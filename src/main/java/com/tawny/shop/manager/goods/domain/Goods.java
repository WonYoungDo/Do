package com.tawny.shop.manager.goods.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Goods {
	
	private int id;
	private String goodsName;
	private int price;
	private int count;
	private String category;
	private String imagePath;
	private Date createdAT;
	private Date updatedAT;
}
