package com.tawny.shop.manager.goods;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class GoodsController {
	
	// 상품 등록 화면
	@GetMapping("/goodsUpload")
	public String goodsUpload() {
		return "manager/goods/goodsUpload";
	}
	
	// 상품 수정 화면
	@GetMapping("/goodsUpdate")
	public String goodsUpdate() {
		return "manager/goods/goodsUpdate";
	}
}
