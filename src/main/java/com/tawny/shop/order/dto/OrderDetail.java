package com.tawny.shop.order.dto;

import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.order.domain.Order;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class OrderDetail {
	
	// 주문한 상품 정보
	private Goods goods; 
	
	// 주문 정보
	private Order Order; 
	
	
}
