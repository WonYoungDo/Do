package com.tawny.shop.manager.goods.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class GoodsDetail {
	
	private int goodsId;
	private String goodsName;
	private int price;
	private int count;
	private String category;
	private String imagePath;
	
	private int userId;
}
