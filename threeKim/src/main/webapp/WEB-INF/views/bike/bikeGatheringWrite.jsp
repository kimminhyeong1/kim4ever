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
#content #gather{width:80%; height:1500px; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px;}
#content #gather label{font-family:'omyu_pretty'; font-size:30px; margin-left:10px;}
#content #gather p{text-align:left;}
#content #gather input{box-sizing: border-box; width:100%;padding:20px; border:1px solid #ccc; border-radius:4px;}
#content button{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}


</style>


</head>
<body>
<div id="main">
	
	<%@include file="../header.jsp" %>

	<div id="content">

	
	<div id="gather">
	 <p>
	 <label>소모임 이름</label>
     <input type="text"/>
     </p>
     
     <p>
	 <label>소모임 이름</label>
     <input type="text"/>
     </p>
     
     <p>
	 <label>소모임 최대 멤버 수</label>
     <input type="text"/>
     </p>
     
     <p>
	 <label>소모임 소개</label>
     <input type="text" style="height:200px;"/>
     </p>
  	
  
  	 <button>소모임 생성</button>
  
  	
	
	</div>


	</div>
	
	
	
	<div id="bottom">
	
	
	
	</div>


</div>
</body>
<%@include file="../footer.jsp" %>
</html>