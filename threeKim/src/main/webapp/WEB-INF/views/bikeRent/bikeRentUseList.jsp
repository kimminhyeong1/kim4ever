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
			#useInfo{width:80%; font-size:22px; line-height:35px;}
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
						1. 자전거 이용시간은 오전9시부터 오후10시까지입니다.<br>
						2. 반납은 대여한 장소와 무관하게 어느 대여소에서든 가능합니다.<br>
						3. 자전거에 문제가 생겼을 경우 고장/신고 접수 부탁드립니다.<br>
						4. 안전수칙을 준수하시고 음주 시 이용이 불가합니다.<br>
					</p></div>
					<div><h2>현재 <span style="color:blue">${bjv.bikeType}</span>를  대여 중입니다.</h2></div>
					<div><p>대여한 자전거 대여소 위치</p><p>:</p><p>${bjv.bikeLocation }</p></div>
					<div><p>사용자 이름</p><p>:</p><p>${bjv.memberName }</p></div>
					<div><p>자전거 고유번호</p><p>:</p><p>${bjv.bikeCode}</p></div>
					<div><p>대여한 자전거 시간</p><p>:</p><p>${bjv.rentDay }</p></div>
					<div><p>대여한 자전거 이용 요금</p><p>:</p><p>${bjv.rentPrice }원</p></div>
					<div id="useListBtn">
						<button onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentFault.do'">고장/신고</button>
						<button onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeReturnQR.do'">반납하러가기</button>						
					</div>
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>