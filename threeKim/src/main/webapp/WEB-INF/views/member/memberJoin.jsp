<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
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
		#main #content{width:1440px; }
		#main #bottom{width:1440px; height:100px; }
		/*로그인 외각선*/
		#login_out{border: 1px solid #bbb;margin: 40px auto;width: 50%;padding: 20px;background-color: #f1f1f1;border-radius: 10px;}
		/*알림*/
		.alarm{color: #f00;text-align: left;line-height: 0px;padding-left: 5px;padding-top: 15px;} 
		
		h2{text-align: center; margin-top:0px;margin-bottom: 20px;}   
		#content table {width:60%;border-collapse:collapse;  margin:10px auto 0; text-align:center;  line-height:0px; font-family:'omyu_pretty'; font-size:21px;}
		#content table th{width:150px; text-align:center;  padding:8px;}   
		#content table td{padding:8px;text-align:left;}  
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
		  font-size:24px;
		  box-sizing: border-box;
		  width: 100%;
		  padding: 10px;
		  margin: 2px 0;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		}
		
		#content table button{width:430px; height:60px; text-align:center; font-family: 'omyu_pretty'; font-size:30px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
		#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		
		#main #findbutton{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
		#main #findbutton:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		
		</style>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
				//!전역변수!
				var idFlag;
				var pwdFlag;
				var emailFlag;
				var nameFlag;
				var phoneFlag;
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
						oMsg.style.padding = "15px 0px 0px 5px";
						oMsg.style.textAlign = "left"; 
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "필수 정보입니다.";
						return false;
					}
					var isID = /^[a-zA-Z0-9]{6,15}$/;//아이디형식
					if (!isID.test(id)) {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 0px 0px 5px";
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
									oMsg.style.padding = "15px 0px 0px 5px";
									oMsg.style.textAlign = "left";
									oMsg.className = "ability_chk";
									oMsg.innerHTML = "이미 사용중인 아이디입니다.";
									return false;
								} else {
									oMsg.style.display = "block";
									oMsg.style.color = "red";
									oMsg.style.padding = "15px 0px 0px 5px";
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
						oMsg.style.padding = "15px 0px 0px 5px";
						oMsg.style.textAlign = "left";
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "필수 정보입니다.";
						
						return false;
					}
					var isPWD = /^[a-zA-Z0-9]{4,12}$/;//비밀번호형식//임시 나중에 변경
					if (!isPWD.test(pwd)) {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 0px 0px 5px";
						oMsg.style.textAlign = "left";
						oMsg.style.lineHeight = "20px";
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "회원 비밀번호(ID)는 띄어쓰기 없이 6~10자리의 영문자와 숫자 조합만 가능합니다.";//임시 나중에 변경
						return false;
					}else {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 0px 0px 5px";
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
						oMsg.style.padding = "15px 0px 0px 5px";
						oMsg.style.textAlign = "left";
						oMsg.innerHTML = "필수 정보입니다.";
						return false;
					}
					if (pwd1 != pwd2) {
						oMsgC.className = "bg_area icon_bg chk pw2";
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 0px 0px 5px";
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
						oMsg.style.padding = "15px 0px 0px 5px";
						oMsg.style.textAlign = "left";
						oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.";
						return false;
					}
				
					if (email != "") {			
				
						var isEmail = /^[ㄱ-힣\w-\.\_]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,3}$/;
						if (!isEmail.test(email)){
							oMsg.style.display = "block";
							oMsg.style.color = "red";
							oMsg.style.padding = "15px 0px 0px 5px";
							oMsg.style.textAlign = "left";
							oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.222";
							return false;
						}
				
						// 이메일 길이 제한 : 50
						if (email.length > 50) {
							oMsg.style.display = "block";
							oMsg.style.color = "red";
							oMsg.style.padding = "15px 0px 0px 5px";
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
										oMsg.style.padding = "15px 0px 0px 5px";
										oMsg.style.textAlign = "left";
										oMsg.innerHTML = "이미 사용중인 이메일입니다.";
										$("#memberEmail").val("");
										return false;
									} else {
										oMsg.style.display = "block";
										oMsg.style.color = "red";
										oMsg.style.padding = "15px 0px 0px 5px";
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
						oMsg.style.padding = "15px 0px 0px 5px";
						oMsg.style.textAlign = "left";
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "필수 정보입니다.";
						return false;
					}
							
					var isName = /^[가-힣]{2,15}$/;
					if (!isName.test(name)) {
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.style.padding = "15px 0px 0px 5px";
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
					
					//var isPhone = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
					var isPhone = /^(01[016789]{1})[-]?[0-9]{3,4}[-]?[0-9]{4}$/;  // 수정된 정규 표현식
					if(!isPhone.test(phone)){
						oMsg.style.display = "block";
						oMsg.style.color = "red";
						oMsg.className = "ability_chk";
						oMsg.style.padding = "15px 0px 0px 5px";
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
					if (!phoneFlag) {
						alert("휴대폰 번호 입력이 잘못 되었습니다.");
						return false;
					}
			
/* 					// 인증 유무
					if (!AuthCheck()) return;
					// 아이디 체크
					if (!IDCheck()) return;
					// 비밀번호 체크
					if (!PasswordCheck()) return;
					// 이름 체크
					if (!NameCheck()) return;
					// 휴대폰 체크
					if (!HpNoCheck()) return;
			
					// 이메일
					if (!EmailCheck()) return; */
					
					$('#frm').attr('action', 'memberJoinAction.do').submit();
					return;

					
				}
		</script>
		
		
		<script type="text/javascript">
		
		    <%-- $(document).ready(function(){
		    });
		    function check(){
		    //alert("각 값이 있는지 체크하는 구문을 만들어보세요");
		    var memberId=document.getElementById("memberId");
			var memberPwd=document.getElementById("memberPwd");
			var memberPwd2=document.getElementById("memberPwd2");
			var memberName=document.getElementById("memberName");
			var memberAge=document.getElementById("memberAge");
			var memberPhone=document.getElementById("memberPhone");
			var memberEmail=document.getElementById("memberEmail");
			var memberAddr=document.getElementById("memberAddr");
			
		    var reg_id=/^[a-zA-Z0-9]{4,12}$/; //id 유효성 검사 정규식
		    var reg_pw=/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; //비밀번호 유효성 검사 정규식
		    var reg_phone=/^\d{3}-\d{3,4}-\d{4}$/; // 휴대폰번호 유효성 검사 정규식
		    var reg_email=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 이메일 유효성 검사 
		    
		 
		 	if(memberId.value==""){
				alert("아이디를 입력하세요");
				memberId.focus();
				return false;
			};
			
			if(!reg_id.test(memberId.value)){
				alert("아이디는 4~12자리 영문,대소문자,숫자로만 입력하여 주세요.");
				return false;
			};
			if(memberPwd.value==""){
				alert("비밀번호를 입력하세요.");
				memberPwd.focus();
				return false;
			};
			
			if(!reg_pw.test(memberPwd.value)){
				alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
				memberPwd.focus();
				return false;
			}; 
			
			if(memberPwd.value !== memberPwd2.value){
				alert("비밀번호가 일치하지 않습니다.");
				memberPwd2.focus();
				return false;
			};
		
			if(memberName.value==""){
				alert("이름을 입력하세요.");
				memberName.focus();
				return false;
			};
			
			if(memberPhone.value==""){
				alert("휴대전화를 입력하세요.");
				memberPhone.focus();
				return false;
			};
			
			if(memberAge.value==""){
				alert("나이를 입력하세요.");
				memberAge.focus();
			return false;
			}; 
			
			if(!reg_phone.test(memberPhone.value)){
				alert("휴대전화는 숫자만 입력할 수 있습니다.")
				alert("예시에 맞게 입력해주세요.")
				memberPhone.focus();
				return false;
			}
			if(memberEmail.value==""){
				alert("이메일을 입력하세요.");
				memberEmail.focus();
				return false;
			};
			
			if(!reg_email.test(memberEmail.value)){
				alert("올바른 이메일 형식이 아닙니다.");
				alert("예시에 맞게 입력해주세요.")
				memberEmail.focus();
				return false;
			};
			
			if(memberAddr.value==""){
				alert("주소를 입력하세요.");
				memberAddr.focus();
			return false;
			};
				
			
			
			if($("#memberIdCheck").val() != "사용가능"){
				alert("아이디 중복체크를 하세요");
				$("#memberId").focus();
			return;
			}  	 
		
			var fm=document.frm;
			//이 경로로 데이터를 감추어서 전송한다
			fm.action="<%=request.getContextPath()%>/member/memberJoinAction.do"; //
			fm.method="post";
			fm.submit(); //전송
			return;
			
		};
			
			
			function idCheck(){
			//	alert("아이디 체크창입니다.");	
				let memberId = $("#memberId").val();
				
				$.ajax({
					url: "<%=request.getContextPath()%>/member/memberIdCheck.do",		
					method: "POST",
					data: {"memberId": memberId },
					dataType: "json",
					success : function(data){	
						if (data.value =="0"){
							alert("사용가능한 아이디입니다.");
							$("#memberIdCheck").val("사용가능");
						}else{
							alert("사용불가한 아이디 입니다");
						}	
					},
					error : function(request,status,error){
						alert("다시 시도하시기 바랍니다.");		
					}		
				});	
				
				return;
			} --%>
		
		</script>
		
		<script type="text/javascript">
		function autoHyphen2(target) {
			  target.value = target.value
			    .replace(/[^0-9]/g, '')
			    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
			    .replace(/(\-{1,2})$/g, "");
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
		<%@include file="../header.jsp" %>
		<main id="main">
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
								<input type="text" id="memberPhone" name="memberPhone" oninput="autoHyphen2(this)" maxlength="13" placeholder="휴대폰번호">
								<p id="phoneMsg" class="ability_chk" style="display:none">휴대폰번호를 정확히 입력해주세요.</p>
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
								<input type="text" id="memberAddr" name="memberAddr" placeholder="주소"> 
								<input type="button" onclick="openAddressPopup()" value="주소 검색"> 
								
							</td>
						</tr> 
						<tr>
							<td colspan="2">
								<button type="button" onclick="Signup();">회원가입</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div> 
		</form>
		</div>
		<div id="bottom"></div>
	</main>
	</body>
	<%@include file="../footer.jsp" %>
</html>