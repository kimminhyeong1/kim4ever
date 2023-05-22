<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>겜스터-비밀번호찾음</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
				
		</style>
		<script>
            $(document).ready(function(){
                $("#btn1").click(function(){
        			             
             var fm = document.frm;
       			 fm.action ="${pageContext.request.contextPath}/member/memberPwdFoundAction.do";  
       			 fm.method = "POST";
       			 fm.submit();
  
                });
            });	
   
        </script>
	</head>
	<body>
	<%@include file="../header.jsp" %> 
		<main>
	        <section id="loginPwdFound" class="memberOut">
	            <div>
	                <h2 class="memberTitle"><a href="${pageContext.request.contextPath}/member/memberIdFind.do">아이디찾기</a> <a id="loginFindTitle"  href="${pageContext.request.contextPath}/member/memberPwdFind.do">비밀번호찾기</a></h2>
	                <div class="memberOutBorder">
	                <form id="frm" name="frm" >
	                    <div id="">
	                        <input type="text" class="memberBar" name="mPwd" placeholder="비밀번호 재설정">
	                    </div>
	                    <div id="">
	                        <input type="text" class="memberBar" placeholder="비밀번호 재설정 확인">
	                    </div>
	                    <div id="">
	                        <input type="button" id="btn1" class="memberBar" value="비밀번호 재설정">
	                    </div>
	                </form>
	                </div>
	            </div>
	        </section>
	    </main>
	<%@include file="../footer.jsp" %>
	</body>
</html>