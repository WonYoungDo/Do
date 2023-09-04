package com.tawny.shop.goods.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.goods.repository.GoodsRepository;

@Service
public class GoodsService {
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	// 상품 등록
	public int goodsUpload(
			String goodsName
			, String price
			, String count
			, String category
			, String imagePath) {
		return goodsRepository.insertGoods(goodsName, price, count, category, imagePath);
	}
}
