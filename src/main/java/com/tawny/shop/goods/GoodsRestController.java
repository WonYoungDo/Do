package com.tawny.shop.goods;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.goods.service.GoodsService;

@RestController
public class GoodsRestController {
	
	@Autowired
	private GoodsService goodsService;
	
	// 상품 등록
	@PutMapping("/goodsUpload")
	public Map<String, String> goodsUpload(
			@RequestParam("goodsName") String goodsName
			, @RequestParam("price") String price
			, @RequestParam("count") String count
			, @RequestParam("category") String category
			, @RequestParam("imagePath") String imagePath) {
		
		int count = goodsService.goodsUpload(goodsName, price, count, category, imagePath);
		return ;
	}
}
