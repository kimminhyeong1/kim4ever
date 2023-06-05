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
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
		    	$("#btn1").click(function(){
		
		            var fm = document.frm;
		         
		            // 위치 및 주소 값을 입력 폼에 저장
		            fm.latitude.value = document.getElementById('latitude').value;
		            fm.longitude.value = document.getElementById('longitude').value;
		            		      			
		      			 fm.action ="<%=request.getContextPath()%>/bikeRent/bikeRentFaultAction.do";  
		      			 fm.method = "POST";
		      			 fm.submit();
		
		       });//$("#btn1").click(function(){-----end
				
			});
		</script>
		<script>
	    var map;
	    var marker;

	    function initMap() {
	      // 사용자의 현재 위치를 가져오기 위한 Geolocation API
	      navigator.geolocation.getCurrentPosition(function(position) {
	        var latitude = position.coords.latitude;
	        var longitude = position.coords.longitude;

	        var initialLatLng = new kakao.maps.LatLng(latitude, longitude);

	        var mapOptions = {
	          center: initialLatLng,
	          level: 2
	        };

	        // 지도 생성
	        map = new kakao.maps.Map(document.getElementById('map'), mapOptions);

	        // 마커 생성
	        marker = new kakao.maps.Marker({
	          position: map.getCenter(),
	          draggable: true // 마커를 드래그 가능하게 설정
	        });
	        marker.setMap(map);

	        // 좌표를 주소로 변환하는 Geocoder 객체 생성
	        var geocoder = new kakao.maps.services.Geocoder();

	        // 마커 드래그 이벤트 리스너 등록
	        kakao.maps.event.addListener(marker, 'dragend', function() {
	          var position = marker.getPosition(); // 마커의 위치를 얻어옴
	          var latitude = position.getLat();
	          var longitude = position.getLng();
	          document.getElementById('latitude').value = latitude;
	          document.getElementById('longitude').value = longitude;

	          // 좌표를 주소로 변환
	          geocoder.coord2Address(longitude, latitude, function(result, status) {
	            if (status === kakao.maps.services.Status.OK) {
	              if (result.length > 0) {
	                var address = result[0].address.address_name;
	                document.getElementById('address').innerHTML = '현재 주소: ' + address;
	                document.getElementById('position').innerHTML = '위치: ' + latitude + ', ' + longitude;
	              }
	            }
	          });
	        });

	        // 지도 드래그 이벤트 리스너 등록
	        kakao.maps.event.addListener(map, 'dragend', function() {
	          var centerLatLng = map.getCenter();
	          marker.setPosition(centerLatLng);

	          var latitude = centerLatLng.getLat();
	          var longitude = centerLatLng.getLng();
	          document.getElementById('latitude').value = latitude;
	          document.getElementById('longitude').value = longitude;

	          // 좌표를 주소로 변환
	          geocoder.coord2Address(longitude, latitude, function(result, status) {
	            if (status === kakao.maps.services.Status.OK) {
	              if (result.length > 0) {
	                var address = result[0].address.address_name;
	                document.getElementById('address').innerHTML = '현재 주소: ' + address;
	                document.getElementById('position').innerHTML = '위치: ' + latitude + ', ' + longitude;
	              }
	            }
	          });
	        });

	        // 초기 위치의 주소로 변환
	        geocoder.coord2Address(longitude, latitude, function(result, status) {
	          if (status === kakao.maps.services.Status.OK) {
	            if (result.length > 0) {
	              var address = result[0].address.address_name;
	              document.getElementById('address').innerHTML = '현재 주소: ' + address;
	              document.getElementById('position').innerHTML = '위치: ' + latitude + ', ' + longitude;
	            }
	          }
	        });
	      });
	    }

	    // HTML 로딩 완료 후 initMap 함수 호출
	    document.addEventListener('DOMContentLoaded', initMap);
		</script> 

	</head>
	<body>
		<%@include file="../header.jsp" %>
		<div id="main">	
			<div id="content">
				<h2>자전거 고장/신고</h2>
				<form name="frm" id="frm">
					<div>
			            <label>위치</label>
			            <div id="map" style="width: 1000px; height: 500px;"></div>
			            <input type="hidden" id="latitude" name="latitude">
			            <input type="hidden" id="longitude" name="longitude">
			        </div>
					<p id="address">현재 주소: </p>
					<p id="position">위치: </p>

			        <div>
			            <label>이미지</label>
			            <input type="file" name="image">
			        </div>
	                <div>
			            <label>내용</label>
			            <textarea name="content"></textarea>
			        </div>
					<table>
						<tr>
							<td>
								<img src="../resources/bikeimg/bikeDetail.png" alt="bikeDetail">
							</td> 
						</tr>
					 	<tr>
					 		<td>
								<textarea cols="100" rows="15" name="errorContent"></textarea>
							</td>
						</tr>
						<tr>
							<td>
							 	<button type="button" id="btn1">작성하기</button>
							 	
							</td> 
						</tr>	
					</table>
				</form>
			</div>
			
			<div id="bottom">
			 <%@include file="../bottom.jsp" %>
			</div>
		</div>
		<%@include file="../footer.jsp" %>
		

	</body>
</html>