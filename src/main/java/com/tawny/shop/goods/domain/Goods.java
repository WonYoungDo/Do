package com.tawny.shop.goods.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Goods {

	private String goodsName;
	private int price;
	private int count;
	private String category;
	private String imagePath;
}
