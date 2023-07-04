<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>타:바-아이디찾기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			main{width:1250px; margin:35px auto 70px; text-align:center;}
			section{border: 1px solid #bbb;margin: 40px auto;width: 38%;padding: 20px;background-color: #fdfcfa;border-radius: 20px;padding-top: 45px;}
			input{font-family: 'omyu_pretty';font-size: 21px;box-sizing: border-box;width: 300px;padding: 10px;margin: 2px 0;border: 1px solid #ccc;border-radius: 20px;}
			section>div{margin-top: 35px;} 
			section div>div>div{padding: 8px;}
			section button{width: 300px;height: 45px;text-align: center;font-family: 'omyu_pretty';font-size: 21px;border-radius: 20px;border: 0px solid #ff9933;background: #ff9933; cursor: pointer;}
			/* section #auth{height: 50px; font-size: 24px;}  */
			 .memberTitle{position: relative;}
			 #loginIdFindTitle{position:absolute; color: #ff9933; text-decoration-line: none; top: -120px; left: 0px; font-size: 30px;} 
			 #loginPwdFindTitle{position:absolute; color: #ddd; text-decoration-line: none; top: -120px; left: 140px; font-size: 30px;}
			 /*로고*/
			.logo h1 img{position: relative;top: 133px;width: 90px;  cursor: pointer;}   
			#auth{ cursor: pointer;}
		</style>
	</head>
	<body>
		<main>
			<div class="logo">
				<h1><img src="${pageContext.request.contextPath}/resources/logo/logo6.png" alt="타:바" onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/></h1>
			</div>
	        <section id="loginIdFound" class="memberOut">
	            <div>
	                <h2 class="memberTitle"><a id="loginIdFindTitle" href="${pageContext.request.contextPath}/member/memberIdFind.do">아이디찾기</a> <a id="loginPwdFindTitle" href="${pageContext.request.contextPath}/member/memberPwdFind.do">비밀번호찾기</a></h2>
	                <div class="memberOutBorder">
	                    <div id="">
	                        <input type="button" class="memberBar" value="아이디는 ${memberId} 입니다.">
	                    </div>
	                    <div id="">
	                    	<button id="memberIdFind_btn"onclick="location.href='${pageContext.request.contextPath}/member/memberLogin.do'" >로그인 하러 가기</button>
	                    </div>
	                </div>
	            </div>
	        </section>
	    </main>
	</body>
</html>