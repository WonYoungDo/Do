package com.tawny.shop.goods;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tawny.shop.goods.service.GoodsService;

@RestController
@RequestMapping("/manager")
public class GoodsRestController {
	
	@Autowired
	private GoodsService goodsService;
	
	// 상품 등록
	@PutMapping("/goodsUpload")
	public Map<String, String> goodsUpload(
			@RequestParam("goodsName") String goodsName
			, @RequestParam("price") int price
			, @RequestParam("count") int count
			, @RequestParam("category") String category
			, @RequestParam("file") MultipartFile file) {
		
		int addGoods = goodsService.addGoodsUpload(goodsName, price, count, category, file);
	
		Map<String, String> resultMap = new HashMap<>();
		if(addGoods != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
