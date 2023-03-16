package com.sharebridge.controller;

import java.io.File;
import java.io.IOException;
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

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.service.ProductService;
import com.sharebridge.util.FileUtil;

@Controller
public class ProductController {
	@Autowired
	ProductService service;
	
	// 상품등록
	@GetMapping(value = "productRegi.do")
	public String productRegi(Model model) {
		List<CategoryDto> allCategory = service.allCategory();
		model.addAttribute("allCategory", allCategory);
		
		return "productRegi";
	}
	
	@PostMapping(value = "productRegiAf.do")
	public String productRegiAf(ProductDto dto,
								@RequestParam(value="fileload", required=false)
								MultipartFile fileload,
								HttpServletRequest req,
								Model model) {
		
		// filename 취득(원본)
		String filename = fileload.getOriginalFilename();
		
		// upload 경로 -> folder
		String fupload = "C:\\upload";
		
		System.out.println("fupload: " + fupload);
		
		// 파일명을 충돌되지 않는 명칭으로 변경
		String newfilename = FileUtil.getNewFileName(filename);
		
		String photoPath = fupload + "/" + newfilename;
		dto.setPhoto(photoPath);	// DB에 파일 경로 저장 
		
		System.out.println(dto.getPhoto());
		// 파일 생성
		File file = new File(fupload + "/" + newfilename);

		try {			
			// DB에 저장
			boolean isS = service.insertProduct(dto);
			String msg = "PRODUCT_INSERT_OK";
			if(isS) {
				// 파일 업로드
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			} else {
				msg = "PRODUCT_INSERT_NO";
			}
			model.addAttribute("insertProduct", msg);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "detailsMsg";
	}
	
	// 상품 수정
	@GetMapping("/updateProduct.do")
	public String updateProduct(int product_id) {
		boolean isS = service.updateProduct(product_id);
		String msg = "Yes";
		if(isS) {
			System.out.println(msg);
		} else {
			msg = "No";
			System.out.println(msg);
		}
		
		return "productDetail";	// message.jsp로 이동 혹은 디테일로 바로 이동
	}
		
	// 상품 상세 보기
	@GetMapping("/productDetail.do")
	public String productDetail(int product_id, int category_id, Model model) {
		ProductDto detail = service.getProduct(product_id);
		CategoryDto getCate = service.getCate(category_id);
		
		model.addAttribute("detail", detail);
		model.addAttribute("getCate", getCate);
		
		return "productDetail";
	}
	
	// 상품 삭제 : 데이터는 그대로 보존
	@GetMapping("/delProduct.do")
	public String delProduct(int product_id, Model model) {
		boolean isS = service.delProduct(product_id);
		String msg = "PRODUCT_DELETE_OK";
		if(!isS) {			
			msg = "PRODUCT_DELETE_NO";
		}
		
		model.addAttribute("delProduct", msg);
		
		return "detailsMsg";
	}
}
