</html><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.myezen.myapp.domain.BoardVo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜태그 --> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb&libraries=services,clusterer,drawing"></script> <!-- 카카오지도APIkey -->
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


#main{width:1250px; margin:35px auto 70px; text-align:center;}
#main #content{width:1250px; height:1500px;}
h2{text-align: center; margin-top:20px;}



#content table {width:60%; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px; font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:150px; text-align:center; border:1px solid #ddd; padding:8px;}
#content table td{border:1px solid #ddd; padding:8px; text-align:left;}
#content table td:nth-child(1){width:100px;text-align:center;}
#content table tr:last-child td input{display: inline-block; width:120px; height:50px;}
#content table button{width:160px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}


</style>

</head>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<body>
	<div id="main">
		<%@include file="../header4.jsp"%>

		<div id="content">
			<h2>신고 상세 내용</h2>

	
			<table>	  		
				<tr>
					<th>고객명</th>
					<td>${ejv.memberName}</td>										
				</tr>
				
				<tr>
					<th>연락처</th>
					<td>${ejv.memberPhone}</td>
				</tr>
				
				<tr>
					<th>자전거 종류</th>
					<td>${ejv.bikeType}</td>
				</tr>
				
				<tr>
					<th>자전거 번호</th>
					<td>${ejv.bikeCode}</td>
				</tr>
				
				<tr>
					<th>대여 장소</th>
					<td>${ejv.rentPlace}</td>
				</tr>
				<tr>
					<th>고장 장소</th>
					<td><div id="map" style="width:600px;height:300px;"></div></td>
				</tr>
				
				
				<tr>
					<th>고장 시간</th>
					<td>
				         <fmt:parseDate value="${ejv.errorDay}" pattern="yyyy-MM-dd HH:mm" var="parsedRentDay" /><!-- 날짜 변경 -->
            			<fmt:formatDate value="${parsedRentDay}" pattern="yyyy-MM-dd HH:mm" var="formattedRentDay" /><!-- 시간 설정 변경 -->
	           	 			${formattedRentDay}
						</td>  
				</tr>
				<tr>
					<th>고장 내용</th>
					<td>${ejv.errorContent}</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="sendToRepairCenter(${ejv.eidx})">수리센터 보내기</button>
					</td>		
				</tr>
		</table>
				
		
		</div>


		<div id="bottom"></div>
		
		<script>
		var map;
		var marker;

		function initMap() {
			var latitude = '${ejv.errorLatitude}'; 
			var longitude = '${ejv.errorLongitude}'; 

			var mapOptions = {
				center: new kakao.maps.LatLng(latitude, longitude),
				level: 4,
				zoomable: false, // 지도 확대/축소 비활성화
				  scrollwheel: false // 마우스 휠 스크롤 비활성화
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
				content: '${ejv.errorLocation}',
			    removable: true,
				
			});
				
			var content = '<div style="font-family: omyu_pretty; font-size: 18px;">' + '${ejv.errorLocation}' + '</div>';
			infowindow.setContent(content);
			
			// 마커 클릭 시 인포윈도우 표시
			kakao.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, marker);
			});
		

		// HTML 로딩 완료 후 initMap 함수 호출
		document.addEventListener('DOMContentLoaded', initMap);
		}
		
		
	    function sendToRepairCenter(eidx) {
	        var bikeState = '${ejv.bikeState}';
	        if (bikeState === 'Y') {
	            alert("이미 수리 처리된 자전거입니다.");
	            location.href = '<%=request.getContextPath()%>/admin/adminbikeError.do';
	        } else {
	            location.href = '<%=request.getContextPath()%>/admin/adminbikeRepairAction.do?eidx=' + eidx;
	        }
	    }
	
	</script> 		
				
	</div>
		
	
</body>

</html>