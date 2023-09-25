package com.tawny.shop.order.dto;

import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.order.domain.Order;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class OrderBestGoodsDetail {
	
	 private Order order;
	 
	 private Goods goods;
	 
	 // 사용자가 주문한 상품 총 수량
     private int totalQuantity;
}
