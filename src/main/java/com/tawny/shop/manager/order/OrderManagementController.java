package com.tawny.shop.manager.order;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tawny.shop.manager.order.dto.AllOrderDetail;
import com.tawny.shop.manager.order.service.OrderManagementService;

@Controller
@RequestMapping("/do/manager/order")
public class OrderManagementController {
	
	@Autowired
	private OrderManagementService OrderManagementService;
	
	@GetMapping("/details")
	public String OrderManagement(Model model)	{
		List<AllOrderDetail> allOrderDetailList = OrderManagementService.getAllOrderDetail();
		model.addAttribute("allOrderDetailList", allOrderDetailList);
		return "orderManagement/orderDetails";
	}
}
