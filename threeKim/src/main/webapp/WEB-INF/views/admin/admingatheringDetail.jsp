<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<%@page import = "java.util.*" %>  
<%
ArrayList<GatheringJoinVo> gjlist = (ArrayList<GatheringJoinVo>)request.getAttribute("gjlist");
%>

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
			#main section h3{display: inline-block;font-size: 18px;}
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
					<div class="gInfoName">${gInfoName}11</div>
				</div>
				<div>
					<div>
						<h3>모임장</h3>
					</div>
					<div class="gatheringMemberType"></div>							
				</div>
				<div>
					<h3>모임 프로필 이미지</h3>
					<div class="imageUpload"></div>				
				</div>
				<div>
					<h3>모임 정원</h3>
					<div class="gatheringMemberType"></div>
	
				</div>
				<div>
					<h3>모임 간단 소개글</h3>
					<input class="gInput" type="text" placeholder="맨 앞에 노출되는 간단 소개글입니다." name="gInfoBriefIntroduction">		
				</div>
				
			<div>
				<button class="gBtn2">돌아가기</button>				 
			</div>
		</section> 
	</main>



</body>
<%@include file="../footer.jsp" %>
</html>