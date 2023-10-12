<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="d-flex p-0">
		
			<!-- 베스트 상품1 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods1.jsp"/>
			<!-- /베스트 상품1 -->
			
			<!-- 모든 주문 목록 -->
			<div class="all-order d-flex justify-content-center">	
				<div class="col-10">
					<h4 class="pt-3 pr-5 mr-5">모든 주문 목록</h4>
					<div class="all-order-list mt-1">
						<c:forEach var="allOrderList" items="${allOrderDetailList }">
							<div class="d-flex border">
								<div class="p-0 order-image">
									<a href="/do/main/goodsInfo/${allOrderList.goods.id }">
										<img alt="${allOrderList.goods.goodsName }" src="${allOrderList.goods.imagePath }" class="w-100 h-100">
									</a>
								</div>
								<div class="col-10 pl-1">
									<div class="d-flex">
										<a href="/do/main/goodsInfo/${allOrderList.goods.id }" class="link">
											<b>${allOrderList.order.delivery }</b> 
								    		(<fmt:formatDate value="${allOrderList.order.updatedAT }" pattern="yyyy-MM-dd"/>)
										</a>
									</div>
									<div class="small d-flex justify-content-between">
										<a href="/do/main/goodsInfo/${allOrderList.goods.id }" class="link">
											<b>${allOrderList.goods.goodsName }</b> <br>
											총 가격 : ${allOrderList.order.totalPrice }원 <br>
											구매 수량 : ${allOrderList.order.quantity }개 <br>
											주문 날짜 : <fmt:formatDate value="${allOrderList.order.createdAT }" pattern="yyyy-MM-dd"/>
										</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /모든 주문 목록 -->
			
			<!-- 베스트 상품2 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods2.jsp"/>
			<!-- /베스트 상품2 -->
		
		</section>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
</body>
</html>