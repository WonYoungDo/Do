package com.tawny.shop.user.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.shop.user.domain.User;


@Repository
public interface UserRepository {
	
	// 회원가입
	public User insertJoin(
			@Param("loginId") String loginId
			, @Param("pw") String pw
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("address") String address);
	
	// 중복확인
	public User isDuplicateId(@Param("loginId") String loginId);
	
	// 인증
	

}
