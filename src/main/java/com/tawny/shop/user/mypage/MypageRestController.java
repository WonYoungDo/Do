package com.tawny.shop.user.mypage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.user.member.service.UserService;

@RestController
public class MypageRestController {
	
	@Autowired
	private UserService userService;
	
	@PutMapping("/mypage/updateMyInfo")
	public Map<String, String> updateMyInfo(
			@RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email
			, @RequestParam("email") String address
			, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		int count = userService.updateMyInfo(userId, address, email, phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
