package com.tawny.shop.after.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AfterSalesRepository {
	
	// 취소 내용과 사유를 쿼리에 저장
	public int insertAfterSales(
			@Param("userId") int userId
			, @Param("goodsId") int goodsId
			, @Param("payId") int payId
			, @Param("orderId") int orderId
			, @Param("cancelReason") String cancelReason);
}
