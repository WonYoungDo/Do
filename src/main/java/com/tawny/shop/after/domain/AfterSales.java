package com.tawny.shop.after.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AfterSales {
	private int id;
	private int userId;
	private int goodsId;
	private int payId;
	private String delivery;
	private int quantity;
	private int totalPrice;
	private Date createdAT;
	private Date updatedAT;
}
