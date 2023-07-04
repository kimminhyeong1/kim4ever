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
		<title>타:바-대여소QR</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">  
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
	</head>
	<style>
	#content2{display:none;}
	/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
				#main { width: auto;  margin: 0 auto;   text-align: center;}
				#content{display:none;} 
				#content2{display:block; width: auto;margin: 0 auto; height:260px;
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
}</style>

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
			
			<section id="content2">
			<div class="intro">
			<p class="intro_title">반납 안내사항</p>
 			<p class="intro_main">	 자전거를 대여소 거치대에 올려서 잠금장치를 실행시켜주시고<br>
  												반납 대여소의 QR을 찍어 반납해주세요<br>
 												 QR을 찍은후 결제을 하고 이용이 가능합니다.</p>
 			<p class="intro_main" style="color: red; font-weight: bold;">반납주의사항</p>
 		<p class="intro_main">	
			-잠금장치 후 "잠금이 실행되었습니다"라는 음성 안내가 나오는지 꼭 확인해 주세요.<br>
			-자전거를 이용하려면 결제가 완료되어야 합니다.<br>
			-대여소에 지정된 거치대에 자전거를 반납해 주세요. (반납 지역 외에 반납할 경우 과태료가 부과됩니다.)<br>
			-허위 신고 시에는 타 : 바의 자전거 이용이 제한됩니다.<br>
			-반납 전 자전거의 상태를 확인하고 이상이 있을 경우, 플랫폼에 문의해 주세요.
			</p>
			<lottie-player id="bikeOn" src="https://lottie.host/237d85d8-6638-4d11-89e0-324be53a8c72/IJ88ONv0Og.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></lottie-player>			
    		<lottie-player  id="QRcheck"  src="https://lottie.host/9cbdd921-4a00-43d0-b171-a1bf3be1d5fe/QfTawsiddx.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></lottie-player>
			</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>