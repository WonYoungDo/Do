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
	
	// 등록된 상품 리스트 가져오기
	public List<Goods> selectGoodsList();
	
	// 저장되어 있는 상품 정보 가져오기 
	public Goods selectGoods(@Param("id") int id);
	
	// 수정한 내용 쿼리에 업데이트
	public int goodsUpdate(
			@Param("goodsId") int goodsId
			, @Param("goodsName") String goodsName
			, @Param("price") int price
			, @Param("count") int count
			, @Param("category") String category);
	
	// goodsId 가져오기
	public List<Goods> findByGoodsId(@Param("id") int id);
}
