package com.tawny.shop.manager.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.service.GoodsService;

@Controller
@RequestMapping("/manager")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	// 상품 등록 화면
	@GetMapping("/goodsUpload")
	public String goodsUpload() {
		return "goods/goodsUpload";
	}
	
	// 상품 수정 화면
	@GetMapping("/goodsUpdate")
	public String goodsUpdate(@RequestParam("id") int id,  Model model) {
		
		Goods goods = goodsService.getGoods(id);
		model.addAttribute("goods", goods);
		
		return "goods/goodsUpdate";
	}
}
