<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임-일정만들기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
		<style type="text/css">
		 	/*일정만들기 부분*/
			#main section h3{display: inline-block;font-size: 27px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
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
				<div>
					<div> 
						<div> 
							<h3>일정 제목</h3>
						</div>
						<div class="boxContent">동원물산 8시 까지 모이기</div>
					</div>
					<div>
						<div>
							<h3>일정 날짜</h3>
						</div>
						<label for="start">시작일:</label>
						<div class="boxContent">2023-06-01 오후 06:30</div>
						<label for="end">종료일:</label>		
						<div class="boxContent">2023-06-02 오후 03:00</div>									
					</div>
					<div>
						<h3>일정 위치</h3><!-- 지도 api사용 -->
						<input class="gInput" type="text" placeholder="맨 앞에 노출되는 간단 소개글입니다.">		
					</div>
					<div>
						<h3>모임비</h3>
						<div class="boxContent">50000원</div>	
					</div>
					<div>
						<h3>준비물</h3>
						<div class="boxContent" style="width: 90%;">
						준비물준비물준비물준비물준비물	준비물준비물준비물준비물준비물	준비물준비물준비물준비물준비물	준비물준비물준비물준비물준비물	준비물준비물준비물준비물준비물
						준비물준비물준비물준비물준비물준비물준비물준비물	준비물준비물준비물준비물준비물	준비물준비물준비물준비물준비물	준비물준비물준비물준비물준비물
						준비물준비물준비물준비물준비물준비물준비물준비물준비물준비물준비물준비물준비물준비물준비물					
						</div>	
					</div>
					<div>
						<div>
							<h3>정원(최대 100명)</h3>
						</div>
						<div class="boxContent">현재 20명</div>	
					</div>
				</div><!-- 끝-->
				<div>
					<button class="gBtn2">돌아가기</button>			 	 
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
