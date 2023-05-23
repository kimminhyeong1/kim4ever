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
		 	/*소개부분*/
			#bikeIntro{margin:40px auto;width:70%; padding: 20px;background-color:#f1f1f1; border-radius:10px;} 
			#bikeIntro h2{font-family:'KCC-Ganpan'; text-align:center; font-size:35px; color:#333; margin-bottom: 20px;}
			#bikeIntro p{font-family:'omyu_pretty'; text-align:left; margin-left:40px; font-size:24px; padding:15px 15px; letter-spacing:3px;}
			.card p{}
		 </style> 
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section id="container">
			<div id="bikeIntro">
			 <h2>자전거 이용 수칙</h2>
	           <p>1. 자전거 이용시간은 오전9시부터 오후10시까지입니다.</p>
	           <p>2. 자전거 이용 시 안전수칙을 준수하시고 음주 시 이용이 불가합니다. </p>
	           <p>3. 대여는 5개의 대여소에서 가능하며, 반납은 빌린곳과 무관하게 <br>&nbsp;&nbsp;&nbsp;어느 대여소에서든 가능합니다.</p>
	           <p>4. 자전거 고장/신고 문의는 대여내역에서 신고 접수 부탁드립니다! </p>
			</div>
			<div id="bcontent">
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/일반자전거.jpg">
					<p class="cardName">일반자전거</p>
					<p class="cardInfo">남녀노소 즐길 수 있는 자전거입니다!</p>
					<p class="cardPrice">가격 : 1000원</p>
					
				</div>
				
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/전기자전거.jpg">
					<p class="cardName">전기자전거</p>
					<p class="cardInfo">전기로 동작해서 편하게 라이딩이 가능합니다!</p>
					<p class="cardPrice">가격 : 5000원</p>
					
				</div>
				
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/하이브리드 자전거1.jpg">
					<p class="cardName">하이브리드자전거</p>
					<p class="cardInfo">비교적 가볍고 적은 힘으로 라이딩을 할수있어요!</p>
					<p class="cardPrice">가격 : 1000원</p>
					
				</div>
				
				<div class="card" >
					<img class="cardImg" src="../resources/btn/+button.png">
							
				</div>
			
				<div class="card" >
					<img class="cardImg" src="../resources/btn/+button.png">
					
				</div>
				
				<div class="card" >
					<img class="cardImg" src="../resources/btn/+button.png">
				
				</div>
			
			</div>
			
			<div>
				<p style="font-size:40px;">자전거의 종류는 추가적으로 추후에 추가예정입니다</p>
			</div>
		
			
			
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>