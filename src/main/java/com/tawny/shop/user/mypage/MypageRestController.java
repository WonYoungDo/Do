package com.tawny.shop.user.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.order.domain.Order;
import com.tawny.shop.order.service.OrderService;
import com.tawny.shop.user.member.service.UserService;

@RestController
@RequestMapping("/mypage")
public class MypageRestController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	// 내정보 수정
	@PutMapping("/updateMyInfo")
	public Map<String, String> updateMyInfo(
			@RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email
			, @RequestParam("email") String address
			, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		int count = userService.updateMyInfo(userId, address, email, phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 주문 목록(기간 별로 보여주기)
    @GetMapping("/order/list/recent")
    public ResponseEntity<List<Order>> getRecentOrderList(HttpSession session){
    	int userId = (Integer)session.getAttribute("userId");
  		List<Order> recentOrderList = orderService.getOrderList(userId, true);
      	return new ResponseEntity<>(recentOrderList, HttpStatus.OK);
    }

    @GetMapping("/order/list/all")
    public ResponseEntity<List<Order>> getAllOrderList(HttpSession session){
    	int userId = (Integer)session.getAttribute("userId");
    	List<Order> allOrders = orderService.getOrderList(userId, false);
    	return new ResponseEntity<>(allOrders, HttpStatus.OK);
    }
	
}
