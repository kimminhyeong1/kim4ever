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
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/media.css">
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <style type="text/css">
		 	/*소개부분*/
			#gatheringIntro{width:100%; height:350px; background-color:#fbfdfa; border-radius:20px; border: 1px solid #ccc;} 
			#gatheringIntro h2{text-align:center; margin-top:20px;  font-size:35px; padding:20px; margin-top }
			.gContentTitle h2 {margin-top:40px;}
			#gatheringIntro p{text-align:center; padding:5px; font-size:24px; margin-top:20px;}
			#gatheringList{width:100%; display:flex; flex-wrap:wrap;justify-content:center; align-items:center;}
			#gatheringList h2{text-align:center;  font-size:33px; padding:20px;}
			
			/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
								/*소개부분*/
			.gContentTitle h2{margin-top:10px;}
			#gatheringIntro{width:99.5%; height:auto; margin:0 auto; margin-top:20px; max-width:550px; }  
			#gatheringIntro h2{text-align:center; margin-top:0px; font-size:25px; padding:15px;}
			#gatheringIntro p{text-align:center; padding:5px;  font-size:12px; margin-top:1px;  overflow: hidden;}
			#gatheringList{width:99%; display:flex; flex-wrap:wrap;justify-content:center; align-items:center;}
 			#gatheringList h2 {text-align:center;  font-size: 14px;  padding:10px;}
 			 footer{margin-top: 0px !important;}
 			 }
		 </style>
	
	
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div id="gatheringIntro">
					<h2>당신의 자전거 여정을 함께할 수 있는 모임, 타 : 바입니다!</h2>
			  		<p>타 : 바는 자전거를 사랑하는 취미인들을 위한 소모임도 운영중입니다. 자신의 자전거가 있어도 좋고 없어도 좋습니다.</p>
			  		<p>우리 타 : 바의 공영자전거로 함께 어울리면서 맛집 탐방이나 전주 관광도 할 수 있어요.</p>
			  		<p>우리는 자전거를 타고 다닐 때 느낄 수 있는 자유로움과 즐거움을 함께 느낄 수 있으며, 더불어 건강한 습관도 함께 만들어 갈 수 있습니다</p>
			  		<p>타 : 바와 함께라면 누구나 쉽게 자전거 여행을 즐길 수 있습니다. 우리와 함께 멋진 추억을 만들어보세요!</p>
				</div>

				<div class="gContentTitle" >
					<h2>추천 모임</h2> 
				</div>
				<div class="gContent gContentB" >
					<c:forEach var="gjv" items="${gjvlist}" varStatus="loop">
						<c:if test="${loop.index lt 8}">
							<div class="card" >
								<img class="cardImg" src="../resources/GTImages/${gjv.imageName}">
								<c:if test="${not empty midx}">
									<c:choose>
										<c:when test="${gjv.gwidx != 0}">
										<img class="cardWish" src="../resources/icon/fullheart.png" onclick="handleHeartClick(${gjv.giidx}, ${midx}, this)">
										</c:when>
										<c:otherwise>
											<img class="cardWish" src="../resources/icon/heart.png" onclick="handleHeartClick(${gjv.giidx}, ${midx}, this)">
										</c:otherwise>
									</c:choose>
								</c:if>
								<h3 class="cardTitle">${gjv.gInfoName}</h3>
								<p class="cardInfo" id="textContainer">${gjv.gInfoBriefIntroduction}</p>
								<p class="attend">(참여멤버${gjv.gInfoParticipating}/${gjv.gInfoCapacity})</p> 
								<button class="gBtn" onclick="delayedRedirect('${pageContext.request.contextPath}/gathering/gSimpleInfo.do?giidx=${gjv.giidx}', 50)">구경하기</button><!-- 버튼딜레이 -->						
							</div>
						</c:if>
		                <c:if test="${loop.index eq 8 and loop.last}">
		                    <script>
		                        $(document).ready(function() {
		                            $("#moreButton").show();
		                        });
		                    </script>
		                </c:if>	
					 </c:forEach>
				</div>
				<button id="moreButton" type="button" class="gBtn2" onclick="fetchNewData()" style="display: none;">더 보기</button>
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
								console.log("찜 삭제");
								// src 속성을 업데이트하여 이미지를 변경합니다.
								$(element).attr('src', '../resources/icon/heart.png');
								return;
							} else {
								console.log("찜 실패");
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
								console.log("찜성공");
								// src 속성을 업데이트하여 이미지를 변경합니다.
								$(element).attr('src', '../resources/icon/fullheart.png');
								return;
							} else {
								console.log("찜실패");
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
	    <script>
	    	var offset2 = 0;
	        var excludedData = [];
		    function fetchNewData() {
		        <c:forEach var="gjv" items="${gjvlist}">
		            excludedData.push('${gjv.giidx}');
		        </c:forEach>
		
		        $.ajax({
		            url: '${pageContext.request.contextPath}/gathering/getNewData.do',
		            type: 'POST',
		            dataType: "json",
		            traditional: true,//배열값받기
		            data: { offset:offset2 , excludedData:excludedData},
		            success: function(data) {
		                // 새로운 데이터 처리
		                console.log(data); // 응답 데이터 출력 예시
		             // 가져온 데이터를 gContent에 추가
	                    $.each(data, function(index, gjv) {
	                    	if (index !== 8) {
	                    		
	                    		var card = "<div class='card'>" +
	                    	    "<img class='cardImg' src='../resources/GTImages/" + gjv.imageName + "'>";

		                    	if (${midx != null}) {
		                    	    if (gjv.gwidx != 0) {
		                    	        card += "<img class='cardWish' src='../resources/icon/fullheart.png' onclick='handleHeartClick(" + gjv.giidx + ", " + ${midx} + ", this)'>";
		                    	    } else {
		                    	        card += "<img class='cardWish' src='../resources/icon/heart.png' onclick='handleHeartClick(" + gjv.giidx + ", " + ${midx} + ", this)'>";
		                    	    }
		                    	}
	
		                    	card += "<h3 class='cardTitle'>" + gjv.gInfoName + "</h3>" +
		                    	    "<p class='cardInfo'>" + gjv.gInfoBriefIntroduction + "</p>" +
		                    	    "<p class='attend'>(참여멤버 " + gjv.gInfoParticipating + "/" + gjv.gInfoCapacity + ")</p>" +
		                    	    "<button class='gBtn' onclick=\"location.href='${pageContext.request.contextPath}/gathering/gSimpleInfo.do?giidx=" + gjv.giidx + "'\">구경하기</button>" +
		                    	    "</div>";
		                    	    
		                        $(".gContentB").append(card);
		                        excludedData.push(gjv.giidx);
	                    	}
	                    });
	                    //offset2 += 8;
	                    
	                  	//데이터가 없으면 
                        if (data.length < 8) {
		                    $("#moreButton").hide(); // 더보기 버튼 숨기기
		                }
	                    
	                    
		            },
		            error: function(xhr, textStatus, errorThrown) {
		            	 console.log("더 보기 요청에 실패했습니다.");
		            }
		        });
		    }
		</script>
	</body>
</html>