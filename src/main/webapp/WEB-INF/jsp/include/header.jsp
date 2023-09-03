<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<header class="d-flex">
	<div class="logo col-2 p-0 border border-dark">
		<img alt="로고" src="/static/image/로고.1.png" class="col-12 h-100">
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
				<a href="/user/login" class="text-dark pr-2">로그인</a>
				<a href="/user/join" class="text-dark">회원가입</a>
				<a href="#" class="text-dark px-2">마이페이지</a>
			</div>
			<!-- /카테고리1 -->
		</div>
		<!-- /메뉴1 -->
		<!-- 카테고리2 -->
		<div class="category d-flex border border-dark">
		
			<ul class="nav w-100 d-flex justify-content-center pt-1 text-center">
			
				<!-- BEST -->		
	            <li class="nav-item">
	            	<a href="#" class="nav-link text-dark font-weight-bold main-category">BEST</a>
		            <div class="d-none sub-category">
		                <ul class="d-flex justify-content-around">
		                    <li class="text-white"><a href="#" class="dropdown-item text-white font-weight-bold">OUTER</a></li>
		                    <li class="text-white"><a href="#" class="dropdown-item text-white font-weight-bold">TOP</a></li>
		                    <li class="text-white"><a href="#" class="dropdown-item text-white font-weight-bold">PANTS</a></li>
		                    <li class="text-white"><a href="#" class="dropdown-item text-white font-weight-bold">SHOES</a></li>
		                    <li class="text-white"><a href="#" class="dropdown-item text-white font-weight-bold">ACC</a></li>
		                </ul>
		            </div>
		        </li>
				<!-- /BEST -->
				
				<!-- NEW -->		
	            <li class="nav-item">
		            <a href="#" class="nav-link text-dark font-weight-bold main-category">NEW</a>
		            <div class="d-none dropdown-visible p-0 sub-category">
		                <ul class="d-flex flex-row justify-content-around p-0 m-0 w-100">
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">OUTER</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">TOP</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">PANTS</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">SHOES</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">ACC</a></li>
		                </ul>
		            </div>
	       		</li>
				<!-- /NEW -->
				
				<!-- OUTER -->		
	            <li class="nav-item">
		            <a href="#" class="nav-link text-dark font-weight-bold main-category">OUTER</a>
		            <div class="d-none p-0 sub-category">
		                <ul class="d-flex justify-content-around p-0 m-0 w-100">
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">패딩</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">코트</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">집업</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">자켓</a></li>
		                </ul>
		            </div>
	            </li>
				<!-- /OUTER -->
				
				<!-- PANTS -->		
	            <li class="nav-item">
		            <a href="#" class="nav-link text-dark font-weight-bold main-category">PANTS</a>
		            <div class="d-none p-0 sub-category">
		                <ul class="d-flex justify-content-around p-0 m-0 w-100">
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">슬랙스</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">청바지</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">데님</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">조거</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">반바지</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">트레이닝</a></li>
		                </ul>
		            </div>
		        </li>
				<!-- /PANTS -->
				
				<!-- SHOES -->		
	            <li class="nav-item">
		            <a href="#" class="nav-link text-dark font-weight-bold main-category">SHOES</a>
		            <div class="d-none p-0 sub-category">
		                <ul class="d-flex justify-content-around p-0 m-0 w-100">
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">단화</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">운동화</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">로퍼</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">구두</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">샌들</a></li>
		                    <li><a href="#" class="dropdown-item text-white font-weight-bold">슬리퍼</a></li>
		                </ul>
		            </div>
		        </li>
				<!-- /SHOES -->
				
				<!-- ACC -->		
	            <li class="nav-item">
		            <a href="#" class="nav-link text-dark font-weight-bold main-category">ACC</a>
		            <div class="d-none p-0 sub-category">
		                <ul class="d-flex justify-content-around p-0 m-0 w-100">
		                    <li class="text-white"><a href="#" class="dropdown-item text-dark font-weight-bold">가방</a></li>
		                    <li><a href="#" class="dropdown-item text-dark font-weight-bold">지갑</a></li>
		                    <li><a href="#" class="dropdown-item text-dark font-weight-bold">벨트</a></li>
		                    <li><a href="#" class="dropdown-item text-dark font-weight-bold">모자</a></li>
		                    <li><a href="#" class="dropdown-item text-dark font-weight-bold">넥타이</a></li>
		                    <li><a href="#" class="dropdown-item text-dark font-weight-bold">머플러</a></li>
		                    <li><a href="#" class="dropdown-item text-dark font-weight-bold">팔찌</a></li>
		                    <li><a href="#" class="dropdown-item text-dark font-weight-bold">반지</a></li>
		                    <li><a href="#" class="dropdown-item text-dark font-weight-bold">양말</a></li>
		                </ul>
		            </div>
		        </li>
				<!-- /ACC -->
			

			</ul>
			
			<div class="login-user small-text d-flex justify-content-start align-items-center mr-3">
				${userName } <a href="/user/logout" class="pl-1">로그아웃</a>
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
		  
		$(".main-category").on("mouseleave", function(e) {
			$(".sub-category").addClass('d-none');
		});
	
	});
</script>




