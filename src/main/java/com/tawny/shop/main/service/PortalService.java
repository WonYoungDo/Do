package com.tawny.shop.main.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.main.dto.GoodsDetail;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.repository.GoodsRepository;
import com.tawny.shop.manager.goods.service.GoodsService;

@Service
public class PortalService {
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	@Autowired
	private GoodsService goodsService;
	
	// 상품 정보 보여주기
	public List<GoodsDetail> getGoodsList() {
		
		List<Goods> goodsList = goodsRepository.selectGoodsList();
		List<GoodsDetail> goodsDetailList = new ArrayList<>();
		
		for(Goods goods : goodsList) {
			
			List<Goods> goodsId = goodsService.getGoodsId(goods.getId());
			
			GoodsDetail goodsDetail = GoodsDetail.builder()
												 .goodsId(goods.getId())
												 .goodsName(goods.getGoodsName())
												 .price(goods.getPrice())
												 .count(goods.getCount())
												 .category(goods.getCategory())
												 .imagePath(goods.getImagePath())
												 .build();
			goodsDetailList.add(goodsDetail);
		}
		return goodsDetailList;
	}
}
