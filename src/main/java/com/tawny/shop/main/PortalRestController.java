package com.tawny.shop.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.service.GoodsService;

@RestController
public class PortalRestController {
	
	@Autowired
	private GoodsService goodsService;
	
	// 상품 검색 기능
	@GetMapping("/goods/search")
	public Map<String, String> search(@RequestParam("keyword") String keyword) {
		
		List<Goods> searchGoods = goodsService.getGoodsSearch(keyword);
		
		Map<String, String> resultMap = new HashMap<>();
		if(searchGoods != null) {
			resultMap.put("result", "success");
			resultMap.put("data", "searchGoods");
		} else {
			resultMap.put("message", "존재하지 않는 상품입니다.");
		}
		return resultMap;
	}
		
}
