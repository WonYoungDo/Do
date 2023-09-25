package com.tawny.shop.main.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.main.dto.GoodsDetail;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.repository.GoodsRepository;
import com.tawny.shop.manager.goods.service.GoodsService;
import com.tawny.shop.order.domain.Order;
import com.tawny.shop.order.dto.OrderBestGoodsDetail;
import com.tawny.shop.order.service.OrderService;

@Service
public class PortalService {
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private OrderService orderService;
	
	// 상품 정보 보여주기
	public List<GoodsDetail> getGoodsList() {
		
		List<Goods> goodsList = goodsRepository.selectGoodsList();
		List<GoodsDetail> goodsDetailList = new ArrayList<>();
		
		for(Goods goods : goodsList) {
			
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
	
	// 카테고리별 상품 리스트
	public List<GoodsDetail> getGoodsListByCategory(String category) {
	    
	    List<Goods> goodsList = goodsService.getGoodsCategory(category);
	    List<GoodsDetail> goodsDetailList = new ArrayList<>();
	    
	    for(Goods goods : goodsList) {
	        
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
	
	// 가장 많이 팔린 상품 보여주기
	public List<OrderBestGoodsDetail> getBestGoodsList(int limit) {
		 
	    List<Order> orderBestGoodsList = orderService.getBestGoodsList();
	    
	    List<OrderBestGoodsDetail> bestGoodsList = new ArrayList<>();
	    for(Order bestGoods : orderBestGoodsList) {
	    	
	    	OrderBestGoodsDetail orderBestGoodsDetail = OrderBestGoodsDetail.builder()
	    			                 										.goods(goods)
	    																	.build();
	    	bestGoodsList.add(orderBestGoodsDetail);
	    }
		 return bestGoodsList;
	}
	
	// 상품 개별 정보 가져오기
	public Goods getGoods(int id) {
		return goodsRepository.selectGoods(id);
	}
	
}
