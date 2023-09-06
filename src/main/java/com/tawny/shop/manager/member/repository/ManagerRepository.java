package com.tawny.shop.manager.member.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.shop.manager.member.domain.Manager;

@Repository
public interface ManagerRepository {
	
	// 회원가입
	public int insertJoin(
			@Param("loginId") String loginId
			, @Param("pw") String pw
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email
			, @Param("saltStr") String saltStr);
	
	// 중복확인
	public int isDuplicateId(@Param("loginId") String loginId);
	
	// 로그인 
	public Manager getLoginInfo(
			@Param("loginId") String loginId);
}
