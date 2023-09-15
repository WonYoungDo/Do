package com.tawny.shop.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.pay.domain.Pay;
import com.tawny.shop.pay.repository.PayRepository;

@Service
public class PayService {
	
	@Autowired
	private PayRepository payRepository;
	
	// 카드 등록 기능
	public int addCardInfo(int userId, String card, String cardNumber) {
		return payRepository.insertCardInfo(userId, cardNumber, cardNumber);
	}
	
	// id를 기반으로 등록된 카드 정보 가져오기
	public Pay getCardInfo(int userId) {
		return payRepository.selectCard(userId);
	}
}
