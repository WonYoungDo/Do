<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
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
			
			<!-- 상품 수정 -->
			<div class="goods-update d-flex justify-content-center">	
				<div class="col-10">
					<h4 class="pt-3 pr-5 mr-5">상품 수정</h4>
					<div class="goods-update-input border mt-3">
					
						<!-- 상품 사진 -->
						<div class="goods-image col-6 d-flex align-items-center justify-content-center border p-0">
							<img src="${goods.imagePath }" class="w-100 h-100"> 
						</div>
						<!-- /상품 사진 -->
						
						<!-- 상품 설명 -->
						<div>
							<!-- 품명 -->
							<div class="d-flex pt-2">
						 		<label class="pt-2 px-2">품명 : </label>
						 		<input type="text" class="border-0 form-control col-9 small-placeholder" placeholder="수정할 품명을 입력하세요." id="goodsNameInput" value="${goods.goodsName }">
							</div>
							<!-- /품명 -->
							
							<!-- 가격 -->
							<div class="d-flex pt-2">
						 		<label class="pt-2 px-2">가격 :</label>
						 		<input type="text" class="border-0 form-control col-9 small-placeholder" placeholder="수정할 상품 가격을 입력하세요." id="goodsPriceInput" value="${goods.price }">
							</div>
							<!-- /가격 -->
							
							<!-- 수량 -->
							<div class="d-flex pt-2">
						 		<label class="pt-2 px-2">수량 :</label>
						 		<input type="text" class="border-0 form-control col-9 small-placeholder" placeholder="수정할 상품 수량을 입력하세요." id="goodsCountInput" value="${goods.count }">
							</div>
							<!-- /수량 -->
							
							<!-- 분류 -->
							<div class="d-flex pt-2 pb-2">
						 		<label class="pt-2 px-2">분류 :</label>
						 		<input type="text" class="border-0 form-control col-9 small-placeholder" placeholder="수정할 분류 항목을 입력하세요" id="goodsCategoryInput" value="${goods.category }">
							</div>
							<!-- /분류 -->
						</div>
						<!-- /상품 설명 -->
					</div>
					
					<div class="d-flex justify-content-between my-2">
						<button type="button" class="btn form-control btn-danger col-3" id="deleteBtn" data-goods-id="${goods.id }">삭제</button>
						<button type="button" class="btn form-control btn-black col-3" id="saveBtn" data-goods-id="${goods.id }">저장</button>
					</div>
					
				</div>
					
			</div>
			<!-- /상품 수정 -->
			
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
			
			// 삭제 버튼
			$("#deleteBtn").on("click", function() {
				let goodsId = $(this).data("goods-id");
				
				alert("해당 상품을 삭제하시겠습니까?")
				$.ajax({
					type:"delete"
					, url:"/manager/goodsDelete"
					, data:{"goodsId":goodsId}
					, success:function(data) {
						if(data.result == "success") {
							alert("삭제되었습니다.");
							location.reload();
						} else {
							alert("게시물 삭제 실패");
						}
					}
					, error:function() {
						alert("게시물 삭제 에러");
					}
				});
			});
			
			// 수정 버튼
			$("#saveBtn").on("click", function() {
				let goodsName = $("#goodsNameInput").val();
				let goodsPrice = $("#goodsPriceInput").val();
				let goodsCount = $("#goodsCountInput").val();
				let goodsCategory = $("#goodsCategoryInput").val();
				let goodsId = $(this).data("goods-id");

				// 유효성 검사
				if(goodsName == "") {
					alert("제목을 입력해주세요.");
					return;
				}
				if(goodsPrice == "") {
					alert("작성할 내용을 입력해주세요.");
					return;
				}
				if(goodsCount == "") {
					alert("제목을 입력해주세요.");
					return;
				}
				if(goodsCategory == "") {
					alert("작성할 내용을 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"put"
					, url:"/manager/goodsUpdate"
					, data:{"goodsId":goodsId, "goodsName":goodsName, "price":goodsPrice, "count":goodsCount, "category":goodsCategory}
					, success:function(data) {
						if(data.result == "success") {
							alert("저장되었습니다.");
							location.reload();
						} else {
							alert("수정 실패");
						}
					}
					, error:function() {
						alert("수정 에러");
					}
				});
			});
		});
	</script>
	
</body>
</html>