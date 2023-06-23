<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>대여소-등록</title>
		<style>
		/*리셋코드*/
		
		*{margin:0;padding:0;}
		li{list-style:none;}
		
		@font-face {
		    font-family: 'GangwonEdu_OTFBoldA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'omyu_pretty';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'KCC-Ganpan';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		#main{width:1440px; margin:35px auto 70px; text-align:center;}
		#main #content{width:1440px; }
		#main #bottom{width:1440px; height:100px; }
		/*로그인 외각선*/
		#login_out{border: 1px solid #bbb;margin: 40px auto;width: 50%;padding: 20px;background-color: #f1f1f1;border-radius: 10px;}
		/*알림*/
		.alarm{color: #f00;text-align: left;line-height: 0px;padding-left: 5px;padding-top: 15px;} 
		
		h2{text-align: center; margin-top:0px;margin-bottom: 20px;}   
		#content table {width:60%;border-collapse:collapse;  margin:10px auto 0; text-align:center;  line-height:0px; font-family:'omyu_pretty'; font-size:21px;}
		#content table th{width:150px; text-align:center;  padding:8px;}   
		#content table td{padding:8px;text-align:left;line-height: 30px;}  
		#content table td:nth-child(1){width:120px;text-align:center;}
		#content table td:nth-child(2){width:400px; text-align:left;}
		#content table td:nth-child(3){width:100px; border:0;}
		#content table tr:last-child td{text-align:center;}
		#content table tr:last-child td input{display:inline-block; width:120px; height:50px;}
		#content table th{width:150px;text-align:center;}
		#content table #adminIdCheck {padding:5px 10px; font-size:21px; width:120px; height:50px; }
		#content table 
		input{
		  font-family: 'omyu_pretty';
		  font-size:24px;
		  box-sizing: border-box;
		  width: 100%;
		  padding: 10px;
		  margin: 2px 0;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		}
		
		#content table button{width:430px; height:60px; text-align:center; font-family: 'omyu_pretty'; font-size:30px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
		#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		
		#main #findbutton{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
		#main #findbutton:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		
		</style>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb&libraries=services,clusterer,drawing"></script> <!-- 카카오지도APIkey -->
		<script type="text/javascript">
				//!전역변수!
				var idFlag;
				
				var nameFlag;

				var addressFlag;
			 	
			$(document).ready(function(){
				initMap();//맵실행
				
				//!대여소 이름 체크!
				
				$("#rentalshopName").blur(function(){//blur input값에 쓰고 다른데로 갈때 발동
					var name = document.getElementById("rentalshopName").value;
					var oMsg = document.getElementById("rentalshopNameMsg");
					var oMsgC = document.getElementById("rentalshopNameMsgCheck");

					nameFlag = false;

				
					//대여소이름인 rentalshopName으로 변경
					 try {
						// 성공 Api
						var url = '${pageContext.request.contextPath}/admin/adminrentalshopRegisterNameCheck.do';
						var param = [{ name: "rentalshopName", value: name }];

						$.ajax({
							url: url,
							data: param,
							type: "GET",
							contentType: "application/json;",
							dataType: "json",
							success: function (data) {
								if (data.value == 1) {
									oMsg.style.display = "block";
									oMsg.style.color = "red";
									oMsg.style.padding = "15px 0px 0px 5px";
									oMsg.style.textAlign = "left";
									oMsg.className = "ability_chk";
									oMsg.innerHTML = "이미 사용중인 이름입니다.";
									return false;
								} else {
									oMsg.style.display = "block";
									oMsg.style.color = "red";
									oMsg.style.padding = "15px 0px 0px 5px";
									oMsg.style.textAlign = "left";
									oMsg.className = "ability_chk submit";
									oMsg.innerHTML = "사용가능합니다.";
								}
								nameFlag = true;
								return true;
							},
							error: function (error) {
								alert("Error");
							}
						});
					} catch (e) {
						if (window.bridgeGotTime) {
							throw e;
						 } else {
							//page reload?
						 }
					}
					return true; 
				});
				//!이름!end	

							
			});//$(document).ready(function(){ !end!

 				/// 회원 가입 ///
				function Signup() {

					if (!nameFlag) {	
						alert("대여소 이름을 올바르게 입력해주세요.");
						return false;
					}
			
					
					$('#frm').attr('action', 'adminrentalshopRegisterAction.do').submit();
					return;

					
				}
		</script>
		
		
		<script type="text/javascript">
		function autoHyphen2(target) {
			  target.value = target.value
			    .replace(/[^0-9]/g, '')
			    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
			    .replace(/(\-{1,2})$/g, "");
			}
		</script>
		<!-- 다음 우편번호 API 스크립트 -->
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function openAddressPopup() {
		        new daum.Postcode({
		            oncomplete: function (data) {
		                // 선택된 주소를 주소 입력란에 채우기
		                document.getElementById('address').value = data.address;
		                document.getElementById('address2').innerHTML = data.address;
		                document.getElementById('rentalshopLocation').value = data.address;
		             // 주소로 위도, 경도 검색
		                var geocoder = new kakao.maps.services.Geocoder();
		                geocoder.addressSearch(data.address, function(result, status) {
		                  if (status === kakao.maps.services.Status.OK) {
		                    var position = new kakao.maps.LatLng(result[0].y, result[0].x);
		                    marker.setPosition(position);
		                    map.setCenter(position);
		                    // 위도, 경도 표시하기
	                        document.getElementById('latitude').value = result[0].y;
	                        document.getElementById('longitude').value = result[0].x;
	                        document.getElementById('position').innerHTML = "좌표: "+result[0].y+" , "+result[0].x+"";
	                        
		                  }
		                });
		            }
		        }).open();
		    }
		</script>


<script>
var map;
var marker;

function initMap() {
  // 사용자의 현재 위치를 가져옵니다.
  navigator.geolocation.getCurrentPosition(function(position) {
    var latitude = position.coords.latitude; // 위도
    var longitude = position.coords.longitude; // 경도

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
      draggable: true // 마커를 드래그할 수 있도록 설정
    });
    marker.setMap(map);

    // 주소를 좌표로 변환하는 Geocoder 객체 생성
    var geocoder = new kakao.maps.services.Geocoder();

    // 마커 생성 함수
    function createMarker(address) {
      // 주소를 좌표로 변환
      geocoder.addressSearch(address, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
          var position = new kakao.maps.LatLng(result[0].y, result[0].x);

          // 마커 생성
          marker.setPosition(position);
          map.setCenter(position);
        }
      });
    }

    // 마커 드래그 이벤트 리스너 등록
    kakao.maps.event.addListener(marker, 'dragend', function() {
      var position = marker.getPosition(); // 마커의 좌표를 가져옵니다.
      var latitude = position.getLat(); // 위도
      var longitude = position.getLng(); // 경도
      document.getElementById('latitude').value = latitude;
      document.getElementById('longitude').value = longitude;

      // 좌표를 주소로 변환
      geocoder.coord2Address(longitude, latitude, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
          if (result.length > 0) {
            var address = result[0].address.address_name;
            document.getElementById('address2').innerHTML = '현재 주소: ' + address;
            document.getElementById('position').innerHTML = '좌표: ' + latitude + ', ' + longitude;
          }
        }
      });
    });

    // 주소 값을 가져와서 마커를 생성합니다.
    var address = document.getElementById('address').value;
    createMarker(address);

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
            document.getElementById('address2').innerHTML = '현재 주소: ' + address;
            document.getElementById('position').innerHTML = '좌표: ' + latitude + ', ' + longitude;
            // 입력값 설정
            document.getElementById('latitude').value = latitude;
            document.getElementById('longitude').value = longitude;
            document.getElementById('address').value = address;
            document.getElementById('rentalshopLocation').value = address;
          }
        }
      });
    });

    // 초기 위치의 좌표를 주소로 변환
    geocoder.coord2Address(longitude, latitude, function(result, status) {
      if (status === kakao.maps.services.Status.OK) {
        if (result.length > 0) {
          var address = result[0].address.address_name;
          document.getElementById('address2').innerHTML = '현재 주소: ' + address;
          document.getElementById('position').innerHTML = '좌표: ' + latitude + ', ' + longitude;
          // 입력값 설정
          document.getElementById('latitude').value = latitude;
          document.getElementById('longitude').value = longitude;
          document.getElementById('address').value = address;
          document.getElementById('rentalshopLocation').value = address;
          
        }
      }
    });
  });
}
</script>
	</head>
	<body>
		<%@include file="../header4.jsp" %>
		<main id="main">
			<div id="content">
	
			<form name="frm" id="frm" method="post">
			<div id="login_out">
				<table>
					<tbody> 
					  	<tr>
	    					<th colspan="3"><h2>대여소 등록</h2></th>
	  					</tr>
						<tr>
							<td>
								<input type="text" id="rentalshopName" name="rentalshopName" placeholder="대여소 이름" value="">
								<p id="rentalshopNameMsg" class="ability_chk" style="display:none">최대 한글25자/영문50자(50 byte)까지 입력 가능합니다.</p>
							</td>
						</tr>
					
						<tr>
							<td>
								<input type="text" id="rentalshopLocation" name="rentalshopLocation" placeholder="대여소 주소"> 
								<input type="button" onclick="openAddressPopup()" value="주소 검색"> 
								
							</td>
						</tr> 
						<tr>
							<td>
							<div>
				            	<h3>위치</h3>
					            <div>대여소 위치를 지정해주세요.</div>
					            <div id="map" style="width: 700px; height: 500px;"></div>
					            <input type="hidden" id="latitude" name="latitude" value=""><!-- 위도 -->
					            <input type="hidden" id="longitude" name="longitude" value=""><!-- 경도 -->
					            <input type="hidden" id="address" name="address" value=""><!-- 주소 -->
				        	</div>
							<p id="address2">현재 주소: </p>
							<p id="position">위치: </p>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" onclick="Signup();">등록하기</button>
							</td>
						</tr>
					</tbody>
				</table>
						
			</div> 
		</form>
		</div>
		<div id="bottom"></div>
	</main>
	</body>
	<%@include file="../footer.jsp" %>
</html>