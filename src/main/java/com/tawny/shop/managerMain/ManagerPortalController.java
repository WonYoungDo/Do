package com.tawny.shop.managerMain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/main")
public class ManagerPortalController {
	
	// 관리자 메인 포털 화면
	@GetMapping("/portal")
	public String portal() {
		return "manager/main/portal";
	}
	
}
