package com.tawny.shop.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.user.domain.User;
import com.tawny.shop.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private MailService mailService ;
	
	// 회원가입 기능
	public User join(
			String loginId
			, String pw
			, String name
			, String phoneNumber
			, String email
			, String address) {
		 //String encryptPassword = passwordEncoder.encode(pw);
								 
		User user = userRepository.insertJoin(loginId, pw, name, phoneNumber, address, email);
		
		return user;		
	}
	
	// 중복확인 기능
	public boolean isDuplication(String loginId) {
		return userRepository.isDuplicateId(loginId) != null;
	}
	
	// 이메일 인증 기능
	public boolean mailVerityCheck(int inputCode, HttpSession session) {
		
		Integer sentNumber = (Integer)session.getAttribute("verifyCode");
		
		boolean matched = (sentNumber != null) && (inputCode == sentNumber);
		
		return matched;
	}
	public int check(HttpSession session) {
		int sentNumber = (Integer)session.getAttribute("verifyCode");
		return sentNumber;
	}
}
