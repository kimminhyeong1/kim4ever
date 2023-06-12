<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
if (session.getAttribute("midx") == null){	
	out.println("<script>alert('로그인 하셔야 합니다.'); history.back(-1);</script>");
}
%>    <!-- midx가 null 이면 알림후 뒤로가기 -->
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
#main #content{width:1440px; height:auto;}
#main #bottom{width:1440px; height:300px;}
#main #content h2{text-align:left; margin-top:50px; margin-left:160px; font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}
#content table {width:80%; border-collapse:collapse; margin: 60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty';}
#content table th{width:140px;padding: 10px;text-align: center;}
#content table td{padding: 10px; text-align:left; border-left:1px solid #ddd;}
#content table tr{border:1px solid #ddd;}
#content table input[type="text"],textarea{
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}

#btn{text-align:right; margin-top:20px; margin-right:144px;}
#btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>
<script type="text/javascript">
//확인
function fnWrite() {
	var fm = document.frm;
	
    if (fm.subject.value == "") {
        alert("제목을 입력하세요");
        fm.subject.focus();
        return;
    } else if (fm.content.value == "") {
        alert("내용을 입력하세요");
        fm.contents.focus();
        return;
    } else if (fm.writer.value == "") {
        alert("작성자를 입력하세요");
        fm.writer.focus();
        return;
    }

		if(confirm("글을 등록 하시겠습니까?")) {
			location.href='<%=request.getContextPath()%>/board/boardList.do';
		}
		fm.action = "<%=request.getContextPath()%>/board/boardWriteAction.do";
		fm.enctype ="multipart/form-data";
		fm.method="post";
		fm.submit();
	}
	

</script>

</head>
<body>
	<div id="main">

		<%@include file="../header.jsp"%>

		<div id="content">
			<h2>공지사항 작성</h2>
			<form name="frm">
				<input type="hidden" name="writer"
					value="<%=session.getAttribute("memberName")%>">
				<!-- writer로 저장 -->
				<table>
					<tr>
						<th>작성자</th>
						<td><%= session.getAttribute("memberName") %></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject"
							style="width: 600px; height: 40px;  font-size: 26px;"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" cols="100" rows="8"  style="font-size: 26px;"></textarea>
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
						onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">목록
						보기</button>
				</div>
			</form>


		</div>


		<div id="bottom"></div>


	</div>

</body>
<%@include file="../footer.jsp" %>
</html>