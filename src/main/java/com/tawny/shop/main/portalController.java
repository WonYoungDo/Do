package com.tawny.shop.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class portalController {
	
	@GetMapping("/portal")
	public String portal() {
		return "main/portal";
	}
}
