<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String msg = "";
if (request.getAttribute("msg") != null){
msg = (String)request.getAttribute("msg");
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		<style>
			#main{width:1250px; margin:35px auto 70px; text-align:center;}
			#main #content{width:1250px; height:200px;}
			#main #bottom{width:1250px; height:300px;}
			#content table{width:30%;border-collapse:collapse;  margin: 60px auto 0; text-align:center;  line-height:30px; font-family:'omyu_pretty'; font-size:21px;}
			#content table th{width:240px; text-align:center; border:1px solid #bbb; padding:8px;}
			#content table td{padding:8px;text-align:left;}
			#content table td:nth-child(1){width:240px;text-align:center;}
			/*로그인 외각선*/
			#login_out{border: 1px solid #bbb;margin: 40px auto;width: 38%;padding: 20px;background-color: #fdfcfa;border-radius: 20px;}
			/*경고문*/
			#content table tr:nth-child(3) td{padding: 0px;}
			#content table tr:nth-child(3) td div{width: 240px;text-align: left; padding-left: 10px; color: #f00;}
			/*아이디저장 부분*/
			#content table tr:nth-child(4) td{text-align: left; padding: 0px;padding-left: 10px;}
			#content table tr:nth-child(4) td input{display: inline-block; width: 10%; height: 18px;vertical-align: middle;}
			#content table tr:nth-child(4) td span{display: inline-block;}
			/*아이찾기.비밀번호재설정.회원가입부분*/
			#Login_submenu{margin-bottom: 25px;}
			#Login_submenu p{display: inline-block; font-size: 20px;}
			#Login_submenu p a{text-decoration-line: none; color: #5e5e5e;}
			 
			#content table tr:last-child td input{display: inline-block; width:120px; height:50px;}
			
			h2{text-align: center; margin-top:20px;}
			/*인풋부분*/
			#content table input{
			  font-family: 'omyu_pretty';
			  font-size:21px;
			  box-sizing: border-box;
			  width: 300px;
			  padding: 10px;
			  margin: 2px 0;
			  border: 1px solid #ccc;
			  border-radius: 20px;
			}
			/*버튼부분*/
			#content table button{width:300px; height:45px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:20px; border:0px solid #ff9933; background:#ff9933;}
			#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			/*구글로그인부분*/
			.g_id_signin{display: inline-block; margin-top: 20px;}
			/*아이디저장*/
			#checkId{cursor: pointer;}
			label{cursor: pointer;font-size: 20px;} 
			/*로고*/
			.logo h1 img{position: relative;top: 133px;width: 90px;}
			/*카카오로그인*/
			.kakao_txt img{border-radius: 20px;}
			/*구글로그인*/
			.nsm7Bb-HzV7m-LgbsSe{border-radius: 20px;}
			#buttonDiv{width: 40%;margin: 0 auto;}
			
			/**************************모바일****************************************/
/*****모바일 넓이***/ 

@media (min-width: 300px) and (max-width: 940px)  {
	#main{width:auto; margin:0 auto; text-align:center;}
			#main #content{width:auto; height:350px;}
			#main #bottom{width:auto; height:20px;}
			#content table{width:30%;border-collapse:collapse;  margin: 0 auto; text-align:center;  line-height:30px; font-family:'omyu_pretty'; font-size:21px;}
			#content table th{width:240px; text-align:center; border:1px solid #fff; padding:8px;}
			#content table td{padding:8px;text-align:left;}
			#content table td:nth-child(1){width:10%;text-align:center;}
			/*로그인 외각선*/
			#login_out{ border: 1px solid #bbb; margin: 40px auto;width: 270px; height:200px;padding: 20px;background-color: #fdfcfa;border-radius: 20px;}
			/*경고문*/
			#content table tr:nth-child(3) td{padding: 0px;}
			#content table tr:nth-child(3) td div{width: 240px;text-align: left; padding-left: 10px; color: #f00;}
			/*아이디저장 부분*/
			#content table tr:nth-child(4) td{text-align: left; font-size:12px; }
			#content table tr:nth-child(4) td input{display: inline-block; width: 10%; height: 10px;vertical-align: middle;}
			#content table tr:nth-child(4) td span{display: inline-block;}
			/*아이찾기.비밀번호재설정.회원가입부분*/
			#Login_submenu{margin-bottom: 40px;}
			#Login_submenu p{display: inline-block;}
			#Login_submenu p a{text-decoration-line: none; color: #5e5e5e;}
			 
			#content table tr:last-child td input{display: inline-block; width:120px; height:40px;}
			
			h2{text-align: center; margin-top:20px;}
			/*인풋부분*/
			#content table input{font-family: 'omyu_pretty'; font-size:15px; box-sizing: border-box; width: 80%;
			  padding: 5px; margin: 2px 0; border: 1px solid #ccc; border-radius: 20px;}
			/*버튼부분*/
			#content table button{width:170px; height:30px; text-align:center; font-family: 'omyu_pretty'; font-size:20px; border-radius:20px; border:0px solid #ff9933; background:#ff9933;}
			#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			/*구글로그인부분*/
			.g_id_signin{display: inline-block; margin-top: 20px;  data-width: 130; }
			
}



			
		</style>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://accounts.google.com/gsi/client" async defer></script><!-- 구글 로그인 -->
	
	<script type="text/javascript">
	
		$(document).ready(function(){  //자동실행
			var msg ="<%=msg%>";
			if(msg !== ""){
				alert(msg);
			}
		});
		function check(){
			
			var id = $("#memberId").val();
			var pwd = $("#memberPwd").val();
			var oMsg = document.getElementById("oMsg");
			
		    if (id == "") {
		        oMsg.style.display = "block";
				oMsg.style.color = "red";
				oMsg.innerHTML = "아이디를 입력해주세요.";
		        return false;
		      }
		      if (id.length > 10) {
		        alert("아이디 확인 후 다시 입력해 주세요.");

		        return false;
		      }
		      if (pwd == "") {
		        oMsg.style.display = "block";
				oMsg.style.color = "red";
				oMsg.innerHTML = "비밀번호를 입력해주세요.";
		        return false;
		      }

			
			var fm=document.frm;
			//이 경로로 데이터를 감추어서 전송한다
			fm.action="<%=request.getContextPath()%>/member/memberLoginAction.do"; //
			fm.method="post";
			fm.submit(); //전송
			return;
		};
	
	</script>
    <script>
            $(document).ready(function(){
            	
            	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
        	    var key = getCookie("key");
        	    $("#memberId").val(key); 
        	     
        	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        	    if($("#memberId").val() != ""){ 
        	        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        	    }
        	     
        	    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
        	        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
        	            setCookie("key", $("#memberId").val(), 7); // 7일 동안 쿠키 보관
        	        }else{ // ID 저장하기 체크 해제 시,
        	            deleteCookie("key");
        	        }
        	    });
        	     
        	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        	    $("#memberId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        	        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
        	            setCookie("key", $("#memberId").val(), 7); // 7일 동안 쿠키 보관  	
            	
            		}
        	    });
 
            });//$(document).ready(function(){-----end
        	
            // 쿠키 저장하기 
        	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
        	function setCookie(cookieName, value, exdays) {
        		var exdate = new Date();
        		exdate.setDate(exdate.getDate() + exdays);
        		var cookieValue = escape(value)
        				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        		document.cookie = cookieName + "=" + cookieValue;
        	}

        	// 쿠키 삭제
        	function deleteCookie(cookieName) {
        		var expireDate = new Date();
        		expireDate.setDate(expireDate.getDate() - 1);
        		document.cookie = cookieName + "= " + "; expires="
        				+ expireDate.toGMTString();
        	}
             
        	// 쿠키 가져오기
        	function getCookie(cookieName) {
        		cookieName = cookieName + '=';
        		var cookieData = document.cookie;
        		var start = cookieData.indexOf(cookieName);
        		var cookieValue = '';
        		if (start != -1) { // 쿠키가 존재하면
        			start += cookieName.length;
        			var end = cookieData.indexOf(';', start);
        			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
        				end = cookieData.length;
                        console.log("end위치  : " + end);
        			cookieValue = cookieData.substring(start, end);
        		}
        		return unescape(cookieValue);
        	}
    
        	 // Enter 키를 눌렀을 때 동작
        	document.addEventListener('keydown', function(event) {
        		  if (event.keyCode === 13) {        		   
        		    var loginButton = document.querySelector('button[type="button"]');
        		    if (loginButton) {
        		      loginButton.click();
        		    }
        		  }
        		});

    </script>
	</head>
	<body>

		<main id="main">
			<div id="content">
				<div class="logo">
					<h1><img src="${pageContext.request.contextPath}/resources/logo/logo6.png" alt="타:바" onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/></h1>
				</div>
				<form id="frm" name="frm">
					<div id="login_out" >
						<table>
							<tr>
								<td>
									<input type="text" id="memberId" name="memberId" placeholder="아이디">
								</td>
							</tr>
							  
							<tr>
								<td>
									<input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호">
								</td>
							</tr>
							<tr>
								<td>
									<div id="oMsg"></div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox"id="checkId" name="checkId"><span><label for="checkId">아이디저장</label></span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" onclick="check();">로그인</button>
								</td>
							</tr>
						</table>
						<div id="Login_submenu"> 
							<p><a href="${pageContext.request.contextPath}/member/memberIdFind.do">아이디 찾기 |</a></p>
							<p><a href="${pageContext.request.contextPath}/member/memberPwdFind.do">비밀번호 찾기 |</a></p>
							<p><a href="${pageContext.request.contextPath}/member/memberJoin.do">회원가입</a></p>
						</div>
						<div>
<%-- 						    <a class="kakao" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=76703a8d13e15a9a7deb9a931b73de9e&redirect_uri=http://localhost:8080/myapp/member/login/oauth2/code/kakao.do">
						      	<div class="kakao_i"></div>
						      	<div class="kakao_txt"><img  alt="카카오톡 로그인 버튼" src="${pageContext.request.contextPath}/resources/btn/kakao_login_medium_wide.png"></div>
						   	</a> --%>
					     	<a class="kakao" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=76703a8d13e15a9a7deb9a931b73de9e&redirect_uri=http://jjezen.cafe24.com/kim4ever/member/login/oauth2/code/kakao.do">
						      	<div class="kakao_i"></div>
						      	<div class="kakao_txt"><img  alt="카카오톡 로그인 버튼" src="${pageContext.request.contextPath}/resources/btn/kakao_login_medium_wide.png"></div>
						   	</a> 
							<!-- <div id="g_id_onload"
							     data-client_id="225367376527-0b4amsji9p7soai6hnhnt2bkbp4ma82p.apps.googleusercontent.com"
							     data-context="signin"
							     data-ux_mode="popup"
							     data-login_uri="http://jjezen.cafe24.com/kim4ever/member/login/oauth2/code/google.do"
							     data-auto_prompt="false">
							</div> -->
							
							<div id="g_id_onload" 
							     data-client_id="225367376527-0b4amsji9p7soai6hnhnt2bkbp4ma82p.apps.googleusercontent.com"
							     data-context="signin"
							     data-ux_mode="popup"
							     data-login_uri="${pageContext.request.contextPath}/member/login/oauth2/code/google.do"
							     data-auto_prompt="false">
							</div>
							
							<div class="g_id_signin"
							     data-type="standard"
							     data-shape="pill"
							     data-theme="outline"
							     data-text="signin_with"
							     data-width="300"
							     data-height="45"
							     data-logo_alignment="left">
							</div>
						</div>
					</div>
				</form>
			</div>
		</main>
	</body>
</html>