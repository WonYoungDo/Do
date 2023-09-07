<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="container p-0">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="d-flex p-0 border border-dark">
		
			<!-- 베스트 상품1 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods1.jsp"/>
			<!-- /베스트 상품1 -->
			
			<!-- 로그인 -->
			<div class="login col-6 small d-flex justify-content-center">	
				<div class="login-section d-flex justify-content-center align-items-center">
					
					<div class="text-center">
						<!-- 문구 -->
						<h1 class="login-phrase mb-5">환영합니다</h1>
						<!-- 문구 -->
						
						<!-- 입력란 -->				
						<div class="login-box p-5 h-50 border mb-5">
						
							<form id="loginForm">
								<!-- 아이디 입력란 -->
								<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
									<label class="col-3 p-0 mt-2">아이디:</label>
									<input type="text" class="col-8 border-0" id="idInput">
								</div>
								<div class="text-danger small d-none" id="emptyId">아이디를 입력해주세요!</div>
								<!-- /아이디 입력란 -->
								
								<!-- 비밀번호 입력란 -->
								<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-3 pt-2">
									<label class="col-4 p-0 mt-2">비밀번호 :</label>
									<input type="password" class="col-8 border-0" id="pwInput">
								</div>
								<div class="text-danger small d-none" id="emptyPw">비밀번호를 입력해주세요!</div>
								<!-- /비밀번호 입력란 -->
								
								<!-- 로그인 버튼 -->
								<button type="submit" class="btn btn-dark btn-block" id="loginBtn">로그인</button>
								<!-- /로그인 버튼 -->			
							
								<!-- 회원 정보 찾기 -->
								<div class="d-flex justify-content-around pt-2">
									<a href="/do/find/id">아이디 찾기</a>
									<a href="/do/find/pw">비밀번호 찾기</a>
								</div>
								<!-- /회원 정보 찾기 -->
							</form>	
							
						</div>
						<!-- /입력란 -->
					</div>
				</div>
			</div>
			<!-- /로그인 -->
			
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
			
			// 로그인 버튼 클릭 
			$("#loginForm").on("submit", function(e) {
				e.preventDefault();
				
				let id = $("#idInput").val();
				let pw = $("#pwInput").val();
				
				// 유효성 검사
				if(id == "") { 
					$("#emptyId").removeClass("d-none");
					return;
				} else {
					$("#emptyId").addClass("d-none");
				}
				
				if(pw == "") {
					$("#emptyPw").removeClass("d-none");
					return;
				} else {
					$("#emptyPw").addClass("d-none");
				}
				
				$.ajax({
					type:"post"
					, url:"/user/login"
					, data:{"loginId":id, "pw":pw}
					, success:function(data) {
						
						if(data.result == "success") { 
							location.href="/do/main/portal";
						} else {
							alert("회원정보가 일치하지 않습니다.");
						}
					}
					, error:function() {
						alert("로그인 에러");
					}
				});
				
			});
		});
	</script>
	
</body>
</html>