<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타바-모임-사진첩</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script><!-- 풀캘린더 라이브러리 -->  
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">		  
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
			/*사진첩 틀*/ 
			.gContent{ width: 100%; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px; position: relative; padding-top: 40px;  padding-bottom: 40px;}
			/*사진첩 부분*/
			.card{height:320px; background-color: #d2dfcc; margin-top:100px;}
			.cardTitle{font-size:23px; }
			.cardImg{height: 80%;}

			/*버튼 부분*/
			#createBtn{text-align: right;}	
			/*페이징 부분*/
			.gPaging{font-size: 25px; margin-top:20px;}		
			
			#searchCategory{ position: absolute; top:-10px; right:-20px; text-align: right; font-size: 20px; margin: 40px 60px; height: 30px; font-family: 'omyu_pretty'; vertical-align: top;} 
			#searchCategory>div{display: inline-block; vertical-align: top;} 
			#searchCategory>div>select{width: 80px; height: 30px; font-size: 18px; font-family: 'omyu_pretty';vertical-align: top;} 
			#searchCategory>div>input{width: 300px; height: 26px; font-size: 18px;vertical-align: top;} 
			#searchCategory>div>button{width: 100px; height: 30px; margin-top: 0px;margin-bottom: 0px;} 
						
			
		</style>

 <script>
window.onload = function() {
    var alertMessage = "${alertMessage}"; // Flash Attributes에서 알림 메시지를 가져옴

    if (alertMessage) {
        alert(alertMessage); // 알림 메시지를 출력
    }
}
</script>

	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="gContent" >
				
				<form id="searchCategory" name="frm" action="${pageContext.request.contextPath}/gathering/gPhotoAlbumList.do" method="get">
						<div class="search">
							<select name="searchType">
									<option value="gPhotoAlbumTitle">제목</option>					
							</select>
							<input type="text" name="keyword" size="10">
							<button type="submit" id="searchBtn" class="gBtn2">검색</button>
						</div>
				</form>
				
				<c:if test="${not empty midx}">
					<c:forEach var="gpv" items="${gPhotoList}">
						<div class="card" onclick="window.location.href='<%=request.getContextPath() %>/gathering/gPhotoAlbumContent.do?gpaidx=${gpv.gpaidx}'" >					
							<img class="cardImg" src="../resources/GATImages/${gpv.imageName}">
							<h3 class="cardTitle"> 
							<c:set var="dateString" value="${gpv.gPhotoAlbumWriteDay}" />
							<fmt:parseDate var="date" value="${dateString}" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일" />
							</h3>
							<h3 class="cardTitle">${gpv.gPhotoAlbumTitle }</h3>
						</div>	
					</c:forEach>
				</c:if>
				</div>
				
				<div class="gPaging">
				  <c:if test="${pm.prev == true}">
				    <a href="${pageContext.request.contextPath}/gathering/gPhotoAlbumList.do?page=${pm.startPage-1}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">◀</a>
				  </c:if>
				  <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				    <a href="${pageContext.request.contextPath}/gathering/gPhotoAlbumList.do?page=${i}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">${i}</a>
				  </c:forEach>
				  <c:if test="${pm.next && pm.endPage > 0}">
				    <a href="${pageContext.request.contextPath}/gathering/gPhotoAlbumList.do?page=${pm.endPage+1}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">▶</a>
				  </c:if>
				</div>
				
				<div id="createBtn">
					<button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gPhotoAlbumWriteCheck.do'">사진첩 만들기</button>
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
