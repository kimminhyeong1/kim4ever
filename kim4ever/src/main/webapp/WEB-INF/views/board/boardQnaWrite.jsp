<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%if (session.getAttribute("midx") == null){	out.println("<script>alert('로그인 하셔야 합니다.'); history.back(-1);</script>");}%>
             <!-- midx가 null 이면 알림후 뒤로가기 -->
              <% BoardVo bv   = (BoardVo)request.getAttribute("bv"); %>   
             
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
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
#main #content{width:1440px; height:auto;}
#main #bottom{width:1440px; height:300px;}
#main #content h2{text-align:left; margin-top:50px; margin-left:160px;  font-size:25px;}
#content table {width:80%; border-collapse:collapse; margin: 60px auto 0; line-height:30px; font-size:24px; font-family: 'omyu_pretty';}
#content table th{width:140px;padding: 10px;text-align: center;}
#content table td{padding: 10px; text-align:left; border-left:1px solid #ddd;}
#content table tr{border:1px solid #ddd;}
#content table input[type="text"],textarea{
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 20px;
  resize:none;
}
textarea {
  word-break: break-all;
}


#btn{text-align:right; margin-top:20px; margin-right:144px;}
#btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:20px; border:0px solid #ff9933; background:#ff9933;}
#btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}

/*****************************************모바일***************************************************************/
		
	@media (min-width: 300px) and (max-width: 940px)  {	
#main{width:auto; margin:0 auto; text-align:center;}
#main #content{width:auto; height:auto;}
#main #content h2{text-align:left; margin-top:30px; margin-left:10%;  font-size:18px; margin-bottom:10px;}
#main #bottom{width:auto; height:10px;}
#content table {width:90%; height:auto; border-collapse:collapse; margin: auto; font-size:14px; font-family: 'omyu_pretty' ; border-radius:10px; line-height: 45px;}
#content table tr{border:1px solid #ddd;}
#content table th {width:30px; padding:2px; text-align:left; border-right:0px solid #ddd;}
#content table td {padding:4px;  text-align:left; line-height:12px; }
#content table tr th {width:50px; text-align:center;  }
#content table td { white-space: pre-line;}
#content #btn{text-align:right; margin-top:20px; margin-right:10%; }
#content #btn button{width:60px; height:30px; margin:0 auto; text-align:center; font-family: 'omyu_pretty'; font-size:15px; border-radius:20px; border:0px solid #ff9933; background:#ff9933; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); }
.maintext{height: 200px; width: auto; text-align:left;}




</style>
<script type="text/javascript">

function characterCheck(obj){
	var regExp =/[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi;
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

    fm.action = "<%=request.getContextPath()%>/board/boardWriteAction2.do"; 
    //오류페이지용 오류생성(오타)
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

</script>



</head>
<body>
	<div id="main">

		<%@include file="../header.jsp"%>

		<div id="content">
					<h2>문의사항 작성</h2>
		
						<form name="frm" >
<input type="hidden" name="writer" value="	<%= session.getAttribute("memberName") %>"><!-- writer로 저장 -->
				<table>
					<tr>
						<th>작성자</th>

						<td><%= session.getAttribute("memberName") %></td>					
					</tr>
					
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" maxlength="20" oninput="updateCharacterCount('subject')">
						  <span id="subjectCount"></span>
						</td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td><textarea name="content" cols="50" rows="10"  onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"  maxlength="500" oninput="updateCharacterCount('content')"></textarea>
							 <span id="contentCount"></span>
						</td>
					
					</tr>
					
					<tr>
						<th>첨부 파일</th>
						<td><input type="file" name="filename"></td>
					</tr>


				</table>

				<div id="btn">
					<button type="button" onclick="fnWrite();">글 등록</button>
					<button type="reset">다시 작성</button>
					<button type="button"
						onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">목록보기</button>
				</div>
			</form>


		</div>



	</div>

</body>
<%@include file="../footer.jsp" %>
</html>