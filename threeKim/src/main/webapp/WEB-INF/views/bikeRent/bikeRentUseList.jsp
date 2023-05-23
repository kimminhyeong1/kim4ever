<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-이용중인내역</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">
		<style type="text/css">
			/*헤더영역 메뉴*/
			header #menu{display: none;}
			/*틀부분*/
			.container{border: 1px solid #bbb;margin: 40px auto;width: 55%;padding: 20px;background-color: #f1f1f1;border-radius: 10px;}
			.container>div{padding: 20px; text-align: left;}
			.container>div>p{display: inline-block; } 
			.container>div>p:nth-child(1){width: 40%; margin-left: 60px;} 
			.container>div>p:nth-child(2){width: 5%;} 
			.container{font-size: 24px;}
			.container h1{font-size: 50px; text-align: center;}
			.container h2{font-size: 40px; text-align: center;}
			.container button{display:inline-block; width:45%; height:55px; margin-top:0px;text-align:center; font-family:'omyu_pretty'; font-size:25px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
			.container button:active{background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			/*이용내역 내용*/
			#useInfo{width: 80%;}
			/*이용내역 내용 버튼*/
			#useListBtn{text-align: center;}
			
			  
		</style>  
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section id="content">
				<div class="container">
					<div><h1>이용내역</h1></div>
					<div><p id="useInfo">
						이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내
						이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내
						이용안내이용안내이용안내이용안내이용안내이용안내
					</p></div>
					<div><h2>현재 ㅁㅁㅁ을 대여중입니다.</h2></div>
					<div><p>대여한 자전거 대여소 위치</p><p>:</p><p>효자 대여소</p></div>
					<div><p>사용자 이름</p><p>:</p><p>홍길동</p></div>
					<div><p>자전거 고유번호</p><p>:</p><p>AE-4541</p></div>
					<div><p>대여한 자전거 시간</p><p>:</p><p>2023-05-25 15:50</p></div>
					<div><p>대여한 자전거 이용 요금</p><p>:</p><p>1000원</p></div>
					<div id="useListBtn">
						<button onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentFault.do'">고장/신고</button>
						<button onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentQR.do'">반납하러가기</button>						
					</div>
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>