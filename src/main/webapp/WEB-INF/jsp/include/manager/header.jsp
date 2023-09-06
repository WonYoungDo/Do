<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<header class="d-flex">
	<div class="logo col-2 p-0 border border-dark">
		<a href="/manager/main/portal">
			<img alt="로고" src="/static/image/로고.1.png" class="col-12 h-100">
		</a>
	</div>
	<nav class="col-10 p-0">
		<!-- 카테고리1 -->
		<div class="search border border-dark d-flex justify-content-between align-items-center">
			<!-- 검색 -->
			<div class="pl-3">
				<i class="bi bi-search icon-md"></i>
				<input type="text" class="border-input">
				<button type="button" class="d-none">검색</button>
			</div>
			<!-- /검색 -->
			<!-- 메뉴 -->
			<div class="small">
				<a href="/manager/login" class="text-dark pr-2">로그인</a>
				<a href="/manager/join" class="text-dark">회원가입</a>
				<a href="#" class="text-dark px-2">마이페이지</a>
			</div>
			<!-- /카테고리1 -->
		</div>
		<!-- /메뉴1 -->
		<!-- 카테고리2 -->
		<div class="category d-flex border border-dark">
		
			<ul class="nav w-100 d-flex justify-content-center pt-1 text-center">
			
				<!-- 상품관리 -->		
	            <li class="nav-item">
	            	<a href="#" class="nav-link text-dark font-weight-bold main-category">상품관리</a>
		            <div class="d-none sub-category">
		                <ul class="d-flex justify-content-around">
		                    <li><a href="/manager/goodsUpload" class="dropdown-item">상품등록</a></li>
		                    <li><a href="/manager/goodsUpdate" class="dropdown-item">상품수정</a></li>
		                </ul>
		            </div>
		        </li>
				<!-- /상품관리 -->
				
				<!-- 주문관리 -->		
	            <li class="nav-item">
		            <a href="#" class="nav-link text-dark font-weight-bold main-category">주문관리</a>
		            <div class="d-none sub-category">
		                <ul class="d-flex flex-row justify-content-around">
		                    <li><a href="#" class="dropdown-item">주문내역</a></li>
		                </ul>
		            </div>
	       		</li>
				<!-- /주문관리 -->
				
				<!-- 회원관리 -->		
	            <li class="nav-item">
		            <a href="#" class="nav-link text-dark font-weight-bold main-category">회원관리</a>
		            <div class="d-none sub-category">
		                <ul class="d-flex justify-content-around">
		                    <li><a href="#" class="dropdown-item">회원 리스트</a></li>
		                </ul>
		            </div>
		        </li>
				<!-- /회원관리 -->
				
				<!-- 재고관리 -->		
	            <li class="nav-item">
		            <a href="#" class="nav-link text-dark font-weight-bold main-category">재고관리</a>
		            <div class="d-none sub-category">
		                <ul class="d-flex justify-content-around">
		                    <li><a href="#" class="dropdown-item">재고현황</a></li>
		                </ul>
		            </div>
		        </li>
				<!-- /재고관리 -->
			
			</ul>
			
			<div class="login-user small-text d-flex justify-content-start align-items-center mr-3">
				<c:if test="${not empty userId}">
					${userName } <a href="/user/logout" class="pl-1">로그아웃</a>
				</c:if>
			</div>
		</div>
		<!-- /카테고리2 -->
		
	</nav>
</header>
<div class="gap bg-dark border border-dark">1</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	

<script>
	$(document).ready(function() {
		
		$(".main-category").on("mouseenter", function(e) { // 클래스 기반으로 바꾸고
			e.preventDefault();
			
			let subCategory = $(this).next(".sub-category"); // 클래스 기반으로 변경
			
			if (!subCategory.hasClass("d-none")) {
			    return;
			}
			subCategory.removeClass("d-none");
			
			// 가운데 정렬을 위한 위치 조정
			let buttonPos = $(this).offset().left + $(this).outerWidth() / 2; // 중앙 위치 계산
			let menuPos = dropdownMenu.offset().left + dropdownMenu.outerWidth() / 2; // 중앙 위치 계산
			let diffPos = buttonPos - menuPos; // 차이 계산
			dropdownMenu.css('transform', 'translateX(' + diffPos + 'px)'); // 위치 조정
		});
		  
	    $(".nav-item").on("mouseleave", function(e) {  
			let subCategory = $(this).find(".sub-category"); 
			subCategory.addClass('d-none'); 	
	    });
	
	});
</script>




