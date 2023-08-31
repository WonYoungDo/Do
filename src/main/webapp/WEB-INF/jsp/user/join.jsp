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
	<script>
		$(document).ready(function() {
			
			var duplicatedId = true;   // 아이디 중복 여부
			var duplicatedBtn = false; // 중복 확인 버튼 클릭 여부
			var sendVerifyBtn = false; // 인증번호 전송 버튼 클릭 여부
			var verifyCodeBtn = false; // 인증번호 확인 버튼 클릭 여부
			
			
			// 인증번호 일치 확인
			$("#verifyCodeBtn").on("click", function() {
				let verifyCodeInput = $("#verifyCodeInput").val();
				
				// 유효성 검사 -> 인증 번호 입력란
				if(verifyCodeInput == "") {
					$("#emptyVerifyCode").removeClass("d-none");
					return;
				} else {
					$("#emptyVerifyCode").addClass("d-none");
				}
				
				$.ajax({
					type:"post"
					, url:"/user/verifyCheck"
					, data:{"inputCode":verifyCodeInput}
					, success:function(data) {
						
						verifyCodeBtn = true;
						
						if(data.result == "success") { 
							$("#verifyComplete").removeClass("d-none");
							$("#emptyVerifyCode").addClass("d-none");
						} else { 
							$("#notMatchCode").removeClass("d-none");
							return;
						}
						
					}
					, error:function() {
						alert("인증 에러");
					}
				});
			});
			
			
			
			
			
			// 인증 버튼 -> 이메일로 번호 발송
			$("#sendVerifyBtn").on("click", function() {
				let email = $("#emailInput").val();
				
				// 유효성 검사 -> 이메일 입력란
				if(email == "") {
					$("#emptyEmail").removeClass("d-none");
					return;
				} else {
					$("#emptyEmail").addClass("d-none");
				}
				
				$.ajax({
					type:"post"
					, url:"/user/verify"
					, data:{"email":email}
					, success:function(data) {
						
						sendVerifyBtn = true;
						
						if(data.result == "success") {
							$("#verifyBox").removeClass("d-none");
							$("#sendVerityCode").removeClass("d-none");
						} else {
							$("#verifyBox").addClass("d-none");
							$("#sendVerityCode").addClass("d-none");	
						}
						
					}
					, error:function() {
						alert("인증번호 전송 에러");
					}
				});
			});
			
			
			
			
			
			
			// idInput 이벤트 초기화 
			$("#idInput").on("input", function() {
				duplicatedId = true;
				duplicatedBtn = false;
				$("#availableId").addClass("d-none");
				$("#duplicateId").addClass("d-none");
			});
			
			
			
			
			
			// 중복확인 버튼
			$("#duplicateBtn").on("click", function() {
				let id = $("#idInput").val();
				
				// 유효성 검사
				if(id == "") {
					$("#emptyId").removeClass("d-none");
					return;
				} else {
					$("#emptyId").addClass("d-none");
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplication"
					, data:{"loginId":id}
					, success:function(data) {
						
						duplicatedBtn = true;
						duplicatedId = data.isDuplicate;
						
						if(data.isDuplicate) { // 중복
							$("#duplicateId").removeClass("d-none");
							$("#availableId").addClass("d-none");
						} else { // 사용가능 아이디
							$("#availableId").removeClass("d-none");
							$("#duplicateId").addClass("d-none");
						}
					}
					, error:function() {
						alert("중복확인 에러");
					}
				});
			});
				
				
		
			
			
			
			
			// 회원가입 버튼
			$("#joinBtn").on("click", function() {
				let id = $("#idInput").val();
				let pw = $("#pwInput").val();
				let pwCheck = $("#pwCheckInput").val();
				let name = $("#nameInput").val();
				let address = $("#addressInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let email = $("#emailInput").val();
				
				// 유효성 검사
				if(id == "") { 
					$("#emptyId").removeClass("d-none");
					return;
				} else {
					$("#emptyId").addClass("d-none");
				}
				
				if(!duplicatedBtn) {
					$("#duplicate").removeClass("d-none");
					return;
				} else {
					$("#duplicate").addClass("d-none");
				}
				
				if(duplicatedId) {
					$("#duplicateId").removeClass("d-none");
					$("#availableId").addClass("d-none");
					return;
				} else {
					$("#availableId").removeClass("d-none");
					$("#duplicateId").addClass("d-none");
				}
				
				if(pw == "") {
					$("#emptyPw").removeClass("d-none");
					return;
				} else {
					$("#emptyPw").addClass("d-none");
				}
				
				if(pwCheck != pw) {
					$("#emptyPwCheck").removeClass("d-none");
					return;
				} else {
					$("#emptyPwCheck").addClass("d-none");
				}
				
				if(name == "") {
					$("#emptyName").removeClass("d-none");
					return;
				} else {
					$("#emptyName").addClass("d-none");
				}
				
				if(address == "") {
					$("#emptyAddress").removeClass("d-none");
					return;
				} else {
					$("#emptyAddress").addClass("d-none");
				}
				
				if(phoneNumber == "") {
					$("#emptyPhoneNumber").removeClass("d-none");
					return;
				} else {
					$("#emptyPhoneNumber").addClass("d-none");
				}
				
				if(email == "") {
					$("#emptyEmail").removeClass("d-none");
					return;
				} else {
					$("#emptyEmail").addClass("d-none");
				}
				
				if(!sendVerifyBtn) {
					$("#notSendBtn").removeClass("d-none");
					return;
				} else {
					$("#notSendBtn").addClass("d-none");
				}
				
				if(!verifyCodeBtn) {
					$("#notVerifyCodeBtn").removeClass("d-none");
				} else {
					$("#notVerifyCodeBtn").addClass("d-none");
				}
				
				$.ajax({
					type:"post"
					, url:"/user/join"
					, data:{"loginId":id, "pw":pw, "name":name, "address":address, "phoneNumber":phoneNumber, "email":email}
					, success:function(data) {
						
						if(data.result == "success") { 
							location.href="/user/login";
						} else {
							alert("회원가입 실패");
						}
					}
					, error:function() {
						alert("회원가입 에러");
					}
				});
			});
		});
	</script>
	
</body>
</html>