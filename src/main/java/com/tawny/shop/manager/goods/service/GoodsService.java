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
	public int addGoodsUpdate(int goodsId, String goodsName, int price, int count, String category) {
		return goodsRepository.goodsUpdate(goodsId, goodsName, price, count, category);
	}
	
	// 상품 재고 업데이트 기능
	public int subtractGoodsCount(int goodsId, int orderQuantity) {
		return goodsRepository.updateSubtractGoodsCount(orderQuantity, goodsId);
	}
	
	// id를 기반으로 등록된 상품 정보 
	public Goods getGoods(int id) {
		return goodsRepository.selectGoods(id);
	}
	
	// goodsId 얻어오기
	public List<Goods> getGoodsId(int id) {
		return goodsRepository.findByGoodsId(id);
	}
	
	// 검색 기능 
	public List<Goods> getGoodsSearch(String keyword) {
		return goodsRepository.selectGoodsSearch(keyword);
	}

}
