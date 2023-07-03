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
		<title>대여소QR</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">  
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section id="content">
			<h2 class="QRTitle">대여소QR</h2>	
					<div class="containerFlex">
						<c:forEach var="qrRentalShop" items="${QRList}">
								<div class="QRcard">
		                            <a href="${pageContext.request.contextPath}/bikeRent/bikeRentReturn/${qrRentalShop.ersidx}/view.do"><img class="QRImg" src="data:image/png;base64,${qrRentalShop.QRrentalshop}" alt=""></a>
		                            <p>${qrRentalShop.rentalshopName}</p>
		                        </div>
						</c:forEach> 
					</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>