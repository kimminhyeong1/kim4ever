<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#main #content{width:1440px; height:2400px;}
#main #bottom{width:1440px; height:300px; }

h2{text-align: center; margin-top:20px;}
#content table {width: 80%;border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px; font-family:'omyu_pretty'; font-size:24px;}
#content table td, th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}
#content table td:nth-child(1){width:120px;text-align:center;}
#content table td:nth-child(2){width:400px; text-align:left;}
#content table td:nth-child(3){width:100px; border:0;}
#content table tr:last-child td{text-align:center;}
#content table tr:last-child td input{display: inline-block; width:120px; height:50px;}
#content table th{width:240px;text-align:center;}
#memberIdCheck {padding: 5px 10px; font-size: 14px; width:120px; height:50px; }
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
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}



</style>
<%-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	//자동실행영역
}); 

function check(){
	
	if ($("#member_id").val() == ""){
		alert("아이디를 입력하세요");
		$("#member_id").focus();
		return;
		
	}else if ($("#member_pw").val() == ""){
		alert("비밀번호를 입력하세요");
		$("#member_pw").focus();
		return;

	}else if ($("#member_pw2").val() == ""){
		alert("비밀번호 확인을 입력하세요");
		$("#member_pw2").focus();
		return;
	}else if ($("#member_pw").val() != $("#member_pw2").val()){
		alert("비밀번호가 일치하지 않습니다");
		$("#member_pw2").val("");
		$("#member_pw2").focus();
		return;
		
	}else if ($("#member_name").val() == ""){
		alert("이름을 입력하세요");
		$("#member_name").focus();
		return;
	
	}else if ($("#member_age").val() == ""){
		alert("나이를 입력하세요");
		$("#member_age").focus();
		return;
	
	}else if($("#memberIdCheck").val() != "사용가능"){
		alert("아이디 중복체크를 하세요");
		$("#member_id").focus();
	return;
	}	

	var fm=document.frm;
	//이 경로로 데이터를 감추어서 전송한다
	fm.action="<%=request.getContextPath()%>/memberJoinAction.me"
	fm.method="post";
	fm.submit(); //전송
	return;
}
	
	
function idCheck(){
//	alert("아이디 체크창입니다.");	
	let member_id = $("#member_id").val();
	
	$.ajax({
		url: "<%=request.getContextPath()%>/memberIdCheck.me",		
		method: "POST",
		data: {"member_id": member_id },
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
}


</script> --%>

<script type="text/javascript">
function autoHyphen2(target) {
	  target.value = target.value
	    .replace(/[^0-9]/g, '')
	    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
	    .replace(/(\-{1,2})$/g, "");
	}
</script>

</head>
<body>
<div id="main">
	
	<%@include file="../header.jsp" %>

	<div id="content">

	<form name="frm" id="frm" style="order:1px solid #000;"> 
	
	<table>
	
  	<tr>
    	<th colspan="3"><h2>회원가입</h2></th>
  	</tr>
  	
  	<tr>
    	<th>
    		<label for="member_id">아이디</label>
    	</th>
    	
	    <td>
	    	<input type="text" id="member_id" name="member_id">
	    </td>
	    
	    <td>
	    	<button type="button">ID 중복 확인</button>
	    </td>
 	</tr>
 	
  	<tr>
	    <th>
	    	<label for="member_pw">비밀번호</label>
	    </th>
	    <td>
	    	<input type="password" id="member_pw" name="member_pw" >
	    </td>
	    <td></td>
  	</tr>
  	
  	<tr>
	    <th>
	    	<label for="member_pw2">비밀번호 확인</label>
	    </th>
	    <td>
	    	<input type="password" id="member_pw2" name="member_pw2" >
	 	</td>
	 	<td></td>
 	</tr>
 	
    <tr>
	    <th>
	    	<label for="member_name">이름</label>
	    </th>
	    <td>
	    	<input type="text" id="member_name" name="member_name">
		</td>
	  	<td></td>
 	</tr>
 	
 	<tr>
	    <th>
	    	<label for="member_age">나이</label>
	    </th>
	    <td>
	   		<input type="number" id="member_age" name="member_age" min="0">
	  	</td>
	  	<td></td>
 	</tr>
 	
 	<tr>
 	
 	<tr>
	    <th>
	    	<label for="member_phone">휴대폰번호</label>
	    </th>
	    <td>
	   		<input type="tel" id="member_phone" name="member_phone" oninput="autoHyphen2(this)" maxlength="13">
	  	</td>
	  	<td></td>
 	</tr>
 	
 	<tr>
	    <th>
	    	<label for="member_email">이메일</label>
	    </th>
	    <td>
	    	<input type="text" id="member_email" name="member_email" maxlength="30">
	    </td>
	    <td></td>
 	</tr>
  
  	<tr>
		<td colspan="3">
			<button type="button" onclick="check();">회원가입</button>
			<button type="reset">다시 작성</button>
			<button type="button" onclick="location.href='memberLogin.me'">로그인</button>
		</td>
	</tr>
	
	</table>
	</form>

	</div>
	
	
	
	<div id="bottom">
	
	
	
	</div>


</div>
</body>
<%@include file="../footer.jsp" %>
</html>