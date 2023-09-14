package com.tawny.shop.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.pay.domain.Pay;
import com.tawny.shop.pay.repository.PayRepository;

@Service
public class PayService {
	
	@Autowired
	private PayRepository payRepository;
	
	public int addCardInfo(int userId, String card, String cardNumber) {
		return payRepository.insertCardInfo(userId, cardNumber, cardNumber);
	}
}
