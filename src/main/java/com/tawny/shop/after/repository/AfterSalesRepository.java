package com.tawny.shop.after.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AfterSalesRepository {
	
	public int insertAfterSales(
			@Param("userId") int userId
			, @Param("goodsId") int goodsId
			, @Param("payId") int payId
			, @Param("orderId") int orderId
			, @Param("delivery") String delivery);
}
