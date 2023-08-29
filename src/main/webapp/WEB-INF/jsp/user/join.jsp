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
						<input type="text" class="col-7 border-0" id="pwCheckInput">
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
					
					<!-- 전화번호 입력 -->
					<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
						<label class="col-3 p-0 mt-2">전화번호:</label>
						<input type="text" class="col-6 border-0" id="phoneNumberInput">
						<button type="button" class="btn btn-dark btn-sm p-0 col-2" id="proveBtn">인증</button>
					</div>
					<div class="text-danger small d-none" id="emptyPhoneNumber">전화번호를 입력해주세요!</div>
					<!-- /전화번호 입력 -->
					
					<!-- 인증번호 입력란 -->
					<div class="d-none" id="proveBox">
						<div class="join-input d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
							<label class="col-3 p-0 mt-2">인증번호:</label>
							<input type="text" class="col-6 border-0" id="CertificationInput">
							<button type="button" class="btn btn-dark btn-sm p-0 col-2" id="">확인</button>
						</div>					
					</div>
					<div class="text-danger small d-none" id="emptyCertification">인증번호를 입력해주세요!</div>
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
			
			// 아이디 중복
			var duplicatedId = true;
			
			// 중복버튼 
			var duplicatedBtn = false;
			
			// 전화번호 인증 버튼 
			var phoneNumberproveBtn = false;
			
			// 인증번호 확인 버튼
			var CertificationCheckBtn = false;
			
			// 인증번호 버튼
			$("#proveBtn").on("click", function() {
				let phoneNumber = $("#phoneNumberInput").val();
				let Certification = $("#CertificationInput").val();
				
				if(phoneNumber == "") {
					$("#emptyPhoneNumber").removeClass("d-none");
					return;
				} else {
					$("#emptyPhoneNumber").addClass("d-none");
					$("#proveBox").removeClass("d-none");
				}
				
				if(Certification == "") {
					$("#emptyCertification").removeClass("d-none");
					return;
				} else {
					$("#emptyCertification").addClass("d-none");
				}
				
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
				
				$.ajax({
					type:"post"
					, url:"/user/join"
					, data:{"loginId":id, "pw":pw, "name":name, "address":address, "phoneNumber":phoneNumber}
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