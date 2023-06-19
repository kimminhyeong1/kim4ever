<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임-일정보기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb&libraries=services,clusterer,drawing"></script> <!-- 카카오지도APIkey -->    
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		<style type="text/css">
		 	/*일정만들기 부분*/
			#main section h3{display: inline-block;font-size: 27px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 500px;height: 200px;font-size: 23px;}
			#main section button{text-align: center;}  
			#main section img{width: 100px;height: 100px;}  
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				
					initMap();//맵실행
					
			});//$(document).ready(function(){ !end!
		</script>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer gSetContainer">
				<div>
					<div> 
						<div> 
							<h3>일정 제목</h3>
						</div>
						<div class="boxContent">${gsv.gScheduleTitle}</div>
					</div>
					<div>
						<div>
							<h3>일정 날짜</h3>
						</div>
						<label for="start">시작일:</label>
						<div class="boxContent">${gsv.gScheduleStartDay}</div>
						<label for="end">종료일:</label>		
						<div class="boxContent">${gsv.gScheduleEndDay}</div>									
					</div>
					<div>
						<h3>일정 위치</h3><!-- 지도 api사용 -->
						<div id="map" style="width: 500px; height: 500px;"></div>
						<div id="address" class="boxContent" style="width: 500px;">주소: ${gsv.gScheduleLocation}</div>		
					</div>
					<div>
						<h3>모임비</h3>
						<div class="boxContent">${gsv.gScheduleFee}원</div>	
					</div>
					<div>
						<h3>준비물</h3>
						<div class="boxContent" style="width: 90%;">
						${gsv.gScheduleArrangements}					
						</div>	
					</div>
					<div>
						<div>
							<h3>정원(최대 ${gsv.gScheduleCapacity} 명)</h3>
						</div>
						<div class="boxContent">현재 [추가예정] 명</div>	
					</div>
				</div><!-- 끝-->
				<div>
					<button class="gBtn2">돌아가기</button>			 	 
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
		<script type="text/javascript">
		    var latitude = ${gsv.gScheduleLatitude};
		    var longitude = ${gsv.gScheduleLongitude};
		
		    // 카카오 맵 초기화
		    kakao.maps.load(function() {
		        var mapContainer = document.getElementById('map');
		        var mapOptions = {
		            center: new kakao.maps.LatLng(latitude, longitude),
		            level: 3
		        };
		
		        var map = new kakao.maps.Map(mapContainer, mapOptions);
		
		        // 맵에 마커 추가
		        var markerPosition = new kakao.maps.LatLng(latitude, longitude);
		        var marker = new kakao.maps.Marker({
		            position: markerPosition
		        });
		
		        marker.setMap(map);
		

		    });
		</script>
	</body>
</html>
