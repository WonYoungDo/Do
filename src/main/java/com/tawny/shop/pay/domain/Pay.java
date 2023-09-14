package com.tawny.shop.pay.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay {
	
	private int id;
	private int userId;
	private String card;
	private String cardNumber;
	private Date createdAT;
	private Date updatedAT;
}
