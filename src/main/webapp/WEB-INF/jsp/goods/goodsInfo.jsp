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
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="d-flex p-0">
		
			<!-- 베스트 상품 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods1.jsp"/>
			<!-- /베스트 상품 -->
			
			<!-- 상품 상세 정보 -->
			<div>
				<div class="goods-info d-flex justify-content-center" data-goods-id="${goods.id}">
				
					<div class="goods d-flex col-10 p-1">
					
						<div class="col-6 p-0">
							<img src="${goods.imagePath }"  class="w-100 h-100">
						</div>
						
						<div class="d-flex flex-column justify-content-between border col-6 p-2">
							<div>
								<div class="border-bottom thick-border pb-3 pt-2">
									<b>${goods.goodsName }</b>
								</div>
								<div class="border-bottom py-2">
									가격 : ${goods.price }
								</div>
								<div class="border-bottom d-flex py-2">
									<div class="d-flex align-items-center" id="count">
										선택 수량 : 1개 
									</div>
									<div class="pl-3 p-0">
										<i class="bi bi-arrow-up-square-fill vertical-icon" id="increase"></i>
										<i class="bi bi-arrow-down-square-fill vertical-icon" id="decrease"></i>
									</div>
									
								</div>	
							</div>
							<div>
								<div class="d-flex justify-content-between p-1">
									<div>
										총 상품 금액 : 
									</div>
									<div id="total">
										${goods.price }원
									</div>
								</div>
								<a type="button" href="/do/goodsOrder" class="btn btn-black form-control text-white" id="paymentBtn">바로 구매</a>
							</div>
						</div>
						
					</div>
				</div>
				<div class="goods-detail d-flex justify-content-center align-items-center">
					<div class="text-center">
						<h3>상세 정보 보기</h3>
						<i class="bi bi-caret-down-fill icon-lg "></i> <br>
						<i class="bi bi-caret-down-fill icon-lg "></i>
					</div>
				</div>
			</div>
			<!-- /상품 상세 정보 -->
			
			<!-- 베스트 상품2 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods2.jsp"/>
			<!-- /베스트 상품2 -->
			
		</section>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
	<script>
		$(document).ready(function() {
			
			let goodsId = $(".goods-info").data("goods-id");
			let goodsName = "${goods.goodsName}";			
			let count = 1;
			let totalPrice = ${goods.price};
			
		    function update() {
		        $("#count").text("선택 수량 : " + count + "개");
		        $("#total").text(totalPrice * count + "원");
		    }
			
		    // 수량 추가
		    $("#increase").on("click", function() {
		        count++;
		        update();
		    });
			
		    // 수량 삭제
		    $("#decrease").on("click", function() {
		        if (count > 1) { 
		            count--;
		            update();
		        }
		    });
		    
			// 로그인이 되어있지 않으면 로그인 페이지로 이동 
			let userId = "${sessionScope.userId}";
			$("#paymentBtn").on("click", function(e) {
				e.preventDefault();

				if(userId == "") {
				    let result = confirm("로그인 후에만 이용이 가능합니다.\n로그인 페이지로 이동하시겠습니까?");
				    if (result) {
				        window.location.href = "/do/login";
				    }
				} else {
					// 바로 구매 버튼 클릭 시 URL에 파라미터 추가
				    $("#paymentBtn").on("click", function(e) {
				    	e.preventDefault();
				    	let href = $(this).attr("href");
				    	href += "?goodsId=" + goodsId;
				    	href += "&count=" + count;
				    	href += "&totalPrice=" + totalPrice * count;
				    	href += "&goodsName=" + encodeURIComponent(goodsName);
						window.location.href = href;
				    });
				}   
			});
		});
	</script>
</body>
</html>