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
	private int quantity;
	private int totalPrice;

	private Goods goods; 
}
