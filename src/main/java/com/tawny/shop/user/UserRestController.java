package com.tawny.shop.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.user.domain.User;
import com.tawny.shop.user.service.MailService;
import com.tawny.shop.user.service.UserService;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService ;
	
	// 회원가입 기능
	@PostMapping("/join")
	public Map<String, String> join(
			@RequestParam("loginId") String loginId
			, @RequestParam("pw") String pw
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email
			, @RequestParam("address") String address) {
		User user = userService.join(loginId, pw, name, phoneNumber, address, email);
		
		Map<String, String> resultMap = new HashMap<>();
		if(user != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 아이디 중복확인
	@GetMapping("/duplication")
	public Map<String,Boolean> duplication(@RequestParam("loginId") String loginId) {
		
		boolean isDuplicate = userService.isDuplication(loginId);

		Map<String, Boolean> resultMap = new HashMap<>();
		if(isDuplicate) {
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}
		return resultMap;
	}
	
	// 메일 인증
	@GetMapping("/verify")
	public Map<String, String> mailVerify(@RequestParam("email") String email) {
	
		String verifyMail = mailService.mailCheck(email);
		
		Map<String, String> resultMap = new HashMap<>();
		if()
	}

		
	
}
