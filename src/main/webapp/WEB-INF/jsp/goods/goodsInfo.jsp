<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
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
			
			<!-- 상품 상세 정보 -->
			<div class="col-6">
			
				<div class="goods-info d-flex justify-content-center">
				
					<div class="goods d-flex col-10 p-0">
					
						<div class="col-7 p-0">
							<img src="${goods.imagePath }"  class="w-100 h-100">
						</div>
						
						<div class="d-flex flex-column justify-content-between border border-dark col-5 p-2">
							<div>
								<div class="border-bottom pb-2">
									${goods.goodsName }
								</div>
								<div class="border-bottom py-2">
									판매가 : ${goods.price }
								</div>
								<div class="border-bottom py-2">
									선택 수량 : 2개
								</div>	
							</div>
							<div>
								<div class="d-flex justify-content-between">
									<div>
										총 상품 금액 : 
									</div>
									<div>
										${goods.price } + ${goods.price } 원
									</div>
								</div>
								<a type="button" href="/do/goodsOrder/${goods.id}" class="btn btn-dark form-control text-white">바로 구매</a>
							</div>
						</div>
						
					</div>
					
				</div>
				
			</div>
			<!-- /상품 상세 정보 -->
			
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