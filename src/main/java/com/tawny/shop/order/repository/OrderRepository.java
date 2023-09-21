package com.tawny.shop.order.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.shop.order.domain.Order;

@Repository
public interface OrderRepository {
	
	// 주문 정보를 쿼리에 저장
	public int insertOrder(
			@Param("userId") int userId
			, @Param("goodsId") int goodsId
			, @Param("payId") int payId
			, @Param("request") String request
			, @Param("address") String address
			, @Param("delivery") String delivery
			, @Param("quantity") int quantity
			, @Param("totalPrice") int totalPrice);
	
	// 사용자가 주문한 리스트 
	public List<Order> selectOrderList(@Param("userId") int userId, @Param("elapsedTime") String elapsedTime);
	
	// 사용자가 취소/반품 요청 변경 저장
	public int updateOrderDelivery(@Param("orderId") int orderId, @Param("deliveryStatus") String deliveryStatus);
	
	// orderId를 기반으로한 주문 정보 가져오기
	public Order selectOrder(@Param("orderId") int orderId);
}
