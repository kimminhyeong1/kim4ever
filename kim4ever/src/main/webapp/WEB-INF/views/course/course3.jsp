<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4번째 코스 한옥마을</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/*리셋코드*/
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
*{margin:0;padding:0; font-family: 'omyu_pretty';}
li{list-style:none;}
#main{width:1000px; height:1000px; margin:35px auto 70px; text-align:center; background:#ffffff;}
#main #restaurant{display:flex; justify-content:center; align-items:center;font-family: 'omyu_pretty'; margin-left:10px;}
#main #restaurant table{ height:300px; border:1; margin-top:40px; background:white;}
#main #restaurant table td{border:1px solid #ddd;   max-width: 230px; border-radius: 10px;
transition: transform 0.1s ease-in-out; background-color:#ffff; margin-right:10px;}
#main #restaurant table td:hover {transform: scale(1.1); z-index: 3; background:white; box-shadow:none; border:1px solid orange;}
#main #restaurant table h3,p{border-bottom:1px solid #bbb;}
#main #restaurant table p:last-child {border-bottom: none; }
#main #restaurant img{width:230px; height:300px; border-radius: 10px 10px 0 0; z-index:1; } 
#main h2{color:#333;  font-size:30px; margin-top:40px; text-align:center; border-bottom:2px solid #333;
padding-bottom:10px;}
table td {margin: 10px;}
#map{width:1000px;height:500px;border-radius: 20px;}


	/*****************************************모바일***************************************************************/
		
	@media (min-width: 300px) and (max-width: 940px)  {	
	#main{width:auto; height:auto; margin:0 auto; text-align:center;}
#main #restaurant{display:flex; justify-content:center; align-items:center;font-family: 'omyu_pretty'; margin-left:10px;}
#main #restaurant table{ width: 90%; height:100px; border:1; margin-top:40px; }
#main #restaurant table td{  max-width: 20%; 
transition: transform 0.1s ease-in-out;  margin-right:10px;}
#main #restaurant table h3,p{ font-size:10px;}
#main #restaurant table p:last-child {border-bottom: none; }
#main #restaurant img{width:100%; height:auto;  z-index:1; } 
#main h2{color:#333; font-size:15px; margin-top:40px; text-align:center;
padding-bottom:10px;}
table td {margin: 10px;}
#map{width:80%;height:300px; margin-left:10%; border-radius: 20px;}

	
	}
</style>
</head>
<body>
<div id="main">


<div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb"></script>


<script>
if (window.matchMedia("(min-width: 300px) and (max-width: 940px)").matches) {

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.812686263387754, 127.15025483822191), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨 숫자 클수록 많이 보임
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: '<div>베테랑</div>', 
        latlng: new kakao.maps.LatLng(35.8134282256133, 127.15151210481918)
    },
    {
    	content: '<div>조점례남문피순대</div>', 
        latlng: new kakao.maps.LatLng(35.812541668890596, 127.14692682703824)
    },
    {
    	content: '<div>두이모비빔밥와플</div>', 
        latlng: new kakao.maps.LatLng( 35.81418083278474, 127.15674175990175)
    },
    {
    	content: '<div>메르밀진미집</div>',
        latlng: new kakao.maps.LatLng(35.8110637793089, 127.15042604911902)
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
    new kakao.maps.LatLng(35.81522214550856, 127.15472717901719),
    new kakao.maps.LatLng(35.814435216407084, 127.15517655356756),
    new kakao.maps.LatLng(35.8137624677197, 127.15618768924438),
    new kakao.maps.LatLng(35.81262709582399, 127.15945511746571),
    new kakao.maps.LatLng(35.81210338766886, 127.16018987552819),
    new kakao.maps.LatLng(35.81123042248897, 127.16093498390879),
    new kakao.maps.LatLng(35.810980526789756, 127.16078234169413),
    new kakao.maps.LatLng(35.81058356143954 , 127.15596293984585),
    new kakao.maps.LatLng(35.810206290430756, 127.15323204279827),
    new kakao.maps.LatLng(35.81008453404269, 127.1515223499617),
    new kakao.maps.LatLng(35.810121610125314 , 127.15070641613616),
    new kakao.maps.LatLng(35.81044839645062 , 127.14883436524354),
    new kakao.maps.LatLng(35.811619697998815 , 127.14542863161898),
    new kakao.maps.LatLng(35.81196430841411, 127.14365613839523),
    new kakao.maps.LatLng(35.81214679332209 , 127.1417754601272),
    new kakao.maps.LatLng(35.81247990688508 , 127.1401550600514),
    new kakao.maps.LatLng(35.81278259449782 , 127.13949723424973),
    new kakao.maps.LatLng(35.81374614378971, 127.14018494764713),
    new kakao.maps.LatLng(35.81400482617389, 127.14055331375172),
    new kakao.maps.LatLng(35.815148636048406, 127.14313351266165),
    new kakao.maps.LatLng(35.81552785277109, 127.14444265503039),
    new kakao.maps.LatLng(35.81552589402296, 127.14606370550497),
    new kakao.maps.LatLng(35.81568273482156, 127.14678599946494),
    new kakao.maps.LatLng(35.81381629992338, 127.14746029412157),
    new kakao.maps.LatLng(35.813795590148, 127.14781156877791),
    new kakao.maps.LatLng(35.81357225288291, 127.14803521996912),
    new kakao.maps.LatLng(35.813789800463766, 127.14885166558571),
    new kakao.maps.LatLng(35.81463700071441, 127.15243557002592)
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
}
/************************************* 데스크탑**************************/
else {
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.812686263387754, 127.15025483822191), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨 숫자 클수록 많이 보임
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: '<div>베테랑</div>', 
        latlng: new kakao.maps.LatLng(35.8134282256133, 127.15151210481918)
    },
    {
    	content: '<div>조점례남문피순대</div>', 
        latlng: new kakao.maps.LatLng(35.812541668890596, 127.14692682703824)
    },
    {
    	content: '<div>두이모비빔밥와플</div>', 
        latlng: new kakao.maps.LatLng( 35.81418083278474, 127.15674175990175)
    },
    {
    	content: '<div>메르밀진미집</div>',
        latlng: new kakao.maps.LatLng(35.8110637793089, 127.15042604911902)
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
    new kakao.maps.LatLng(35.81522214550856, 127.15472717901719),
    new kakao.maps.LatLng(35.814435216407084, 127.15517655356756),
    new kakao.maps.LatLng(35.8137624677197, 127.15618768924438),
    new kakao.maps.LatLng(35.81262709582399, 127.15945511746571),
    new kakao.maps.LatLng(35.81210338766886, 127.16018987552819),
    new kakao.maps.LatLng(35.81123042248897, 127.16093498390879),
    new kakao.maps.LatLng(35.810980526789756, 127.16078234169413),
    new kakao.maps.LatLng(35.81058356143954 , 127.15596293984585),
    new kakao.maps.LatLng(35.810206290430756, 127.15323204279827),
    new kakao.maps.LatLng(35.81008453404269, 127.1515223499617),
    new kakao.maps.LatLng(35.810121610125314 , 127.15070641613616),
    new kakao.maps.LatLng(35.81044839645062 , 127.14883436524354),
    new kakao.maps.LatLng(35.811619697998815 , 127.14542863161898),
    new kakao.maps.LatLng(35.81196430841411, 127.14365613839523),
    new kakao.maps.LatLng(35.81214679332209 , 127.1417754601272),
    new kakao.maps.LatLng(35.81247990688508 , 127.1401550600514),
    new kakao.maps.LatLng(35.81278259449782 , 127.13949723424973),
    new kakao.maps.LatLng(35.81374614378971, 127.14018494764713),
    new kakao.maps.LatLng(35.81400482617389, 127.14055331375172),
    new kakao.maps.LatLng(35.815148636048406, 127.14313351266165),
    new kakao.maps.LatLng(35.81552785277109, 127.14444265503039),
    new kakao.maps.LatLng(35.81552589402296, 127.14606370550497),
    new kakao.maps.LatLng(35.81568273482156, 127.14678599946494),
    new kakao.maps.LatLng(35.81381629992338, 127.14746029412157),
    new kakao.maps.LatLng(35.813795590148, 127.14781156877791),
    new kakao.maps.LatLng(35.81357225288291, 127.14803521996912),
    new kakao.maps.LatLng(35.813789800463766, 127.14885166558571),
    new kakao.maps.LatLng(35.81463700071441, 127.15243557002592)
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

}

</script>
<h2>타바  추천 맛집 pick !</h2>
	<div id="restaurant">
		<table>
		  <tr>
		    <td>
		     <img src="../resources/restaurant/메르밀.jpg" alt="맛집1">
		      <h3>메르밀진미집</h3>
		      <p>전북 전주시 완산구 전주천동로 94</p>
		      <p>냉모밀소바 10,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    
		    <td>
		      <img src="../resources/restaurant/두이모.jpg" alt="맛집2">
		      <h3>두이모 비빔밥와플</h3>
		      <p>전북 전주시 완산구 자만동2길 21 두이모</p>
		      <p>비빔밥와플 6,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		     <img src="../resources/restaurant/조점례.jpg" alt="맛집3">
		      <h3>조점례남문피순대</h3>
		      <p>전북 전주시 완산구 전동3가 2-198</p>
		      <p>순대국밥 9,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		    <img src="../resources/restaurant/베테랑칼국수.jpg" alt="맛집4">
		      <h3>베테랑칼국수</h3>
		      <p>전북 전주시 완산구 경기전길 135</p>
		      <p>칼국수 8,000원</p>
		      <p>063-222-2222</p>
		    </td>
		  </tr>
	  </table>
	</div>
</div>

</body>
</html>