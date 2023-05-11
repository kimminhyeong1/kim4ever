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
#main #content{width:1440px; height:2400px;}
#main #bottom{width:1440px; height:300px; }

h2{text-align: center; margin-top:20px;}
#content #gather{width:80%; height:600px; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px;}
#content #gather label{font-family:'omyu_pretty'; font-size:30px; margin-left:10px;}
#content #gather input{box-sizing: border-box; width:100%;padding:20px; border:1px solid #ccc; border-radius:4px;}
#content button{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content img{width:500px; height:500px;}
#content #gatherCon p{font-family: 'omyu_pretty'; font-size:34px; margin-left:10px;}
#content #gatherCon{width:80%; height:400px; border-collapse:collapse; border:1px solid #ddd; margin:10px auto 0; text-align:center;  line-height:100px;}

</style>
</head>
<body>
<div id="main">
	
	<%@include file="../header.jsp" %>

	<div id="content">
	
	<div id="gather">
	<h1>바이크어썸</h1>
	<img src="../resources/bikeimg/커플자전거.jpg" alt="Image 1">
	</div>
	<div id="gatherCon"> 
	<p>바이크어썸은 자전거를 처음 타보는 초보자들도 환영합니다 ! <br/>
	같이 라이딩하면서 맛있는거 먹는 모임이에요!</p>
	<p>모임위치:</p>
	<p>날짜:</p>
	<button>가입</button>
	</div>
	
	</div>

	
	
	<div id="bottom">
	
	

	</div>


</div>
</body>
<%@include file="../footer.jsp" %>
</html>