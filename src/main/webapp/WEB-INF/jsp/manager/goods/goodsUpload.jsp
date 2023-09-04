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
			
			<!-- 상품 등록 -->
			<div class="goods-upload col-6 d-flex justify-content-center">	
				<div class="col-10">
					<h4 class="pt-3 pr-5 mr-5">상품 등록</h4>
					<div class="border mt-3">
					
						<!-- 상품 사진 -->
						<div class="goods-image col-6 d-flex align-items-center justify-content-center border">
							<i class="bi bi-plus-square-fill" id="addFileIcon"></i>
							<input type="file" class="d-none" id="addFile">
							<img src="#" id="image" class="d-none">
						</div>
						<!-- /상품 사진 -->
						
						<!-- 상품 설명 -->
						<div>
							<!-- 품명 -->
							<div class="d-flex pt-2">
						 		<label class="pt-2 px-2">품명 :</label>
						 		<input type="text" class="border-0 form-control col-9 small-placeholder" placeholder="(필수) 상품명을 입력하세요." id="goodsNameInput">
							</div>
							<!-- /품명 -->
							
							<!-- 가격 -->
							<div class="d-flex pt-2">
						 		<label class="pt-2 px-2">가격 :</label>
						 		<input type="text" class="border-0 form-control col-9 small-placeholder" placeholder="(필수) 상품 가격을 입력하세요." id="goodsPriceInput">
							</div>
							<!-- /가격 -->
							
							<!-- 수량 -->
							<div class="d-flex pt-2">
						 		<label class="pt-2 px-2">수량 :</label>
						 		<input type="text" class="border-0 form-control col-9 small-placeholder" placeholder="(필수) 상품 최초 수량을 입력하세요." id="goodsCountInput">
							</div>
							<!-- /수량 -->
							
							<!-- 분류 -->
							<div class="d-flex pt-2 pb-2">
						 		<label class="pt-2 px-2">분류 :</label>
						 		<input type="text" class="border-0 form-control col-9 small-placeholder" placeholder="(필수) 분류할 항목을 입력하세요." id="goodsCategoryInput">
							</div>
							<!-- /분류 -->
							
						</div>
						<!-- /상품 설명 -->
					</div>
					<button type="button" class="btn form-control btn-dark mt-2" id="addBtn">등록</button>
				</div>
					
				
			</div>
			<!-- /상품 등록 -->
			
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
			
			// 이미지 미리보기
			$("#addFile").on("change", function() {
				let file = event.target.files[0];
				let reader = new FileReader();
				
				reader.onload = function(e) {
			    	$("#Image").attr("src", e.target.result);
			    	$("#Image").removeClass("d-none");
			    }
					  
			  	reader.readAsDataURL(file);
			});
			
			// 등록하기 버튼
			$("#addBtn").on("click", function() {
				let goodsName = $("#goodsNameInput").val();		
				let goodsPrice = $("#goodsPriceInput").val();	
				let goodsCount = $("#goodsCountInput").val();	
				let goodsCategory = $("#goodsCategoryInput").val();	
				let file = $("#addFile")[0];
				
				// 유효성 검사
				if(goodsName == "") {
					return;
				}
				
				if(goodsPrice instanceof Number) {
					return;
				} else if(goodsPrice == "") {
					return;
				}
				
				if(goodsCount instanceof Number) {
					return;
				} else if(goodsCount == "") {
					return;
				}
				
				if(!(goodsCategory instanceof Number)) {
					return;
				} else if(goodsCategory == "") {
					return;
				}
				
				if(file.files.length == 0) {
					alert("상품 이미지를 선택하세요.");
					return;
				}
				
				var formData = new FormData();
				formData.append("goodsName", goodsName);
				formData.append("price", goodsPrice);
				formData.append("count", goodsCount);
				formData.append("category", goodsCategory);
				formData.append("file", file.files[0]);
				
				$.ajax({
					type:"put"
					, url:"/manager/goodsUpload"
					, data:formData
					, processData:false
					, contentType:false
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("상품 업로드 실패");
						}
					}
					, error:function() {
						alert("상품 업로드 에러");
					}
				});
				
			});
			
			// 상품 이미지 선택
			$("#addFileIcon").on("click", function() {
				$("#addFile").click();	
			});
		});
	</script>
</body>
</html>