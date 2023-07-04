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
			section>form>div{margin-top: 35px;} 
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
		<script>
            $(document).ready(function(){
            	//인증번호 보내기 
            		var oneFlag = false;//한번만클릭하게
            	$("#auth").click(function(){
            		var authBar = $("#authBar");
            		var IdFind = $("#memberIdFind_btn");

            		var memberName = document.getElementById("memberName").value;
            		var memberEmail = document.getElementById("memberEmail").value;
            		var url = '${pageContext.request.contextPath}/member/memberIdMailAuth.do';
					var param = [{ name: "memberEmail", value: memberEmail },{ name: "memberName", value: memberName }];
					if (oneFlag == false) { 
	            		$.ajax({
							url: url,
							data: param,
							type: "GET",
							contentType: "application/json;",
							dataType: "json",
							success: function (data) {
								if (data.value == 1) {
									alert("이메일 전송 성공");
									oneFlag = true;
									authBar.attr("style","display:inline-block;");
									IdFind.attr("style","display:inline-block;");
									return;
								} else {
									alert("사용자가 입력한부분중에 틀린게 있습니다. 다시 시도하시오.");
									return false;
								}
							},
							error: function (error) {
								alert("Error");
							}
						});//ajax-end						
					}
            		
            	});
            	//아이디찾기
                $("#memberIdFind_btn").click(function(){
        			             
	             var fm = document.frm;
	       			 fm.action ="${pageContext.request.contextPath}/member/memberIdFound.do";  
	       			 fm.method = "POST";
	       			 fm.submit();
	  
	                });
	            });	
   
        </script>
	</head>
	<body>
		<main id="main">
			<div class="logo">
				<h1><img src="${pageContext.request.contextPath}/resources/logo/logo6.png" alt="타:바" onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/></h1>
			</div>
	        <section id="loginIdFind" class="memberOut">
		        <form id="frm" name="frm">
		            <div>
		                <h2 class="memberTitle"><a id="loginIdFindTitle" href="${pageContext.request.contextPath}/member/memberIdFind.do">아이디찾기</a> <a id="loginPwdFindTitle" href="${pageContext.request.contextPath}/member/memberPwdFind.do">비밀번호찾기</a></h2>
		                <div class="memberOutBorder">
		                    <div id="">
		                        <input type="text" id="memberName" name="memberName" placeholder="이름">
		                    </div>
		                    <div id="">
		                        <input type="text" id="memberEmail" name="memberEmail" placeholder="이메일">
		                    </div>
		                    <div id="">
		                        <input type="button" id="auth"  class="memberBar" value="인증번호 받기">
		                    </div>
		                    <div id="">
		                        <input type="text" id="authBar" name="mailKey" style="display: none;" placeholder="인증번호">
		                    </div>
		                    <div id="">
		                    	<button id="memberIdFind_btn" style="display: none;">아이디찾기</button>
		                    </div>
		                </div>
		            </div>
		        </form>
	        </section>
	    </main> 
	</body>
</html>