package com.tawny.shop.manager.goods.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tawny.shop.common.FileManager;
import com.tawny.shop.manager.goods.repository.GoodsRepository;

@Service
public class GoodsService {
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	// 상품 등록
	public int addGoodsUpload(
			String goodsName
			, int price
			, int count
			, String category
			, MultipartFile file) {
		String imagePath = FileManager.saveFile(file);
		
		return goodsRepository.insertGoods(goodsName, price, count, category, imagePath);
	}
}
