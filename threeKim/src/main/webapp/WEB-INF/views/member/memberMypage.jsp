<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<%@page import = "java.util.*" %>  


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
#main #bottom{width:1440px; height:300px;}
#content table h2{margin-top:40px;}
#content table {width:60%; height:20%; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; font-family:'omyu_pretty'; }
#content table th{width:200px; text-align:center; border:1px solid #ddd; padding:8px;}
#content table td {border:1px solid #ddd;padding:20px;text-align:left;vertical-align:middle;height:100px; font-size:30px;}
#content table img{width:60px; height:50px; float:right; margin: 0 auto; vertical-align:middle;}
#content table td a {display:flex;  color:#333;}
#content table td a.logout-btn {display:inline-block;padding:10px 20px;background-color:#ff9800;color:#fff;text-decoration:none;border-radius:5px;transition:background-color 0.3s ease;}
#content table td a.logout-btn:hover {background-color: #FF6600;}
</style>




</head>
<body>
<div id="main">

	<%@include file="../header.jsp" %>
	
	<div id="content">
		<table>
			<tr>
				<td colspan="2" >
					<h2><%= session.getAttribute("memberName") %>님 환영합니다.</h2>
					<a class="logout-btn" style="float:right;  " href="<%=request.getContextPath() %>/member/memberLogOut.do">로그아웃</a>
				</td>
			</tr>
			
			<tr>
				<%-- <td onclick="window.location.href='<%=request.getContextPath() %>/member/memberEditInformation.do'">회원정보수정<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td> --%>
				<td onclick="window.location.href='<%=request.getContextPath() %>/member/memberEditInformation.do'">회원정보수정<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td onclick="window.location.href='<%=request.getContextPath() %>/member/memberMyPost.do'">내 게시글<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		
			<tr>
				<td onclick="window.location.href='<%=request.getContextPath() %>/bikeRent/bikeRentHistory.do'">대여내역<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td>뭐넣지?<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		
			<tr>
				<td>나의 소모임<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td>내가 찜한 모임<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		</table>
		
		  
		  
		
	
		
	</div>
	
	<div id="bottom">	
	
	</div>





</div>

</body>
<%@include file="../footer.jsp" %>
</html>