<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<c:if test="${not empty midx}">
					<c:forEach var="gjvmy" items="${gjvmylist}">
						<div class="card" >
							<img class="cardImg" src="../resources/GTImages/${gjvmy.imageName}">
							<img class="cardWish" src="../resources/icon/heart.png">
							<h3 class="cardTitle">${gjvmy.gInfoName}</h3>
							<p class="cardInfo">${gjvmy.gInfoBriefIntroduction}</p>
							<p>(참여멤버${gjvmy.gInfoParticipating}/${gjvmy.gInfoCapacity})</p>
							<button class="gBtn" onclick="location.href='${pageContext.request.contextPath}/gathering/gContentCheck.do?giidx=${gjvmy.giidx}'">들어가기</button>
						</div>
					</c:forEach>
				</c:if>		
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