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
						<b>수령인 : ${user.name }</b> <br>
						<b>배송지 : ${user.address }</b> <br>     
						<div class="small pt-4">
							주문 상품 : ${goods.goodsName } <br>
							상품 가격 : ${goods.price } <br>
							주문 수량 :
						</div>	
					</div>
					
					<div class="pay-method my-3 border p-1">
						<b>결제 수단</b> 
						<div class="pt-2">
							<select id="card" class="form-control">
							 	<c:forEach var="card" items="${pay}">
									<option  value="card.id">${card.card }-${card.cardNumber }</option>
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
			
			
			// 결제하기 버튼
			${"#payBtn"}.on("click", function() {
				let userId = $(".pay-info").data("user-id");
				let payId = $("#card").val();
				let request = $("#requestInput").val();
				
				$.ajax({
					type:"put"
					, url:"/goods/order"
					, data:{"userId":userId, "payId":payId, "request":request}
					, success:function(data) {
						if(data.result == "success") {
							alert("결제되었습니다.");
						} else {
							alert("결제 실패");
						}
					}
					, error:function() {
						alert("결제 에러");
					}
				});
			});
		});
	</script>

</body>
</html>