package com.tawny.shop.user.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tawny.shop.user.member.domain.User;
import com.tawny.shop.user.member.service.UserService;

@Controller
@RequestMapping("/do/user/mypage")
public class MypageController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@GetMapping("/order/list")
	public String orderList() {
		return "mypage/orderList";
	}
	
	@GetMapping("/order/cancelReturn")
	public String cancelReturnList() {
		return "mypage/cancelReturn";
	}
	
	@GetMapping("/info")
	public String mypageInfo(Model model, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		User user = userService.getUserId(userId);
		model.addAttribute("user", user);
		return "mypage/myInfo";
	}
}
