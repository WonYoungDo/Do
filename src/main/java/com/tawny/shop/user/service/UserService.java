package com.tawny.shop.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.tawny.shop.user.domain.User;
import com.tawny.shop.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 회원가입 기능
	public User join(
			String loginId
			, String pw
			, String name
			, String phoneNumber
			, String address) {
		String encryptPassword = passwordEncoder.encode(pw);
								 
		User user = userRepository.insertJoin(loginId, encryptPassword, name, phoneNumber, address);
		
		return user;		
	}
	
	// 중복확인 기능
	public boolean isDuplication(String loginId) {
		return userRepository.isDuplicateId(loginId) != null;
	}
	
}
