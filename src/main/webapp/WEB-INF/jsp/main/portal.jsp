<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="main-goods">
		
			<div class="main d-flex">
			
				<!-- 베스트 상품1 -->
				<c:import url="/WEB-INF/jsp/include/bestGoods1.jsp"/>
				<!-- /베스트 상품1 -->
				
				<!-- 베스트 상품2 -->
				<c:import url="/WEB-INF/jsp/include/bestGoods2.jsp"/>
				<!-- /베스트 상품2 -->
				
				<!-- 베스트 상품3 -->
				<c:import url="/WEB-INF/jsp/include/bestGoods3.jsp"/>
				<!-- /베스트 상품3 -->
				
				<div class="pl-2">
					<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
				</div>
			</div>
			
			<div class="portal px-3">
				<c:forEach var="goods" items="${goodsList }">
					<div class="goods border border-dark">
						<a href="/do/main/goodsInfo/${goods.goodsId }" class="link">
							<img alt="${goods.goodsId }" src="${goods.imagePath }" class="w-100 h-100">
						</a>	
						<div class="small p-1">
							<a href="/do/main/goodsInfo/${goods.goodsId }" class="link">	
								<b>${goods.goodsName }</b> <br>
								${goods.price }원
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
			
		</section>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
	<script>
		$(document).ready(function(){
			
			// 상품 링크 더블 클릭 
		    $(".link").on("click", function(e) {
		        e.preventDefault();
		        
		    }).dblclick(function() {
		        window.location = this.href;
		    });
		});
	</script>
</body>
</html>