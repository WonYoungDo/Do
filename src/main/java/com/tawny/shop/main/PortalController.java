package com.tawny.shop.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/do")
public class PortalController {
	
	// 메인 포털 화면
	@GetMapping("/main/portal")
	public String portal() {
		return "main/portal";
	}
	
	// 회원가입 화면
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	// 로그인 화면
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	// 아이디 찾기 화면
	@GetMapping("/find/id")
	public String findId() {
		return "member/findId";
	}
	
	// 비밀번호 찾기 화면
	@GetMapping("/find/pw")
	public String findPw() {
		return "member/findPw";
	}
}
