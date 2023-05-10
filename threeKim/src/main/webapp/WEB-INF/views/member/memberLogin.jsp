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
#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:1200px;}
#main #bottom{width:1440px; height:300px;}
#content table {width: 80%;border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px; font-size:20px;}
#content table td, th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}
#content table td:nth-child(1){width:240px;text-align:center;}
#content table th{width:240px;text-align:center;}
#content table tr:last-child td input{display: inline-block; width:120px; height:50px;}
h2{text-align: center; margin-top:20px;}
#content table input{
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
</style>

</head>
<body>
<div id="main">
	
	<%@include file="../header.jsp" %>

	<div id="content">
	
	
	<form action="memberLoginAction.me" method="post">
		
		
	<table>
	<tr>
		<th colspan="2"><h2>로그인</h2></th>
	</tr>
	
	<tr>
		<th>
			<label for="member_id">아이디</label>
		</th>
	  
		<td>
			<input type="text" id="member_id" name="member_id">
		</td>
	</tr>
	  
	<tr>
		<th>
			<label for="member_pw">비밀번호</label>
		</th>
		<td>
			<input type="password" id="pw" name="member_pw">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<button type="submit">로그인</button>
			<button type="button">회원가입</button>
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