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
#memberIdCheck {padding:5px 10px; font-size:14px; width:120px; height:50px; }
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
	    <th>
	    	<label for="member_address">거주지</label>
	    </th>
	    <td>	    	
			<input type="text" id="sample2_address" placeholder="주소"><br>
			<input type="text" id="sample2_extraAddress" placeholder="지번">
			<input type="button" id="findbutton" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample2_address").value = addr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
	    </td>
	    <td></td>
 	</tr>
 	
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