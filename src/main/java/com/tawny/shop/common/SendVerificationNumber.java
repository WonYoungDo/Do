package com.tawny.shop.common;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendVerificationNumber {
	
	public static final String ACCOUNT_SID = "발급받은 SID";
	public static final String AUTH_TOKEN = "발급받은 TOKEN";
	
	// SMS 전송
	public static int sendSMS (String country, String phoneNum) {

		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	    
	    // 휴대폰 인증번호 생성
	    int authNum = randomRange(100000, 999999);
	    
	    
	    // 전송대상 휴대폰 번호
	    String sendTarget = "+"+ country + phoneNum;
	    
	    // 전송 메세지
	    String authMsg = "Do에서 발송된 인증번호는 [" + authNum + "]입니다." ;
	    
	    
	    Message message = Message.creator(
	    	// to
	    	new PhoneNumber(sendTarget),
	        // from
	    	new PhoneNumber("Twilio에서 발급받은 번호"), 
	        // message
	    	authMsg).create();
	    
		return authNum;
		
	  }
	    
	  // 인증번호 범위 지정
	  public static int randomRange(int n1, int n2) {
	    return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	  }
}
