<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ page import="com.myezen.myapp.domain.BoardVo" %>   
 
 <% BoardVo bv   = (BoardVo)request.getAttribute("bv"); %>   

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
#content table {width:80%; border-collapse:collapse; margin: 60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty';}
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
#btn{text-align:right; margin-top:20px; margin-right:144px; }
#btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>


</head>
<body>
<div id="main">
<%@include file="../header.jsp" %>
   
	<div id="content">
	<h2>게시글 삭제</h2>
 	<form name="frm"> 	
 	<input type="text" name="bidx" value="<%=bv.getBidx()%>">
 	
		<table>
			<tr>
				<th>글제목</th>
				<td> <%=bv.getSubject() %></td>
			</tr>
			
			<tr>
		
		</table>
			
		<div id="btn">
			<button type="button"  onclick="check();" style="width:120px;height:30px;">확인</button>
			<button type="reset" style="width:120px;height:30px;">취소</button>
		</div>
	
	</form>
	</div>
        

	
	 
   
   
   <div id="bottom">
  
   </div>
</div>
</body>
<script type="text/javascript">


function check(){	


	var fm = document.frm;
	if(confirm("글을 삭제하시겠습니까?")) {
		location.href='<%=request.getContextPath()%>/board/boardModify.do';
	}
	fm.action = "<%=request.getContextPath()%>/board/boardDeleteAction.do";
	fm.enctype ="multipart/form-data";
	fm.method="post";
	fm.submit();
}
</script>
<%@include file="../footer.jsp" %>
</html>