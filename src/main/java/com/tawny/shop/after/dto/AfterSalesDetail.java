package com.tawny.shop.after.dto;

import com.tawny.shop.after.domain.AfterSales;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.order.domain.Order;
import com.tawny.shop.user.member.domain.User;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class AfterSalesDetail {
	
	// 취소/반품한 상품 정보
	private Goods goods;
	
	// 취소/반품한 주문 정보
	private Order order;
	
	// 취소/반품한 사용자 정보
	private User user;
	
	// 취소/반품 정보
	private AfterSales afterSales;
}
