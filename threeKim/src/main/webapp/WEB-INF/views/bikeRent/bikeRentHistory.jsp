<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜태그 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-대여 이력 보기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<style>
		#main{width:1440px; margin:35px auto 70px; text-align:center;}
		#main #content{width:1440px; height:2400px; text-align:center;}
		#main #bottom{width:1440px; height:300px; }
		#main #content h2{text-align:left; margin-top:50px; margin-left:80px;font-family: 'GangwonEdu_OTFBoldA'; font-size:27px;}
		#content table {width:90%; border-collapse:collapse; margin:60px auto 0; line-height:60px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
		#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
		#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
		#content table tr{font-size:10px;}
		#content table tr th:nth-child(2){width: 130px;}
		#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
		#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		
		
								/****************************모바일**************************/
@media (min-width: 300px) and (max-width: 940px)  {
	#main{width:auto; margin:35px auto 70px; text-align:center;}
		#main #content{width:auto; height:auto; text-align:center;}
		#main #bottom{width:auto; height:10px; }
		#main #content h2{text-align:left; margin-top:10px; margin-left:5% ;font-family: 'GangwonEdu_OTFBoldA'; font-size:17px;}
		#content table {width:90%; border-collapse:collapse; margin:0 auto; line-height:10px; font-family:'omyu_pretty'; font-size:10px;}
		#content table th{width:100px;padding: 1px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
		#content table td{padding: 1px; text-align:center;border-bottom:1px solid #CCCCCC;}
		#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
		#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		.hide{display:none;}
}    
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
								<th  class="hide">고객명</th>
								<th  class="hide">연락처</th>	
								<th>종류</th>
								<th>대여장소</th>
								<th>반납장소</th>
								<th>대여날짜</th>
								<th>대여시간</th>
								<th>반납시간</th>
								<th  class="hide">가격</th> 
							</tr>
							<c:forEach var="bjv" items="${bjvlist}">
								<tr>
									<td  class="hide">${bjv.memberName}</td>
									<td  class="hide">${bjv.memberPhone}</td>
									<td>${bjv.bikeType}</td>
									<td>${bjv.rentPlace}</td>
									<td>${bjv.returnPlace}</td>
									<td><!-- 대여날짜 -->
							            <fmt:parseDate value="${bjv.rentDay}" pattern="yyyy-mm-dd" var="parsedRentDay1" /><!-- 날짜 변경 -->
			            				<fmt:formatDate value="${parsedRentDay1}" pattern="yyyy-mm-dd" var="formattedRentDay1" /><!-- 시간 설정 변경 -->
				           	 			${formattedRentDay1}	
									</td>
									<td><!-- 대여시간 -->
							            <fmt:parseDate value="${bjv.rentDay}" pattern="yyyy-MM-dd HH:mm:ss.S" var="parsedRentDay2" /><!-- 날짜 변경 -->
			            				<fmt:formatDate value="${parsedRentDay2}" pattern="HH:mm" var="formattedRentDay2" /><!-- 시간 설정 변경 -->
				           	 			${formattedRentDay2}	
									</td>
									<td><!-- 반납시간 -->
							            <fmt:parseDate value="${bjv.returnDay}" pattern="yyyy-MM-dd HH:mm:ss.S" var="parsedRentDay3" /><!-- 날짜 변경 -->
			            				<fmt:formatDate value="${parsedRentDay3}" pattern="HH:mm" var="formattedRentDay3" /><!-- 시간 설정 변경 -->
				           	 			${formattedRentDay3}						
									</td>
									<td  class="hide">${bjv.rentPrice}원</td>
								</tr>
							</c:forEach>
						</table>
					
					</c:otherwise>
				</c:choose>
			</div>
			
			<div id="bottom"></div>
		</div>
		<%@include file="../footer.jsp" %>
	</body>
</html>