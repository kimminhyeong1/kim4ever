<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.myezen.myapp.domain.BoardVo"%>
<%BoardVo bv = (BoardVo) request.getAttribute("bv");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <%@ page import="com.myezen.myapp.domain.BoardVo" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
#main #content h2{text-align:left; margin-top:50px; margin-left:160px;  font-size:25px;}
#main #bottom{width:1440px; height:300px;}
#content table {width:80%; border-collapse:collapse; margin: 60px auto 0; line-height:30px; font-size:24px; font-family: 'omyu_pretty';}
#content table th{width:140px;padding: 10px;text-align: center;}
#content table td{padding: 10px; text-align:left; border-left:1px solid #ddd;}
#content table tr{border:1px solid #ddd;}
#content table input[type="text"],[type="password"],textarea{
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
#content #btn{text-align:right; margin-top:20px; margin-right:144px; }
#content #btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}

/**************************모바일****************************************/


@media (min-width: 300px) and (max-width: 940px)  {
#main{width:auto; margin:0 auto; text-align:center;}
#main #content{width:auto; height:auto;}
#main #content h2{text-align:left; margin-top:30px; margin-left:10%; font-size:18px; margin-bottom:10px;}
#main #bottom{width:auto; height:10px;}
#content table {width:90%; height:auto; border-collapse:collapse; margin: auto; font-size:14px; line-height: 45px;}
#content table th {width:30px; padding:2px; text-align:left; }
#content table td {padding:4px;  text-align:left; line-height:12px; }
#content table tr th {width:50px; text-align:center;  }
#content table td { white-space: pre-line;}
#content #btn{text-align:right; margin-top:20px; margin-right:10%; }
#content #btn button{width:60px; height:30px; margin:0 auto; text-align:center; font-family: 'omyu_pretty'; font-size:15px; border-radius:20px; border:0px solid #ff9933; background:#ff9933; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); }
.maintext{height: 200px; width: auto; text-align:left;}


}
</style>

</head>
<script type="text/javascript">

function characterCheck(obj){
	var regExp = /[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi;
    if(regExp.test(obj.value)){
        alert("특수문자는 입력할 수 없습니다.");
        obj.value = obj.value.substring( 0 , obj.value.length - 1 );
    }
}
function fnWrite() {
    var fm = document.frm;
    

    if (fm.subject.value == "") {
        alert("제목을 입력하세요");
        fm.subject.focus();
        return;
    }  else if (fm.content.value == "") {
        alert("내용을 입력하세요");
        fm.content.focus();
        return;
    } else if (fm.writer.value == "") {
        alert("작성자를 입력하세요");
        fm.writer.focus();
        return;
    }

    fm.action = "<%=request.getContextPath()%>/board/boardModifyAction.do";
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
	  updateCharacterCount('subject');
	  updateCharacterCount('content');
	});
	
	  window.onload = function() {
		    var filenameInput = document.getElementsByName("filename")[0];
		    filenameInput.value = '<%=bv.getFilename()%>';
		  };

</script>

<body>
	<div id="main">
		<%@include file="../header.jsp"%>

		<div id="content">
			<h2>게시글 수정</h2>
			<form name="frm">
				<input type="hidden" name="bidx" value="<%=bv.getBidx()%>"><!-- 게시글번호 숨김 -->
				<input type="hidden" name="writer" value="<%=bv.getWriter()%>"><!-- 게시글번호 숨김 -->

				<table>

					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" maxlength="20" oninput="updateCharacterCount('subject')" value="<%=bv.getSubject()%>">
						  <span id="subjectCount"></span>
						</td>
					</tr>

					<tr>
						<th>내용</th>
						<td><textarea name="content" cols="50" rows="10"  onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"  maxlength="500" oninput="updateCharacterCount('content') "><%=bv.getContent()%>	</textarea>
							 <span id="contentCount"></span>
						</td>
					</tr>

					<tr>
						<th>작성자</th>
						<td>
							<%=bv.getWriter()%>
							</td>
					</tr>

					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="filename" > 
									<c:if test="${not empty bv.filename}">
							    <c:set var="exp" value="${fn:substring(bv.filename, fn:length(bv.filename) - 3, fn:length(bv.filename))}" />
							    <c:choose>
							        <c:when test="${exp eq 'jpg' or exp eq 'gif' or exp eq 'png'}">
							            <img src="${pageContext.request.contextPath}/board/displayFile.do?fileName=${bv.filename}"
							                width="10%" height="10%" />
							        </c:when>
							    </c:choose>
							</c:if>
						</td>
					</tr>
				</table>
				
				<div id="btn">
					<button type="button" onclick="fnWrite();">수정</button>
					<button type="button"
						onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">취소</button>
				</div>

			</form>
		
		</div>

	</div>

</body>

<%@include file="../footer.jsp"%>
</html>