package com.tawny.shop.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.user.domain.User;
import com.tawny.shop.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	
	// 회원가입 기능
	public int join(
			String loginId
			, String pw
			, String name
			, String phoneNumber
			, String email
			, String address) {
		 //String encryptPassword = passwordEncoder.encode(pw);
								 
		int count = userRepository.insertJoin(loginId, pw, name, phoneNumber, address, email);
		
		return count;		
	}
	
	// 중복확인 기능
	public boolean isDuplication(String loginId) {
		boolean duplicateId = (userRepository.isDuplicateId(loginId) != null) && (userRepository.isDuplicateId(loginId).equals(loginId)); 
		return duplicateId;
	}
	
	// 이메일 인증 기능
	public boolean mailVerityCheck(int inputCode, HttpSession session) {
		
		Integer sentNumber = (Integer)session.getAttribute("verifyCode");
		
		boolean matched = (sentNumber != null) && (inputCode == sentNumber);
		
		return matched;
	}
	
	// 로그인 기능
	public User login(String loginId, String pw) {
		
		List<User> userList = userRepository.getLoginInfo(loginId, pw);
		
		if(userList.isEmpty()) {
			return null;
		} else {
			return userList.get(0);
		}
	}
}
