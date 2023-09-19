<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 결제</title>
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
	
			<div class="goods-payment col-6 d-flex justify-content-center">	
				<div class="pay-box col-10">
				
					<h4 class="pt-3 pr-5 mr-5">주문/결제</h4>
					
					<div class="pay-info mt-3 border p-1" data-user-id="${session.userId}">
						<div class="font-weight-bold">수령인 : ${user.name }</div>
						<div class="d-flex justify-content-between align-items-center py-2">
							<div class="font-weight-bold" id="address">배송지 : ${user.address }</div>   
							<input type="text" class="d-none col-9" id="newAddress">
							<button type="button" class="btn btn-sm ml-1" id="addressDirectBtn">직접입력</button>
						</div>
						<div class="small">
							<div class="order-goods-name"></div>
							<div class="order-goods-price py-1"></div>
							<div class="order-goods-count"></div>
						</div>	
					</div>
					
					<div class="pay-method my-3 border p-1">
						<b>결제 수단</b> 
						<div class="pt-2">
							<select id="card" class="form-control">
							 	<c:forEach var="card" items="${pay}">
									<option  value="${card.id}">${card.card }-${card.cardNumber }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="pay-request border p-0">
						<div class="h-25 pl-1 pt-1"><b>요청사항</b></div>
						<textarea class="no-outline w-100 h-75 border-0 mb-1" id="requestInput"></textarea>
					</div>
					
					<div class="pt-5">
						<button type="button" class="btn form-control btn-dark" id="payBtn">결제하기</button>
					</div>
					
				</div>
					
			</div>
	
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
			
			var params = new URLSearchParams(location.search);
			let count = params.get("count");
			let totalPrice = params.get("totalPrice");
			let goodsName = decodeURIComponent(params.get("goodsName"));
			
			// 주문 수량 및 상품 가격 업데이트
			if (count && totalPrice) {
				$(".order-goods-name").append("상품 이름 : " + goodsName + "<br>");
			    $(".order-goods-price").append("상품 가격 : " + totalPrice + "<br>");
			    $(".order-goods-count").append("주문 수량 : " + count + "<br>");
			}
			
			// 배송지 직접입력
			$("#addressDirectBtn").on("click", function() {
			    $("#address").toggleClass("d-none");
			    $("#newAddress").toggleClass("d-none");
			
			    if ($("#newAddress").hasClass("d-none")) {
			        $(this).text("직접입력");
			    } else {
			        $(this).text("취소");
			    }
			});
			
			// 결제하기 버튼
			$("#payBtn").on("click", function() {
				let userId = $(".pay-info").data("user-id");
				let goodsId = params.get("goodsId");
				let payId = $("#card").val();
				let request = $("#requestInput").val();
				let address;				
				
				// 배송지 직접입력 유효성 검사
			    if ($("#newAddress").hasClass("d-none")) {
			        address = $("#address").text().split(": ")[1];
			    } else {
			        address = $("#newAddress").val();
			        if (address == "") {
			        	$("#newAddress").attr("placeholder", "배송지를 입력하세요");
			            return;
			        }
			    }
			   
				$.ajax({
					type:"put"
					, url:"/goods/order"
					, data:{"goodsId":goodsId, "payId":payId, "request":request, "address":address}
					, success:function(data) {
						if(data.result == "success") {
							alert("주문이 완료되었습니다.");
						} else {
							alert("주문 실패");
						}
					}
					, error:function() {
						alert("주문 에러");
					}
				});
			});
		});
	</script>

</body>
</html>