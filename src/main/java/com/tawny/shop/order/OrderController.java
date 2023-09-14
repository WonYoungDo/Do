package com.tawny.shop.order;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tawny.shop.main.service.PortalService;
import com.tawny.shop.manager.goods.domain.Goods;

@RequestMapping("/do")
public class OrderController {
	
	private PortalService portalService;
	
	// 결제 화면
	@GetMapping("/goodsOrder/{id}")
	public String goodsOrder(@PathVariable("id") int id,  Model model) {
		Goods goods = portalService.getGoods(id);
		model.addAttribute("goods", goods);
		return "goods/goodsOrder";
	}
}
