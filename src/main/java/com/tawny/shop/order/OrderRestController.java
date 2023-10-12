package com.tawny.shop.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.order.service.OrderService;

@RestController
public class OrderRestController {
	
	@Autowired
	private OrderService orderService;
	
	// 주문 정보 저장
	@PostMapping("/goods/order")
	public Map<String, String> Order(
			@RequestParam("goodsId") int goodsId
			, @RequestParam("payId") int payId
			, @RequestParam("request") String request
			, @RequestParam("address") String address
			, @RequestParam("quantity") int quantity
			, @RequestParam("totalPrice") int totalPrice
			, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		int count = orderService.addOrder(userId, goodsId, payId, request, address, quantity, totalPrice);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
