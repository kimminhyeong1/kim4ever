<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여소위치</title>
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
#main #content{width:1440px; height:2400px;text-align:center;}
#main #bottom{width:1440px; height:300px;}

#main #content table {border-collapse: collapse; margin:50px auto; width:1000px; background-color:white; box-shadow:0px 0px 10px rgba(0, 0, 0, 0.1); line-height:40px; font-size:24px;  font-family: 'omyu_pretty';}
#main #content table th {padding: 10px;text-align:center; border-bottom: 1px solid #ddd;background-color: #f2f2f2;}
#main #content table td:nth-child(1){padding: 10px; text-align:center; border-bottom:1px solid #ddd;}
#main #content table td:nth-child(2){padding: 10px; text-align:left; border-bottom:1px solid #ddd;}
#main #content h1 {
  font-size: 35px;
  text-align: center;
  color: #333;
  margin-top: 40px;
  margin-bottom: 20px;
  font-family: 'KCC-Ganpan';
  font-weight: bold;
  letter-spacing: -1px;
  text-shadow: 1px 1px #fff;
  background-color: #fff;
  border: none;
  padding-bottom: 10px;
}
#main #content h2{margin-top:20px; font-family: 'KCC-Ganpan';}

#main #marker1{font-family: 'KCC-Ganpan';}
#main #marker2{font-family: 'KCC-Ganpan';}
#main #marker3{font-family: 'KCC-Ganpan';}
#main #marker4{font-family: 'KCC-Ganpan';}
#main #marker5{font-family: 'KCC-Ganpan';}
.rs1{font-size: 50px;}
.rs2{font-size: 15px;}

</style>
</head>
<body>


<div id="main">

	<%@include file="../header.jsp" %>
	
	<div id="content">
	
	<h1>타:바 공영자전거 대여소</h1>
	

<div id="map" style=" margin-top:50px; width:100%;;height:700px;"></div>




<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb"></script>


<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.82379981948935, 127.14761432056453), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: '<div id="marker1"><span class="rs1">오목 대여소</span></br><span class="rs2">남은 갯수:</span></div>', 
        latlng: new kakao.maps.LatLng(35.81459776759758, 127.15492513917111)
    },
    {
    	content: '<div id="marker2">평화 대여소</br>남은 갯수:</div>', 
        latlng: new kakao.maps.LatLng(35.79594860552455 , 127.1321029429742)
    },
    {
    	content: '<div id="marker3">덕진 대여소</br>남은 갯수:</div>', 
        latlng: new kakao.maps.LatLng(35.84934062155616, 127.1605636201495)
    },
    {
    	content: '<div id="marker4">송천 대여소</br>남은 갯수:</div>',
        latlng: new kakao.maps.LatLng(35.854855187999924, 127.11659646840083)
    },
    {
    	content: '<div id="marker5">효자 대여소</br>남은 갯수:</div>',
        latlng: new kakao.maps.LatLng(35.819267333182594, 127.11125221813597)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

var infowindow = new kakao.maps.InfoWindow({
    content: positions[i].content // 인포윈도우에 표시할 내용
});

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
</script>
	<h2>대여소 위치 안내</h2>
	<table>
      
        <tr>
          <th>대여소명</th>
          <th>위치</th>
        </tr>
      
        <tr>
          <td>송천 대여소</td>
          <td>전라북도 전주시 덕진구 송천동1가 318-12</td>
        </tr>
        
         <tr>
          <td>덕진 대여소</td>
          <td>전라북도 전주시 덕진구 동부대로 680</td>
        </tr>
        
        <tr>
          <td>오목 대여소</td>
          <td>전라북도 전주시 완산구 교동 산1-11</td>
        </tr>
        <tr>
          <td>평화 대여소</td>
          <td>전라북도 전주시 완산구 백제대로 13</td>
        </tr>
        <tr>
       	  <td>효자 대여소</td>
       	  <td>전라북도 전주시 완산구 효자동3가 1554</td>
        </tr>
     
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
</div>
</body>
<%@include file="../footer.jsp" %>
</html>