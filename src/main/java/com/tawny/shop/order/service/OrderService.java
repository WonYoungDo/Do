package com.tawny.shop.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.service.GoodsService;
import com.tawny.shop.order.domain.Order;
import com.tawny.shop.order.repository.OrderRepository;

@Service
public class OrderService {
	
	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private GoodsService goodsService;
	
	// 사용자가 주문한 내용
	public int addOrder(
			int userId
			, int goodsId
			, int payId
			, String request
			, String address
			, int quantity
			, int totalPrice) {
		return orderRepository.insertOrder(userId, goodsId, payId, request, address, "주문완료", quantity, totalPrice);
	}
	
	// 사용자가 요청한 주문 정보 리스트
	public List<Order> getOrderList(int userId, String elapsedTime) {
		if (elapsedTime == null) {
			elapsedTime = "recent";
	    }
	    List<Order> orderList = orderRepository.selectOrderList(userId, elapsedTime);
		for(Order order : orderList) {
			Goods goods = goodsService.getGoods(order.getGoodsId());
			order.setGoods(goods);   
		}
		return orderList;
	}
	
	// 주문 취소/반품 정보 업데이트 
	public int addDeliveryStatus(int orderId, String deliveryStatus) {
		
		if("cancel".equalsIgnoreCase(deliveryStatus)) {
			return orderRepository.updateOrderDelivery(orderId, "취소 요청 중");
		} 
		
		if("return".equalsIgnoreCase(deliveryStatus)) {
			return orderRepository.updateOrderDelivery(orderId, "반품 요청 중");
		}
		return -1;
	}
	
	// orderId를 기반으로한 주문 정보
	public Order getOrder(int orderId) {
		return orderRepository.selectOrder(orderId);
	}
	
	

}
