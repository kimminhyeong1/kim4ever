<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜태그 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>타:바-대여 이력 보기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
		<style>
		#main{width:1250px; margin:35px auto 70px; text-align:center;}
		#main #content{width:1250px; height: auto; text-align:center;}
		#main #bottom{width:1250px;  height: auto; }
		#main #content h2{text-align:left; margin-top:50px; margin-left:200px; font-weight:normal; font-size:30px;}
		#content table {width:70%; border-collapse:collapse; margin:60px auto 0; line-height:50px; ;font-family:'omyu_pretty'; font-size:24px;}
		#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
		#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
		#content table tr th:nth-child(1){width: 70px;}
		#content table tr th:nth-child(2){width: 100px;}
		#content table tr th:nth-child(3){width: 70px;}
		#content table tr th:nth-child(4){width: 70px;}
		#content table tr th:nth-child(5){width: 130px;}
		#content table tr th:nth-child(6){width: 70px;}
		#content table tr th:nth-child(7){width: 70px;}
		#content table tr th:nth-child(8){width: 60px;}

		#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
		#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		.Paging{text-align: center;font-size: 30px;margin-top: 30px;padding: 10px;}
		.Paging a{padding: 5px;}
		/****************************모바일**************************/
		@media (min-width: 300px) and (max-width: 940px)  {
			#main{width:auto; min-height:87vh; margin:0 auto; text-align:center;}
			#main #content{width:auto; height:auto;}
			#main #content h2{text-align:left; margin-top:50px; margin-left:16px; margin-left:10%; font-size:15px; }
			#main #bottom{width:auto; height:10px;}
			#content table {width:80vw; border-collapse:collapse; margin:10px auto 0; line-height:13px; font-size:14px; font-family: 'omyu_pretty'; cursor:pointer; }
			#content table th{padding: 10px;text-align: center;}
			#content table td{padding: 5px; text-align:center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
			#content #btn{text-align:right; margin-top:20px; margin-right:5%; }
			#content #btn button{width:60px; height:30px; text-align:center; font-family: 'omyu_pretty'; font-size:15px;  border-radius:20px; border:0px solid #ff9933; }
			
			.cell-content {width: 25vw; overflow: hidden; text-overflow: ellipsis;}
			
			
			
			/*메뉴바 테이블*/
			.tab__contents {display:none;}
			.show {display: block;} 
			.tab__list{margin-top:3%;}
			.tab__list li{ display: inline-block; border: none; background-color: #f8f8f8; padding: 5px 7px; cursor: pointer;  font-family: 'omyu_pretty'; font-size:15px; border-radius:20px; margin-top:10px;0.4);}
			.tab__list__item.active {background-color:#ff9933; color:#fff; border:none ;}
			
			 a {color: inherit; text-decoration: none;}
			 .pageing{font-size:20px !important;} 
			 
		
		}
		</style>
		<script type="text/javascript">
			function fnReturn() {
				if(confirm("반납 하시겠습니까?")) {
					location.href='';
				}
			}
		</script>
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<div id="main">
			<div id="content">
				<h2>대여 이력</h2>
				<c:choose>
					<c:when test="${empty bjvlist}"><!-- 대여이력이 없으면 실행 -->
							<div style="margin-top: 50px;margin-left: 80px;font-family: 'GangwonEdu_OTFBoldA';font-size: 27px;"> 대여 이력이 없습니다. </div>
					</c:when>
					<c:otherwise>
						<table>
							<tr>
								<th>고객명</th>
								<th>자전거종류</th>
								<th>대여장소</th>
								<th>반납장소</th>
								<th>대여날짜</th>
								<th>대여시간</th>
								<th>반납시간</th>
								<th>가격</th> 
							</tr>
							<c:forEach var="bjv" items="${bjvlist}">
								<tr>
									<td>${bjv.memberName}</td>
									<td>${bjv.bikeType}</td>
									<td>${bjv.rentPlace}</td>
									<td>${bjv.returnPlace}</td>
									<td><!-- 대여날짜 -->
							            <fmt:parseDate value="${bjv.rentDay}" pattern="yyyy-mm-dd" var="parsedRentDay1" /><!-- 날짜 변경 -->
			            				<fmt:formatDate value="${parsedRentDay1}" pattern="yyyy-mm-dd" var="formattedRentDay1" /><!-- 시간 설정 변경 -->
				           	 			${formattedRentDay1}	
									</td>
									<td><!-- 대여시간 -->
							            <fmt:parseDate value="${bjv.rentDay}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedRentDay2" /><!-- 날짜 변경 -->
			            				<fmt:formatDate value="${parsedRentDay2}" pattern="HH:mm" var="formattedRentDay2" /><!-- 시간 설정 변경 -->
				           	 			${formattedRentDay2}	
									</td>
									<td><!-- 반납시간 -->
							            <fmt:parseDate value="${bjv.returnDay}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedRentDay3" /><!-- 날짜 변경 -->
			            				<fmt:formatDate value="${parsedRentDay3}" pattern="HH:mm" var="formattedRentDay3" /><!-- 시간 설정 변경 -->
				           	 			${formattedRentDay3}						
									</td>
									<td>${bjv.rentPrice}원</td>
								</tr>
							</c:forEach>
						</table>
						<div class="Paging">
							<c:if test="${pm.prev == true}">
								<a href="${pageContext.request.contextPath}/bikeRent/bikeRentHistory.do?page=${pm.startPage-1}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">◀</a>
							</c:if><!--if문-end-->
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
							<a href="${pageContext.request.contextPath}/bikeRent/bikeRentHistory.do?page=${i}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">${i}</a>
							</c:forEach><!--for문-end-->
							<c:if test="${pm.next && pm.endPage > 0}">
								<a href="${pageContext.request.contextPath}/bikeRent/bikeRentHistory.do?page=${pm.endPage+1}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">▶</a>
							</c:if><!--if문-end-->
						</div><!-- 페이징 -->
					</c:otherwise>
				</c:choose>
			</div>
		
		</div>
		<%@include file="../footer.jsp" %>
	</body>
</html>