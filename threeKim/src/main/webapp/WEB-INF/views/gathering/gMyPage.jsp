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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">  
		 
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		 <style type="text/css">
		 	/*틀부분*/
		 	.gContainer{width: 1250px;text-align: center;border: 1px solid #bbb;margin: 40px auto;padding: 20px;background-color: #f1f1f1;border-radius: 10px;}
			#myImg{width: 100px;height: 100px;}
			
			/**************************모바일****************************************/

			/*****모바일 넓이***/
			@media (min-width: 300px) and (max-width: 940px)  {
			.gContainer{width: 100%; text-align: center;border:none;  margin: 10px auto;padding: 0px;background-color: #f1f1f1;border-radius: 10px;}
			#myImg{width: 100px;height: 100px;}
			}
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
							<p class="attend">(참여멤버${gjvmy.gInfoParticipating}/${gjvmy.gInfoCapacity})</p>							
							<button class="gBtn" onclick="delayedRedirect('${pageContext.request.contextPath}/gathering/gContentCheck.do?giidx=${gjvmy.giidx}', 700)">들어가기</button><!-- 버튼딜레이 -->						
							
						</div>
					</c:forEach>
				</c:if>
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
			
			//버튼 이펙트 스크립트
			var animateButton = function(e) {
				  e.preventDefault();
				  // Reset animation
				  e.target.classList.remove('animate');
				  
				  e.target.classList.add('animate');
				  setTimeout(function(){
				    e.target.classList.remove('animate');
				  }, 700);
				};

				var gBtns = document.getElementsByClassName("gBtn");

				for (var i = 0; i < gBtns.length; i++) {
				  gBtns[i].addEventListener('click', animateButton, false);
				}

				/* 버튼 딜레이*/
				  function delayedRedirect(url, delay) {
					    setTimeout(function() {
					      window.location.href = url;
					    }, delay);
					  }
				
		</script>
	</body>
</html>