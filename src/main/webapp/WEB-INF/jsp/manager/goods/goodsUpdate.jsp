<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="container p-0">
		<c:import url="/WEB-INF/jsp/include/managerHeader.jsp"/>
		
		<section class="d-flex p-0 border border-dark">
		
			<!-- 베스트 상품1 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods1.jsp"/>
			<!-- /베스트 상품1 -->
			
			<!-- 상품 수정 -->
			<div class="goods-upload col-6 d-flex justify-content-center">	
				<div class="col-10">
					<h4 class="pt-3 pr-5 mr-5">상품 수정</h4>
					<div class="border mt-3">
						<!-- 상품 사진 -->
						<div class="goods-image col-6 d-flex align-items-center justify-content-center border">

						</div>
						<!-- /상품 사진 -->
						
						<!-- 상품 설명 -->
						<div>
							<div class="d-flex pt-2">
						 		<label class="pt-1 px-2">상품 이름 :</label>
						 		<input type="text" class="border-0 form-control col-9">
							</div>
							<div class="d-flex pt-2">
						 		<label class="pt-1 px-2">상품 가격 :</label>
						 		<input type="text" class="border-0 form-control col-9">
							</div>
							<div class="d-flex pt-2">
						 		<label class="pt-1 px-2">상품 수량 :</label>
						 		<input type="text" class="border-0 form-control col-9">
							</div>
							<div class="d-flex pt-2">
						 		<label class="pt-1 px-2">상품 분류 :</label>
						 		<input type="text" class="border-0 form-control col-9">
							</div>
						</div>
						<!-- /상품 설명 -->
					</div>
					
					<div class="d-flex justify-content-between mt-2">
						<button type="button" class="btn form-control btn-danger col-3">삭제</button>
						<button type="button" class="btn form-control btn-dark col-3">저장</button>
					</div>
					
				</div>
					
				
			</div>
			<!-- /상품 수정 -->
			
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