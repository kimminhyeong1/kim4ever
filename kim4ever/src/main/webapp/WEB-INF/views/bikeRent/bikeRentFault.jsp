<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-자전거 고장/신고</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_bikeRent_mo.css">	
		 
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb&libraries=services,clusterer,drawing"></script> <!-- 카카오지도APIkey -->
		<style>
		*{word-break:keep-all}
			/*헤더영역 메뉴*/
			header #menu{display: none;}
			/*틀부분*/
			/*container A*/
			.container{font-size: 24px;border: 1px solid #bbb;margin: 40px auto;width: 900px; padding: 40px;background-color: #fdfcfa;border-radius: 20px;}
            .container>div{padding: 20px; text-align: center;}
            .container>div>p{display: inline-block; } 
			.container h1{font-size: 50px; text-align: center; margin:5px; }
			.container h2{font-size: 40px; text-align: center;}
			.container h3{margin:5px; margin-top:15px; font-weight:bold;}
			
            .container button{display:inline-block; width:30%; height:55px; margin-top:40px; text-align:center; font-family:'omyu_pretty'; font-size:25px; border-radius:20px; border:0px solid #ff9933; background:#ff9933;}
			.container button:active{background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			            
            /*container B*/
            .container h3{margin-top:20px;}
            .container #bikeLocation {margin:20px; }
            .container #bikeAddress {margin:20px; display: inline-flex; font-size:18px;} 
            .container #address{}
			/*이용내역 내용*/
			#useInfo{width:80%; font-size:22px; line-height:35px;}
			/*이용내역 내용 버튼*/
			#useListBtn{text-align:center;}
			img{height:100%; width:100%;}
			
			#map{width: 100%; height: 500px;border-radius: 20px;}
			textarea {resize: none;border-radius: 20px;} 
			
						/****************************모바일**************************/
@media (min-width: 300px) and (max-width: 940px)  {
	header #menu{display: none;}
			/*틀부분*/
			.content{width:auto; height:auto;}
			.container{border: 1px solid #bbb;margin: 40px auto;width: 95% ;   max-width: 850px;
  			padding: 8px;background-color: #f1f1f1;border-radius: 10px;}
			.container>div{padding: 18px; text-align: left;}
			.container>div>p{display: inline-block; } 
			.container>div>p:nth-child(1){width: 40%; margin-left: 60px;} 
			.container>div>p:nth-child(2){width: 5%;} 
			.container{font-size: 16px; line-high:10px;}
			.container h1{font-size: 20px; text-align: center;}
			.container h2{font-size: 20px; text-align: center;}
			.container h3{font-size: 20px; text-align: center; margin-top:10px;}
			.container button{display:inline-block; width:100%; height:55px; margin-top:0px;text-align:center; font-family:'omyu_pretty'; font-size:17px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
			.container button:active{background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			
			/*이용내역 내용*/
			#useInfo{width:80%; font-size:22px; line-height:35px;}
			/*이용내역 내용 버튼*/
			#useListBtn{text-align:center;}
			img{height:100%; width:100%;}
			#map{width:290px;height:200px; text-align:center}
			
}
			
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
		    	
				// 자전거가 움직이지 않나요? 버튼 클릭 시
				  $("#btn1").click(function() {
				    // container A 비활성화				   	
				    $(".container.A").css("display", "none");
				    // container B 활성화
				    $(".container.B").css("display", "block");
				    
				    initMap();//맵실행
				    
				  });
				//돌아가기
				  $("#btn2").click(function() {
					  //이동  
					  window.location.href = "${pageContext.request.contextPath}/bikeRent/bikeRentUseList.do";
					  
				  });
				
				
				
				  $("#btn3").click(function() {
					    var errorContent = $("#errorContent").val(); // errorContent 텍스트 영역의 값을 가져옴
					    var fileInput = document.getElementById("errorImg"); // 파일 첨부(input 태그)의 ID에 맞게 변경
					    var files = fileInput.files;

					    if (errorContent.trim() === "") {
					        alert("내용을 입력해주세요."); // 내용이 비어있을 경우 알림 메시지 표시
					    } else if (files.length === 0 || files[0] === null) {
					        alert("사진을 등록해주세요."); // 파일이 선택되지 않았을 경우 알림 메시지 표시
					    } else {
					        var fm = document.frm;
					        fm.action = "${pageContext.request.contextPath}/bikeRent/bikeRentFaultAction.do";
					        fm.method = "POST";
					        fm.submit();
					    }
					});

				
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
	                document.getElementById('address2').innerHTML = '현재 주소: ' + address;
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
	                document.getElementById('address2').innerHTML = '현재주소 : ' + address;
	                document.getElementById('position').innerHTML = '위치 : ' + latitude + ', ' + longitude;
	             // 인풋 값 설정
	                document.getElementById('latitude').value = latitude;
	                document.getElementById('longitude').value = longitude;
	                document.getElementById('address').value = address;
	              }
	            }
	          });
	        });

	        // 초기 위치의 주소로 변환
	        geocoder.coord2Address(longitude, latitude, function(result, status) {
	          if (status === kakao.maps.services.Status.OK) {
	            if (result.length > 0) {
	              var address = result[0].address.address_name;
	              document.getElementById('address2').innerHTML = '현재주소 : ' + address;
	              document.getElementById('position').innerHTML = '위치 : ' + latitude + ', ' + longitude;
		             // 인풋 값 설정
	                document.getElementById('latitude').value = latitude;
	                document.getElementById('longitude').value = longitude;
	                document.getElementById('address').value = address;
	            }
	          }
	        });
	      });
	    }

	    
		</script> 

	</head>
	<body>
		<%@include file="../header.jsp" %>
		<div id="main">	
			<div class="content">

				<div class="container A">
					<div><h2>안내사항</h2></div>
					<div><p>자전거가 움직이지 않거나 사고가 일어났을 때 접수가 가능한 페이지입니다</p></div>
					<div><p>불편한 사항이나 문제 상황을 알려주시면 신속히 처리해 드리겠습니다.</p></div>
					<div>
						<button type="button" id="btn1">고장/신고 접수</button>
						<button type="button" id="btn2">돌아가기</button>
					</div>
				</div>
				<div class="container B" style="display: none;">
					<form name="frm" id="frm" enctype="multipart/form-data">
						<h2>자전거 고장/신고</h2>
						<div>
				            <div id="bikeLocation">      
				            <p>
				            <img src="../resources/icon/arrow.png" style="width: 30px;height: 30px; vertical-align: middle;margin-right:5px;">
				            	현재 자전거 위치를 지정해주세요
				            <img src="../resources/icon/arrow.png" style="width: 30px;height: 30px; vertical-align: middle;margin-left: 5px;">
				            <p>
				            </div>
				            <div id="map" ></div>
				            <input type="hidden" id="latitude" name="errorLatitude" value=""><!-- 위도 -->
				            <input type="hidden" id="longitude" name="errorLongitude" value=""><!-- 경도 -->
				            <input type="hidden" id="address" name="errorLocation" value=""><!-- 주소 -->
				        </div>
			        	
			        	<div id="bikeAddress">
						<p id="address2"></p>&nbsp&nbsp&nbsp&nbsp
						<p id="position"></p>
						</div>
						
				        <div>
				            <h3>사진</h3>
				            <div>자전거의 문제가 있는 부분을 찍어주세요.</div>
				            <input type="file" name="errorImg" id="errorImg"> 
				        </div>
		                <div>
				            <h3>고장내용</h3>
				            <div>아래의 사진을 보시고 고장 난 부위를 설명해 주세요.</div>
				            <img src="../resources/bikeimg/bikeDetail.GIF" style=" margin-top:20px;"alt="bikeDetail">
							<textarea id ="errorContent" style="width:100%"cols="100" rows="15" name="errorContent"></textarea>
				        </div>
				       <div><button type="button" id="btn3">작성하기</button></div>
					</form>
				</div>
			</div>
			
			<div id="bottom">

			</div>
		</div>
		<%@include file="../footer.jsp" %>
	</body>
</html>