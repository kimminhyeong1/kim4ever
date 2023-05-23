<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-자전거 소개</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css"> 
		<style type="text/css">
		 
		 </style> 
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section id="container">
			<div class="content">
				<div id="box">
					<div class="left-section">
			        	<img src="../resources/bikeimg/일반자전거.jpg" alt="일반자전거">
			        </div>
			        <div class="right-section">
						<p>일반 자전거</p>
						<p>남녀노소 즐길 수 있는 자전거입니다!</p>
						<p>자전거 고유번호 : hy001</p>
						<p>오목대여소</p>
						<p>이용요금 : 1000원</p>
						<p>
						<label for="phone-number">휴대폰번호</label>
						</p>
						<p>
						<input type="text" id="phone-number" oninput="autoHyphen2(this)" maxlength="13">
						<button type="button" onclick="sendVerificationCode()">확인</button>
						</p>
						<p>
						<label for="verification-code">인증번호</label></p>
						<p>
						<label for="verification-code">인증번호</label>
						</p>
						<p>
						<input type="text" id="verification-code" style="flex: 1; width: 210;" maxlength="6">
						<button type="button" onclick="verifyCode()">대여하기</button>
						</p>       
			    	</div>
			    </div>
			
			
			</div>
			
			
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>