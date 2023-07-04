<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
<title>타바-회원정보수정</title>
<style>
/*리셋코드*/

*{margin:0;padding:0;}
li{list-style:none;}
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{max-width: 500px;margin:40px auto;background-color:#fdfcfa;padding:30px;border-radius:20px;border: 1px solid #bbb;}
#main #bottom{width:1440px; height:300px;}
h2{text-align:left; margin-top: 20px; padding-bottom:10px; border-bottom:2px solid #000;}
#main #box{margin-top:30px;}
#main #box img{width:30px; height:20px; float:left; margin: 0 auto; vertical-align:middle;}
#main #box .section {margin-bottom:20px;padding:20px;text-align:left;}
#main #box .section-header {margin-bottom:10px;font-size:24px;font-weight:bold;} 
#main #box .section-content {font-size:21px;margin-top:40px;}
input{font-family:'omyu_pretty';font-size:24px;box-sizing:border-box;width:100%;padding:10px;margin:2px 0;border:1px solid #ccc;border-radius:20px;}
#content button{width:150px; height:35px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:20px; border:0px solid #ff9933; background:#ff9933;}
#content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
/****************************모바일**************************/
@media (min-width: 300px) and (max-width: 940px)  {
	#main{width:100%; margin:35px auto 70px; text-align:center;}
	#main #box .section {padding: 10px;text-align: left;margin-bottom: 0px;}
	#main #box .section-content {margin-top: 10px;}
	#content{height: 100% !important;} 
	#content button {margin: 10px;}

} 
</style>
<script type="text/javascript">

function fnSubmit() {
	if(confirm("정말 수정하시겠습니까?")) {
		location.href='<%=request.getContextPath()%>/member/memberUpdate.do?memberId='+memberId;
	}
}
</script>


</head>
<body>
<div id="main">

	<%@include file="../header.jsp" %>
	
	<div id="content">
		
		<form action="memberUpdateAction.do" method="post" onsubmit="fnSubmit()">
		<h2>회원정보</h2>
		<div id="box">
			<c:choose>
				<c:when test="${mv.memberLoginType eq '구글' or mv.memberLoginType eq '카카오'}">
				</c:when>
				<c:otherwise>
			        <div class="section">
			            <div class="section-header">아이디</div>
			            <div class="section-content"> <img src="../resources/icon/check.png" alt="이미지">${memberId}</div>
			        </div>	
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${mv.memberLoginType eq '구글' or mv.memberLoginType eq '카카오'}">
				</c:when>
				<c:otherwise>
		         <div class="section">
		            <div class="section-header">비밀번호</div>
		            <div class="section-content">
		            	<input type="password" id="memberPwd" name="memberPwd">
	            	</div>
		        </div>
				</c:otherwise>
			</c:choose>
			 <div class="section">
	            <div class="section-header">이름</div>
	            <div class="section-content">
					<input type="text" id="memberName" name="memberName">
				</div>
	        </div>	
			 <div class="section">
	            <div class="section-header">나이</div>
	            <div class="section-content">
	            	<input type="number" id="memberAge" name="memberAge">
	            </div>
	        </div>	
			 <div class="section">
	            <div class="section-header">휴대폰번호</div>
	            <div class="section-content">
	            	<input type="tel" id="memberPhone" name="memberPhone" maxlength="11">
	            </div>
	        </div>	
			<div class="section">
	            <div class="section-header">이메일</div>
	            <div class="section-content">
	            	<input type="text" id="memberEmail" name="memberEmail">
	            </div>
	        </div>	
			<div>
		        <button type="submit">수정하기</button>
				<button type="reset">초기화하기</button>
				<button type="button">취소하기</button>
	        </div>	
        </div>
		</form>
	</div>
</div>

</body>
<%@include file="../footer.jsp" %>
</html>