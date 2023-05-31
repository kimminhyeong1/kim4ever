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
			
			<h2 class="QRTitle">대여소QR</h2>	
					<div class="containerFlex">
						<div class="QRcard">
							<a href="<%=request.getContextPath()%>/bikeRent/bikeRentReturn.do?rsidx=1"><img class="QRImg"src="../resources/QRcode/rsidx1.png" alt=""></a>
						<p>송천대여소</p>
						</div>
						<div class="QRcard">
							<a href="<%=request.getContextPath()%>/bikeRent/bikeRentReturn.do?ridx=${bjv.ridx }&rsidx=2"><img class="QRImg" src="../resources/QRcode/rsidx2.png" alt=""></a>
						<p>효자대여소</p>
						</div>
						<div class="QRcard">
							<a href="<%=request.getContextPath()%>/bikeRent/bikeRentReturn.do?ridx=${bjv.ridx }&rsidx=3"><img class="QRImg" src="../resources/QRcode/rsidx3.png" alt=""></a>
						<p>덕진대여소</p>
						</div>
					</div>
				
			
			
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>