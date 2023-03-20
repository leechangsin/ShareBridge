package com.sharebridge.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.ReqProdDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.dto.ReviewDto;
import com.sharebridge.service.ReviewService;
import com.sharebridge.util.FileUtil;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	@GetMapping(value = "reviewList.do")
	public String reviewList(int member_id, Model model) {
		System.out.println("ReviewController reviewList " + new Date());
		
		// 세션정보의 렌티 회원번호를 통해 상품번호와 대여기간 취득
		List<RequestDto> rentalDate = service.reviewList(member_id);
		System.out.println(rentalDate.size());
		
		// 취득한 상품번호로 상품명, 등록자, 가격을 취득하자!
		List<ProductDto> product = new ArrayList<>();
		for (int i = 0; i < rentalDate.size(); i++) {
			ProductDto dto = service.reviewListTwo(rentalDate.get(i).getProduct_id());
			product.add(i, dto);
		}
		System.out.println(product.size());
		
		// 취득한 렌터번호로 렌터닉네임을 취득하자!
		List<String> nickname = new ArrayList<>();
		for (int i = 0; i < rentalDate.size(); i++) {
			String renter_id = service.reviewListThree(product.get(i).getMember_id());
			nickname.add(i, renter_id);
		}
		System.out.println(nickname.size());
		
		model.addAttribute("rentalDate", rentalDate);
		model.addAttribute("product", product);
		model.addAttribute("nickname", nickname);
		
		return "review";
	}
	
	@GetMapping(value = "writeReview.do")
	public String writeReview(ReqProdDto dto, Model model) {
		System.out.println("ReviewController writeReview " + new Date());
		System.out.println(dto.getProduct_id());
		ProductDto prod = service.reviewListTwo(dto.getProduct_id());
		
		model.addAttribute("prod", prod);
		
		model.addAttribute("requestId", dto.getRequest_id());
		
		return "review_form";
	}
	
	@PostMapping(value = "reviewWriteAf.do")
	public String reviewWriteAf(ReviewDto dto,
								@RequestParam(value = "fileload", required = false)
								MultipartFile fileload,
								HttpServletRequest req,
								Model model) {
		System.out.println("ReviewController writeReviewAf " + new Date());
		boolean isS = false;
		
		// filename 취득
		String filename = fileload.getOriginalFilename();	// 원본 파일명
		
		dto.setPhoto(filename);	// 원본 파일명(DB)
		
		// upload의 경로 설정
		// 폴더
		String fupload = "C:\\springSamples\\sharebridgeBackup\\src\\main\\webapp\\upload\\review";
		
		System.out.println("fupload:" + fupload);
		
		// 파일명을 충돌되지 않는 명칭(Date)으로 변경
		String newfilename = FileUtil.getNewFileName(filename);
		dto.setPhoto(newfilename);	// 변경된 파일명
		
		File file = new File(fupload + "/" + newfilename);
		
		try {
			// 실제로 파일 생성 + 기입 = 업로드
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db에 저장
			isS = service.writeRev(dto);
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		boolean isStwo = service.writeRevTwo(dto.getRequest_id());
		String msg = "REVIEW_NO";
		
		if(isS && isStwo) {
			msg = "REVIEW_OK";
		}
		
		model.addAttribute("writeRev", msg);
		
		return "revMsg";
	}
	
	@GetMapping(value = "updateReview.do")
	public String updateReview(int request_id, Model model) {
		System.out.println("ReviewController updateReview " + new Date());
		
		ReviewDto dto = service.revFromReq(request_id);
		System.out.println(dto.toString());
		ProductDto prod = service.reviewListTwo(dto.getProduct_id());
		String title = prod.getTitle();
		
		model.addAttribute("revCont", dto);
		model.addAttribute("title", title);
		
		return "review_update_form";
	}
	
	@PostMapping(value = "updateReviewAf.do")
	public String updateReviewAf(ReviewDto dto,
								@RequestParam(value = "fileload", required = false)
								MultipartFile fileload,
								HttpServletRequest req,
								Model model) {
		System.out.println("ReviewController updateReviewAf " + new Date());
		boolean isS = false;
		
		if(fileload == null) {	// 기존의 사진 저장
			System.out.println("fileload is null");
			ReviewDto getRev = service.selecAllRev(dto.getReview_id());
			dto.setPhoto(getRev.getPhoto());
			
		} else {	// 수정된 사진 저장
			System.out.println("fileload is not null");
		
			// filename 취득
			String filename = fileload.getOriginalFilename();	// 원본 파일명
			
			dto.setPhoto(filename);	// 원본 파일명(DB)
			
			// upload의 경로 설정
			// 폴더
			String fupload = "C:\\springSamples\\sharebridgeBackup\\src\\main\\webapp\\upload\\review";
			
			System.out.println("fupload:" + fupload);
			
			// 파일명을 충돌되지 않는 명칭(Date)으로 변경
			String newfilename = FileUtil.getNewFileName(filename);
			dto.setPhoto(newfilename);	// 변경된 파일명
			
			File file = new File(fupload + "/" + newfilename);
			
			try {
				// 실제로 파일 생성 + 기입 = 업로드
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				// db에 저장
				isS = service.updateRev(dto);
				
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		String msg = "REV_UP_NO";
		
		if(isS) {
			msg = "REV_UP_OK";
		}
		
		model.addAttribute("revUp", msg);
		
		return "revMsg";
	}
	
	@GetMapping(value = "deleteReview.do")
	public String deleteReview(int request_id, Model model) {
		System.out.println("ReviewController deleteReview " + new Date());
		
		boolean isS = service.deleteRev(request_id);
		boolean isStwo = service.deleteRevTwo(request_id);
		String msg = "REV_DEL_NO";
		
		if(isS && isStwo) {
			msg = "REV_DEL_OK";
		}
		
		model.addAttribute("revDel", msg);
		
		return "revMsg";
	}
}
