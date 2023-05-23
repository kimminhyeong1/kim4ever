<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>QR코드</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">  
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section id="content">
			<h2 class="QRTitle">자전거QR</h2>
				<div class="container">
					<div class="containerFlex">
						<div class="QRcard">
						<a href="bikeRentDetail.do"><img class="QRImg"src="../resources/QRcode/Qrcode2.png" alt=""></a>
						<p>TAS2121</p>
						</div>
						<div class="QRcard">
						<img class="QRImg" src="../resources/bikeimg/일반자전거2.jpg" alt="">
						<p>BUE4362</p>
						</div>
						<div class="QRcard">
						<img class="QRImg" src="../resources/bikeimg/전기자전거.jpg" alt="">
						<p>FDG8172</p>
						</div>
					</div>
				</div>
			<h2 class="QRTitle">대여소QR</h2>	
					<div class="containerFlex">
						<div class="QRcard">
						<a href="bikeRentReturn.do"><img class="QRImg"src="../resources/QRcode/Qrcode2.png" alt=""></a>
						<p>덕진대여소</p>
						</div>
						<div class="QRcard">
						<img class="QRImg" src="../resources/bikeimg/bike2.jpg" alt="">
						<p>오목대여소</p>
						</div>
						<div class="QRcard">
						<img class="QRImg" src="../resources/bikeimg/bike.jpg" alt="">
						<p>송천대여소</p>
						</div>
					</div>
				</div>
			
			
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>