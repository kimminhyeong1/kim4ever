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
#main #content h2{text-align:left; margin-top:50px; margin-left:160px;font-family: 'KCC-Ganpan';}
#main #bottom{width:1440px; height:300px;}
#content table {width:80%; border-collapse:collapse; margin:60px auto 0; font-size:24px; font-family: 'omyu_pretty'}
#content table tr{border:1px solid #ddd;}
#content table th {width:100px; padding:10px; text-align:center; border-right:1px solid #ddd;}
#content table td {padding:10px; text-align:center; line-height:50px;}
#content table tr th {width:120px; text-align:center;  }

#btn{text-align:right; margin-top:20px; margin-right:144px;}
#btn input{width:100px; height:30px; font-family:'omyu_pretty'; font-size:24px; background:#ff9933; border-radius:10px; border:0px solid #ff9933;}
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
				<th>글 제목</th>
				<td></td>
				<th style="width:100px; text-align:center;border-left:1px solid #ddd;">조회수</th>
				<td style="width:200px; text-align:center;"></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td></td>
				<td></td>
				<td></td>
				
			</tr>
			
			<tr>
				<th>글 내용</th>
				<td style="height:500px;"></td>
				<td></td>
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
      	<input type="button" name="modify" value="수정"  onclick="location.href='boardModify.jsp'" >												
    	<input type="button" name="delete" value="삭제" onclick="location.href='boardDelete.jsp'" >
		<input type="button" name="reply" value="답변" onclick="location.href='boardReply.jsp'" >
		<input type="button" name="list" value="목록"	onclick="location.href='boardList.jsp'" >

    </div>
	</form>
	</div>
        

	
	 
   
   
   <div id="bottom">
  
   </div>
</div>
</body>
<%@include file="../footer.jsp" %>
</html>