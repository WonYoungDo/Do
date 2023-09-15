package com.tawny.shop.pay.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.shop.pay.domain.Pay;

@Repository
public interface PayRepository {
	
	// 쿼리에 카드 정보 등록 
	public int insertCardInfo(
			@Param("userId") int userId
			, @Param("card") String card
			, @Param("cardNumber") String cardNumber);
	
	// id를 기반으로 등록된 카드 정보 가져오기
	public Pay selectCard(@Param("userId") int userId);
}
