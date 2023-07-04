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
		<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script> 
<style>
#content{display:block;}
#content2{display:none;}
/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
				#main { width: auto;  margin: 0 auto;   text-align: center;}
				#content{display:none;} 
				#content2{display:block; width: auto;margin: 0 auto;
    margin-top: 20px;
    width: 320px;
    background-color: #fdfcfa;
    border-radius: 20px;
    padding: 10px;
    margin-bottom: 30px;
    border: 1px solid #bbb;} 
.intro_title{
text-align: center;
    font-size: 25px;
    color: #333;
    margin-bottom: 20px;}
.intro_main{

font-family: 'omyu_pretty';
    text-align: left;
    margin-left: 10px;
    font-size: 12px;
    padding: 5px 5px;
    letter-spacing: 3px;
    word-break: keep-all;}
    #QRcheck{display: inline-block;}
    #bikeOn{display: inline-block;}
}
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
			
			<section id="content2">
			<div class="intro">
			<p class="intro_title">대여 안내사항</p>
 			<p class="intro_main">	대여하고자하는 자전거의 후면에 있는 QR을 찍어주세요<br>
 												 QR을 찍은후 결제을 하고 이용이 가능합니다.</p>
 			<p class="intro_main" style="color: red; font-weight: bold;">대여주의사항</p>
 		<p class="intro_main">	

			-안전 운전에 최선을 다해 주시기 바랍니다. <br>
			-다른 이용자들을 배려하고 자전거를 깨끗하게 사용해 주세요.<br>
			-대여 중에는 자전거를 소중히 다뤄주세요.<br>
			-음주 후 자전거를 이용하는 경우 발생하는 사고에 대한 책임은 타:바에서 일절 지지 않습니다.<br>
			-13세 미만의 어린이는 보호자동반 시 대여 가능합니다.
			</p>
    		<lottie-player  id="QRcheck"  src="https://lottie.host/9cbdd921-4a00-43d0-b171-a1bf3be1d5fe/QfTawsiddx.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></lottie-player>
			<lottie-player id="bikeOn" src="https://lottie.host/237d85d8-6638-4d11-89e0-324be53a8c72/IJ88ONv0Og.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></lottie-player>
			</div>
			</section>
			
		</main>
		<%@include file="../footer.jsp" %>		
	</body>
</html>