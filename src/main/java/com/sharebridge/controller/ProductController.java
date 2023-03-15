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
import com.sharebridge.service.productService;
import com.sharebridge.util.FileUtil;

@Controller
public class ProductController {
	@Autowired
	productService service;
	
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
								HttpServletRequest req) {
		
		// filename 취득(원본)
		String filename = fileload.getOriginalFilename();
		
		// upload 경로 -> folder
		String fupload = "C:\\upload";
		
		System.out.println("fupload: " + fupload);
		
		// 파일명을 충돌되지 않는 명칭으로 변경
		String newfilename = FileUtil.getNewFileName(filename);

		dto.setPhoto(fupload + "/" + newfilename);	// DB에 파일 경로 저장 
		
		// 파일 생성
		File file = new File(fupload + "/" + newfilename);

		try {
			// 파일 업로드
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// DB에 저장
			boolean isS = service.insertProduct(dto);
			String msg = "Yes";
			if(isS) {
				System.out.println(msg);
			} else {
				msg = "No";
				System.out.println(msg);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:";	// message.jsp로 이동 혹은 메인페이지로 이동
	}
}
