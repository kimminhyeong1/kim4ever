<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타:바-모임신고하기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo7.png">
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		 <style type="text/css">
		 	/*헤더영역 메뉴*/
			header #menu{display: none;}
		 	/*수정하기 부분*/
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width:500px ;height:200px; font-size:23px; margin-top:20px;  resize: none;}
			#main section button{text-align: center; margin-top:20px; }  
			#main section img{width: 100px;height: 100px;}  
			/*테이블*/
			table {width:100%;height:auto;text-align:center;border-collapse:collapse;font-family:'omyu_pretty';}
			table th {padding:10px;margin:5px 0; text-algin:center;font-size:25px;}
			table td {padding:10px;text-align:left;font-size:24px;}
			table td textarea {width:100%;height:100%;box-sizing:border-box;resize: vertical; resize: none;}
			.button-container {margin-top:20px;text-align:center;}
			.button-container button {margin-right:10px;}
			textarea {resize: none;border-radius: 20px; padding: 20px;  }
			.gBtn2 {margin-bottom:10px}
				/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
					/*헤더영역 메뉴*/
			header #menu{display: none;}
		 	/*수정하기 부분*/
			#main section h1{display:inline-block;font-size: 25px; margin-bottom:10px; margin-top:10px; margin-left:35px; }
			#main section h3{display:inline-block; font-weight:bold; font-size: 18px; margin-top:20px; margin-left:15px;}
			#main section p{font-family: 'omyu_pretty'; display:inline-block; font-size:18px; }
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width:100% ;height:200px; font-size:18px; margin-top:20px; }
			#main section button{text-align: center; margin-top:20px; float:right; margin-left:5px;}   
			#main section img{width: 100px;height: 100px;}  
			table {width:100%;height:auto;text-align:center;border-collapse:collapse;font-family:'omyu_pretty';}
			table th {padding:10px;margin:5px 0; text-algin:center;font-size:20px;}
			table td {padding:10px;text-align:left;font-size:18px;}
			table td textarea {width:100%;height:100%;box-sizing:border-box;resize: vertical; resize: none;}
				}

	
</style>

<script>
function characterCheck(obj){
	var regExp =/[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi;
    if(regExp.test(obj.value)){
        alert("특수문자는 입력할 수 없습니다.");
        obj.value = obj.value.substring( 0 , obj.value.length - 1 );
    }
}
function fnWrite() {
    var fm = document.frm;
    var content = fm.gatheringReportContent.value;
    if (fm.gatheringReportContent.value == "") {
        alert("내용을 입력하세요");
        fm.gatheringReportContent.focus();
        return;		 
	}
     if (content.length < 10) {
        alert("10글자 이상 입력해주세요");
        fm.gatheringReportContent.focus();
        return;
    }
    fm.action = "<%=request.getContextPath()%>/gathering/gDeclarationAction.do";
    fm.enctype = "multipart/form-data";
    fm.method = "post";
    fm.submit();
    }
    
function updateCharacterCount(inputName) {
	  var input = document.getElementsByName(inputName)[0];
	  var maxLength = parseInt(input.getAttribute('maxlength'));
	  var currentLength = input.value.length;
	  var countElement = document.getElementById(inputName + 'Count');
	  
	  countElement.textContent = currentLength + '/' + maxLength;
	}

	// 초기 로딩 시 글자 수 업데이트
	window.addEventListener('DOMContentLoaded', function() {
	  updateCharacterCount('gatheringReportContent');
	});
</script>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer gSetContainer">
				<form name="frm" id="frm">
				<table>
					<tr>
						<th colspan="2" style="text-align: center;">모임 신고하기</th>
					</tr>
					<tr>
						<th>모임명</th>
						<td>${gjvlist[0].gInfoName}</td>
					</tr>
					<tr>
						<th>지역</th>
						<td>${gjvlist[0].gInfoArea}</td>
					</tr>
					<tr>
						<th>모임장</th>
						<td>${gjvlist[0].memberName}</td>
					</tr>
					<tr>
						<th>신고 내용</th>
						<td><textarea id="gatheringReportContent" name="gatheringReportContent" rows="5" cols="5" placeholder="글자 제한: 500자 이내" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"  maxlength="500" oninput="updateCharacterCount('gatheringReportContent')"></textarea>
						  <span id="gatheringReportContent"></span>
						
						</td>
					
					</tr>
					
					<tr>
						<td colspan='2' class="button-container">
						<button type="button"class="gBtn2" onclick="fnWrite();">신고하기</button>				 
						<button class="gBtn2" onclick="history.back()">돌아가기</button>
						</td>
					</tr>
				</table>

				</form>
			</section>
		</main>
	</body>
</html>