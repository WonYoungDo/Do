package com.tawny.shop.manager.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.shop.common.MailService;
import com.tawny.shop.manager.member.domain.Manager;
import com.tawny.shop.manager.member.service.ManagerService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/manager")
public class ManagerRestController {
	
	@Autowired
	private ManagerService ManagerService;
	
	@Autowired
	private MailService mailService ;
	
	// 회원가입 기능
	@PostMapping("/join")
	public Map<String, String> join(
			@RequestParam("loginId") String loginId
			, @RequestParam("pw") String pw
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email) {
		int count = ManagerService.join(loginId, pw, name, phoneNumber, email);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 아이디 중복확인
	@GetMapping("/duplication")
	public Map<String,Boolean> duplication(@RequestParam("loginId") String loginId) {
		
		boolean isDuplicate = ManagerService.isDuplication(loginId);

		Map<String, Boolean> resultMap = new HashMap<>();
		if(isDuplicate) {
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}
		return resultMap;
	}
	
	// 메일 전송
	@PostMapping("/verify")
	public Map<String, String> mailVerify(@RequestParam("email") String email, HttpSession session) {
		
		int sentVerifyCode = mailService.sendMail(email);

		Map<String, String> resultMap = new HashMap<>();
		if(sentVerifyCode != 0) {
			resultMap.put("result", "success");
			session.setAttribute("verifyCode", sentVerifyCode);
		} else {
			resultMap.put("result", "fail");
		}
		
        return resultMap;
    }
		
	// 메일 인증
	@PostMapping("/verifyCheck")
	public Map<String, String> mailVerityCheck(@RequestParam("inputCode") int inputCode, HttpSession session) {
		
		boolean isMatched = ManagerService.mailVerityCheck(inputCode, session);
		
		
		Map<String, String> resultMap = new HashMap<>();
		if(isMatched) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 로그인
	@PostMapping("/login")
	public Map<String, String> login(			
			@RequestParam("loginId") String loginId
			, @RequestParam("pw") String pw
			, HttpSession session) {
		Manager manager = ManagerService.login(loginId, pw);
		
		Map<String, String> resultMap = new HashMap<>();
		
		boolean AlreadyLoggedInUser = session.getAttribute("userId") != null;
		boolean AlreadyLoggedInManager = session.getAttribute("managerId") != null;
		
		if(AlreadyLoggedInUser || AlreadyLoggedInManager) {
			resultMap.put("result", "AlreadyLoggedIn");
			
		} else {
			if(manager != null) {
				resultMap.put("result", "success");
				session.setAttribute("managerId", manager.getId());
				session.setAttribute("managerName", manager.getName());
			} else {
				resultMap.put("result", "fail");
			}
		}
		return resultMap;
	}
	
	
}
