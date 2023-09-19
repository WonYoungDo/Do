package com.tawny.shop.order.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
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
			, String address) {
		return orderRepository.insertOrder(userId, goodsId, payId, request, address, "주문완료");
	}
	
	// 사용자가 주문한 상품 정보 리스트
	public List<Order> getOrderList(int userId) {
		List<Order> orderList = orderRepository.selectOrderList(userId);
		for(Order order : orderList) {
			Goods goods = goodsService.getGoods(order.getGoodsId());
			order.setGoods(goods);   
		}
		return orderList;
	}

}
