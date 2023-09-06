package com.tawny.shop.manager.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	// 회원가입 화면
	@GetMapping("/join")
	public String join() {
		return "manager/member/join";
	}
	
	// 로그인 화면
	@GetMapping("/login")
	public String login() {
		return "manager/member/login";
	}
	
	// 아이디 찾기 화면
	@GetMapping("/find/id")
	public String findId() {
		return "manager/member/findId";
	}
	
	// 비밀번호 찾기 화면
	@GetMapping("/find/pw")
	public String findPw() {
		return "manager/member/findPw";
	}
}
