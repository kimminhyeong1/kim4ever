<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타:바-모임-일정수정하기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo7.png">
		
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
		<!-- 다음 우편번호 API 스크립트 -->
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function openAddressPopup() {
		        new daum.Postcode({
		            oncomplete: function (data) {
		                // 선택된 주소를 주소 입력란에 채우기
		                document.getElementById('address').value = data.address;
		                document.getElementById('address2').innerHTML = data.address;
		                document.getElementById('scheduleLocation').value = data.address;
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

			    var latitude = ${gsv.gScheduleLatitude}; // 위도
			    var longitude = ${gsv.gScheduleLongitude}; // 경도
			
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
			            document.getElementById('scheduleLocation').value = address;
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
			          //document.getElementById('scheduleLocation').value = address;
			          
			        }
			      }
			    });
			}
			
			
			
			
			</script>
			<script>
			function characterCheck(obj){
				var regExp =/[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi;
			    if(regExp.test(obj.value)){
			        alert("특수문자는 입력할 수 없습니다.");
			        obj.value = obj.value.substring( 0 , obj.value.length - 1 );
			    }
			}
			function fnWrite() {
			    var fm = document.frm;
			    if (fm.gScheduleTitle.value == "") {
			        alert("제목을 입력하세요");
			        fm.gScheduleTitle.focus();
			        return;		 
				}
			    else if (fm.gScheduleStartDay.value == "") {
				    alert("시작일을 입력하세요");
				    fm.gScheduleStartDay.focus();
				    return;
				  } 
				else if (fm.gScheduleEndDay.value == "") {
				    alert("종료일을 입력하세요");
				    fm.gScheduleEndDay.focus();
				    return;
				  } 
				else if (fm.gScheduleEndDay.value <= fm.gScheduleStartDay.value) {
					  alert("종료일은 시작일보다 크거나 같아야 합니다.");
					  fm.gScheduleEndDay.focus();
					  return;
					}
				 else if (fm.scheduleLocation.value == "") {
				        alert("주소를 입력하세요");
				        fm.scheduleLocation.focus();
				        return;
				  }
				  else if (fm.gScheduleFee.value == "") {
				        alert("모임비를 입력하세요");
				        fm.gScheduleFee.focus();
				        return;
				  }
				  else if (fm.gScheduleArrangements.value == "") {
				        alert("준비물을 입력하세요");
				        fm.gScheduleArrangements.focus();
				        return;
				  }
				  else if (fm.gScheduleCapacity.value == "") {
				        alert("정원을 입력하세요");
				        fm.gScheduleCapacity.focus();
				        return;
				  }
				  else if (fm.gScheduleCapacity.value < "${gsv.gScheduleCapacity}") {
					  	alert("모임 참여하고있는 인원보다 설정한 모임 정원이 더 작습니다. 더 늘려주세요.");
				        fm.gScheduleCapacity.focus();
				        return;
				  }
				 
					    fm.action = "${pageContext.request.contextPath}/gathering/gScheduleModifyAction.do";
					    fm.enctype = "multipart/form-data";
					    fm.method = "post";
					    fm.submit();
					    }
		
			function updateCharacterCount(inputName) {
				  var input = document.getElementsByName(inputName)[0];
				  var maxLength = parseInt(input.getAttribute('maxlength'));
				  var currentLength = input.value.length;
				  var countElement = document.getElementById(inputName + 'Count');
				  
				  countElement.textContent = currentLength + '/' + maxLength;
				}

				// 초기 로딩 시 글자 수 업데이트
				window.addEventListener('DOMContentLoaded', function() {
				  updateCharacterCount('gScheduleTitle');
				  updateCharacterCount('gScheduleArrangements');
				});
				
			
			</script>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<form  name="frm">
				<input type="hidden" id="gsidx" name="gsidx" value="${gsv.gsidx}"><!-- 모임 일정 번호 -->
				<section class="gContainer gSetContainer">
					<div>
						<div> 
							<div>
								<h3>일정 제목</h3>
							</div>
							<input class="gInput" type="text" name="gScheduleTitle" placeholder="내용을 입력해주세요" value="${gsv.gScheduleTitle}">
						</div>
						<div>
							<div>
								<h3>일정 날짜</h3>
							</div>
							<label for="start">시작일:</label>
							<input class="gInput" type="datetime-local" id="start" name="gScheduleStartDay" value="${gsv.gScheduleStartDay}" required>
							<label for="end">종료일:</label>		
							<input class="gInput" type="datetime-local" id="end" name="gScheduleEndDay" value="${gsv.gScheduleEndDay}" required>												
						</div>
						<div>
							<h3>일정 위치</h3><!-- 지도 api사용 -->
							<div>일정 위치를 지정해주세요.</div>
				            <div id="map" style="width: 500px; height: 500px;"></div>
				            <input class="gInput" style="width: 500px;" type="text" id="scheduleLocation" name="scheduleLocation" placeholder="일정 주소"> 
							<input class="gInput" style="width: 500px;" type="button" onclick="openAddressPopup()" value="주소 검색"> 
				            <input type="hidden" id="latitude" name="gScheduleLatitude" value=""><!-- 위도 -->
				            <input type="hidden" id="longitude" name="gScheduleLongitude" value=""><!-- 경도 -->
				            <input type="hidden" id="address" name="gScheduleLocation" value=""><!-- 주소 -->
				            <p id="address2">현재 주소: </p>
							<p id="position">위치: </p>
						</div>
						<div>
							<h3>모임비</h3>
							<input class="gInput" type="text" name="gScheduleFee" placeholder="가격을 적어주세요." value="${gsv.gScheduleFee}">		
						</div>
						<div>
							<h3>준비물</h3>
							<textarea rows="5" cols="5"  name="gScheduleArrangements"placeholder="글자제한:500자이내">${gsv.gScheduleArrangements}</textarea>		
						</div>
						<div>
							<div>
								<h3>정원(최대 100명)</h3>
							</div>
							<input class="gInput" type="number" name="gScheduleCapacity" placeholder="예:5" value="${gsv.gScheduleCapacity}">	
						</div>
					</div><!-- 끝-->
					<div>
						<button type="button" class="gBtn2" onclick="fnWrite();">일정수정하기</button>				 
					</div>
				</section>
			</form>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
