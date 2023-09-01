package com.tawny.shop.config;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class PasswordEncoding {
	
	
	public static byte[] createSalt() {
	    SecureRandom random = new SecureRandom();
	    byte[] salt = new byte[16];
	    random.nextBytes(salt);
	    return salt;
	    
	}

	public static String sha256(String message, byte[] salt) {
        String passwordEncode = "";
        try {
            // 솔트 생성


            MessageDigest md = MessageDigest.getInstance("SHA-256");
            
            // 비밀번호와 솔트를 연결
            md.update(salt);
            md.update(message.getBytes());

            byte byteData[] = md.digest();

			// 바이트를 헥사 값으로 변환
			StringBuilder sb = new StringBuilder();
			
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			passwordEncode = sb.toString();

        } catch (NoSuchAlgorithmException e) {
           e.printStackTrace();
        }
        return passwordEncode;
    }

	
}
