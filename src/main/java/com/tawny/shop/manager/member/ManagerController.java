package com.tawny.shop.manager.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagerController {
	
	// 로그아웃 
	@GetMapping("/manager/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("managerId");
		session.removeAttribute("managerName");
		
		return "redirect:/do/login";		
	}
}
