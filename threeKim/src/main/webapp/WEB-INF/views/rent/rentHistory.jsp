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
#main #content h2{text-align:left; margin-top:50px; margin-left:80px;font-family: 'GangwonEdu_OTFBoldA'; font-size:27px;}
#content table {width:90%; border-collapse:collapse; margin:60px auto 0; line-height:60px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(2){width: 130px;}
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>
<script type="text/javascript">
	function fnReturn() {
		if(confirm("반납 하시겠습니까?")) {
			location.href='';
		}
	}
</script>
</head>
<body>
<div id="main">
	
	<%@include file="../header.jsp" %>

	<div id="content">
		<h2>이용 내역</h2>
		<table>
				<tr>
					<th>고객명</th>
					<th>연락처</th>
					<th>대여소</th>
					<th>자전거종류</th>
					<th>대여날짜</th>
					<th>대여시간</th>
					<th>가격</th>
					<th>반납</th>
					<th></th>
					
				</tr>
			
				<tr>
					<td>김병수</td>
					<td>010-1234-5678</td>
					<td>효천</td>
					<td>전기자전거</td>
					<td>2023-04-27</td>
					<td>09:40</td>
					<td>2000원</td>
					<td><button type="button" onclick="fnReturn();">반납하기</button></td>
					<td><button type="button" onclick="location.href='<%=request.getContextPath()%>/rent/rentFault.do'">고장/신고</button></td>
				</tr>
		</table>
	
		
	
		<h2>대여 이력</h2>
		<table>
				<tr>
					<th>고객명</th>
					<th>연락처</th>	
					<th>자전거종류</th>
					<th>대여장소</th>
					<th>반납장소</th>
					<th>대여날짜</th>
					<th>대여시간</th>
					<th>반납시간</th>
					<th>가격</th>
					
					
				</tr>
			
				<tr>
					<td>김병수</td>
					<td>010-1234-5678</td>
					<td>전기자전거</td>
					<td>송천</td>
					<td>아중</td>
					<td>2023-04-27</td>
					<td>09:40</td>
					<td>11:25</td>
					<td>2000원</td>
				</tr>
				
				<tr>
					<td>김지원</td>
					<td>010-1234-5678</td>
					<td>일반자전거</td>
					<td>덕진</td>
					<td>오목</td>
					<td>2023-02-27</td>
					<td>11:40</td>
					<td>15:25</td>
					<td>1000원</td>
				</tr>
				
				<tr>
					<td>김민형</td>
					<td>010-1234-5678</td>
					<td>일반자전거</td>
					<td>효자</td>
					<td>평화</td>
					<td>2023-02-27</td>
					<td>15:40</td>
					<td>17:25</td>
					<td>1000원</td>
				</tr>
		</table>
		
	
	
	
	
	
	</div>
	
	<div id="bottom">
	</div>
</div>
</body>

<%@include file="../footer.jsp" %>
</html>