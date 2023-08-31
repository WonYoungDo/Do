package com.tawny.shop.manager.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Manager {
	
	private int id;
	private String loginId;
	private String pw;
	private String name;
	private String phoneNumber;
	private String email;
	private Date createdAT;
	private Date updatedAT;
}
