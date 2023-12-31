<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
			
			<!-- 내정보 -->
			<div class="mypage d-flex justify-content-center">	
				<div class="col-10">
					<h4 class="pt-3 pr-5 mr-5">내정보</h4>
					<div class="mt-3 p-1">
					
						<!-- 아이디 -->
						<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-4">
							<label class="col-2 p-0 mt-2">아이디 :</label>
							<input type="text" class="col-9 border-0 no-outline" id="idInput" value="${user.loginId }" readonly>
						</div>
						<!-- /아이디 -->
						
						<!-- 이름 -->
						<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-4 pt-2">
							<label class="mt-2">이름 :</label> 
							<input type="text" class="col-9 border-0 no-outline" id="nameInput" value="${user.name }" readonly>
						</div>
						<!-- /이름 -->
						
						<!-- 전화번호 -->
						<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
							<label class="col-3 p-0 mt-2">전화번호 :</label>
							<input type="text" class="col-7 border-0 no-outline" id="phoneNumberInput" value="${user.phoneNumber }" readonly>
							<button type="button" class="btn btn-black col-2 btn-sm" id="phoneNumberUpdateBtn">수정</button>
						</div>
						<div class="text-danger small d-none guide-message" id="emptyPhoneNumber">전화번호를 입력해주세요.</div>
						<div class="text-danger small d-none guide-message" id="invalidPhoneNumber">전화번호 형식이 올바르지 않습니다.</div>
						<!-- /전화번호 -->
						
						<!-- 이메일 -->
						<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-4 pt-2">
							<label class="col-3 p-0 mt-2">이메일 :</label>
							<input type="text" class="col-7 border-0 no-outline" id="emailInput" value="${user.email }" readonly>
							<button type="button" class="btn btn-black col-2 btn-sm" id="emailUpdateBtn">수정</button>
						</div>
						<div class="text-danger small d-none guide-message" id="emptyEmail">이메일을 입력해주세요.</div>
						<!-- /이메일 -->

						<!-- 결제 수단 -->
						<div id="address">
							<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark pt-2">
								<label class="mt-2">결제 수단 :</label>
								
								<select id="card" class="col-7 form-control">
							 	<c:forEach var="card" items="${pay}">
									<option  value="card.id">${card.card }-${card.cardNumber }</option>
								</c:forEach>
								
							</select>
								<button type="button" class="btn btn-black col-2 btn-sm" data-toggle="modal" data-target="#moreModal">등록</button>
							</div>
						</div>	
						<!-- /결제 수단 -->

						<!-- 주소 -->
						<div id="address">
							<div class="input-box d-flex align-items-center justify-content-between border-bottom border-dark my-4 pt-2">
								<label class="mt-2">주소 :</label>
								<input type="text" class="col-7 border-0 no-outline" id="addressInput" value="${user.address }" readonly>
								<button type="button" class="btn btn-black col-2 btn-sm" id="addressUpdateBtn">수정</button>
							</div>
						</div>
						<div class="text-danger small d-none guide-message" id="emptyAddress">주소를 입력해주세요.</div>	
						<!-- /주소 -->
						
						<div class="d-flex justify-content-end">
							<button type="button" class="btn btn-black" id="saveBtn">저장</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /내정보 -->
			
			<!-- 베스트 상품2 -->
			<c:import url="/WEB-INF/jsp/include/bestGoods2.jsp"/>
			<!-- /베스트 상품2 -->
		
		</section>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-body text-center">
	      	<h4 class="py-5">결제 수단을 입력해주세요</h4>
	      	<div class="d-flex mb-1">
	      		<label class="col-3 mt-1 pl-4">카드 :</label>
	      		<input type="text" class="col-9" id="cardInput">
	      	</div>
	      	<div class="d-flex">
	      		<label class="col-3 mt-1">카드 번호 :</label>
	      		<input type="text" class="col-9" id="cardNumberInput">
	      	</div>
	      	<div class="d-flex justify-content-end">
	      		<button type="button" class="btn btn-dark mt-5" id="saveCardBtn">등록</button>
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

			// 연락처 수정 버튼
		    $("#phoneNumberUpdateBtn").on("click", function() {
		        let phoneNumberInput = $("#phoneNumberInput");
		        if (phoneNumberInput.prop("readonly")) {
		        	phoneNumberInput.prop("readonly", false); 
		        } else {
		        	phoneNumberInput.prop("readonly", true); 
		        }
		    });
			
			// 주소 수정 버튼
		    $("#addressUpdateBtn").on("click", function() {
		        let addressInput = $("#addressInput");
		        if (addressInput.prop("readonly")) {
		        	addressInput.prop("readonly", false); 
		        } else {
		        	addressInput.prop("readonly", true); 
		        }
		    });
			
			// 이메일 수정 버튼
		    $("#emailUpdateBtn").on("click", function() {
		        let emailInput = $("#emailInput");
		        if (emailInput.prop("readonly")) { 
		            emailInput.prop("readonly", false);
		        } else {
		            emailInput.prop("readonly", true);
		        }
		    });
			
			// 결제 수단 등록
			var newCard;
			$("#saveCardBtn").on("click", function() {
				let card = $("#cardInput").val();		
				let cardNumber = $("#cardNumberInput").val();	
				
				if(card == "") {
					alert("카드사를 입력해주세요.");
					return;
				} else if(/[0-9]/.test(card)) {
					alert("이름이 올바르지 않습니다.");
					return;
				}
				
				if(cardNumber == "") {
					alert("카드 번호를 입력해주세요.");
					return;
				} else if(/[a-zA-Z가-힣]/.test(cardNumber)) {
				    alert("숫자로 입력해주세요.");
				    return;
				}
				
				newCard = {"card":card, "cardNumber":cardNumber};	
				
				$("#moreModal").modal("hide");
			});
			
			// modal창 뒷배경 없애기
			$('#moreModal').on('hidden.bs.modal', function (e) {
			    $('.modal-backdrop').remove(); 
			});
			
			// 내정보 저장 버튼
			$("#saveBtn").on("click", function() {
				let phoneNumberInput = $("#phoneNumberInput").val();
				let addressInput = $("#addressInput").val();
				let emailInput = $("#emailInput").val();
				
				if(phoneNumberInput == "") {
					$("#emptyPhoneNumber").removeClass("d-none");
					return;
				} else if(phoneNumberInput.length != 11 || !phoneNumberInput.startsWith("010")) {
					$("#invalidPhoneNumber").removeClass("d-none");
					return;
				} else {
					$("#emptyPhoneNumber").addClass("d-none");
				}
				
				if(emailInput == "") {
					$("#emptyEmail").removeClass("d-none");
					return;
				} else {
					$("#emptyEmail").addClass("d-none");
				}
				
				if(addressInput == "") {
					$("#emptyAddress").removeClass("d-none");
					return;
				} else {
					$("#emptyAddress").addClass("d-none");
				}
				
				// 카드 등록 아작스
				if(newCard) {
					$.ajax({
						type:"put"
						, url:"/card/register"
						, data:newCard
						, success:function(data) {
							
							if(data.result == "success") { 
								
							} else {
								alert("카드 등록 실패");
							} 
							
						}
						, error:function() {
							alert("카드 등록 에러");
						}
					});
				} 
				
				
				// 내정보 저장 아작스
				$.ajax({
					type:"put"
					, url:"/mypage/updateMyInfo"
					, data:{"phoneNumber":phoneNumberInput, "email":emailInput, "address":addressInput}
					, success:function(data) {
						
						if(data.result == "success") { 
							location.reload();
						} else {
							alert("정보 수정 실패.");
						}
					}
					, error:function() {
						alert("정보 수정 에러");
					}
				});
			});
		});
	</script>	
</body>
</html>