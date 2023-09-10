package com.tawny.shop.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tawny.shop.main.dto.GoodsDetail;
import com.tawny.shop.main.service.PortalService;

@Controller
@RequestMapping("/do")
public class PortalController {
	
	@Autowired
	private PortalService portalService;
	
	// 메인 포털 화면
	@GetMapping("/main/portal")
	public String portal(Model model) {
		List<GoodsDetail> goodsList = portalService.getGoodsList();
		model.addAttribute("goodsList", goodsList);
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
