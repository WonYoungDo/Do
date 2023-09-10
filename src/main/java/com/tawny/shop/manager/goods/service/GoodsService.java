package com.tawny.shop.manager.goods.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tawny.shop.common.FileManager;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.repository.GoodsRepository;

@Service
public class GoodsService {
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	// 상품 등록 기능
	public int addGoodsUpload(
			String goodsName
			, int price
			, int count
			, String category
			, MultipartFile file) {
		String imagePath = FileManager.saveFile(file);
		
		return goodsRepository.insertGoods(goodsName, price, count, category, imagePath);
	}
	
	// 상품 수정 기능
	public int goodsUpdate(String goodsName, int price, int count, String category) {
		return goodsRepository.goodsUpdate(goodsName, price, count, category);
	}
	
	// 등록된 상품 정보
	public Goods getGoods(int id) {
		return goodsRepository.selectGoods(id);
	}
	
	// goodsId 얻어오기
	public List<Goods> getGoodsId(int id) {
		return goodsRepository.findById(id);
	}
}
