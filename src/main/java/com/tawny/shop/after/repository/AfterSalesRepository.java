package com.tawny.shop.after.repository;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.tawny.shop.after.domain.AfterSales;

@Repository
public interface AfterSalesRepository {
	
	// 취소 내용과 사유를 쿼리에 저장
	public int insertAfterSales(
			@Param("userId") int userId
			, @Param("goodsId") int goodsId
			, @Param("payId") int payId
			, @Param("orderId") int orderId
			, @Param("cancelReason") String cancelReason);
	
	// 취소/반품 내역 리스트
	public List<AfterSales> selectAfterSalesList(@Param("userId") int userId, @Param("elapsedTime") String elapsedTime);
}
