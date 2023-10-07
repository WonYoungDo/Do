package com.tawny.shop.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tawny.shop.main.PortalController;
import com.tawny.shop.pay.domain.Pay;
import com.tawny.shop.pay.service.PayService;
import com.tawny.shop.user.member.domain.User;
import com.tawny.shop.user.member.service.UserService;

@RequestMapping("/do")
@Controller
public class OrderController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PortalController portalController;

	// 결제 화면
	@GetMapping("/goodsOrder")
	public String goodsOrder(Model model, HttpSession session) {
		
		portalController.bestGoodsModel(model);
		
		int userId = (Integer)session.getAttribute("userId");
		
		User user = userService.getUser(userId);
		List<Pay> pay = payService.getCardInfo(userId);
		
		model.addAttribute("user", user);
		model.addAttribute("pay", pay);
		return "goods/goodsOrder";
	}
}
