<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myezen.myapp.domain.BikeVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <a href="${pageContext.request.contextPath}/bikeRent/bikeRentDetail/${ebkidx1}/view.do"><img class="QRImg" src="data:image/png;base64,${QRCode1}" alt=""></a>
                            <p>NOR1</p>
                        </div>
                         <div class="QRcard">
                            <a href="${pageContext.request.contextPath}/bikeRent/bikeRentDetail/${ebkidx2}/view.do"><img class="QRImg" src="data:image/png;base64,${QRCode2}" alt=""></a>
                            <p>NOR2</p>
                        </div>
                         <div class="QRcard">
                            <a href="${pageContext.request.contextPath}/bikeRent/bikeRentDetail/${ebkidx3}/view.do"><img class="QRImg" src="data:image/png;base64,${QRCode3}" alt=""></a>
                            <p>NOR3</p>
                        </div>  
					</div>					
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>