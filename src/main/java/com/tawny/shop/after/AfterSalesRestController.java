package com.tawny.shop.after;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.after.service.AfterSalesService;

@RestController
public class AfterSalesRestController {
	
	@Autowired
	private AfterSalesService afterSalesService;
	
	// 주문 정보 저장
	@PutMapping("/goods/order")
	public Map<String, String> Order(
			@RequestParam("goodsId") int goodsId
			, @RequestParam("payId") int payId
			, @RequestParam("orderId") int orderId
			, @RequestParam("cancelReason") String cancelReason
			, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		int count = afterSalesService.addAfterSales(userId, goodsId, payId, orderId, cancelReason);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
