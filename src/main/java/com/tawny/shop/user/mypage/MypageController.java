package com.tawny.shop.user.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tawny.shop.after.dto.AfterSalesDetail;
import com.tawny.shop.after.service.AfterSalesService;
import com.tawny.shop.order.dto.OrderDetail;
import com.tawny.shop.order.service.OrderService;
import com.tawny.shop.pay.domain.Pay;
import com.tawny.shop.pay.service.PayService;
import com.tawny.shop.user.member.domain.User;
import com.tawny.shop.user.member.service.UserService;

@Controller
@RequestMapping("/do/user/mypage")
public class MypageController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private PayService payService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private AfterSalesService afterSalesService;
	
	// 마이페이지 화면
	@GetMapping("")
	public String mypage() {
		return "mypage/mypage";
	}
	
	// 마이페이지 -> 주문 목록 화면
	@GetMapping("/order/list")
	public String orderList(Model model, HttpSession session, @RequestParam(value="elapsedTime", required = false) String elapsedTime) {
		int userId = (Integer)session.getAttribute("userId");
		List<OrderDetail> orderDetailList = orderService.getOrderList(userId, elapsedTime);
		model.addAttribute("orderDetailList", orderDetailList);
		return "mypage/orderList";
	}
	
	// 마이페이지 -> 취소/반품 조회 화면
	@GetMapping("/order/cancelReturn")
	public String cancelReturnList(Model model, HttpSession session, @RequestParam(value="elapsedTime", required = false) String elapsedTime) {
		int userId = (Integer)session.getAttribute("userId");
		List<AfterSalesDetail> afterSalesList = afterSalesService.getAfterSalesList(userId, elapsedTime);
		model.addAttribute("afterSalesList", afterSalesList);
		return "mypage/cancelReturn";
	}
	
	// 마이페이지 -> 내정보 화면
	@GetMapping("/info")
	public String mypageInfo(Model model, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		User user = userService.getUser(userId);
		List<Pay> pay = payService.getCardInfo(userId);
		model.addAttribute("user", user);
		model.addAttribute("pay", pay);
		return "mypage/myInfo";
	}
}
