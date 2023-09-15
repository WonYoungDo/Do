package com.tawny.shop.user.member.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.user.member.domain.User;


@Repository
public interface UserRepository {
	
	// 회원가입
	public int insertJoin(
			@Param("loginId") String loginId
			, @Param("pw") String pw
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email
			, @Param("address") String address
			, @Param("saltStr") String saltStr);
	
	// 중복확인
	public int isDuplicateId(@Param("loginId") String loginId);
	
	// 로그인 
	public User getLoginInfo(
			@Param("loginId") String loginId);
	
	// 저장되어 있는 사용자 정보 가져오기 
	public User selectUser(@Param("id") int id);
}
