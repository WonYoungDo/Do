package com.tawny.shop.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.manager.goods.service.GoodsService;
import com.tawny.shop.order.service.OrderService;
import com.tawny.shop.pay.service.PayService;

@RestController
public class OrderRestController {
	
	@Autowired
	private OrderService orderService;
	
	// 주문 정보 저장
	@PutMapping("/goods/order")
	public Map<String, String> Order(
			@RequestParam("goodsId") int goodsId
			, @RequestParam("payId") int payId
			, @RequestParam("request") String request
			, @RequestParam("address") String address
			, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		int count = orderService.addOrder(userId, goodsId, payId, request, address);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
