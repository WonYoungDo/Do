package com.tawny.shop.manager.order.dto;

import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.order.domain.Order;
import com.tawny.shop.user.member.domain.User;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class AllOrderDetail {
	
	// 모든 사용자가 주문한 상품 정보
	private Goods goods;
	
	// 모든 사용자 정보 사용자 정보
	private User user;
	
	// 모든 사용자 주문 정보 사용자 정보
	private Order order;
	
}
