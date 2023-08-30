package com.tawny.shop.user.service;

import java.util.Random;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {
	
	private final JavaMailSender javaMailSender;

    public String mailCheck(String email){
        Random random = new Random(); //난수 생성
        String code=""; // 인증번호

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        //message.setFrom("ohohgeunhy@gamil.com");

        for(int i = 0; i < 3; i++){
            int index = random.nextInt(25) + 65;

            code += (char)index;
        }
        int numIndex = random.nextInt(9999) + 1000;

        code += numIndex;
        message.setSubject("인증번호 입력을 위한 메일 전송");
        message.setText("인증 번호 : " + code);

        javaMailSender.send(message);
        return code;
    }
}
