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
	<div id="wrap" class="container bg-white p-0">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="d-flex p-0">
		
			<!-- 베스트 상품 -->
			<div class="best-goods col-3 p-0">
				<img src="/static/image/메인 사진1.jpg" class="w-100 h-100">
			</div>
			<!-- /베스트 상품 -->
			
			<!-- 회원가입 -->
			<div class="join col-6 small d-flex justify-content-center">
				
				<!-- 뒤로가기 -->
				<div class="pt-3">
					<i class="bi bi-backspace-fill icon-sm"></i>
				</div>
				<!-- /뒤로가기 -->
								
				<div class="join-box col-10 p-5">
				
					<!-- 아이디 입력란 -->
					<div class="join-input d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
						<label class="col-2 p-0 mt-2">아이디:</label>
						<input type="text" class="col-7 border-0">
						<button type="button" class="btn btn-dark btn-sm col-2 p-0">중복확인</button>
					</div>
					<!-- /아이디 입력란 -->
					
					<!-- 비밀번호 입력란 -->
					<div class="join-input d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
						<label class="mt-2">비밀번호 :</label>
						<input type="text" class="col-7 border-0">
					</div>
					<!-- /비밀번호 입력란 -->
					
					<!-- 비밀번호 확인란 -->
					<div class="join-input d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
						<label class="mt-2">비밀번호 확인 :</label>
						<input type="text" class="col-7 border-0">
					</div>
					<!-- /비밀번호 확인란 -->
					
					<!-- 이름 입력란 -->
					<div class="join-input d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
						<label class="mt-2">이름 :</label>
						<input type="text" class="col-7 border-0">
					</div>
					<!-- /이름 입력란 -->
					
					<!-- 주소 입력란 -->
					<div class="join-input d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
						<label class="mt-2">주소 :</label>
						<input type="text" class="col-7 border-0">
					</div>
					<!-- /주소 입력란 -->
					
					<!-- 전화번호 입력 -->
					<div class="join-input d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
						<label class="col-3 p-0 mt-2">전화번호:</label>
						<input type="text" class="col-6 border-0">
						<button type="button" class="btn btn-dark btn-sm p-0 col-2">인증</button>
					</div>
					<!-- /전화번호 입력 -->
					
					<!-- 인증번호 입력란 -->
					<div class="d-none">
						<div class="join-input d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
							<label class="col-3 p-0 mt-2">인증번호:</label>
							<input type="text" class="col-6 border-0">
							<button type="button" class="btn btn-dark btn-sm p-0 col-2">확인</button>
						</div>					
					</div>
					<!-- /인증번호 입력란 -->
					
					<!-- 회원가입 버튼 -->
					<button type="button" class="btn btn-dark btn-block mt-5">회원가입</button>
					<!-- /회원가입 버튼 -->				
				</div>
			</div>
			<!-- /회원가입 -->
			
			<!-- 베스트 상품 -->
			<div class="best-goods col-3 p-0">
				<img src="/static/image/메인사진 2.jpg" class="w-100 h-100">
			</div>
			<!-- /베스트 상품 -->
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
</body>
</html>