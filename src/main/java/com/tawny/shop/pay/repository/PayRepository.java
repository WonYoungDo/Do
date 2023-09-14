package com.tawny.shop.pay.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.shop.pay.domain.Pay;

@Repository
public interface PayRepository {
	
	public int insertCardInfo(
			@Param("userId") int userId
			, @Param("card") String card
			, @Param("cardNumber") String cardNumber);
}
