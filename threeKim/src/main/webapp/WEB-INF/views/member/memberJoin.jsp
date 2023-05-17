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
#content table {width:60%;border-collapse:collapse; border:1px solid #ddd; margin:60px auto 0; text-align:center;  line-height:100px; font-family:'omyu_pretty'; font-size:21px;}
#content table th{width:150px; text-align:center; border:1px solid #ddd; padding:8px;}
#content table td{border:1px solid #ddd;padding:8px;text-align:left;}
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

#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}

#main #findbutton{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#main #findbutton:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

    $(document).ready(function(){
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
}
  
</script>

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

	<form name="frm" id="frm"> 
	
	<table>
	
  	<tr>
    	<th colspan="3"><h2>회원가입</h2></th>
  	</tr>
  	
  	<tr>
    	<th>
    		<label for="memberId">아이디</label>
    	</th>
    	
	    <td>
	    	<input type="text" id="memberId" name="memberId">
	    </td>
	    
	    <td>
	    	<button type="button" id="memberIdCheck" name="memberIdCheck" onclick="idCheck();">ID 중복 확인</button>
	    </td>
 	</tr>
 	
  	<tr>
	    <th>
	    	<label for="memberPwd">비밀번호</label>
	    </th>
	    <td>
	    	<input type="password" id="memberPwd" name="memberPwd" >
	    </td>
	    <td></td>
  	</tr>
  	
  	<tr>
	    <th>
	    	<label for="memberPwd2">비밀번호 확인</label>
	    </th>
	    <td>
	    	<input type="password" id="memberPwd2" name="memberPwd2" >
	 	</td>
	 	<td></td>
 	</tr>
 	
    <tr>
	    <th>
	    	<label for="memberName">이름</label>
	    </th>
	    <td>
	    	<input type="text" id="memberName" name="memberName">
		</td>
	  	<td></td>
 	</tr>
 	
 	<tr>
	    <th>
	    	<label for="memberAge">나이</label>
	    </th>
	    <td>
	   		<input type="number" id="memberAge" name="memberAge" min="0">
	  	</td>
	  	<td></td>
 	</tr>
 	
 	<tr>
 	
 	<tr>
	    <th>
	    	<label for="memberPhone">휴대폰번호</label>
	    </th>
	    <td>
	   		<input type="tel" id="memberPhone" name="memberPhone" oninput="autoHyphen2(this)" maxlength="13">
	  	</td>
	  	<td></td>
 	</tr>
 	
 	<tr>
	    <th>
	    	<label for="memberEmail">이메일</label>
	    </th>
	    <td>
	    	<input type="text" id="memberEmail" name="memberEmail" maxlength="30">
	    </td>
	    <td></td>
 	</tr>
  	
  	<tr>
    <th>
        <label for="memberAddr">거주지</label>
    </th>
    <td>
        <input type="text" id="memberAddr" name="memberAddr" placeholder="주소"><br>
        <input type="button" onclick="openAddressPopup()" value="주소 검색">
    </td>
</tr>

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
 	
  	<tr>
		<td colspan="3">
			<button type="button" onclick="check();">회원가입</button>
			<button type="reset">다시 작성</button>
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/memberLogin.do'">로그인</button>
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