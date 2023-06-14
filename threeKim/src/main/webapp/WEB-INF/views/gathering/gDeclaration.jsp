<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 신고하기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
		 <style type="text/css">
		 	/*헤더영역 메뉴*/
			header #menu{display: none;}
		 	/*수정하기 부분*/
			#main section h1{display: inline-block;font-size: 37px; margin-bottom:20px; }
			#main section h3{display: inline-block;font-size: 27px; margin-top:10px; }
			#main section p{display: inline-block; font-size: 21px; }
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 500px;height: 200px;font-size: 23px;}
			#main section button{text-align: center;}  
			#main section img{width: 100px;height: 100px;}  
		 </style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer gSetContainer">
				<form name="frm" id="frm" action="${pageContext.request.contextPath}/gathering/gDeclarationAction.do" method="POST">
				<div>
						<div>
							<h1>모임 신고하기</h1>
						</div>

						<div>
							<h3>모임명</h3> : <p>${gjvlist[0].gInfoName}</p>	
						</div>
						
						<div>
							<h3>지역</h3> : <p>${gjvlist[0].gInfoArea}</p>	
						</div>
						<div>
							<h3>모임장</h3> : <p>${gjvlist[0].memberName}</p>	
						</div>
						
						<div>
							<h3>신고 내용</h3>
							<textarea id="gatheringReportContent" name="gatheringReportContent" rows="5" cols="5" placeholder="글자제한:500자이내"></textarea>		
						</div>
					
				</div>
				<div>
					<button type="submit"class="gBtn2">신고하기</button>				 
					<button class="gBtn2" onclick="history.back()">돌아가기</button>				 
				</div>
				</form>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>