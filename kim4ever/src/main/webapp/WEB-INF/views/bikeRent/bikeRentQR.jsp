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
		<title>타:바-QR코드</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">  
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
<style>
#content{display:block;}

/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {#content{display:none;}}
</style>

	</head>
	<body>
	<%@include file="../header.jsp" %>
		<main id="main">
			<section id="content">
			<h2 class="QRTitle">일반 자전거QR</h2>
				<div class="container">
					<div class="containerFlex">
						<c:set var="count1" value="0" scope="page" />
						<c:forEach var="qrbike" items="${QRList}">
							<c:if test="${qrbike.bikeType == '일반자전거' && count1 < 3}">
								<div class="QRcard">
		                            <a href="${pageContext.request.contextPath}/bikeRent/bikeRentDetail/${qrbike.ebkidx}/view.do"><img class="QRImg" src="data:image/png;base64,${qrbike.QRbike}" alt=""></a>
		                            <p>${qrbike.bikeCode}</p>
		                        </div>
		                        <c:set var="count1" value="${count1 + 1}" scope="page" />
	                        </c:if>
						</c:forEach>                    					
					</div>
			<h2 class="QRTitle" style="margin-top: 35px;">전기 자전거QR</h2>		
					<div class="containerFlex">
						<c:set var="count2" value="0" scope="page" />
						<c:forEach var="qrbike" items="${QRList}">
								<c:if test="${qrbike.bikeType == '전기자전거' && count2 < 3}">
									<div class="QRcard">
			                            <a href="${pageContext.request.contextPath}/bikeRent/bikeRentDetail/${qrbike.ebkidx}/view.do"><img class="QRImg" src="data:image/png;base64,${qrbike.QRbike}" alt=""></a>
			                            <p>${qrbike.bikeCode}</p>
			                        </div>
			                        <c:set var="count2" value="${count2 + 1}" scope="page" />
		                        </c:if>
						</c:forEach>  				
                      </div>
				</div>				
			</section>	
			
		</main>
		<%@include file="../footer.jsp" %>		
	</body>
</html>