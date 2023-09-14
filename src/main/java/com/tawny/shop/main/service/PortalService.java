package com.tawny.shop.main.service;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.main.dto.GoodsDetail;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.repository.GoodsRepository;
import com.tawny.shop.manager.goods.service.GoodsService;
import com.tawny.shop.user.member.domain.User;
import com.tawny.shop.user.member.service.UserService;

@Service
public class PortalService {
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserService userService;
	
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
	
	// 상품 개별 정보 가져오기
	public Goods getGoods(int id) {
		return goodsRepository.selectGoods(id);
	}
}
