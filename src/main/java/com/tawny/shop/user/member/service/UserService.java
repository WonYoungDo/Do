package com.tawny.shop.user.member.service;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.common.PasswordEncoding;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.user.member.domain.User;
import com.tawny.shop.user.member.repository.UserRepository;

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
		
		byte[] salt = PasswordEncoding.createSalt();
		String encryptPassword = PasswordEncoding.sha256(pw, salt);
		
		String saltStr = Base64.getEncoder().encodeToString(salt);
		
		int count = userRepository.insertJoin(loginId, encryptPassword, name, phoneNumber, email, address, saltStr);
				
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
		
		User user = userRepository.getLoginInfo(loginId);
		
		byte[] salt = Base64.getDecoder().decode(user.getSaltStr());
		
		String encryptPassword = PasswordEncoding.sha256(pw, salt);
		
		if(!user.getPw().equals(encryptPassword)) {
			return null;
		} else {
			return user;
		}
	}
	
	
	// id를 기반으로 등록된 사용자 정보 
	public User getUser(int id) {
		return userRepository.selectUser(id);
	}
	
	
	// 내 정보 수정 
	public int updateMyInfo(int userId, String address, String email, String phoneNumber) {
		return userRepository.updateMyInfo(userId, email, phoneNumber, address);
	}
}
