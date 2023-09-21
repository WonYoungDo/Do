package com.tawny.shop.after.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.after.repository.AfterSalesRepository;
import com.tawny.shop.order.service.OrderService;

@Service
public class AfterSalesService {
	
	@Autowired
	private AfterSalesRepository afterSalesRepository;
	
	@Autowired
	private OrderService orderService;
	
	// 사용자가 취소/반품한 내용
	public int addAfterSales(
			int userId
			, int goodsId
			, int payId
			, int orderId
			, String cancelReason
			, String deliveryStatus) {
		
	    // 주문 상태 업데이트
		boolean orderCancel = "cancel".equalsIgnoreCase(deliveryStatus);
		boolean orderReturn = "return".equalsIgnoreCase(deliveryStatus);
	    if (orderCancel) {
	    	orderService.addDeliveryStatus(orderId, deliveryStatus);
	    } else if (orderReturn) {
	    	orderService.addDeliveryStatus(orderId, deliveryStatus);
	    }
	    
	    afterSalesRepository.insertAfterSales(userId, goodsId, payId, orderId, cancelReason);
	    
		return 1;
	}
	
	
}
