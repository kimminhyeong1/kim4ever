<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>겜스터-아이디찾음</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
				
		</style>
	</head>
	<body>
	<%@include file="../header.jsp" %> 
		<main>
	        <section id="loginIdFound" class="memberOut">
	            <div>
	                <h2 class="memberTitle"><a id="loginFindTitle" href="${pageContext.request.contextPath}/member/memberIdFind.do">아이디찾기</a> <a href="${pageContext.request.contextPath}/member/memberPwdFind.do">비밀번호찾기</a></h2>
	                <div class="memberOutBorder">
	                    <div id="">
	                        <input type="button" class="memberBar" value="아이디는 ${mId} 입니다.">
	                    </div>
	                    <div id="">
	                        <input type="button" class="memberBar" value="로그인 하러 가기" onclick="location.href='${pageContext.request.contextPath}/member/memberLogin.do';">
	                    </div>
	                </div>
	            </div>
	        </section>
	    </main>
	<%@include file="../footer.jsp" %>
	</body>
</html>