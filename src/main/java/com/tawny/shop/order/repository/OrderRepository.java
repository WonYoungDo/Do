package com.tawny.shop.order.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository {
	
	// 주문 정보를 쿼리에 저장
	public int insertOrder(
			@Param("userId") int userId
			, @Param("goodsId") int goodsId
			, @Param("payId") int payId
			, @Param("request") String request
			, @Param("address") String address);
}
