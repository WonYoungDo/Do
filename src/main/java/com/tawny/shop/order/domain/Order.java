package com.tawny.shop.order.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Order {
	
	private int id;
	private int userId;
	private int goodsId;
	private String delivery;
	private String address;
	private Date createdAT;
	private Date updatedAT;
}
