<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 메인화면</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  
		 <style type="text/css">
		 	/*소개부분*/
			#gatheringIntro{width:100%; height:350px; background-color:#F8F8F8;} 
			#gatheringIntro h2{text-align:center; margin-top:20px; font-family: 'GangwonEdu_OTFBoldA'; font-size:27px; padding:20px; text-shadow: 2px 2px 0 #99CC99, -2px -2px 0 #99CC99, 2px -2px 0 #99CC99, -2px 2px 0 #99CC99;}
			#gatheringIntro p{text-align:center; padding:5px; font-family:'GangwonEdu_OTFBoldA'; font-size:20px; margin-top:20px;}
			#gatheringList{width:100%; display:flex; flex-wrap:wrap;justify-content:center; align-items:center;}
			#gatheringList h2{text-align:center;; font-family: 'GangwonEdu_OTFBoldA'; font-size:33px; padding:20px;}
		 </style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div id="gatheringIntro">
					<h2>당신의 자전거 여정을 함께할 수 있는 모임, 타:바입니다!</h2>
			  		<p>타:바는 자전거를 사랑하는 취미인들을 위한 소모임도 운영중입니다. 자신의 자전거가 있어도 좋고 없어도 좋습니다.</p>
			  		<p>우리 타:바의 공영자전거로 함께 어울리면서 맛집 탐방이나 전주 관광도 할 수 있어요.</p>
			  		<p>우리는 자전거를 타고 다닐 때 느낄 수 있는 자유로움과 즐거움을 함께 느낄 수 있으며, 더불어 건강한 습관도 함께 만들어 갈 수 있습니다</p>
			  		<p>타:바와 함께라면 누구나 쉽게 자전거 여행을 즐길 수 있습니다. 우리와 함께 멋진 추억을 만들어보세요!</p>
				</div>
				<div class="gContentTitle" >
					<h2>내 모임</h2>
				</div>
				<div class="gContent" >
					<c:if test="${not empty midx}">
						<c:forEach var="gjvmy" items="${gjvmylist}">
							<div class="card" >
								<img class="cardImg" src="../resources/GTImages/${gjvmy.imageName}">
								<c:choose>
									<c:when test="${gjvmy.gwidx != 0}">
										<img class="cardWish" src="../resources/icon/fullheart.png" onclick="handleHeartClick(${gjvmy.giidx}, ${midx}, this)">
									</c:when>
									<c:otherwise>
										<img class="cardWish" src="../resources/icon/heart.png" onclick="handleHeartClick(${gjvmy.giidx}, ${midx}, this)">
									</c:otherwise>
								</c:choose>
								<h3 class="cardTitle">${gjvmy.gInfoName}</h3>
								<p class="cardInfo">${gjvmy.gInfoBriefIntroduction}</p>
								<p>(참여멤버${gjvmy.gInfoParticipating}/${gjvmy.gInfoCapacity})</p>
								<button class="gBtn" onclick="location.href='${pageContext.request.contextPath}/gathering/gContentCheck.do?giidx=${gjvmy.giidx}'">들어가기</button>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<div><button class="gBtn2" >더보기</button></div>
				<div class="gContentTitle" >
					<h2>추천 모임</h2> 
				</div>
				<div class="gContent" >
					<c:forEach var="gjv" items="${gjvlist}">
						<div class="card" >
							<img class="cardImg" src="../resources/GTImages/${gjv.imageName}">
							<c:choose>
								<c:when test="${gjv.gwidx != 0}">
									<img class="cardWish" src="../resources/icon/fullheart.png" onclick="handleHeartClick(${gjv.giidx}, ${midx}, this)">
								</c:when>
								<c:otherwise>
									<img class="cardWish" src="../resources/icon/heart.png" onclick="handleHeartClick(${gjv.giidx}, ${midx}, this)">
								</c:otherwise>
							</c:choose>
							<h3 class="cardTitle">${gjv.gInfoName}</h3>
							<p class="cardInfo">${gjv.gInfoBriefIntroduction}</p>
							<p>(참여멤버${gjv.gInfoParticipating}/${gjv.gInfoCapacity})</p> 
							<button class="gBtn" onclick="location.href='${pageContext.request.contextPath}/gathering/gSimpleInfo.do?giidx=${gjv.giidx}'">구경하기</button>
						</div>
					 </c:forEach>
				</div>
				<div><button class="gBtn2" >더보기</button></div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
		<script>
			function handleHeartClick(giidx, midx ,element) {
				 
				var imageSrc = element.src;
				
				 if (imageSrc.includes('fullheart.png')) {
					
					// AJAX 요청 전송
					$.ajax({
						url: '${pageContext.request.contextPath}/gathering/WishDel.do',
						type: 'POST',
						data: {
							giidx: giidx,
							midx: midx
						},
						success: function(data) {
							
							if (data.value == 1) {
								alert("찜 삭제");
								// src 속성을 업데이트하여 이미지를 변경합니다.
								$(element).attr('src', '../resources/icon/heart.png');
								return;
							} else {
								alert("찜 실패");
								return false;
							}
						},
						error: function(xhr, status, error) {
							// AJAX 오류 처리
							console.log('오류: ' + error);
						}
					});
				 }
				 else if (imageSrc.includes('heart.png')) { 
					// AJAX 요청 전송
					$.ajax({
						url: '${pageContext.request.contextPath}/gathering/Wish.do',
						type: 'POST',
						data: {
							giidx: giidx,
							midx: midx
						},
						success: function(data) {
							
							if (data.value == 1) {
								alert("찜 성공");
								// src 속성을 업데이트하여 이미지를 변경합니다.
								$(element).attr('src', '../resources/icon/fullheart.png');
								return;
							} else {
								alert("찜 실패");
								return false;
							}
						},
						error: function(xhr, status, error) {
							// AJAX 오류 처리
							console.log('오류: ' + error);
						}
					});
					
				}
			}
		</script>
	</body>
</html>