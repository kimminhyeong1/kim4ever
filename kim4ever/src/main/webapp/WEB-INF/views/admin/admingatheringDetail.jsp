<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<%@page import = "java.util.*" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">





 <style type="text/css">
		 	/*만들기 부분*/

#main section table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
  table-layout: fixed;
}

#main section th,
#main section td {
  padding: 10px;
  border: 1px solid #ccc;
 
  
}

#main section th {
  background-color: #f1f1f1;
  font-size: 36px;
  text-align: center;
}

#main section td {
  font-size: 25px;
  padding-left: 20px;
  text-align: left;
}



			
			/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
					/*만들기 부분*/
					
			#main section h3{display: inline-block;font-size: 20px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 80%; height: 200px;font-size: 20px;}
			#main section button{text-align: center;}  
			#main section img{width: 100px;height: 100px;}  
			#main section .radio{display: inline-block;width: 4%; margin-top: 10px; } 
			#main section span{font-size: 20px;} 
				}
		 </style>



</head>
<body>
<%@include file="../header4.jsp" %>
<main id="main">
		
		<section class="gContainer gSetContainer">
			
				<table>
					<tr>
						<th>모임 이름</th>
						<td>${gtrdv.gInfoName}</td>
					</tr>
					<tr>
						<th>모임장</th>
						<td>${gtrdv.memberName}</td>
					</tr>
					<tr>
						<th>모임 인원</th>
						<td>${gtrdv.gInfoParticipating}명</td>
					</tr>
					<tr>
						<th>모임 생성일</th>
						<td>${gtrdv.gInfoCreationDay.substring(0, 16)}</td>
					</tr>
					<tr>
						<th>모임 소개글</th>
						<td>${gtrdv.gInfoAreaIntroduction}</td>
					</tr>
					<tr>
						<th>모임 신고 접수</th>
						<td><span style="color: red">${gtrdv.REPORTCNT}번</span></td>
					</tr>
				</table>
	       
	        
		</section>
		
	</main>



</body>
<%@include file="../footer.jsp" %>
</html>