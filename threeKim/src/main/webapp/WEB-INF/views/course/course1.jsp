<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5번째 코스</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/*리셋코드*/
*{margin:0;padding:0;}
li{list-style:none;}
#main{width:1000px; height:1000px; margin:35px auto 70px; text-align:center; background:#ffffff;}
#main #restaurant{display:flex; justify-content:center; align-items:center;font-family: 'omyu_pretty'; margin-left:10px;}
#main #restaurant table{ height:300px; border:1; margin-top:40px; background:white;}
#main #restaurant table td{border:1px solid #ddd;   max-width: 230px; border-radius: 10px;
transition: transform 0.1s ease-in-out; background-color:#ffff; margin-right:10px;}
#main #restaurant table td:hover {transform: scale(1.1); z-index: 3; background:white; box-shadow:none; border:1px solid orange;}
#main #restaurant table h3,p{border-bottom:1px solid #000;}
#main #restaurant table p:last-child {border-bottom: none; }
#main #restaurant img{width:230px; height:300px; border-radius: 10px 10px 0 0; z-index:1; } 
#main h2{color:#333; font-family: 'KCC-Ganpan'; font-size:30px; margin-top:15px; text-align:center; border-bottom:2px solid #333;
padding-bottom:10px;}
table td {
  margin: 10px;
}
#map{width:1000px;height:500px;}


	/*****************************************모바일***************************************************************/
		
	@media (min-width: 300px) and (max-width: 940px)  {	
	#main{width:auto; height:auto; margin:0 auto; text-align:center; background:#ffffff;}
#main #restaurant{display:flex; justify-content:center; align-items:center;font-family: 'omyu_pretty'; margin-left:10px;}
#main #restaurant table{ width: 90%; height:100px; border:1; margin-top:40px; background:white;}
#main #restaurant table td{border:1px solid #ddd;   max-width: 20%; border-radius: 10px;
transition: transform 0.1s ease-in-out; background-color:#ffff; margin-right:10px;}
#main #restaurant table h3,p{border-bottom:1px solid #000; font-size:10px;}
#main #restaurant table p:last-child {border-bottom: none; }
#main #restaurant img{width:100%; height:auto; border-radius: 10px 10px 0 0; z-index:1; } 
#main h2{color:#333; font-family: 'KCC-Ganpan'; font-size:10px; margin-top:15px; text-align:center; border-bottom:2px solid #333;
padding-bottom:10px;}
table td {margin: 10px;}
#map{width:80%;height:300px; margin-left:10%;}

	
	}
</style>

</head>
<body>
<div id="main">

	
<div id="map" ></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f538f14cf29a1eb30d2f9dbaa4e1fb"></script>


<script>
/* 모바일스크립트*/

if (window.matchMedia("(min-width: 300px) and (max-width: 940px)").matches) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.870129959401964, 127.12694976884943), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨 숫자 클수록 많이 보임
    };
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	    	content: '<div>샤브잇데이 송천점</div>', 
	        latlng: new kakao.maps.LatLng(35.871646492998345, 127.12462962290252)
	    },
	    {
	    	content: '<div>스시아시타 송천</div>', 
	        latlng: new kakao.maps.LatLng(35.869442115317675, 127.12101923594786)
	    },
	    {
	    	content: '<div>우연</div>', 
	        latlng: new kakao.maps.LatLng(35.87202522806479, 127.12658461257334)
	    },
	    {
	    	content: '<div>이삭토스트 에코세병호점</div>',
	        latlng: new kakao.maps.LatLng(35.87937632594591, 127.13362281792516)
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
	    new kakao.maps.LatLng(35.85688716515674, 127.11695925003158),
	    new kakao.maps.LatLng(35.85801388261788, 127.11680590934778),
	    new kakao.maps.LatLng(35.85866806349254, 127.11600974178774),
	    new kakao.maps.LatLng(35.8595037300537, 127.11391294272401),
	    new kakao.maps.LatLng(35.859687861455555, 127.1121833071259),
	    new kakao.maps.LatLng(35.869854277633856, 127.1118875976888),
	    new kakao.maps.LatLng(35.86975735515599, 127.12121625665384),
	    new kakao.maps.LatLng(35.87096046413047, 127.12127899012712),
	    new kakao.maps.LatLng(35.87196913095982, 127.12200581274375),
	    new kakao.maps.LatLng(35.87396295427395, 127.1243951739484),
	    new kakao.maps.LatLng(35.87656462231302, 127.1272119609351),
	    new kakao.maps.LatLng(35.87731004859566, 127.12755090371506),
	    new kakao.maps.LatLng(35.882099409091055, 127.1282922658721),
	    new kakao.maps.LatLng(35.8871229933712, 127.12911993072868),
	    new kakao.maps.LatLng(35.886921869026, 127.12967336129763),
	    new kakao.maps.LatLng(35.88656074350044, 127.13025144605875),
	    new kakao.maps.LatLng(35.886316997474005, 127.13062759884969),
	    new kakao.maps.LatLng(35.886122337984, 127.13144406261175),
	    new kakao.maps.LatLng(35.88577000017322, 127.13221872901156),
	    new kakao.maps.LatLng(35.88541813481505, 127.13256146700932),
	    new kakao.maps.LatLng(35.88534351878512, 127.13279945346314),
	    new kakao.maps.LatLng(35.885300396911305, 127.13308179180402),
	    new kakao.maps.LatLng(35.88518739993765, 127.13338893120832),
	    new kakao.maps.LatLng(35.88404609160884, 127.13448895404261),
	    new kakao.maps.LatLng(35.88359545172111, 127.13450203551389),
	    new kakao.maps.LatLng(35.88309948558237, 127.13475037562917),
	    new kakao.maps.LatLng(35.882502150168904, 127.13497916021593),
	    new kakao.maps.LatLng(35.88196120464687, 127.13515266497085),
	    new kakao.maps.LatLng(35.881562392592485, 127.13516029323765),
	    new kakao.maps.LatLng(35.88016646228048, 127.13426091149059),
	    new kakao.maps.LatLng(35.87929493298116, 127.13387461652133),
	    new kakao.maps.LatLng(35.87846888258767, 127.1331118915708)
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
        center: new kakao.maps.LatLng(35.870129959401964, 127.12694976884943), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨 숫자 클수록 많이 보임
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다




// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: '<div>샤브잇데이 송천점</div>', 
        latlng: new kakao.maps.LatLng(35.871646492998345, 127.12462962290252)
    },
    {
    	content: '<div>스시아시타 송천</div>', 
        latlng: new kakao.maps.LatLng(35.869442115317675, 127.12101923594786)
    },
    {
    	content: '<div>우연</div>', 
        latlng: new kakao.maps.LatLng(35.87202522806479, 127.12658461257334)
    },
    {
    	content: '<div>이삭토스트 에코세병호점</div>',
        latlng: new kakao.maps.LatLng(35.87937632594591, 127.13362281792516)
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
    new kakao.maps.LatLng(35.85688716515674, 127.11695925003158),
    new kakao.maps.LatLng(35.85801388261788, 127.11680590934778),
    new kakao.maps.LatLng(35.85866806349254, 127.11600974178774),
    new kakao.maps.LatLng(35.8595037300537, 127.11391294272401),
    new kakao.maps.LatLng(35.859687861455555, 127.1121833071259),
    new kakao.maps.LatLng(35.869854277633856, 127.1118875976888),
    new kakao.maps.LatLng(35.86975735515599, 127.12121625665384),
    new kakao.maps.LatLng(35.87096046413047, 127.12127899012712),
    new kakao.maps.LatLng(35.87196913095982, 127.12200581274375),
    new kakao.maps.LatLng(35.87396295427395, 127.1243951739484),
    new kakao.maps.LatLng(35.87656462231302, 127.1272119609351),
    new kakao.maps.LatLng(35.87731004859566, 127.12755090371506),
    new kakao.maps.LatLng(35.882099409091055, 127.1282922658721),
    new kakao.maps.LatLng(35.8871229933712, 127.12911993072868),
    new kakao.maps.LatLng(35.886921869026, 127.12967336129763),
    new kakao.maps.LatLng(35.88656074350044, 127.13025144605875),
    new kakao.maps.LatLng(35.886316997474005, 127.13062759884969),
    new kakao.maps.LatLng(35.886122337984, 127.13144406261175),
    new kakao.maps.LatLng(35.88577000017322, 127.13221872901156),
    new kakao.maps.LatLng(35.88541813481505, 127.13256146700932),
    new kakao.maps.LatLng(35.88534351878512, 127.13279945346314),
    new kakao.maps.LatLng(35.885300396911305, 127.13308179180402),
    new kakao.maps.LatLng(35.88518739993765, 127.13338893120832),
    new kakao.maps.LatLng(35.88404609160884, 127.13448895404261),
    new kakao.maps.LatLng(35.88359545172111, 127.13450203551389),
    new kakao.maps.LatLng(35.88309948558237, 127.13475037562917),
    new kakao.maps.LatLng(35.882502150168904, 127.13497916021593),
    new kakao.maps.LatLng(35.88196120464687, 127.13515266497085),
    new kakao.maps.LatLng(35.881562392592485, 127.13516029323765),
    new kakao.maps.LatLng(35.88016646228048, 127.13426091149059),
    new kakao.maps.LatLng(35.87929493298116, 127.13387461652133),
    new kakao.maps.LatLng(35.87846888258767, 127.1331118915708)
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
		     <img src="../resources/restaurant/샤브잇데이1.jpg" alt="맛집1">
		      <h3>샤브잇데이 송천점</h3>
		      <p>전북 전주시 덕진구 세병서로 22</p>
		      <p>평일런치 19,800원</p>
		      <p>063-222-2222</p>
		    </td>
		    
		    <td>
		      <img src="../resources/restaurant/스시아시타.jpg" alt="맛집2">
		      <h3>스시아시타 송천</h3>
		      <p>전북 전주시 덕진구 송천중앙로 249</p>
		      <p>아시타 스탠다드A 22,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		     <img src="../resources/restaurant/우연.jpg" alt="맛집3">
		      <h3>우연</h3>
		      <p>전북 전주시 덕진구 세병서로 39 302호</p>
		      <p>시그니처 코스 90,000원</p>
		      <p>063-222-2222</p>
		    </td>
		    <td>
		    <img src="../resources/restaurant/이삭토스트2.jpg" alt="맛집4">
		      <h3>이삭토스트 에코세병호점</h3>
		      <p>전북 전주시 덕진구 세병로 174-9</p>
		      <p>햄치즈 토스트 3,100원</p>
		      <p>063-222-2222</p>
		    </td>
		  </tr>
	  </table>
	</div>
</div>


</body>
</html>