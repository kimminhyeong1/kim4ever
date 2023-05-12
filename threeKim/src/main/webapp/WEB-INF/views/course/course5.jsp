<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스</title>
<style>
/*리셋코드*/
*{margin:0;padding:0;}
li{list-style:none;}

#main{width:1000px; height:1000px; margin:35px auto 70px; text-align:center; background:#ffffff;}
#main #restaurant{display:flex; justify-content:center; align-items:center;font-family: 'omyu_pretty'; margin-left:10px;}
#main #restaurant table{ height:300px; border:1; margin-top:40px; background:white;}
#main #restaurant table td{border:1px solid #ddd;   max-width: 230px; border-radius: 10px;;
transition: transform 0.1s ease-in-out; background-color:#ffff; margin-right:10px;}
#main #restaurant table td:hover {transform: scale(1.1); z-index: 3; background:white; box-shadow:none; border:1px solid orange;}
#main #restaurant table h3,p{border-bottom:1px solid #000;}
#main #restaurant table p:last-child {border-bottom: none; }
#main #restaurant img{width:230px; height:300px; border-radius: 10px 10px 0 0; z-index:1; } 
#main h2{color:#333; font-family: 'KCC-Ganpan'; font-size:30px; margin-top:15px; text-align:center; border-bottom:2px solid #333;
padding-bottom:10px;}
</style>
</head>
<body>
<div id="main">


<div id="map" style="width:1000px;height:500px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb"></script>


<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.80785941542732, 127.11147141935659), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨 숫자 클수록 많이 보임
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: '<div>동원순대집</div>', 
        latlng: new kakao.maps.LatLng(35.804602492072284, 127.10774946373438)
    },
    {
    	content: '<div>가츠연</div>', 
        latlng: new kakao.maps.LatLng(35.816729328027805, 127.10734812833758)
    },
    {
    	content: '<div>수플레</div>', 
        latlng: new kakao.maps.LatLng(35.80967752768257, 127.10670796600279)
    },
    {
    	content: '<div>호순이감자탕</div>',
        latlng: new kakao.maps.LatLng(35.79848533253409, 127.11005610613933)
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

// 선을 구성하는 좌표 배열
var linePath = [
    new kakao.maps.LatLng(35.81928216644206, 127.1122619876997),
    new kakao.maps.LatLng(35.81573155475878, 127.11188077083578),
    new kakao.maps.LatLng(35.81280777638758 , 127.11100254672371),
    new kakao.maps.LatLng(35.81012699542269, 127.1104898503057),
    new kakao.maps.LatLng(35.808838932134066, 127.10968037280519),
    new kakao.maps.LatLng(35.807717761556624, 127.10868859100613),
    new kakao.maps.LatLng(35.80648775487392, 127.10844903990609),
    new kakao.maps.LatLng(35.805626845495205, 127.10867467845107),
    new kakao.maps.LatLng(35.80484685350046, 127.10911616550851),
    new kakao.maps.LatLng(35.80290772530249, 127.11066239924455),
    new kakao.maps.LatLng(35.80240734920768, 127.11085254889207),   
    new kakao.maps.LatLng(35.802051465472914, 127.1107275917528),
    new kakao.maps.LatLng(35.80024174625179, 127.10873372238224),
    new kakao.maps.LatLng(35.7988429134721, 127.10831419157064),
    new kakao.maps.LatLng(35.79553481750727, 127.10882133989028),
    new kakao.maps.LatLng(35.79464892787134, 127.10925985938323),
    new kakao.maps.LatLng(35.79348958869892, 127.1105884975356),
    new kakao.maps.LatLng(35.792497724966196, 127.11110150749555)
];

// 지도에 표시할 선을 생성합니다
var polyline = new kakao.maps.Polyline({
    path: linePath, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#9E37D1', // 선의 색깔입니다
    strokeOpacity: 0.9, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 지도에 선을 표시합니다 
polyline.setMap(map);  


var sw = new kakao.maps.LatLng(35.81222242569394, 127.11979821722417), // 사각형 영역의 남서쪽 좌표
    ne = new kakao.maps.LatLng(35.81222452569394, 127.11979821785117); // 사각형 영역의 북동쪽 좌표

// 사각형을 구성하는 영역정보를 생성합니다
// 사각형을 생성할 때 영역정보는 LatLngBounds 객체로 넘겨줘야 합니다
var rectangleBounds = new kakao.maps.LatLngBounds(sw, ne);



</script>
<h2>주변 맛집 리스트</h2>
	<div id="restaurant">
		<table>
		  <tr>
		    <td>
		     <img src="../resources/restaurant/동원순대.jpg" alt="맛집1">
		      <h3>동원순대집</h3>
		      <p>전북 전주시 완산구 쑥고개로391 동원순대</p>
		      <p>순대국밥 10,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    
		    <td>
		      <img src="../resources/restaurant/가츠연1.jpg" alt="맛집2">
		      <h3>가츠연</h3>
		      <p>전북 전주시 완산구 홍산북로 46-21</p>
		      <p>명품규카츠 13,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		     <img src="../resources/restaurant/수플레.jpg" alt="맛집3">
		      <h3>수플레</h3>
		      <p>전북 전주시 완산구 우전2길 63 1층 수플레</p>
		      <p>아메리카노 4,500원</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		    <img src="../resources/restaurant/호순이.jpg" alt="맛집4">
		      <h3>호순이 감자탕</h3>
		      <p>전북 전주시 완산구 강변로 78(강변공원 옆) </p>
		      <p>감자탕 소 30,000원</p>
		      <p>063-222-2222</p>
		    </td>
		  </tr>
	  </table>
	</div>
</div>


</body>
</html>