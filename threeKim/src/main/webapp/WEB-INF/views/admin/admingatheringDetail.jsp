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
			#main section h3{display: inline-block;font-size: 35px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 80%; height: 200px;font-size: 23px;}
			#main section button{text-align: center;}  
			#main section img{width: 100px;height: 100px;}   
			#main section .radio{display: inline-block;width: 4%; margin-top: 10px; } 
			#main section span{font-size: 20px;} 
			
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
			<div>
				<div> 
					<div>	
						<h3>모임 이름</h3>
					</div>
					<div class="gInfoName">${gtrdv.gInfoName}</div>
				</div>
				<div>
					<div>
						<h3>모임장</h3>
					</div>
					<div class="gatheringMemberType">${gtrdv.memberName}</div>							
				</div>
				<div>
					<h3>모임 인원</h3>
					<div class="gInfoCapacity">${gtrdv.gInfoCapacity}명</div>				
				</div>
				<div>
					<h3>모임 생성일</h3>
					<div class="gInfoCreationDay">${gtrdv.gInfoCreationDay}</div>	
				</div>
				<div>
					<h3>모임 소개글</h3>
					<div class="gInfoCreationDay">${gtrdv.gInfoAreaIntroduction}</div>	
				</div>
				 <div>
	                <h3>모임 신고 접수</h3>
	                <div class="ReportCount">
						${gtrdv.REPORTCNT}
	                </div>
	            </div>
			<div>
				<button class="gBtn2">돌아가기</button>				 
			</div>
		</section> 
	</main>



</body>
<%@include file="../footer.jsp" %>
</html>