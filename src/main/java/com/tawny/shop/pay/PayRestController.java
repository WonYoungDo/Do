package com.tawny.shop.pay;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.pay.service.PayService;

@RestController
public class PayRestController {
	
	@Autowired
	private PayService payService;
	
	@PutMapping("/card/register")
	public Map<String, String> registerCard(
			@RequestParam("card") String card
			, @RequestParam("cardNumber") String cardNumber
			, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		
		int count = payService.addCardInfo(userId, card, cardNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
