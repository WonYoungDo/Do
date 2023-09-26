package com.tawny.shop.manager.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tawny.shop.main.service.PortalService;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.dto.GoodsDetail;
import com.tawny.shop.manager.goods.service.GoodsService;

@Controller
@RequestMapping("/manager")
public class GoodsController {
	
	@Autowired
	private PortalService portalService;
	
	@Autowired
	private GoodsService goodsService;
	
	// 상품 등록 화면
	@GetMapping("/goodsUpload")
	public String goodsUpload() {
		return "goods/goodsUpload";
	}
	
	// 상품 수정 화면
	@GetMapping("/goodsUpdate/{id}")
	public String goodsUpdate(@PathVariable("id") int id,  Model model) {
		
		Goods goods = goodsService.getGoods(id);
		model.addAttribute("goods", goods);
		
		return "goods/goodsUpdate";
	}
	
	// 상품 리스트 화면
	@GetMapping("/goodsList")
	public String goodsList(Model model) {
		
		List<GoodsDetail> goodsList = portalService.getGoodsList();
		model.addAttribute("goodsList", goodsList);
		
		return "goods/goodsList";
	}
	
	
}
