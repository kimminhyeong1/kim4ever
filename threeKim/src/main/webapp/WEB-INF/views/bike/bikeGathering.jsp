<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#main #content{width:1440px; height:2400px; border:1px solid #000; }
#main #bottom{width:1440px; height:300px; border:1px solid #000;}
#main #content #gatheringIntro{width:100%; height:400px; background-color:#F8F8F8;}
#main #content #gatheringIntro h2{text-align:center;; margin-top:20px; font-family: 'GangwonEdu_OTFBoldA'; font-size:33px; padding:20px; text-shadow:2px 2px 0 #FFD700,-2px -2px 0 #FFD700,2px -2px 0 #FFD700, -2px 2px 0 #FFD700;}
#main #content #gatheringIntro p{text-align:center; padding:20px; font-family:'GangwonEdu_OTFBoldA'; font-size:21px; margin-top:10px;}
#main #content #gatheringList{width:100%; display:flex; flex-wrap:wrap;justify-content:center; align-items:center;}
#main #content #gatheringList h2{text-align:center;; font-family: 'GangwonEdu_OTFBoldA'; font-size:33px; padding:20px;}
#main #content .box {width:320px; height:450px; margin:20px; padding:20px; box-sizing:border-box; border:1px solid #ccc; text-align:center;}
#main #content .box img {width:100%;height:70%;object-fit:cover;margin-bottom:10px;}
#main #content #gatheringList h2 {width:100%; text-align:center; font-size:27px; margin-top:50px; margin-bottom:50px;}
#main #content #gatheringList button{display:block; width:100px; height:30px; padding:0; margin:10px 80px 15px 80px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#main #content #gatheringList button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#main #content .box h3 {margin-top:0;}
#main #content .box p {font-size:14px;}
#main #content button{width:100%; height:40px; margin-top:100px;text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#main #content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>
</head>
<body>
<div id="main">
<%@include file="../header.jsp" %>
   
	<div id="content">
	
		<div id="gatheringIntro">
		<h2>당신의 자전거 여정을 함께할 수 있는 모임, 타:바입니다!</h2>
		  <p>타:바는 자전거를 사랑하는 취미인들을 위한 소모임도 운영중입니다. 자신의 자전거가 있어도 좋고 없어도 좋습니다.</p>
		  <p>우리 타:바의 공영자전거로 함께 어울리면서 맛집 탐방이나 전주 관광도 할 수 있어요.</p>
		  <p>우리는 자전거를 타고 다닐 때 느낄 수 있는 자유로움과 즐거움을 함께 느낄 수 있으며, 더불어 건강한 습관도 함께 만들어 갈 수 있습니다</p>
		  <p>타:바와 함께라면 누구나 쉽게 자전거 여행을 즐길 수 있습니다. 우리와 함께 멋진 추억을 만들어보세요!</p>
		</div>
		

	
		<div id="gatheringList">
		<h2>자전거 모임</h2>
		<div class="box">
		<img src="../resources/bikeimg/커플자전거.jpg" alt="Image 1">
		<h3>바이크어썸</h3>
		<p>자전거를 사랑하는 전주인들의 모임입니다!</p>
		<button onclick="location.href='<%=request.getContextPath()%>/bike/bikeGatheringContent.do'">구경하기</button>
		</div>
		
		<div class="box">
		<img src="../resources/bikeimg/커플자전거.jpg" alt="Image 2">
		<h3>헬로사이클</h3>
		<p>2~30대 자전거 모임입니다</p>
		<button onclick="location.href='<%=request.getContextPath()%>/bike/bikeGatheringContent.do'">구경하기</button>
		</div>
		
		<div class="box">
		<img src="../resources/bikeimg/커플자전거.jpg" alt="Image 2">
		<h3>빠리로</h3>
		<p>자전거타고 맛집도 다니고~</p>
		<button onclick="location.href='<%=request.getContextPath()%>/bike/bikeGatheringContent.do'">구경하기</button>
		</div>
		
		<div class="box">
		<img src="../resources/bikeimg/커플자전거.jpg" alt="Image 2">
		<h3>바이크먹방</h3>
		<p>자전거보다 먹방에 진심!</p>
		<button onclick="location.href='<%=request.getContextPath()%>/bike/bikeGatheringContent.do'">구경하기</button>
		</div>
		
		<div class="box">
		<img src="../resources/bikeimg/커플자전거.jpg" alt="Image 2">
		<h3>자전거에미친사람들</h3>
		<p>자미사입니다~~</p>
		<button onclick="location.href='<%=request.getContextPath()%>/bike/bikeGatheringContent.do'">구경하기</button>
		</div>
		
		<div class="box">
		<img src="../resources/bikeimg/커플자전거.jpg" alt="Image 2">
		<h3>타자전거</h3>
		<p>라이딩 초보들 대환영!</p>
		<button onclick="location.href='<%=request.getContextPath()%>/bike/bikeGatheringContent.do'">구경하기</button>
		</div>
		
		<div class="box">
		<img src="../resources/bikeimg/커플자전거.jpg" alt="Image 2">
		<h3>효자동바이커</h3>
		<p>자전거를 좋아하는 효자동 사람들입니다~</p>
		<button onclick="location.href='<%=request.getContextPath()%>/bike/bikeGatheringContent.do'">구경하기</button>
		</div>
		
		<div class="box">
		<img src="../resources/bikeimg/커플자전거.jpg" alt="Image 2">
		<h3>덕진구바이커</h3>
		<p>자전거를 좋아하는 덕진구 사람들입니다~</p>
		<button onclick="location.href='<%=request.getContextPath()%>/bike/bikeGatheringContent.do'">구경하기</button>
		</div>
 		</div>
 		<button onclick="location.href='<%=request.getContextPath()%>/bike/bikeGatheringWrite.do'">모임만들기</button>
	</div>

        

	
	 
   
   <div id="bottom">
  
   </div>
</div>
</body>
<%@include file="../footer.jsp" %>
</html>