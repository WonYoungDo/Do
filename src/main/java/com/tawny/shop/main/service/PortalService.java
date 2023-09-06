package com.tawny.shop.main.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.main.dto.GoodsDetail;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.service.GoodsService;

@Service
public class PortalService {
	
	@Autowired
	private GoodsService goodsService;
	/*
		public List<GoodsDetail> getGoodsList() {
		
		List<Goods> goodsList = portalRepository.selectGoods();
		List<GoodsDetail> goodsDetailList = new ArrayList<>();
		
		for(Goods goods : goodsList) {
			
		}
		
	}
	*/
}
