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
#main{width:1440px; margin:35px auto 70px; text-align:center; }
#content{width:1440px; height:1500px;}
#bottom{width:1440px; height:300px;}
#content img{width:600px; height:400px; margin-top:40px;}
#content table {width:600px; height:400px; border-collapse:collapse; margin:50px auto 20px; text-align:center;}
#content table td {border:1px solid #ddd; padding:10px;font-size:16px; line-height:1.5; margin-left:60px;}
#content table h2 {font-size:24px; margin-bottom:5px; }
#content table p {margin: 0;}
#content table input[type="text"],textarea{
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}

#content button{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>
</head>
<body>
<div id="main">
<%@include file="../header.jsp" %>
	
	
	<div id="content">
		<h2>자전거 고장/신고</h2>
		<table>
	
			<tr>
				<img src="../resources/bikeimg/bikeDetail.png" alt="bikeDetail"> 
			</tr>
			
		 	<tr>
		 		<td>
				<textarea cols="100" rows="15"></textarea>
				</td>
			</tr>
				
			<tr>
			<td>
				 <button>등록</button>
			</td>
			</tr>
		</table>


	
	</div>
	
	<div id="bottom">
	 <%@include file="../bottom.jsp" %>
	</div>


</div>
</body>
<%@include file="../footer.jsp" %>
</html>