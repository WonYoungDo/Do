package com.tawny.shop.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.config.PasswordEncoding;
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
		
		String encryptPassword = PasswordEncoding.sha256(pw);
		
		int count = userRepository.insertJoin(loginId, encryptPassword, name, phoneNumber, email, address);
				
		return count;		
	}
	
	// 중복확인 기능
	public boolean isDuplication(String loginId) {
		
		int duplicateId = userRepository.isDuplicateId(loginId); 
		
		return duplicateId != 0;
	}
	
	// 이메일 인증 기능
	public boolean mailVerityCheck(int inputCode, HttpSession session) {
		
		Integer sentNumber = (Integer)session.getAttribute("verifyCode");
		
		boolean matched = (sentNumber != null) && (inputCode == sentNumber);
		
		return matched;
	}
	
	// 로그인 기능
	public User login(String loginId, String pw) {
		
		String encryptPassword = PasswordEncoding.sha256(pw);
		
		List<User> userList = userRepository.getLoginInfo(loginId, encryptPassword);
		
		if(userList.isEmpty()) {
			return null;
		} else {
			return userList.get(0);
		}
	}
}
