<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.BikeJoinVo" %>
<%@page import = "java.util.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<BikeJoinVo> bikeList = (ArrayList<BikeJoinVo>)request.getAttribute("bikeList");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타:바-자전거 소개</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">			
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent_mo.css"> 
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
		
		
		<style type="text/css">
		 	/*소개부분*/
		 	#main{margin:0 auto !important;}
			#bikeIntro{margin:40px auto; margin-top:10px; width:1000px; padding: 20px;background-color:#fdfcfa; border-radius:20px;border: 1px solid #bbb;} 
			#bikeIntro h2{text-align:center; font-size:35px; color:#333; margin-bottom: 20px;}
			#bikeIntro p{font-family:'omyu_pretty'; text-align:left; margin-left:40px; font-size:24px; padding:15px 15px; letter-spacing:3px;}
			#bikeNotice{text-align:center;}
			#bikeNotice button{width:400px; height:50px; border-radius:20px; border:0px solid #ff9933; font-family:'omyu_pretty'; font-size:30px; background:#ff9933; margin-top:20px;}
			#bikeNotice p{margin:40px; font-size:30px;}
			#bcontent .deleteBtn {display:none; position: absolute;top:0;right:0;width:30px;height:30px;background-color:#ff0000;color:#fff;font-size:20px;border:none;border-radius:50%;cursor:pointer;}
			#bcontent .card:hover .deleteBtn {display:block;}


/**********************모바일****************/
@media (min-width: 300px) and (max-width: 940px)  {
/*소개부분*/
			#bikeIntro{margin:0 auto; margin-top: 20px; width:320px; background-color:#fdfcfa; border-radius:20px; padding:10px; margin-bottom:30px; border: 1px solid #bbb;} 
			#bikeIntro h2{text-align:center; font-size:25px; color:#333; margin-bottom: 20px;}
			#bikeIntro p{font-family:'omyu_pretty'; text-align:left; margin-left:10px; font-size:12px; padding:5px 5px; letter-spacing:3px; word-break: keep-all;}
			#bikeNotice{text-align:center;}
			#bikeNotice button{width:200px; height:40px; border:0px solid #ff9933; font-family:'omyu_pretty'; font-size:18px; background:#ff9933; margin-top:10px;}
			#bikeNotice p{margin:20px; font-size:12px;  }
			.cardInfo {height:33px; }			
			#bcontent .deleteBtn {display:none; position: absolute;top:0;right:0;width:30px;height:20px;background-color:#ff0000;color:#fff;font-size:20px;border:none;border-radius:50%;cursor:pointer;}
			#bcontent .card:hover .deleteBtn {display:block;}
			.card{ word-break: keep-all;}
}


		 </style>
	 <script>
		function deleteBike(bikeType) {
		  if (confirm("정말로 자전거를 삭제하시겠습니까?")) {
		    location.href = "${pageContext.request.contextPath}/bikeRent/bikeRentDeleteAction.do?bikeType=" + bikeType;
		  }
		}
	</script>
	</head>
	<body>
		<% if ("관리자".equals((String) session.getAttribute("memberType"))) { %>
		    <%@include file="../header.jsp" %>
		<% } else { %>
		    <%@include file="../header.jsp" %>
		<% } %>
		<main id="main">
			<section id="container">
			<div id="bikeIntro">
			 <h2>자전거 이용 수칙</h2>
	           <p>1. 자전거 이용시간은 오전9시부터 오후 10시까지 입니다.</p>
	           <p>2. 자전거 이용 시 안전수칙을 준수하시고 음주 시 이용이 불가합니다. </p>
	           <p>3. 대여는 5개의 대여소에서 가능하며, 반납은 빌린곳과 무관하게 <br>&nbsp&nbsp&nbsp어느 대여소에서든 가능합니다.</p>
	           <p>4. 자전거 고장/신고 문의는 대여내역에서 신고 접수 부탁드립니다! </p>
			</div>
			<div id="bcontent">
			  <c:forEach var="bjv" items="${bikeList}">
		        <div class="card">
		        <c:if test="${sessionScope.memberType eq '관리자'}">
		        	<button class="deleteBtn" onclick="deleteBike('${bjv.bikeType}')">X</button>
        	    </c:if>
				   <%-- <img class="cardImg" src="//192.168.0.157/bteam/${bjv.uploadFile}" alt="이미지"> --%>
				    <img class="cardImg" src="${pageContext.request.contextPath}/resources/bikeImages/${bjv.uploadFile}" alt="이미지">
		            <p class="cardName">${bjv.bikeType } / ${bjv.bikeCode }</p>
		            <p class="cardInfo">${bjv.bikeContent}</p>
		            <p class="cardPrice">${bjv.rentPrice }원</p>
		        </div>
		    </c:forEach>
			</div>
				
			<div id="bikeNotice">
			<c:if test="${sessionScope.memberType eq '관리자'}">
				<button class="createBtn" onclick="location.href='${pageContext.request.contextPath}/bikeRent/bikeRentWrite.do'">등록</button>
			</c:if>
			<p>- 자전거의 종류는 추가적으로 추후에 추가예정입니다 -</p>
			</div>
			
			<div id="bottom">
			<%@include file="../bottom.jsp" %>
			</div>		
	
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>