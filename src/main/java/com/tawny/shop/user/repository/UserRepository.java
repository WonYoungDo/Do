package com.tawny.shop.user.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.shop.user.domain.User;


@Repository
public interface UserRepository {
	
	public User insertJoin(
			@Param("loginId") String loginId
			, @Param("pw") String pw
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("address") String address);
	
	public int findByLoginId(String loginId);
//	public int isDuplication(@Param("loginId") String loginId);



}
