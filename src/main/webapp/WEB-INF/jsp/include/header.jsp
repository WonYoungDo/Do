<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<header class="d-flex">
	<div class="logo p-0 border border-dark">
		<a href="/do/main/portal">
			<img alt="로고" src="/static/image/로고.1.png" class="col-12 h-100">
		</a>
	</div>
	<nav class="p-0">
		<!-- 카테고리1 -->
		<div class="search border border-dark d-flex justify-content-between align-items-center">
			<!-- 검색 -->
			<div class="pl-3">
				<form id="searchForm">
					<i class="bi bi-search icon-md"></i>
					<input type="text" class="border-input no-outline" id="searchInput">
					<button type="submit" class="d-none">검색</button>
				</form>
			</div>
			<!-- /검색 -->
			
			<c:if test="${empty managerId }">
				<!-- 메뉴 -->
				<div class="small">
					<c:if test="${empty userId }">
						<a href="/do/login" class="text-dark">로그인</a>
						<a href="/do/join" class="text-dark px-2 pr-4">회원가입</a>
					</c:if>	
					<c:if test="${not empty userId }">
						<a href="/do/user/mypage" class="text-dark pr-3">마이페이지</a>
					</c:if>	
				</div>
				<!-- /메뉴 -->
			</c:if>
			
		</div>
		<!-- /카테고리1 -->
		
		<!-- 카테고리2 -->
		<div class="category d-flex border border-dark">
		
			<ul class="nav w-100 d-flex justify-content-center pt-1 text-center">
			<c:choose>
				<%-- 관리자 로그인 시 --%>
				<c:when test="${not empty managerId}">
					<!-- 상품관리 -->		
		            <li class="nav-item">
		            	<a href="#" class="nav-link text-dark font-weight-bold main-category">상품관리</a>
			            <div class="d-none sub-category">
			                <ul class="d-flex justify-content-around">
			                    <li><a href="/manager/goodsUpload" class="dropdown-item">상품등록</a></li>
			                    <li><a href="/manager/goodsList" class="dropdown-item">상품수정</a></li>
			                </ul>
			            </div>
			        </li>
					<!-- /상품관리 -->
					
					<!-- 주문관리 -->		
		            <li class="nav-item">
			            <a href="#" class="nav-link text-dark font-weight-bold main-category">주문관리</a>
			            <div class="d-none sub-category">
			                <ul class="d-flex flex-row justify-content-around">
			                    <li><a href="/do/manager/order/details" class="dropdown-item">주문내역</a></li>
			                </ul>
			            </div>
		       		</li>
					<!-- /주문관리 -->
					
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
				</c:when>
				
				<%-- 기본 사용자 --%>
				<c:otherwise>
					<!-- BEST -->		
		            <li class="nav-item">
		            	<a href="#" class="nav-link text-dark font-weight-bold main-category">BEST</a>
			            <div class="d-none sub-category">
			                <ul class="d-flex justify-content-around">
			                    <li><a href="#" class="dropdown-item">OUTER</a></li>
			                    <li><a href="#" class="dropdown-item">TOP</a></li>
			                    <li><a href="#" class="dropdown-item">PANTS</a></li>
			                    <li><a href="#" class="dropdown-item">SHOES</a></li>
			                    <li><a href="#" class="dropdown-item">ACC</a></li>
			                </ul>
			            </div>
			        </li>
					<!-- /BEST -->
					
					<!-- NEW -->		
		            <li class="nav-item">
			            <a href="#" class="nav-link text-dark font-weight-bold main-category">NEW</a>
			            <div class="d-none sub-category">
			                <ul class="d-flex flex-row justify-content-around">
			                    <li><a href="#" class="dropdown-item">OUTER</a></li>
			                    <li><a href="#" class="dropdown-item">TOP</a></li>
			                    <li><a href="#" class="dropdown-item">PANTS</a></li>
			                    <li><a href="#" class="dropdown-item">SHOES</a></li>
			                    <li><a href="#" class="dropdown-item">ACC</a></li>
			                </ul>
			            </div>
		       		</li>
					<!-- /NEW -->
					
					<!-- OUTER -->		
		            <li class="nav-item">
			            <a href="#" class="nav-link text-dark font-weight-bold main-category">OUTER</a>
			            <div class="d-none sub-category">
			                <ul class="d-flex justify-content-around">
			                    <li><a href="#" class="dropdown-item">패딩</a></li>
			                    <li><a href="#" class="dropdown-item">코트</a></li>
			                    <li><a href="#" class="dropdown-item">집업</a></li>
			                    <li><a href="#" class="dropdown-item">자켓</a></li>
			                </ul>
			            </div>
		            </li>
					<!-- /OUTER -->
					
					<!-- PANTS -->		
		            <li class="nav-item">
			            <a href="#" class="nav-link text-dark font-weight-bold main-category">PANTS</a>
			            <div class="d-none sub-category">
			                <ul class="d-flex justify-content-around">
			                    <li><a href="#" class="dropdown-item">슬랙스</a></li>
			                    <li><a href="#" class="dropdown-item">청바지</a></li>
			                    <li><a href="#" class="dropdown-item">데님</a></li>
			                    <li><a href="#" class="dropdown-item">조거</a></li>
			                    <li><a href="#" class="dropdown-item">반바지</a></li>
			                    <li><a href="#" class="dropdown-item">트레이닝</a></li>
			                </ul>
			            </div>
			        </li>
					<!-- /PANTS -->
					
					<!-- SHOES -->		
		            <li class="nav-item">
			            <a href="#" class="nav-link text-dark font-weight-bold main-category">SHOES</a>
			            <div class="d-none sub-category">
			                <ul class="d-flex justify-content-around">
			                    <li><a href="#" class="dropdown-item">단화</a></li>
			                    <li><a href="#" class="dropdown-item">운동화</a></li>
			                    <li><a href="#" class="dropdown-item">로퍼</a></li>
			                    <li><a href="#" class="dropdown-item">구두</a></li>
			                    <li><a href="#" class="dropdown-item">샌들</a></li>
			                    <li><a href="#" class="dropdown-item">슬리퍼</a></li>
			                </ul>
			            </div>
			        </li>
					<!-- /SHOES -->
					
					<!-- ACC -->		
		            <li class="nav-item">
			            <a href="#" class="nav-link text-dark font-weight-bold main-category">ACC</a>
			            <div class="d-none sub-category">
			                <ul class="d-flex justify-content-around">
			                    <li><a href="#" class="dropdown-item">가방</a></li>
			                    <li><a href="#" class="dropdown-item">지갑</a></li>
			                    <li><a href="#" class="dropdown-item">벨트</a></li>
			                    <li><a href="#" class="dropdown-item">모자</a></li>
			                    <li><a href="#" class="dropdown-item">넥타이</a></li>
			                    <li><a href="#" class="dropdown-item">머플러</a></li>
			                    <li><a href="#" class="dropdown-item">팔찌</a></li>
			                    <li><a href="#" class="dropdown-item">반지</a></li>
			                    <li><a href="#" class="dropdown-item">양말</a></li>
			                </ul>
			            </div>
			        </li>
					<!-- /ACC -->
				</c:otherwise>
			</c:choose>
			</ul>
			 
			<div class="login-user small-text d-flex justify-content-start align-items-center mr-3">
				<c:if test="${not empty managerId}">
					${managerName } <a href="/manager/logout" class="pl-1">로그아웃</a>
				</c:if>
				<c:if test="${not empty userId}">
					${userName } <a href="/user/logout" class="pl-1">로그아웃</a>
				</c:if>
			</div>
			
		</div>
		<!-- /카테고리2 -->
		
	</nav>
</header>
<div class="gap bg-dark border border-dark"></div>
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
			let menuPos = subCategory.offset().left + subCategory.outerWidth() / 2; // 중앙 위치 계산
			let diffPos = buttonPos - menuPos; // 차이 계산
			subCategory.css('transform', 'translateX(' + diffPos + 'px)'); // 위치 조정
		});
		  
	    $(".nav-item").on("mouseleave", function(e) {  
			let subCategory = $(this).find(".sub-category"); 
			subCategory.addClass('d-none'); 	
	    });
	    
	    
	    // 검색 기능 
	    $("#searchForm").on("submit", function(e) {
	    	e.preventDefault();
	    	
	    	let keyword = $("#searchInput").val();
	    	
	    	if(keyword == "") {
				alert("검색어를 입력해주세요.");
				return;
	    	}
	    	
			$.ajax({
				type:"get"
				, url:"/goods/search"
				, data:{"keyword":keyword}
				, success:function(data) {
					
					if(data.result == "success") { 
						location.reload();
					} else {
						alert(data.message);
					}
				}
				, error:function() {
					alert("검색 에러");
				}
			});
	    });
	
	});
</script>




