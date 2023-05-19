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
			#main #content{width:1440px; height:200px;}
			#main #bottom{width:1440px; height:300px;}
			#content table{width:30%;border-collapse:collapse;  margin: 60px auto 0; text-align:center;  line-height:30px; font-family:'omyu_pretty'; font-size:21px;}
			#content table th{width:240px; text-align:center; border:1px solid #fff; padding:8px;}
			#content table td{padding:8px;text-align:left;}
			#content table td:nth-child(1){width:240px;text-align:center;}
			/*로그인 외각선*/
			#login_out{border: 1px solid #bbb;margin: 40px auto;width: 50%;padding: 20px;background-color: #f1f1f1;border-radius: 10px;}
			/*경고문*/
			#content table tr:nth-child(3) td{padding: 0px;}
			#content table tr:nth-child(3) td div{width: 240px;text-align: left; padding-left: 10px; color: #f00;}
			/*아이디저장 부분*/
			#content table tr:nth-child(4) td{text-align: left;}
			#content table tr:nth-child(4) td input{display: inline-block; width: 10%; height: 18px;vertical-align: middle;}
			#content table tr:nth-child(4) td span{display: inline-block;}
			
			#content table tr:last-child td input{display: inline-block; width:120px; height:50px;}
			
			h2{text-align: center; margin-top:20px;}
			/*인풋부분*/
			#content table input{
			  font-family: 'omyu_pretty';
			  font-size:24px;
			  box-sizing: border-box;
			  width: 100%;
			  padding: 10px;
			  margin: 2px 0;
			  border: 1px solid #ccc;
			  border-radius: 4px;
			}
			/*버튼부분*/
			#content table button{width:430px; height:60px; text-align:center; font-family: 'omyu_pretty'; font-size:30px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
			#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		</style>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){  //자동실행
			var msg ="<%=msg%>";
			if(msg !== ""){
				alert(msg);
			}
		});
		function check(){
		    //alert("각 값이 있는지 체크하는 구문을 만들어보세요");
		    var memberId=document.getElementById("memberId");
			var memberPwd=document.getElementById("memberPwd");
		
			if(memberId.value==""){
				alert("아이디를 입력하세요");
				memberId.focus();
				return false;
			};
			
			if(memberPwd.value==""){
				alert("비밀번호를 입력하세요.");
				memberPwd.focus();
				return false;
			};
			
			var fm=document.frm;
			//이 경로로 데이터를 감추어서 전송한다
			fm.action="<%=request.getContextPath()%>/member/memberLoginAction.do"; //
			fm.method="post";
			fm.submit(); //전송
			return;
		};
	
	</script>
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<div id="content">
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
									<div>경고문</div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox"><span>아이디저장</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" onclick="check();">로그인</button>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
			<div id="bottom"></div>
		</main>
		<%@include file="../footer.jsp" %>
		
	</body>
</html>