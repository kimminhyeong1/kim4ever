<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 수정하기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
		 <style type="text/css">
		 	/*수정하기 부분*/
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
							<h3>모임 이름</h3>
							<p>필수</p>
						</div>
						<input class="gInput" type="text" placeholder="내용을 입력해주세요">
					</div>
					<div>
						<div>
							<h3>모임 지역</h3>
							<p>필수</p>
						</div>
						<input class="gInput" type="text" placeholder="내용을 입력해주세요">										
					</div>
					<div>
						<h3>모임 프로필 이미지</h3>
						<div>
							<img alt="" src="">											
						</div>
					</div>
					<div>
						<h3>모임 소개 이미지</h3>
						<div>
							<img alt="" src="">
							<img alt="" src="">
							<img alt="" src="">
							<img alt="" src="">
							<img alt="" src="">					
						</div>
		
					</div>
					<div>
						<h3>모임 간단 소개글</h3>
						<input class="gInput" type="text" placeholder="맨 앞에 노출되는 간단 소개글입니다.">		
					</div>
					<div>
						<h3>모임 소개글</h3>
						<textarea rows="5" cols="5" placeholder="글자제한:500자이내"></textarea>		
					</div>
					<div>
						<div>
							<h3>모임 정원(최대 100명)</h3>
							<p>필수</p>
						</div>
						<input class="gInput" type="number" placeholder="예:5">	
					</div>
				</div>
				<div>
					<button class="gBtn2">변경하기</button>				 
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>