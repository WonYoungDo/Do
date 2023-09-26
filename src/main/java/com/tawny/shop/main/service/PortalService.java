package com.tawny.shop.main.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.dto.GoodsDetail;
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
	    	Goods goods = goodsService.getGoods(bestGoods.getGoodsId());
	    	Order order = orderService.getOrder(bestGoods.getId());
	    	
	    	OrderBestGoodsDetail orderBestGoodsDetail = OrderBestGoodsDetail.builder()
	    			                 										.goods(goods)
	    			                 										.order(order)
	    																	.build();
	    	bestGoodsList.add(orderBestGoodsDetail);
	    }
		 return bestGoodsList;
	}
	
	// 상품 검색 기능 
	public List<GoodsDetail> getGoodsSearch(String keyword) {
		
		List<Goods> goodsSearchList = goodsService.getGoodsSearch(keyword);
		List<GoodsDetail> goodsDetailList = new ArrayList<>();
		
		for(Goods goods : goodsSearchList) {
			
			GoodsDetail goodsDetail = GoodsDetail.builder()
												 .goodsId(goods.getId())
												 .goodsName(goods.getGoodsName())
												 .imagePath(goods.getImagePath())
												 .count(goods.getCount())
												 .price(goods.getPrice())
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
