package com.tawny.shop.user.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
	private int id;
	private String loginId;
	private String pw;
	private String name;
	private String phoneNumber;
	private String address;
	private Date createdAT;
	private Date updatedAT;
}
