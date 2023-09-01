package com.tawny.shop.goods;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class GoodsController {
	
	// 상품 등록 화면
	@GetMapping("/goodsUpload")
	public String goodsUpload() {
		return "manager/goodsUpload";
	}
	
}
