package com.tawny.shop.manager.goods.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.shop.manager.goods.domain.Goods;

@Repository
public interface GoodsRepository {
	
	// 상품 등록 
	public int insertGoods(
			@Param("goodsName") String goodsName
			, @Param("price") int price
			, @Param("count") int count
			, @Param("category") String category
			, @Param("imagePath") String imagePath);
	
	public List<Goods> selectGoods();
}
