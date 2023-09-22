package com.tawny.shop.manager.order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.service.GoodsService;
import com.tawny.shop.manager.order.dto.AllOrderDetail;
import com.tawny.shop.order.domain.Order;
import com.tawny.shop.order.service.OrderService;
import com.tawny.shop.user.member.domain.User;
import com.tawny.shop.user.member.service.UserService;

@Service
public class OrderManagementService {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	public List<AllOrderDetail> getAllOrderDetail() {
		
		List<Order> orderList = orderService.getAllOrderList();
		List<AllOrderDetail> allOrderDetailList = new ArrayList<>();
		
		for(Order orderDetail : orderList) {
			Goods goods = goodsService.getGoods(orderDetail.getGoodsId());
			User user = userService.getUser(orderDetail.getUserId());
			Order order = orderService.getOrder(orderDetail.getId());
			
			AllOrderDetail allOrderDetail = AllOrderDetail.builder()
														  .goods(goods)
														  .user(user)
														  .order(order)
														  .build();
			allOrderDetailList.add(allOrderDetail);
		}
		return allOrderDetailList;
	}
}
