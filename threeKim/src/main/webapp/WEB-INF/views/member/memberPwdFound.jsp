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
			main{width:1250px; margin:35px auto 70px; text-align:center;}
			section{border: 1px solid #bbb;margin: 40px auto;width: 55%;padding: 20px;background-color: #f1f1f1;border-radius: 10px;}
			input{font-family: 'omyu_pretty';font-size: 24px;box-sizing: border-box;width: 430px;padding: 10px;margin: 2px 0;border: 1px solid #ccc;border-radius: 4px;}
			section>div{margin-top: 35px;} 
			section div>div div{padding: 8px;}
			section button{width: 430px;height: 60px;text-align: center;font-family: 'omyu_pretty';font-size: 30px;border-radius: 10px;border: 0px solid #ff9933;background: #ff9933;}
			/* section #auth{height: 50px; font-size: 24px;}  */
			 .memberTitle{position: relative;}
			 #loginIdFindTitle{position:absolute; color: #ff9933; text-decoration-line: none; top: -100px; left: 0px; font-size: 30px;} 
			 #loginPwdFindTitle{position:absolute; color: #ddd; text-decoration-line: none; top: -100px; left: 140px; font-size: 30px;} 
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
	                <h2 class="memberTitle"><a id="loginIdFindTitle" href="${pageContext.request.contextPath}/member/memberIdFind.do">아이디찾기</a> <a id="loginPwdFindTitle"  href="${pageContext.request.contextPath}/member/memberPwdFind.do">비밀번호찾기</a></h2>
	                <div class="memberOutBorder">
	                <form id="frm" name="frm" >
	                    <div id="">
	                        <input type="text" class="memberBar" name="memberPwd" placeholder="비밀번호 재설정">
	                    </div>
	                    <div id="">
	                        <input type="text" class="memberBar" placeholder="비밀번호 재설정 확인">
	                    </div>
	                    <div id="">
	                    	<button id="btn1">비밀번호 재설정</button>
	                    </div>
	                </form>
	                </div>
	            </div>
	        </section>
	    </main>
	<%@include file="../footer.jsp" %>
	</body>
</html>