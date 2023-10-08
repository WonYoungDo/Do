package com.tawny.shop.manager.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tawny.shop.main.PortalController;
import com.tawny.shop.manager.order.dto.AllOrderDetail;
import com.tawny.shop.manager.order.service.OrderManagementService;

@Controller
@RequestMapping("/do/manager/order")
public class OrderManagementController {
	
	@Autowired
	private OrderManagementService OrderManagementService;
	
	@Autowired
	private PortalController portalController;
	
	// 사용자들이 주문한 모든 정보 리스트
	@GetMapping("/details")
	public String allOrderList(Model model)	{
		
		portalController.bestGoodsModel(model);
		
		List<AllOrderDetail> allOrderDetailList = OrderManagementService.getAllOrderDetail();
		model.addAttribute("allOrderDetailList", allOrderDetailList);
		return "orderManagement/orderDetails";
	}
}
