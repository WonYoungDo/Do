package com.tawny.shop.main.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class GoodsDetail {
	
	private String goodsName;
	private int price;
	private int count;
	private String category;
	private String imagePath;
}
