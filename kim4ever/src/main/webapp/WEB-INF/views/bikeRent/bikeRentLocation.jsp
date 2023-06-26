<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>대여소위치</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_rent.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb"></script>
		<style>
			#main{width:1250px; margin:35px auto 70px; text-align:center;}
			#main #content{width:1250px; height:2400px;text-align:center;}
			#main #bottom{width:1250px; height:300px;}
			#main #content #map{margin-top:50px; width:80%; height:700px; margin-left:130px;}
			#main #content table {border-collapse: collapse; margin:50px auto; width:1000px; background-color:white; box-shadow:0px 0px 10px rgba(0, 0, 0, 0.1); line-height:40px; font-size:24px;  font-family: 'omyu_pretty';}
			#main #content table th {padding: 10px;text-align:center; border-bottom: 1px solid #ddd;background-color: #f2f2f2;}
			#main #content table td:nth-child(1){padding: 10px; text-align:center; border-bottom:1px solid #ddd;}
			#main #content table td:nth-child(2){padding: 10px; text-align:left; border-bottom:1px solid #ddd;}
			#main #content h1 {font-size:35px; padding-top:10px;  text-align:center; color:#333; margin-top:40px; margin-bottom:20px; font-family:'KCC-Ganpan'; font-weight:bold; letter-spacing:-1px; text-shadow:1px 1px #fff; background-color:#fff; border:none;padding-bottom:10px;}
			#main #content h2{margin-top:20px; font-family: 'KCC-Ganpan';}
			
			/*마커 폰트 변경*/
			/*마커 글씨 크기 변경*/
			.rs1{font-size:25px; font-family:'omyu_pretty';}
			.rs2{font-size:19px; font-family:'omyu_pretty';}
			.infowindow {display: block;  background:#238CFA;  color: #fff;  text-align: center;  width: 120px; height: 50px;  line-height:22px;  border-radius:4px; margin:0; line-height:14px; padding-top:10px;}
			
			
				/*****************************************모바일***************************************************************/
		html{height:100%;}
	@media (min-width: 300px) and (max-width: 940px)  {	
			#main{width:auto; margin:0 auto; text-align:center;}
			#main #content{width:auto; height:auto;text-align:center;}
			#main #bottom{width:auto; height:10px;}
			#main #content #map{margin-top:50px; width:200px; height:200px; margin-right:50px;}
			#main #content table {border-collapse: collapse; margin:20px auto; width:90%; background-color:white; box-shadow:0px 0px 10px rgba(0, 0, 0, 0.1); line-height:11px; font-size:11px;  font-family: 'omyu_pretty'; }
			#main #content table th {padding: 3px;text-align:center; border-bottom: 1px solid #ddd;background-color: #f2f2f2; width:45px; line-height:12px;}
			#main #content table td:nth-child(1){padding: 5px; text-align:center; border-bottom:1px solid #ddd;}
			#main #content table td:nth-child(2){padding: 5px; text-align:left; border-bottom:1px solid #ddd;}
			
			#main #content h1 {font-size:15px; text-align:center; color:#333; margin-top:10px; margin-bottom:20px; font-family:'KCC-Ganpan'; font-weight:bold; letter-spacing:-1px; text-shadow:1px 1px #fff; background-color:#fff; border:none;padding-bottom:10px;}
			#main #content h2{font-size:15px; margin-top:20px; font-family: 'KCC-Ganpan';}
#main #content #map{width:80%;height:40vh; margin-left:10%;}
			/*마커 폰트 변경*/
			/*마커 글씨 크기 변경*/
			.rs1{font-size:13px; margin-left:3px; font-family:'omyu_pretty'; padding-top:2px;}
			.rs2{font-size:13px; margin-left:2px; font-family:'omyu_pretty';}
.infowindow {display: block;  background:#238CFA;  color: #fff;  text-align: center;  width: 70px; height: 30px;  line-height:22px;  border-radius:4px; margin:0; line-height:10px;}

}
		</style>
	</head>
<body>
	<%@include file="../header.jsp" %>
	<div id="main">
		<div id="content">
			<h1>타:바 공영자전거 대여소</h1>
			<div id="map" ></div>
			<h2>대여소 위치 안내</h2>
			<table>
		        <tr>
		          <th>대여소명</th>
		          <th>위치</th>
		        </tr>
		      	<c:forEach var="bjvlist" items="${bjvlist}">
	           		<tr>
			          <td>${bjvlist.rentalshopName} 대여소</td>
			          <td>${bjvlist.rentalshopLocation}</td>
			        </tr>
        		</c:forEach>
		    </table>
		    
		    <h2>대여소 운영 안내</h2>
		  	<table>
			    <tr>
			      <th>대여시간</th>
			      <td>4월, 5월, 9월, 10월 (09:00 ~ 18:00)<br><strong>하절기</strong>: 6월 ~ 8월 (09:00 ~ 19:00)<br><strong>동절기</strong>: 3월, 11월, 12월 (10:00 ~ 17:00)</td>
			    </tr>
			    
			    <tr>
			      <th>대여대상</th>
			      <td>자전거 운전이 가능한 사람(단, 14세 이하 이용자는 보호자와 동반한 경우)</td>
			    </tr>
			    
			    <tr>
			      <th>대여료</th>
			      <td>1회 1,000원 (일반자전거 기준)</td>
			    </tr>
			    
			    <tr>
			      <th>대여조건</th>
			      <td>휴대폰으로 인증</td>
			    </tr>
			    
			    <tr>
			      <th>반납장소</th>
			      <td>대여소 어디에서든 가능</td>
			    </tr>
		  	</table>
		</div>
	<div id="bottom">
	</div>
	<%@include file="../footer.jsp" %>
</div>
<script>

/* 모바일스크립트*/





if (window.matchMedia("(min-width: 300px) and (max-width: 940px)").matches) {


	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.82991972478962, 127.13179953776518), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다




/*
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: '<div id="marker1"><span class="rs1">오목 대여소</span></br><span class="rs2">남은 갯수:</span></div>', 
        latlng: new kakao.maps.LatLng(35.81459776759758, 127.15492513917111)
    },
    {
    	content: '<div id="marker2"><span class="rs1">평화 대여소</span></br><span class="rs2">남은 갯수:</div>', 
        latlng: new kakao.maps.LatLng(35.79594860552455 , 127.1321029429742)
    },
    {
    	content: '<div id="marker3"><span class="rs1">덕진 대여소</span></br><span class="rs2">남은 갯수:</div>', 
        latlng: new kakao.maps.LatLng(35.84934062155616, 127.1605636201495)
    },
    {
    	content: '<div id="marker4"><span class="rs1">송천 대여소</span></br><span class="rs2">남은 갯수:</div>',
        latlng: new kakao.maps.LatLng(35.854855187999924, 127.11659646840083)
    },
    {
    	content: '<div id="marker5"><span class="rs1">효자 대여소</span></br><span class="rs2">남은 갯수:</div>',
        latlng: new kakao.maps.LatLng(35.819267333182594, 127.11125221813597)
    }
];
*/
//마커를 표시할 위치 정보 배열 
var positions = [
    <c:forEach var="position" items="${positions}">
        {
            content: '${position.content}',
            latlng: new kakao.maps.LatLng('${position.latitude}', '${position.longitude}')
        },
    </c:forEach>
];
	// 지도에 마커 추가
for (var i = 0; i < positions.length; i++) {
    var marker = new kakao.maps.Marker({
        map: map,
        position: positions[i].latlng
    });
    
var infowindow = new kakao.maps.InfoWindow({
    content: positions[i].content // 인포윈도우에 표시할 내용
});
	//인포윈도우를 열어줍니다
	infowindow.open(map, marker);
	
	var infowindow = document.querySelectorAll('.infowindow');
	infowindow.forEach(function(e) {
	    var w = e.offsetWidth + 10;
	    var ml = w/2;
	    e.parentElement.style.top = "35px";
	    e.parentElement.style.left = "50%";
	    e.parentElement.style.marginLeft = -ml+"px";
	    e.parentElement.style.width = "70px";
	    e.parentElement.previousSibling.style.display = "none";
	    e.parentElement.parentElement.style.border = "0px";
	    e.parentElement.parentElement.style.background = "unset";
	});


}
	
}
/* ********************************************데탑*******************************************/
else{

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.82379981948935, 127.13042445589289), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	

	/*
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	    	content: '<div id="marker1"><span class="rs1">오목 대여소</span></br><span class="rs2">남은 갯수:</span></div>', 
	        latlng: new kakao.maps.LatLng(35.81459776759758, 127.15492513917111)
	    },
	    {
	    	content: '<div id="marker2"><span class="rs1">평화 대여소</span></br><span class="rs2">남은 갯수:</div>', 
	        latlng: new kakao.maps.LatLng(35.79594860552455 , 127.1321029429742)
	    },
	    {
	    	content: '<div id="marker3"><span class="rs1">덕진 대여소</span></br><span class="rs2">남은 갯수:</div>', 
	        latlng: new kakao.maps.LatLng(35.84934062155616, 127.1605636201495)
	    },
	    {
	    	content: '<div id="marker4"><span class="rs1">송천 대여소</span></br><span class="rs2">남은 갯수:</div>',
	        latlng: new kakao.maps.LatLng(35.854855187999924, 127.11659646840083)
	    },
	    {
	    	content: '<div id="marker5"><span class="rs1">효자 대여소</span></br><span class="rs2">남은 갯수:</div>',
	        latlng: new kakao.maps.LatLng(35.819267333182594, 127.11125221813597)
	    }
	];
	*/
	//마커를 표시할 위치 정보 배열 
    var positions = [
        <c:forEach var="position" items="${positions}">
            {
                content: '${position.content}',
                latlng: new kakao.maps.LatLng('${position.latitude}', '${position.longitude}')
            },  
        </c:forEach>
    ];
 	// 지도에 마커 추가
    for (var i = 0; i < positions.length; i++) {
        var marker = new kakao.maps.Marker({
            map: map,
            position: positions[i].latlng
        });
        
	var infowindow = new kakao.maps.InfoWindow({
	    content: positions[i].content // 인포윈도우에 표시할 내용
	});
	
	//인포윈도우를 열어줍니다
	infowindow.open(map, marker);

	var infowindow = document.querySelectorAll('.infowindow');
	infowindow.forEach(function(e) {
	    var w = e.offsetWidth + 10;
	    var ml = w/2;
	    e.parentElement.style.top = "35px";
	    e.parentElement.style.left = "50%";
	    e.parentElement.style.marginLeft = -ml+"px";
	    e.parentElement.style.width = "70px";
	    e.parentElement.previousSibling.style.display = "none";
	    e.parentElement.parentElement.style.border = "0px";
	    e.parentElement.parentElement.style.background = "unset";
	});
	
	}

	/* 전에했던거 마우스를 가져가면 이벤트 발생
	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	// 이벤트 리스너로는 클로저를 만들어 등록합니다 
	// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	
	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	return function() {
	    infowindow.open(map, marker);
	};
	}
	
	
	
	//인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	return function() {
	    infowindow.close();
	};
	}
	*/

	}
	</script>
</body>

</html>