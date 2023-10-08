package com.tawny.shop.manager.member.service;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.common.PasswordEncoding;
import com.tawny.shop.manager.member.domain.Manager;
import com.tawny.shop.manager.member.repository.ManagerRepository;
import com.tawny.shop.user.member.domain.User;

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
		
		byte[] salt = PasswordEncoding.createSalt();
		String encryptPassword = PasswordEncoding.sha256(pw, salt);
		
		String saltStr = Base64.getEncoder().encodeToString(salt);
		
		int count = managerRepository.insertManagerJoin(loginId, encryptPassword, name, phoneNumber, email, saltStr);
				
		return count;		
	}
	
	// 중복확인 기능
	public boolean isDuplication(String loginId) {
		
		int duplicateId = managerRepository.isDuplicateManagerId(loginId);
		
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
		
		Manager manager = managerRepository.getManagerLoginInfo(loginId);
		
		if(manager == null) {
			return null;
		} else {
			byte[] salt = Base64.getDecoder().decode(manager.getSaltStr());
			
			String encryptPassword = PasswordEncoding.sha256(pw, salt);
			
			if(!manager.getPw().equals(encryptPassword)) {
				return null;
			} else {
				return manager;
			}
		}
	}

}
