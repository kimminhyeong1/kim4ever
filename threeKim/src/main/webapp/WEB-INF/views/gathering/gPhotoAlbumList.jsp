<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-모임-사진첩</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">		  
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
			/*사진첩 틀*/ 
			.gContent{ width: 100%; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
			/*사진첩 부분*/
			.card{height:320px; background-color: #d2dfcc;}
			.cardTitle{font-size:23px; }
			.cardImg{height: 80%;}

			/*버튼 부분*/
			#createBtn{text-align: right;}	
			/*페이징 부분*/
			.gPaging{font-size: 25px;}		
		</style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="gContent" >
				<c:if test="${not empty midx}">
					<c:forEach var="gpv" items="${gPhotoList}">
						<div class="card" onclick="window.location.href='<%=request.getContextPath() %>/gathering/gPhotoAlbumContent.do?gpaidx=${gpv.gpaidx }'" >					
							<img class="cardImg" src="../resources/GATImages/${gpv.imageName}">
							<h3 class="cardTitle"> 
							<c:set var="dateString" value="${gpv.gPhotoAlbumWriteDay}" />
							<fmt:parseDate var="date" value="${dateString}" pattern="yyyy-MM-dd HH:mm:ss.S" />
							<fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일" />
							</h3>
							<h3 class="cardTitle">${gpv.gPhotoAlbumTitle }</h3>
						</div>
					</c:forEach>
				</c:if>
					
					<div class="gPaging">  1-2-3 </div><!-- 페이징 -->
				</div>
				<div id="createBtn">
					<button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gPhotoAlbumWrite.do'">사진첩 만들기</button>
				</div>
				
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
