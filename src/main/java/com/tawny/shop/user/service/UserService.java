package com.tawny.shop.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	
	public int join(
			String loginId
			, String pw
			, String name
			, String phoneNumber
			, String address) {
		return userRepository.insertJoin(loginId, pw, name, phoneNumber, address);
	}
}
