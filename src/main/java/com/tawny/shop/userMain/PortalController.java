package com.tawny.shop.userMain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class PortalController {
	
	// 메인 포털 화면
	@GetMapping("/portal")
	public String portal() {
		return "main/portal";
	}
	
}
