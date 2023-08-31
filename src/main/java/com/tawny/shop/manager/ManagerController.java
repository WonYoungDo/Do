package com.tawny.shop.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	// 회원가입 화면
	@GetMapping("/join")
	public String join() {
		return "manager/join";
	}
	
	// 로그인 화면
	@GetMapping("/login")
	public String login() {
		return "manager/login";
	}
	
	// 아이디 찾기 화면
	@GetMapping("/find/id")
	public String findId() {
		return "manager/findId";
	}
	
	// 비밀번호 찾기 화면
	@GetMapping("/find/pw")
	public String findPw() {
		return "manager/findPw";
	}
}
