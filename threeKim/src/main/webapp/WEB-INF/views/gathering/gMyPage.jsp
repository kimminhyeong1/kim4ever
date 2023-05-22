<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 나의소모임</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
		 <style type="text/css">
		 	/*틀부분*/
		 	.gContainer{width: 1250px;text-align: center;border: 1px solid #bbb;margin: 40px auto;padding: 20px;background-color: #f1f1f1;border-radius: 10px;}
			#myImg{width: 100px;height: 100px;}
		 </style>
	</head>
	<body>
	<%@include file="../header2.jsp" %>
	<main id="main">
		<section class="gContainer">
			
			<div class="gContentTitle" >
				<h2>내 모임 보기</h2>
			</div>
			<div class="gContent" >
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">들어가기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">들어가기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">들어가기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">들어가기</button>
				</div>			
			</div>
			<div><button class="gBtn2" >더보기</button></div>
			<div class="gContentTitle" ><h2>내 간단 소개</h2></div>
			<div>
				<input class="gInput" type="text" placeholder="멤버보기에 있는 소개입니다.">
			</div>
				<button class="gBtn2">변경하기</button>
			<div class="gContentTitle" ><h2>내 프로필 설정</h2></div>
			<div>
				<img id="myImg" alt="" src="">
			</div>
				<button class="gBtn2">변경하기</button>

		</section>
	</main>
	<%@include file="../footer.jsp" %>
	</body>
</html>