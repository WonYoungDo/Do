package com.tawny.shop.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.order.repository.OrderRepository;

@Service
public class OrderService {
	
	@Autowired
	private OrderRepository orderRepository;
	
	// 사용자가 주문한 내용
	public int addOrder(
			int userId
			, int goodsId
			, int payId
			, String request
			, String address) {
		return orderRepository.insertOrder(userId, goodsId, payId, request, address, "주문완료");
	}
}
