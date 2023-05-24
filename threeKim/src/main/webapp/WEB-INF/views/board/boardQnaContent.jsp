<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="com.myezen.myapp.domain.BoardVo" %>   
 
 <% BoardVo bv   = (BoardVo)request.getAttribute("bv"); %>   
     <%if (session.getAttribute("midx") == null){out.println("<script>alert('로그인 하셔야 합니다.'); history.back(-1);</script>");}%>
     <!-- midx가 null 이면 알림후 뒤로가기 -->    
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
#main #content h2{text-align:left; margin-top:50px; margin-left:160px; font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}
#main #bottom{width:1440px; height:300px;}
#content table {width:80%; border-collapse:collapse; margin:60px auto 0; font-size:24px; font-family: 'omyu_pretty'}
#content table tr{border:1px solid #ddd;}
#content table th {width:100px; padding:10px; text-align:center; border-right:1px solid #ddd;}
#content table td {padding:10px; text-align:center; line-height:50px;}
#content table tr th {width:120px; text-align:center;  }
#content #btn{text-align:right; margin-top:20px; margin-right:144px; }
#content #btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content #btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>

</head>
<body>
<div id="main">
<%@include file="../header.jsp" %>
   
		<div id="content">
	<h2>게시글 내용</h2>
 	<form name="frm">
		<table>
		
			<tr>
				<th>제목</th>
			<td> <%=bv.getSubject() %> </td>

				<th style="width:100px; text-align:center;border-left:1px solid #ddd;">조회수</th>
				      <td><%=bv.getBoardView()%></td>
				
				<td style="width:200px; text-align:center;"></td>
			</tr>
			
			<tr>
				<th>작성자</th>
<td><%=bv.getWriter() %></td>

				<td></td>
				<td></td>
				
			</tr>
			
			<tr>
				<th>글 내용</th>
				<td style="height:500px;"></td>
<td><%=bv.getContent() %>  </td>
				<td></td>
          		
			</tr>
			<tr>
				<th>파일다운로드</th>
				<td></td>	
				<td></td>
				<td></td>
          		
			</tr>
			
			<tr>
				<th>이미지</th>
				<td></td>	
				<td></td>
				<td></td>
			</tr>
	
	</table>
	<div id="btn">
			<c:if test="${midx == bv.getMidx()}"><!-- midx가 동일할때만 출력 -->
					<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardModify.do?bidx=<%=bv.getBidx() %>'">수정</button>
		    		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardDelete.do?bidx=<%=bv.getBidx() %>'">삭제</button>
			</c:if>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardReply.do?bidx=<%=bv.getBidx()%>'">답변</button>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">목록</button>
    </div>
	</form>
	</div>
        

	
	 
   
   
   <div id="bottom">
  
   </div>
</div>
</body>
<%@include file="../footer.jsp" %>
</html>