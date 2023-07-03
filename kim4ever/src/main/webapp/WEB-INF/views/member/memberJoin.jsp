<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
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
		#main #content{width:1440px; }
		#main #bottom{width:1440px; height:100px; }
		/*로그인 외각선*/
		#login_out{border: 1px solid #bbb;margin: 40px auto;width: 38%;padding: 20px;background-color: #fdfcfa;border-radius: 20px;padding-top: 45px;}
		/*알림*/
		.alarm{color: #f00;text-align: left;line-height: 10px;padding-left: 5px;padding-top: 15px;} 
		
		h2{text-align: center; margin-top:0px;margin-bottom: 20px;}   
		#content table {width:60%;border-collapse:collapse;  margin:50px auto 0; text-align:center;  line-height:10px; font-family:'omyu_pretty'; font-size:21px;} 
		#content table th{width:150px; text-align:center;  padding:8px;}   
		#content table td{text-align:left;}  
		#content table td:nth-child(1){width:120px;text-align:center;}
		#content table td:nth-child(2){width:400px; text-align:left;}
		#content table td:nth-child(3){width:100px; border:0;}
		#content table tr:last-child td{text-align:center;}
		#content table tr:last-child td input{display:inline-block; width:120px; height:50px;}
		#content table th{width:150px;text-align:center;}
		#content table #memberIdCheck {padding:5px 10px; font-size:21px; width:120px; height:50px; }
		#content table 
		input{
		  font-family: 'omyu_pretty';
		  font-size:21px;
		  box-sizing: border-box;
		  width: 300px;
		  padding: 10px;
		  margin: 2px 0;
		  border: 1px solid #ccc;
		  border-radius: 20px; 
		  
		}
		
		#content table button{width:300px; height:45px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:20px; border:0px solid #ccc; background:#f0f0f0; cursor: pointer;}
		#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px); cursor: pointer;} 
		
		#main #findbutton{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933; cursor: pointer;}
		#main #findbutton:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px); cursor: pointer;}
		
		button{font-family: 'omyu_pretty';font-size: 21px;box-sizing: border-box;width: 300px;padding: 10px;margin: 2px 0;border: 1px solid #ccc;border-radius: 20px; cursor: pointer;} 
		/*로고*/
		.logo h1 img{position: relative;top: 133px;width: 90px;  cursor: pointer;}   
		/*회원가입 버튼*/
		#content table #signup{background:#ff9933;} 
		#emailCheck{margin: 0 auto;line-height: 45px; width: 300px;height: 45px;text-align: center;font-size: 21px;border-radius: 20px;border: 0px solid #ccc;background: #f0f0f0;cursor: pointer;}
		#phoneChk2{margin: 0 auto;line-height: 45px; width: 300px;height: 45px;text-align: center;font-size: 21px;border-radius: 20px;border: 0px solid #ccc;background: #f0f0f0;cursor: pointer;}
	
		
	/*****************************************모바일***************************************************************/
		
	@media (min-width: 300px) and (max-width: 940px)  {		
	
		#main{width:auto; margin:35px auto 70px; text-align:center;}
		#main #content{width:auto; height:auto;}
		#main #bottom{width:auto; height:10px; }
		/*로그인 외각선*/
		#login_out{border: 1px solid #bbb;margin: 20px auto;width: 260px; ;padding: 20px;;}
		/*알림*/
		.alarm{color: #f00;text-align: left;line-height: 0px;padding-left: 5px;padding: 10px; font-size:10px;} 
		
		h2{text-align: center; margin-top:0px;margin-bottom: 20px; font-size:15px;}   
		#content table {width:250px;border-collapse:collapse;  margin:10px auto 0; text-align:center;  line-height:10px; font-family:'omyu_pretty'; font-size:21px;}
		#content table th{width:230px; text-align:center;  padding:5px;   box-sizing: border-box; font-size:15px;}    
		#content table td{width:230px; padding:5px;text-align:left;   box-sizing: border-box;   font-size:15px;}

		#content table th{width:150px;text-align:center;}
		#content table #memberIdCheck {padding:5px 10px; font-size:21px; width:120px; height:50px; }
		#content table 
		input{
		  font-family: 'omyu_pretty';
		  font-size:14px;
		  box-sizing: border-box;
		  width: 230px;
		  padding: 10px;
		  margin: 2px 0;
		}
		
		#content table button{width:230px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:18px; ;}
		
		#main #findbutton{width:230px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; }
		
		    #authBar, #emailCheck {
		        display: inline-block; padding:10px;
		    }

	}
		</style>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
				//!전역변수!
				var idFlag;
				var pwdFlag;
				var emailFlag;
				var emailChkFlag;
				var nameFlag;
				var phoneFlag;
				var phoneChkFlag;
				var birthFlag;
			$(document).ready(function(){
				//!아이디 체크!
				
				$("#memberId").blur(function(){//blur input값에 쓰고 다른데로 갈때 발동
					var id = document.getElementById("memberId").value;
					var oMsg = document.getElementById("idMsg");
					var oMsgC = document.getElementById("idMsgCheck");

					idFlag = false;

					if (id == "") {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left"; 
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "필수 정보입니다.";
						return false;
					}
					var isID = /^[a-zA-Z0-9]{6,15}$/;//아이디형식
					if (!isID.test(id)) {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.style.lineHeight = "20px";						
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "회원 아이디(ID)는 띄어쓰기 없이 6~15자리의 영문자와 숫자 조합만 가능합니다.";
						return false;
					}

					 try {
						// 성공 Api
						var url = '${pageContext.request.contextPath}/member/memberJoinIdCheck.do';
						var param = [{ name: "memberId", value: id }];

						$.ajax({
							url: url,
							data: param,
							type: "GET",
							contentType: "application/json;",
							dataType: "json",
							success: function (data) {
								if (data.value == 1) {
									oMsg.style.display = "block";
									oMsg.style.color = "red";
									oMsg.style.padding = "15px 30px";
									oMsg.style.textAlign = "left";
									oMsg.className = "ability_chk";
									oMsg.innerHTML = "이미 사용중인 아이디입니다.";
									return false;
								} else {
									oMsg.style.display = "block";
									oMsg.style.color = "green";
									oMsg.style.padding = "15px 30px";
									oMsg.style.textAlign = "left";
									oMsg.className = "ability_chk submit";
									oMsg.innerHTML = "사용가능한 아이디 입니다.";
								}
								idFlag = true;
								return true;
							},
							error: function (error) {
								alert("Error");
							}
						});
					} catch (e) {
						if (window.bridgeGotTime) {
							throw e;
						 } else {
							//page reload?
						 }
					}
					return true; 
				});
				//!아이디체크!end	
				//!비밀번호 체크!
				$("#memberPwd").blur(function(){//blur input값에 쓰고 다른데로 갈때 발동
					var pwd = document.getElementById("memberPwd").value;
					var oMsg = document.getElementById("pwdMsg");
					var oMsgC = document.getElementById("pwdMsgCheck");
					


					pwdFlag = false;

					if (pwd == "") {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "필수 정보입니다.";
						
						return false;
					}
					var isPWD = /^[a-zA-Z0-9]{4,12}$/;//비밀번호형식//임시 나중에 변경
					if (!isPWD.test(pwd)) {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.style.lineHeight = "20px";
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "회원 비밀번호(ID)는 띄어쓰기 없이 6~10자리의 영문자와 숫자 조합만 가능합니다.";//임시 나중에 변경
						return false;
					}else {
						oMsg.style.display = "block";
						oMsg.style.color = "green";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.className = "ability_chk submit";
						oMsg.innerHTML = "사용가능한 비밀번호 입니다.";
						/* oMsgC.className = "bg_area icon_bg chk submit"; */
					}
					pwdFlag = true;
					return true;

				});
				
				$("#memberPwd2").blur(function(){

					var pwd1 = $("#memberPwd").val();
					var pwd2 = $("#memberPwd2").val();
					var oMsg = document.getElementById("pwd2Msg");
					var oMsgC = document.getElementById("pwd2MsgCheck");

					if (pwd1 == "") {
						oMsgC.className = "bg_area icon_bg chk pw2";
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.innerHTML = "필수 정보입니다.";
						return false;
					}
					if (pwd1 != pwd2) {
						oMsgC.className = "bg_area icon_bg chk pw2";
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
						document.getElementById("pswd2").value = "";
						return false;
					} else {
						oMsgC.className = "bg_area icon_bg chk pw2 submit";
						oMsg.style.display = "none";
						return true;
					}

					return true;
				});  
				//!비밀번호체크!end
				//!이메일체크!
				$("#memberEmail").blur(function(){
					var email = $("#memberEmail").val();
					var oMsg = document.getElementById("emailMsg");
				
					emailFlag = false;
				
					if (email == "") {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.";
						return false;
					}
				
					if (email != "") {			
				
						var isEmail = /^[ㄱ-힣\w-\.\_]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,3}$/;
						if (!isEmail.test(email)){
							oMsg.style.display = "block";
							oMsg.style.color = "red";
							oMsg.style.padding = "15px 30px";
							oMsg.style.textAlign = "left";
							oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.";
							return false;
						}
				
						// 이메일 길이 제한 : 50
						if (email.length > 50) {
							oMsg.style.display = "block";
							oMsg.style.color = "red";
							oMsg.style.padding = "15px 30px";
							oMsg.style.textAlign = "left";
							oMsg.style.lineHeight = "20px";
							oMsg.innerHTML = "이메일 글자수가 도메인 포함하여 전체 50자 이내로 입력해주세요.";
							return false;
						}
					
						 try {		
							var url = '${pageContext.request.contextPath}/member/memberJoinEmailCheck.do';
							var param = [{ name: "memberEmail", value: email }];			
				
							$.ajax({
								url: url,
								data: param,
								type: "GET",
								contentType: "application/json;",
								dataType: "json",
								success: function (data) {			
									if (data.value == 1) {
										oMsg.style.display = "block";
										oMsg.style.color = "red";
										oMsg.style.padding = "15px 30px";
										oMsg.style.textAlign = "left";
										oMsg.innerHTML = "이미 사용중인 이메일입니다.";
										$("#memberEmail").val("");
										return false;
									} else {
										oMsg.style.display = "block";
										oMsg.style.color = "green";
										oMsg.style.padding = "15px 30px";
										oMsg.style.textAlign = "left";
										oMsg.innerHTML = "사용가능한 이메일 입니다.";
									}
									emailFlag = true;
									//return true;
								},
								error: function (error) {
									emailFlag = false;
									alert("Error");
									return false;
								}
							});	
						} catch (e) {
							if (window.bridgeGotTime) {
								throw e;
							 } else {
								//page reload?
							 } 
						}		
					}
				
					if (true) {
						oMsg.style.display = "none";
						return true;
					}
				
					return true;
				});  
				//!이메일체크!end
				//!이름체크!
				$("#memberName").blur(function(){
					var name = document.getElementById("memberName").value;
					var oMsg = document.getElementById("memberNameMsg");
					var oMsgC = document.getElementById("memberNameMsgCheck");
				
					nameFlag = false;
				
					if (name == "") {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "필수 정보입니다.";
						return false;
					}
							
					var isName = /^[가-힣]{2,15}$/;
					if (!isName.test(name)) {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.style.lineHeight = "20px";
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력하여주세요.";
						return false;
					}
					
					if (true) {
						oMsg.style.display = "none";
						nameFlag = true;
						oMsgC.className = "bg_area icon_bg chk submit";
						return true;
					}
				
					return true;
				});
				//!이름체크!end
				//!휴대폰체크!
				$("#memberPhone").blur(function(){
					var phone = document.getElementById("memberPhone").value;
					var oMsg = document.getElementById("phoneMsg");
					var oMsgC = document.getElementById("phoneMsgCheck");
					
					phoneFlag = false;
					
					
					//var isPhone = /^(01[016789]{1})[-]?[0-9]{3,4}[-]?[0-9]{4}$/;
					var isPhone = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
					if(!isPhone.test(phone)){
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.className = "ability_chk";
						oMsg.style.padding = "15px 30px";
						oMsg.style.textAlign = "left";
						oMsg.innerHTML = "전화번호를 정확히 입력해 주세요.";
						return false;
					}

					if (true) {
						oMsg.style.display = "none";
						phoneFlag = true;
						return true;
					}
				
					return true;
				});
				//!휴대폰체크!end

	      //휴대폰 번호 인증
	        var code2 = "";
	        $("#phoneChk").click(function(event) {
	            event.preventDefault(); // 폼의 전송 방지
				          
	           // 휴대폰 번호 저장
	            var phoneValue = $("#memberPhone").val();
	
	            // 입력값 유효성 검사
	            if (phoneValue === "") {
	              alert("휴대폰 번호를 입력해주세요.");
	              $("#phone").focus();
	              return; // 함수 종료
	            }
	
	            alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해 주세요.");
	            
	            
	            var phone = phoneValue; 
	            $.ajax({
	                type: "GET",
	                url: "${pageContext.request.contextPath}/member/phoneCheck.do?phone=" + phone,
	                cache: false,
	                success: function(data) {
	                    if (data == "error") {
	                        alert("휴대폰 번호가 올바르지 않습니다.")
	                        $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
	                        $(".successPhoneChk").css("color", "red");
	                        $("#phone").attr("autofocus", true);
	                        
	                        $("#phone2").css("color", "red");
	                        // 입력된 휴대폰 번호를 다시 채우기
	                        $("#phone").val(phoneValue);
	                    } else {
	                        $("#phone2").attr("disabled", false);
	                        $("#phoneChk2").css("display", "inline-block");
	                        $(".successPhoneChk").text("인증번호를 입력하세요.");
	                        $(".successPhoneChk").css("color", "green");
	                        $(".successPhoneChk").css("padding","15px 30px");
	                        $("#phone").attr("readonly", true);
	                        $("#phone2").css("display", "block");
	                        $("#phone2").css("margin", "2px auto");
	                        code2 = data;
	
	                        // 폼의 다른 입력 요소들은 초기화하지 않도록 수정
	                    }
	                }
	            });
	        });
			
	     
	        
	      //휴대폰 인증번호 대조
	        $("#phoneChk2").click(function(){
	        	phoneChkFlag=false;
	        	var phoneNumber = $("#memberPhone").val();
	            var verificationCode = $("#phone2").val();
	            $.ajax({
	                type: "POST",
	                url: "${pageContext.request.contextPath}/member/verifyPhoneNumber.do",
	                data: {
	                    phoneNumber: phoneNumber,
	                    verificationCode: verificationCode
	                },
	                cache: false,
	                success: function(data) {
	                    if (data === "success") {
	                        $(".successPhoneChk").text("인증번호가 일치합니다.");
	                        $(".successPhoneChk").css("color", "green");
	                        $("#phoneDoubleChk").val("true");
	                        $("#phone2").attr("disabled", true);   
	                        $("#phoneChk").attr("style","display:none;");
	                        $("#phoneChk2").attr("style","display:none;");
	
	                        phoneChkFlag=true;
	                    } else {
	                        $(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
	                        $(".successPhoneChk").css("color", "red");
	                        $("#phoneDoubleChk").val("false");
	                        $("#phone2").focus();
	
	
	        
	
	                    }
	                }
	            });
	        });
	   
	        	//인증번호 보내기 
        		var oneFlag = false;//한번만클릭하게
	        	$("#auth").click(function(){
	        		var authBar = $("#authBar");
	        		
	        		var email = $("#memberEmail").val();
	        		
	        		if (email === '') {
	        	        alert("이메일을 입력해주세요.");
	        	        return;
	        	    }
	        		
	        		var url = '${pageContext.request.contextPath}/member/memberJoinMailAuth.do';
			        var param = { memberEmail: email };
					
					
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
									$("#emailCheck").css("display", "block");
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
	      
	        	$("#emailCheck").click(function() {
	        		emailChkFlag=false;
	        	    var enteredCode = $("#authBar").val(); // 입력한 인증번호 가져오기
	        	    var email = $("#memberEmail").val(); // 사용자가 입력한 이메일 가져오기
				
	        	    // AJAX 요청
	        	    $.ajax({
	        	        url: "${pageContext.request.contextPath}/member/memberCheckVerificationCode.do",
	        	        method: "POST",
	        	        data: {
	        	            mail_key: enteredCode,
	        	            memberEmail: email 
	        	        },
	        	        success: function(data) {
	        	            if (data === "true") { // 서버 응답 데이터 값이 "true"인 경우
	        	                alert("이메일 인증이 완료되었습니다!");
		                        $(".successEmailChk").text("인증번호가 일치합니다.");
		                        $(".successEmailChk").css("color", "green");
		                        $("#auth").attr("style","display:none;");
		                        $("#emailCheck").attr("style","display:none;");
		                        $(".successEmailChk").css("padding","15px 30px");
	        	                emailChkFlag=true;
	        	            } else {
	        	                alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
	        	            }
	        	        },
	        	        error: function() {
	        	            alert("서버 통신 에러가 발생했습니다.");
	        	        }
	        	    });
	        	});
	       
      
});//$(document).ready(function(){ !end!

 				/// 회원 가입 ///
				function Signup() {

					if (!idFlag) {	
						alert("아이디 입력이 잘못 되었습니다.");
						return false;
					}
					if (!pwdFlag) {
						alert("비밀번호 입력이 잘못 되었습니다.");
						return false;
					}
					if (!nameFlag) {	
						alert("이름 입력이 잘못 되었습니다.");
						return false;
					}
					if (!emailFlag) {
						alert("이메일 입력이 잘못 되었습니다.");
						return false;
					}
					
					if (!phoneChkFlag) {
				        alert("휴대폰 인증을 완료해주세요.");
				        return false;
					}
					if (!emailChkFlag) {
					 	alert("이메일 인증을 완료해주세요.");
			        	return false;
					}    	
					$('#frm').attr('action', 'memberJoinAction.do').submit();
					return;
				}
		</script>
		

		<!-- 다음 우편번호 API 스크립트 -->
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function openAddressPopup() {
		        new daum.Postcode({
		            oncomplete: function (data) {
		                // 선택된 주소를 주소 입력란에 채우기
		                document.getElementById('memberAddr').value = data.address;
		            }
		        }).open();
		    }
		</script>
		
	</head>
	<body>
		<main id="main">
			<div class="logo">
				<h1><img src="${pageContext.request.contextPath}/resources/logo/logo6.png" alt="타:바" onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/></h1>
			</div>
			<div id="content">
	
			<form name="frm" id="frm" method="post">
			<div id="login_out">
				<table>
					<tbody> 
					  	<tr>
	    					<th colspan="3"><h2>회원가입</h2></th>
	  					</tr>
						<tr>
							<td>
								<input type="text" id="memberId" name="memberId" placeholder="아이디">
								<p id="idMsg" class="ability_chk" style="display:none;">사용가능한 아이디 입니다.</p>
							</td> 
						</tr>				  
						<tr>
							<td>
								<input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호">
								<p id="pwdMsg" class="ability_chk" style="display:none">비밀번호를 정확히 입력해주세요.</p> 
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" id="memberPwd2" name="memberPwd2" placeholder="비밀번호 확인">
								<p id="pwd2Msg" class="ability_chk" style="display:none">비밀번호가 동일하지 않습니다.</p>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="memberName" name="memberName" placeholder="이름">
								<p id="memberNameMsg" class="ability_chk" style="display:none">최대 한글25자/영문50자(50 byte)까지 입력 가능합니다.</p>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="memberAge" name="memberAge" placeholder="나이">
							</td>
						</tr>
						<tr>
							<td>
								<input id="memberPhone" type="text" name="memberPhone" maxlength="11" title="전화번호 입력" placeholder="휴대폰 번호" required/>
								<p id="phoneMsg" class="ability_chk" style="display:none">전화번호를 정확히 입력해주세요.</p> 							
							</td>
						</tr>
						<tr>
							<td>
								<button id="phoneChk" class="doubleChk">인증번호 보내기</button>
							</td>
						</tr>
						<tr>
							<td>
								 <input id="phone2" type="text" name="phone2"style="display:none" maxlength="6" title="인증번호 입력" placeholder="휴대폰 인증번호 " disabled required/>								
							</td>
						</tr>
						<tr>
							<td>
								<div id="phoneChk2"style="display:none" class="doubleChk" >인증확인</div>					
							</td>
						</tr>
						<tr>
							<td>
								<div class="point successPhoneChk"></div>
								<input type="hidden" id="phoneDoubleChk"/>
							</td>						
						</tr>
						<tr>
							<td>
								<input type="text" id="memberEmail" name="memberEmail" placeholder="이메일">
								<p id="emailMsg" class="ability_chk" style="display:none">메일주소를 정확히 입력해주세요.</p>
							</td>
						</tr>
						<tr>
							<td>
							 	<button type="button" id="auth"  class="memberBar" value="인증번호 보내기">인증번호 보내기</button>
							</td>
						</tr>
						<tr>
							<td>
							 	<input type="text" id="authBar" name="mailKey" style="display: none;" placeholder="인증번호">
							 	<div id="emailCheck" name="emailCheck"style="display:none" >인증확인</div>
							</td>
						</tr>
						<tr>
							<td>
								<span class="point successEmailChk"></span>
							</td>						
						</tr>
						<tr>
							<td>
								<input type="text" id="memberAddr" name="memberAddr" placeholder="주소"> 
								<button type="button" onclick="openAddressPopup()" value="주소 검색">주소검색</button> 
								
							</td>
						</tr> 
						<tr>
							<td colspan="2">
								<button id="signup" type="button" onclick="Signup();">회원가입</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div> 
		</form>
		</div>
	</main>
	</body>
</html>