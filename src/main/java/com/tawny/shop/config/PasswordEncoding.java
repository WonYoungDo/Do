package com.tawny.shop.config;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class PasswordEncoding {
	
	public static String salting(String message) {
        String passwordEncode = "pw";
        try {
            // 솔트 생성
            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[16];
            random.nextBytes(salt);

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            
            // 비밀번호와 솔트를 연결
            md.update(salt);
            md.update(passwordEncode.getBytes());

            byte byteData[] = md.digest();

			// 바이트를 헥사 값으로 변환
			StringBuilder sb = new StringBuilder();
			
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			System.out.println("Hex format : " + sb.toString());

        } catch (NoSuchAlgorithmException e) {
           e.printStackTrace();
        }
    }
}
