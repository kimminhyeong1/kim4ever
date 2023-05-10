<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2번째 코스</title>
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
#main{width:1000px; height:1000px; margin:35px auto 70px; text-align:center; background:#ffffff;}
#main #restaurant{display:flex; justify-content:center; align-items:center;font-family: 'omyu_pretty';}
#main #restaurant table{width:1000px; height:300px; border:1; margin-top:40px; background:white;}
#main #restaurant table td{border:1px solid #000; width:250px; border-radius: 30px;  box-shadow: 4px 2px 2px black;
transition: transform 0.2s ease-in-out; background-color:#eeeeee;}
#main #restaurant table td:hover {transform: scale(1.05); z-index: 3; background:white; box-shadow:none; border-width:5px;}
#main #restaurant table td:hover img {transform: scale(1.06);}
#main #restaurant table h3,p{border-bottom:1px solid #000;}
#main #restaurant table p:last-child {border-bottom: none;}
#main #restaurant img{width:230px; height:auto; margin-top:8px; border-radius:30px; z-index:1;} 
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
        center: new kakao.maps.LatLng(35.85151993727813, 127.1364321810522), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨 숫자 클수록 많이 보임
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: '<div>카페상상</div>', 
        latlng: new kakao.maps.LatLng(35.85461695229884, 127.13931031928362)
    },
    {
    	content: '<div>원두막</div>', 
        latlng: new kakao.maps.LatLng( 35.85559352024394, 127.13651112006299)
    },
    {
    	content: '<div>소리마당</div>', 
        latlng: new kakao.maps.LatLng(35.85484362280234, 127.1361611082106)
    },
    {
    	content: '<div>재영이네</div>',
        latlng: new kakao.maps.LatLng(35.8539856072058, 127.14163679951362)
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
    new kakao.maps.LatLng(35.84934062155616, 127.1605636201495),
    new kakao.maps.LatLng(35.85687122341646, 127.15668182738546),
    new kakao.maps.LatLng(35.85907290276648, 127.15466011885466),
    new kakao.maps.LatLng(35.85806333146432, 127.15303070289988),
    new kakao.maps.LatLng(35.85716118056323, 127.1501698840819),
    new kakao.maps.LatLng(35.85746687336879, 127.14712038906694),
    new kakao.maps.LatLng(35.85839659770658, 127.14594579513707),
    new kakao.maps.LatLng(35.85830197453338, 127.14407182841917),
    new kakao.maps.LatLng(35.85759601791908, 127.14279184377504),
    new kakao.maps.LatLng(35.85556414668737, 127.14240625841875),
    new kakao.maps.LatLng(35.854306501911736, 127.14082921631464),
    new kakao.maps.LatLng(35.8538587466457, 127.1383569264829),
    new kakao.maps.LatLng(35.85407053772037, 127.13638950069829),
    new kakao.maps.LatLng(35.85261377681307, 127.13347549920208),
    new kakao.maps.LatLng(35.85190001214861, 127.13099179522743),
    new kakao.maps.LatLng(35.85287254909569, 127.12756433715087),
    new kakao.maps.LatLng(35.85211508609075, 127.12364423789239),
    new kakao.maps.LatLng(35.85122457269302, 127.12195188600474),
    new kakao.maps.LatLng(35.85125373761585, 127.1198375262236),
    new kakao.maps.LatLng(35.8494064033689, 127.1195967433694),
    new kakao.maps.LatLng(35.83967408845124, 127.10879027564252)
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
		     <img src="../resources/restaurant/카페상상2.jpg" alt="맛집1">
		      <h3>카페상상</h3>
		      <p>전북 전주시 덕진구 소리로 31 명인홀 2층</p>
		      <p>딸기라떼 6,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    
		    <td>
		      <img src="../resources/restaurant/원두막.jpg" alt="맛집2">
		      <h3>원두막</h3>
		      <p>전북 전주시 덕진구 건지산로 53-8</p>
		      <p>다슬기손수제비 10,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		     <img src="../resources/restaurant/재영이네1.jpg" alt="맛집3">
		      <h3>재영이네</h3>
		      <p>전북 전주시 덕진구 소리로 54 8번 재영이네</p>
		      <p>삽겹살(1인분) 14,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		    <img src="../resources/restaurant/소리마당.jpg" alt="맛집4">
		      <h3>소리마당</h3>
		      <p>전북 전주시 덕진구 건지산로 53-1</p>
		      <p>참옻닭 50,000원</p>
		      <p>063-222-2222</p>
		    </td>
		  </tr>
	  </table>
	</div>
</div>


</body>
</html>