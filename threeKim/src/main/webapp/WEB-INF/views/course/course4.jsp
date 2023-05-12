<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1번째 코스</title>
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

<div id="map" style= "width:1000px;height:500px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.78585492725077, 127.12533620063189), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨 숫자 클수록 많이 보임
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: '<div>이바돔감자탕</div>', 
        latlng: new kakao.maps.LatLng(35.7918329015324, 127.13135498156362)
    },
    {
    	content: '<div>연안식당</div>', 
        latlng: new kakao.maps.LatLng( 35.78610529119045, 127.12934349114393)
    },
    {
    	content: '<div>싸움의고수</div>', 
        latlng: new kakao.maps.LatLng(35.78757709784748, 127.13504523212953)
    },
    {
    	content: '<div>부송국수</div>',
        latlng: new kakao.maps.LatLng(35.78253782309639, 127.13206969095829)
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
    new kakao.maps.LatLng(35.793585069587685, 127.1320769065174),
    new kakao.maps.LatLng(35.78923763241128, 127.131013332939),
    new kakao.maps.LatLng(35.78323383861982, 127.12810003641687),
    new kakao.maps.LatLng(35.78131990100595, 127.12691902522486),
    new kakao.maps.LatLng(35.77890657617317 , 127.12494371929492),
    new kakao.maps.LatLng(35.77809384643601, 127.12430373103848),
    new kakao.maps.LatLng(35.7781056761184, 127.11700412874805),
    new kakao.maps.LatLng(35.778355925084554, 127.11685241948344),
    new kakao.maps.LatLng(35.78243190109383, 127.1168528539205),
    new kakao.maps.LatLng(35.783547197148934, 127.11687384254328),
    new kakao.maps.LatLng(35.78409472065431, 127.1168691135849),
    new kakao.maps.LatLng(35.78532950108056, 127.11682114642106),
    new kakao.maps.LatLng(35.78541730715948, 127.11689040643097),
    new kakao.maps.LatLng(35.788125618825404, 127.11688054516672),
    new kakao.maps.LatLng(35.790491408859125, 127.11691166355106),
    new kakao.maps.LatLng(35.790524875037875, 127.1172518614519),
    new kakao.maps.LatLng(35.790504237257295, 127.11990112009471),

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
		     <img src="../resources/restaurant/이바돔감자탕1.jpg" alt="맛집1">
		      <h3>이바돔감자탕</h3>
		      <p>전북 전주시 완산구 모악로 4731</p>
		      <p>감자탕 소 29,000원</p>
		      <p>063-222-2222</p>
		    </td>		    
		    <td>
		      <img src="../resources/restaurant/연안식당.jpg" alt="맛집2">
		      <h3>연안식당</h3>
		      <p>전북 전주시 완산구 모악로4665 1동 103호</p>
		      <p>꼬막비빔밥 변동</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		     <img src="../resources/restaurant/싸움의고수.jpg" alt="맛집3">
		      <h3>싸움의고수</h3>
		      <p>전북 전주시 완산구 평화로 120 상가</p>
		      <p>1인보쌈 도시락 10,700원</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		    <img src="../resources/restaurant/부송국수1.jpg" alt="맛집4">
		      <h3>부송국수</h3>
		      <p>전북 전주시 완산구 평화1길 16-5</p>
		      <p>잔치국수 6,000원</p>
		      <p>063-222-2222</p>
		    </td>
		  </tr>
	  </table>
	</div>
</div>





</body>
</html>