<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
			
			<!-- 비밀번호 찾기 -->
			<div class="find col-6 small d-flex justify-content-center align-items-center">	
									
					<!-- 입력란 -->				
					<div class="find-pw p-5 border">
					
						<!-- 이름 입력란 -->
						<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
							<label class="col-2 p-0 mt-2">이름:</label>
							<input type="text" class="col-9 border-0">
						</div>
						<!-- /이름 입력란 -->
						
						<!-- 아이디 입력란 -->
						<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
							<label class="col-2 p-0 mt-2">아이디:</label>
							<input type="text" class="col-9 border-0">
						</div>
						<!-- /아이디 입력란 -->
						
						
						<!-- 전화번호 입력란 -->
						<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
							<label class="col-3 p-0 mt-2">전화번호:</label>
							<input type="text" class="col-7 border-0">
							<button type="button" class="btn btn-dark btn-sm col-2 p-0">인증</button>
						</div>
						<!-- /전화번호 입력란 -->
						
						<!-- 인증번호 입력란 -->
						<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
							<label class="col-3 p-0 mt-2">인증번호:</label>
							<input type="text" class="col-7 border-0">
							<button type="button" class="btn btn-dark btn-sm col-2 p-0">확인</button>
						</div>
						<!-- /인증번호 입력란 -->
						
						<!-- 조회한 아이디 -->
						<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark mb-3 pt-2">
							<label class="col-4 p-0 mt-2">임시 비밀번호:</label>
							<input type="text" class="col-7 border-0">
						</div>
						<!-- /조회한 아이디 -->
						
						<!-- 비밀번호 찾기 버튼 -->
						<button type="button" class="btn btn-dark btn-block">비밀번호 찾기</button>
						<!-- /비밀번호 찾기 버튼 -->			
						
						<!-- 회원 정보 찾기 -->
						<div class="d-flex justify-content-around pt-2">
							<a href="/do/login">로그인</a>
							<a href="/do/find/id">아이디 찾기</a>
						</div>
						<!-- /회원 정보 찾기 -->
							
					</div>
					<!-- /입력란 -->
					
			</div>
			<!-- /비밀번호 찾기 -->
			
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