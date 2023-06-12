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
#content table h2{margin-top:40px; font-size:40px; font-family: 'GangwonEdu_OTFBoldA'; }
#content table {width:60%; height:20%; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; font-family:'omyu_pretty'; }
#content table th{width:200px; text-align:center; border:1px solid #ddd; padding:8px;}
#content table td {border:1px solid #ddd;padding:20px;text-align:left;vertical-align:middle;height:100px; font-size:30px;}
#content table img{width:60px; height:50px; float:right; margin: 0 auto; vertical-align:middle;}
#content table td a {display:flex;  color:#333;}
#content table td a.logout-btn {display:inline-block;padding:10px 20px;background-color:#ff9800;color:#fff;text-decoration:none;border-radius:5px;transition:background-color 0.3s ease;}
#content table td a.logout-btn:hover {background-color: #FF6600;}
#content table .profile-image {position:relative;border:1px solid #ddd;width:200px;height:200px;}
#content table .profile-image .image-container {height:80%;display:flex;justify-content:center;align-items:center;}
#content table .profile-image .image-container img {width:160px;height:120px;}
#content table .profile-image .button-container {height:20%;display:flex;justify-content:center;align-items:center;}
#content table .profile-image .button-container button {padding:10px 10px;margin-bottom:15px;background-color:#ff9800;color:#fff;text-decoration:none;border-radius:5px;transition:background-color 0.3s ease;}
#content table .profile-image .button-container button:hover {background-color:#ff6600;}
#content table .intro-section{margin-top:20px;display:flex;align-items:center;justify-content:space-between;}
#content table .intro-section h3 {font-size:34px;}
#content table input {font-family:'omyu_pretty';font-size:24px;box-sizing:border-box;width:60%;padding:10px;margin:2px 0;border:1px solid #ccc;border-radius:4px;}
#content table .intro-section .gBtn {padding:10px 20px;background-color:#ff9800;color:#fff;text-decoration:none;border-radius:5px;transition:background-color 0.3s ease;}
#content table .intro-section .gBtn:hover {background-color:#ff6600;}
</style>




</head>
<body>
<div id="main">

	<%@include file="../header.jsp" %>
	
	<div id="content">
		<table>
			<tr>
				<td colspan="2" >
					<div class="profile-image">
						<div class="image-container">
						    <img id="myImg" alt="" src="../resources/btn/user.png">
						</div>
						<div class="button-container">
						    <button>변경하기</button>
                        </div>
                    </div>
                    <div class="intro-section">
					  <h3>내 간단 소개</h3>
					  <input type="text" placeholder="멤버보기에 있는 소개입니다.">
					  <button class="gBtn">변경하기</button>
					</div>
                </td>
            </tr>       
            <tr>
                <td colspan="2">
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
				<td  onclick="window.location.href='<%=request.getContextPath() %>/bikeRent/bikeRentQR.do'">자전거 타러가기<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		
			<tr>
				<td onclick="window.location.href='<%=request.getContextPath() %>/gathering/gMyPage.do'">나의 소모임<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td onclick="window.location.href='<%=request.getContextPath() %>/gathering/gMyWish.do'">내가 찜한 모임<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		</table>
		
		  
		  
		
	
		
	</div>
	
	<div id="bottom">	
	
	</div>





</div>

</body>
<%@include file="../footer.jsp" %>
</html>