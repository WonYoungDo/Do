package com.tawny.shop.after.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.after.repository.AfterSalesRepository;

@Service
public class AfterSalesService {
	
	@Autowired
	private AfterSalesRepository afterSalesRepository;
	
	// 사용자가 취소/반품한 내용
	public int addAfterSales(
			int userId
			, int goodsId
			, int payId
			, int orderId
			, String delivery) {
		return afterSalesRepository.insertAfterSales(userId, goodsId, payId, orderId, delivery);
	}
}
