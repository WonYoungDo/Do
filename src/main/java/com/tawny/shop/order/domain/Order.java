package com.tawny.shop.order.domain;

import java.util.Date;

import com.tawny.shop.manager.goods.domain.Goods;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Order {
	
	private int id;
	private int userId;
	private int goodsId;
	private int payId;
	private String delivery;
	private String address;
	private String request;
	private Date createdAT;
	private Date updatedAT;

	private Goods goods; 
	private int quantity; // 사용자가 주문한 상품의 수량.
	private int totalPrice; // 사용자가 결제한 총 금액.
}
