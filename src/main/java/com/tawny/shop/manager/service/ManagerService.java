package com.tawny.shop.manager.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.config.PasswordEncoding;
import com.tawny.shop.manager.domain.Manager;
import com.tawny.shop.manager.repository.ManagerRepository;
import com.tawny.shop.user.domain.User;

@Service
public class ManagerService {
	
	@Autowired
	private ManagerRepository managerRepository;
	
	
	// 회원가입 기능
	public int join(
			String loginId
			, String pw
			, String name
			, String phoneNumber
			, String email) {
		String encryptPassword = PasswordEncoding.sha256(pw);
								 
		int count = managerRepository.insertJoin(loginId, encryptPassword, name, phoneNumber, email);
		
		return count;		
	}
	
	// 중복확인 기능
	public boolean isDuplication(String loginId) {
		
		int duplicateId = managerRepository.isDuplicateId(loginId); 
		
		return duplicateId != 0;
	}
	
	// 이메일 인증 기능
	public boolean mailVerityCheck(int inputCode, HttpSession session) {
		
		Integer sentNumber = (Integer)session.getAttribute("verifyCode");
		
		boolean matched = (sentNumber != null) && (inputCode == sentNumber);
		
		return matched;
	}
	
	// 로그인 기능
	public Manager login(String loginId, String pw) {
		
		String encryptPassword = PasswordEncoding.sha256(pw);
		
		List<Manager> managerList = managerRepository.getLoginInfo(loginId, encryptPassword);
		
		if(managerList.isEmpty()) {
			return null;
		} else {
			return managerList.get(0);
		}
	}
}
