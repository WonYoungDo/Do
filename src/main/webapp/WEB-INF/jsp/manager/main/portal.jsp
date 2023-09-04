<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(관리자)Do</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="container bg-white p-0">
		<c:import url="/WEB-INF/jsp/include/managerHeader.jsp"/>
		<section class="d-flex flex-wrap border border-dark">
			<div class="goods col-3 small">
				<img src="/static/image/사진1.jpg" class="w-100 h-75">
				<div>
					상품 이름:<br>
					상품 가격:
				</div>
			</div>
			<div class="goods col-3 small">
				<img src="/static/image/사진2.jpg" class="w-100 h-75">
				<div>
					상품 이름:<br>
					상품 가격:
				</div>
			</div>
			<div class="goods col-3 small">
				<img src="/static/image/사진3.jpg" class="w-100 h-75">
				<div>
					상품 이름:<br>
					상품 가격:
				</div>
			</div>
			<div class="goods col-3 small">
				<img src="/static/image/사진4.jpg" class="w-100 h-75">
				<div>
					상품 이름:<br>
					상품 가격:
				</div>
			</div>
			<div class="goods col-3 small">
				<img src="/static/image/사진5.jpg" class="w-100 h-75">
				<div>
					상품 이름: <br>
					상품 가격:
				</div>
			</div>
			<div class="goods col-3 small">
				<img src="/static/image/사진1.jpg" class="w-100 h-75">
				<div>
					상품 이름: <br>
					상품 가격:
				</div>
			</div>
			<div class="goods col-3 small">
				<img src="/static/image/사진7.jpg" class="w-100 h-75">
				<div>
					상품 이름: <br>
					상품 가격:
				</div>
			</div>
			<div class="goods col-3 small">
				<img src="/static/image/사진8.jpg" class="w-100 h-75">
				<div>
					상품 이름: <br>
					상품 가격:
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
</body>
</html>