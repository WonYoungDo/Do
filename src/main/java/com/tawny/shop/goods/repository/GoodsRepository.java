package com.tawny.shop.goods.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodsRepository {
	
	// 상품 등록 
	public int insertGoods(
			@Param("goodsName") String goodsName
			, @Param("price") String price
			, @Param("count") String count
			, @Param("category") String category
			, @Param("imagePath") String imagePath);
}
