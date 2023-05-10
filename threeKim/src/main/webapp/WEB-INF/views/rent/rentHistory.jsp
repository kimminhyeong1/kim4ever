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
#main #content{width:1440px; height:2400px; text-align:center;}
#main #bottom{width:1440px; height:300px; }
h2{text-align:left; margin-top:50px; margin-left:80px;}
#content table {width:90%; border-collapse:collapse; margin:60px auto 0; line-height:60px; font-size:20px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width: 40px;}
#content table tr th:nth-child(2){width: 100px;}
#content table tr th:nth-child(3){width: 30px;}
#content table tr th:nth-child(4){width: 60px;}
#content table tr th:nth-child(5){width: 30px;}
#content table tr th:nth-child(6){width: 50px;}
#content table tr th:nth-child(7){width: 10px;}
#content table tr th:nth-child(8){width: 40px;}
#content table button{width:100px; height:40px; text-align:center; background:#ff9933; border:0px solid #ff9933; border-radius:10px; font-family:'omyu_pretty'; font-size:24px;}

</style>
</head>
<body>
<div id="main">
	
	<%@include file="../header.jsp" %>

	<div id="content">
		<h2>대여 내역</h2>
		<table>
				<tr>
					<th>고객명</th>
					<th>연락처</th>
					<th>대여소</th>
					<th>자전거종류</th>
					<th>대여시간</th>
					<th>대여날짜</th>
					<th>가격</th>
					<th>반납</th>
					
				</tr>
			
				<tr>
					<td>김병수</td>
					<td>010-1234-5678</td>
					<td>효천</td>
					<td>전기자전거</td>
					<td>09:40</td>
					<td>2023-04-27</td>
					<td>2000원</td>
					<td><button type="button">반납하기</button></td>
				</tr>
		</table>
		
	</div>
	
	
	
	
	</div>
	
	<div id="bottom">
	</div>

</body>
<%@include file="../footer.jsp" %>
</html>