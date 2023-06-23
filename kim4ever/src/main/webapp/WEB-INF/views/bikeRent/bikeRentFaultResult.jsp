<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-자전거 고장/신고</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_rent.css"> 
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb&libraries=services,clusterer,drawing"></script> <!-- 카카오지도APIkey -->
		<style>
		
		#main{width:1250px; margin:35px auto 70px; text-align:center; }
		#content{width:1250px; height:1500px;}
		#bottom{width:1250px; height:300px;}
		#content img{width:600px; height:400px; margin-top:40px;}
		#content table {width:600px; height:400px; border-collapse:collapse; margin:50px auto 20px; text-align:center;}
		#content table td {border:1px solid #ddd; padding:10px;font-size:16px; line-height:1.5; margin-left:60px;}
		#content table h2 {font-size:24px; margin-bottom:5px; }
		#content table p {margin: 0;}
		#content table input[type="text"],textarea{
		  box-sizing: border-box;
		  width: 100%;
		  padding: 10px;
		  margin: 2px 0;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		}
		
		#content button{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
		#content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		
					/*헤더영역 메뉴*/
			header #menu{display: none;}
			/*틀부분*/
			.container{border: 1px solid #bbb;margin: 40px auto;width: 55%;padding: 20px;background-color: #f1f1f1;border-radius: 10px;}
			.container>div{padding: 20px; text-align: left;}
			.container>div>p{display: inline-block; } 
			.container>div>p:nth-child(1){width: 40%; margin-left: 60px;} 
			.container>div>p:nth-child(2){width: 5%;} 
			.container{font-size: 24px;}
			.container h1{font-size: 50px; text-align: center;}
			.container h2{font-size: 40px; text-align: center;}
			.container button{display:inline-block; width:45%; height:55px; margin-top:0px;text-align:center; font-family:'omyu_pretty'; font-size:25px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
			.container button:active{background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			/*이용내역 내용*/
			#useInfo{width:80%; font-size:22px; line-height:35px;}
			/*이용내역 내용 버튼*/
			#useListBtn{text-align:center;}
		
		
		
		</style>

		

	</head>
	<body>
		<%@include file="../header.jsp" %>
		<div id="main">	
			<div id="content">
				<h1>자전거 고장 신고 결과</h1>
			    <div id="map" style="width:1250px;height:500px;"></div>
			    <p>위도: ${latitude}</p>
			    <p>경도: ${longitude}</p>
			    <p>주소: ${address}</p>
			    <p>고장 내용: ${errorContent}</p>
			</div>
			

		</div>
		<%@include file="../footer.jsp" %>
		
			<script>
		var map;
		var marker;

		function initMap() {
			var latitude = '${latitude}'; // 위도 값을 JSP에서 전달받은 값으로 대체해주세요
			var longitude = '${longitude}'; // 경도 값을 JSP에서 전달받은 값으로 대체해주세요

			var mapOptions = {
				center: new kakao.maps.LatLng(latitude, longitude),
				level: 2
			};

			// 지도 생성
			map = new kakao.maps.Map(document.getElementById('map'), mapOptions);

			// 마커 생성
			marker = new kakao.maps.Marker({
				position: map.getCenter()
			});
			marker.setMap(map);

			// 주소 정보를 표시할 인포윈도우 생성
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div style="padding:10px;">${address}</div>' // 주소 값을 JSP에서 전달받은 값으로 대체해주세요
			});

			// 마커 클릭 시 인포윈도우 표시
			kakao.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, marker);
			});
		}

		// HTML 로딩 완료 후 initMap 함수 호출
		document.addEventListener('DOMContentLoaded', initMap);
	</script> 
		

	</body>
</html>