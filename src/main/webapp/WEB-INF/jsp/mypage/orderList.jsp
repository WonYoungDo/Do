<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
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
			
			<!-- 주문 목록 -->
			<div class="mypage col-6 d-flex justify-content-center">	
				<div class="col-10">
					<h4 class="pt-3 pr-5 mr-5">주문 목록</h4>
					<div class="d-flex justify-content-between font-weight-bold mt-1 p-1">
						<a href="/do/user/mypage/order/list?orderListType=recent" class="link">최근 1개월</a>
    					<a href="/do/user/mypage/order/list?orderListType=all" class="link">전체조회</a>
					</div>
					<div class="mypage-order-list mt-1 p-1">
						<c:forEach var="order" items="${orderList }">
							<div class="d-flex border">
								<div class="p-0 order-image">
									<a href="/do/main/goodsInfo/${order.goods.id }">
										<img alt="${order.goods.goodsName }" src="${order.goods.imagePath }" class="order-img">
									</a>
								</div>
								<div class="col-10 pl-1">
									<div class="d-flex">
										<a href="/do/main/goodsInfo/${order.goods.id }" class="link">
											<b>${order.delivery }</b> - 
								    		(<fmt:formatDate value="${order.createdAT}" pattern="yyyy-MM-dd"/>)
										</a>
									</div>
									<div class="small d-flex justify-content-between">
										<a href="/do/main/goodsInfo/${order.goods.id }" class="link">
											${order.goods.goodsName } <br>
											총 가격 : ${order.totalPrice }원 <br>
											구매 수량 : ${order.quantity }개
										</a>
										<div class="pl-5 pt-2">
											<button type="button" class="order-btn btn btn-sm btn-dark p-0 form-control col-12 mb-1" id="cancelBtn" data-toggle="modal" data-target="#moreModal" 
												data-order-id="${order.id}" data-goods-id="${order.goods.id}" data-pay-id="${order.payId}">
												주문취소
											</button>
											<button type="button" class="order-btn btn btn-sm btn-dark p-0 form-control" id="returnBtn"  data-toggle="modal" data-target="#moreModal"
												data-order-id="${order.id}" data-goods-id="${order.goods.id}" data-pay-id="${order.payId}">
												반품
											</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /주문 목록 -->
			
			<!-- 베스트 상품2 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods2.jsp"/>
			<!-- /베스트 상품2 -->
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-body text-center">
	      	<h4 class="py-5">취소/반품 사유를 입력해주세요</h4>
	      	<div class="d-flex mb-1">
	      		<textarea rows="5" cols="100" id="cancelReasonInput"></textarea>
	      	</div>
	      	<div class="d-flex justify-content-end">
	      		<button type="button" class="btn btn-dark mt-5" id="saveCancelReasonBtn">저장</button>
	      	</div>
	      </div>
	    </div>
	  </div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
	<script>
		$(document).ready(function() {
		    let orderId;
		    let goodsId;
		    let payId;
			let deliveryStatus;
			let guide;

		    // 주문 취소/반품 버튼 
		    $(".order-btn").on("click", function() {
		        orderId = $(this).data("order-id"); 
		        goodsId = $(this).data("goods-id");
		        payId = $(this).data("pay-id");
		        
		        if ($(this).attr('id') === 'cancelBtn') {
		            guide = '주문 취소';
		            deliveryStatus = 'cancel';
		        } else if ($(this).attr('id') === 'returnBtn') {
		            guide = '반품 요청';
		            deliveryStatus = 'return';
		        }
		    });
		    
			// 주문 취소/반품 버튼 
			$("#saveCancelReasonBtn").on("click", function() {
				let cancelReason = $("#cancelReasonInput").val();
				
				// 유효성 검사
				if(cancelReason == "") {
					alert("사유를 입력해주세요");
					return;
				}
				
				alert(orderId + " " + goodsId + " " + payId + " " + deliveryStatus);
				$.ajax({
					type:"put"
					, url:"/after/sales"
					, data:{"orderId":orderId, "goodsId":goodsId, "payId":payId, "cancelReason":cancelReason, "deliveryStatus": deliveryStatus}
					, success:function(data) {
						
						if(data.result == "success") { 
							location.href="/do/user/mypage/order/cancelReturn";
						} else {
							alert(guide + " 실패");
						} 
						
					}
					, error:function() {
						alert(guide + " 에러");
					}
				});
			});
			
		});
	</script>
</body>
</html>