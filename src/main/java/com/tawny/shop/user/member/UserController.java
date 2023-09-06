package com.tawny.shop.user.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// 회원가입 화면
	@GetMapping("/join")
	public String join() {
		return "user/member/join";
	}
	
	// 로그인 화면
	@GetMapping("/login")
	public String login() {
		return "user/member/login";
	}
	
	// 로그아웃 
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		return "redirect:/user/login";		
	}
	
	// 아이디 찾기 화면
	@GetMapping("/find/id")
	public String findId() {
		return "user/member/findId";
	}
	
	// 비밀번호 찾기 화면
	@GetMapping("/find/pw")
	public String findPw() {
		return "user/member/findPw";
	}
}
