<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.BikeJoinVo" %>
<%@page import = "java.util.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<BikeJoinVo> klist = (ArrayList<BikeJoinVo>)request.getAttribute("klist");
%>

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

#main{width:1250px; margin:35px auto 70px; text-align:center; }
#main #content{width:1250px; height:2400px;text-align:center;}
#main #bottom{width:1250px; height:300px; }
#main #content h2{text-align:left; margin-top:50px; margin-left:200px;font-family: 'GangwonEdu_OTFBoldA'; font-size:30px;}
#content p{text-align:right; margin-right:200px;}
#content table {width:70%; border-collapse:collapse; margin:60px auto 0; line-height:40px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width:50px;}
#content table tr th:nth-child(2){width:50px;}
#content table tr th:nth-child(3){width:50px;}
#content table tr th:nth-child(4){width:80px;}
button{width:250px; height:40px; margin-top:20px; margin-left:600px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}


</style>

</head>

<body>

<div id="main">
	<%@include file="../header4.jsp"%>
	
	<div id="content">
		<h2>자전거 리스트</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>종류</th>
				<th>위치</th>
				<th>상태</th>
			</tr>
	
		<c:forEach var="kv" items="${klist}">
			<tr>
				<td>${kv.bikeCode}</td>
				<td>${kv.bikeType}</td>
				<td>${kv.bikeLocation}</td>
				<td>
				<c:choose>
								<c:when test="${kv.bikeState eq 'Y'}">  
									대여 가능
								</c:when>
								<c:when test="${kv.bikeState eq 'N'}">  
									대여 중
								</c:when>
								<c:when test="${kv.bikeState eq 'E'}">  
									고장
								</c:when>
				</c:choose>				
				</td>
			</tr>
		</c:forEach>		
		</table>
		<button onclick="location.href='${pageContext.request.contextPath}/bikeRent/bikeRentInfo.do'">자전거 등록/삭제 하러가기</button>
	</div>
	
	
	
	
	</div>
	
	<div id="bottom">
	</div>

</body>
<%@include file="../footer.jsp" %>
</html>