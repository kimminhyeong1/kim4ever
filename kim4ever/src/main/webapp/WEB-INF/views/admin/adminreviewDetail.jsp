<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<%@page import = "java.util.*" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세 페이지</title>
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

button.back {
    margin-left: 46%;
    margin-top: 15px;
    width: 160px;
    height: 40px;
    border-radius: 10px;
    background: #ff9933;
    border: #ff9933;
    font-size: 21px;
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
						<th>리뷰 번호</th>
						<td>${rev.rvidx}</td>
					</tr>
					<tr>
						<th>리뷰 작성일</th>
						<td >${rev.reviewWriteDay}</td>
					</tr>
					<tr>
						<th>리뷰 내용</th>
						<td style="overflow-wrap: break-word;">${rev.reviewContent}</td>
					</tr>
										
				</table>
	       
	       		
	        
		</section>
		<div>
	       		<button type="button" class= "back" onclick="location.href='<%=request.getContextPath()%>/admin/adminreviewList.do'">돌아가기</button>
	       		</div>
	</main>



</body>
<%@include file="../footer.jsp" %>
</html>