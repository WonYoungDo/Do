<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="container p-0">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="d-flex p-0">
		
			<!-- 베스트 상품1 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods1.jsp"/>
			<!-- /베스트 상품1 -->
			
			<!-- 회원가입 -->
			<div class="join col-6 small d-flex justify-content-center">
				
				<!-- 입력란 -->				
				<div class="join-box col-10 p-5">
				
					<!-- 아이디 입력란 -->
					<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
						<label class="col-2 p-0 mt-2">아이디:</label>
						<input type="text" class="col-7 border-0" id="idInput">
						<button type="button" class="btn btn-dark btn-sm col-2 p-0" id="duplicateBtn">중복확인</button>
					</div>
					<div class="text-danger small d-none" id="emptyId">아이디를 입력해주세요!</div>
					<div class="text-success small d-none" id="availableId">사용가능한 아이디입니다.</div>
					<div class="text-danger small d-none" id="duplicateId">사용중인 아이디입니다.</div>
					<div class="text-danger small d-none" id="duplicate">중복확인을 해주세요!</div>
					<!-- /아이디 입력란 -->
					
					<!-- 비밀번호 입력란 -->
					<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
						<label class="mt-2">비밀번호 :</label>
						<input type="text" class="col-7 border-0" id="pwInput">
					</div>
					<div class="text-danger small d-none" id="emptyPw">비밀번호를 입력해주세요!</div>
					<!-- /비밀번호 입력란 -->
					
					<!-- 비밀번호 확인란 -->
					<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
						<label class="mt-2">비밀번호 확인 :</label>
						<input type="password" class="col-7 border-0" id="pwCheckInput">
					</div>
					<div class="text-danger small d-none" id="emptyPwCheck">비밀번호를 확인해주세요!</div>
					<!-- /비밀번호 확인란 -->
					
					<!-- 이름 입력란 -->
					<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
						<label class="mt-2">이름 :</label>
						<input type="text" class="col-7 border-0" id="nameInput">
					</div>
					<div class="text-danger small d-none" id="emptyName">이름을 입력해주세요!</div>
					<!-- /이름 입력란 -->
					
					<!-- 주소 입력란 -->
					<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
						<label class="mt-2">주소 :</label>
						<input type="text" class="col-7 border-0" id="addressInput">
					</div>
					<div class="text-danger small d-none" id="emptyAddress">주소를 입력해주세요!</div>
					<!-- /주소 입력란 -->
					
					<!-- 전화번호 입력란 -->
					<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
						<label class="col-3 p-0 mt-2">전화번호:</label>
						<input type="text" class="col-6 border-0" id="phoneNumberInput">
					</div>
					<div class="text-danger small d-none" id="emptyPhoneNumber">전화번호를 입력해주세요!</div>
					<!-- /전화번호 입력란 -->
					
					<!-- 이메일 입력란 -->
					<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
						<label class="col-3 p-0 mt-2">이메일:</label>
						<input type="text" class="col-6 border-0" id="emailInput">
						<button type="button" class="btn btn-dark btn-sm p-0 col-2" id="sendVerifyBtn">인증</button>
					</div>
					<div class="text-danger small d-none" id="emptyEmail">이메일을 입력해주세요!</div>
					<div class="text-success small d-none" id="sendVerityCode">인증번호를 전송했습니다.</div>
					<div class="text-danger small d-none" id="notSendBtn">인증번호 전송 버튼을 눌러주세요!</div>
					<!-- /이메일 입력란 -->
					
					<!-- 인증번호 입력란 -->
					<div class="d-none" id="verifyBox">
						<div class="join-input d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
							<label class="col-3 p-0 mt-2">인증번호:</label>
							<input type="text" class="col-6 border-0" id="verifyCodeInput">
							<button type="button" class="btn btn-dark btn-sm p-0 col-2" id="verifyCodeBtn">확인</button>
						</div>					
					</div>
					<div class="text-danger small d-none" id="emptyVerifyCode">인증번호가 일치하지 않습니다.</div>
					<div class="text-danger small d-none" id="notVerifyCodeBtn">인증번호 확인 버튼을 눌러주세요!</div>
					<div class="text-success small d-none" id="verifyComplete">인증이 완료되었습니다.</div>
					<div class="text-danger small d-none" id="notMatchCode">인증번호가 일치하지 않습니다.</div>
					<!-- /인증번호 입력란 -->
					
					<!-- 회원가입 버튼 -->
					<button type="button" class="btn btn-dark btn-block mt-5" id="joinBtn">회원가입</button>
					<!-- /회원가입 버튼 -->
									
				</div>
				<!-- /입력란 -->
				
			</div>
			<!-- /회원가입 -->
			
			<!-- 베스트 상품2 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods2.jsp"/>
			<!-- /베스트 상품2 -->
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
</body>
</html>