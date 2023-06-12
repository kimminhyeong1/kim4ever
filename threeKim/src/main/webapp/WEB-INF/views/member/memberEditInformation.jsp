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
#main #content{max-width: 800px;margin:40px auto;background-color:#fff;padding:30px;border-radius:5px;box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);}
#main #bottom{width:1440px; height:300px;}
h2 {text-align:left; margin-top: 20px; border-bottom:2px solid #000;}
#main #box{margin-top:30px;}
#main .section {margin-bottom:20px;padding:20px;background-color:#f9f9f9;border:1px solid #ccc;border-radius:5px;text-align:left;}
#main .section-header {margin-bottom:10px;font-size:21px;font-weight:bold;} 
#main .section-content {font-size:18px;margin-top:40px; border-bottom:1px solid #ddd;}
#content button {display:inline-block; padding:10px 20px;font-size:18px;font-weight:bold;text-align:center;text-decoration:none;background-color:#ff9933;color:#fff;border:none;border-radius:5px;cursor:pointer;}
#content button:hover {background-color:#ffcc66;}
</style>

<script>
function confirmWithdrawal() {
    if (confirm("정말로 회원 탈퇴하시겠습니까?")) {
        var memberId = '<%= session.getAttribute("memberId") %>';
        location.href = '<%= request.getContextPath() %>/member/memberWithdrawal.do';
    } else {
        alert("회원 탈퇴가 취소되었습니다.");
    }
}
</script>


</head>
<body>
<div id="main">

	<%@include file="../header.jsp" %>
	
	<div id="content">
		<h2>회원정보</h2>
		<div id="box">
	        <div class="section">
	            <div class="section-header">아이디</div>
	            <div class="section-content">${memberId}</div>
	        </div>
	        <div class="section">
	            <div class="section-header">비밀번호</div>
	            <div class="section-content">${memberPwd}</div>
	        </div>
	        <div class="section">
	            <div class="section-header">이름</div>
	              <div class="section-content">${memberName}</div>
	        </div>
	        <div class="section">
	            <div class="section-header">나이</div>
	            <div class="section-content">${memberAge}</div>
	        </div>
	        <div class="section">
	            <div class="section-header">휴대폰번호</div>
	            <div class="section-content">${memberPhone}</div>
	        </div>
	        <div class="section">
	            <div class="section-header">이메일</div>
	            <div class="section-content">${memberEmail}</div>
	        </div>
	        <div>
	            <button type="button" onclick="location.href='<%=request.getContextPath()%>/member/memberCheckPwd.do'">회원정보 수정하기</button>
	            <button type="button" onclick="confirmWithdrawal();">회원 탈퇴하기</button>
	        </div>
        </div>
	</div>
	
	<div id="bottom">	
	
	</div>





</div>

</body>
<%@include file="../footer.jsp" %>
</html>