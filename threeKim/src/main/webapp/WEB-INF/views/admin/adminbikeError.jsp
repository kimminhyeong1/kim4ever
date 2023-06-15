<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.BikeJoinVo" %>
<%@page import = "com.myezen.myapp.domain.PageMaker" %>
<%@page import = "com.myezen.myapp.domain.SearchCriteria" %>
<%@page import = "java.util.*" %>      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*리셋코드*/

*{margin:0;padding:0;}
li{list-style:none;}
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'KCC-Ganpan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

#main{width:1250px; margin:35px auto 70px; text-align:center;}
#main #content{width:1250px; height:2400px; text-align:center;}
#main #bottom{width:1250px; height:300px; }
#main #content h2{text-align:left; margin-top:50px; margin-left:200px;font-family: 'GangwonEdu_OTFBoldA'; font-size:30px;}
#content table {width:70%; border-collapse:collapse; margin:0 auto; line-height:50px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width:20px;}
#content table tr th:nth-child(2){width:100px;}
#content table tr th:nth-child(3){width:70px;}
#content table tr th:nth-child(4){width:100px;}
#content table tr th:nth-child(5){width:120px;}
#content table tr th:nth-child(6){width:120px;}
#content table tr th:nth-child(7){width:350px;}
#content table tr th:nth-child(8){width:180px;}
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content #bikeError{color: #ff7700; margin-right:10px;} 
#content #bikeRepair{color: #000;} 
#content .search {text-align:right; margin-right:185px; margin-bottom:40px;}
#content .search select {width:120px;height:30px;font-size:14px;padding:5px;}
#content .search input[type="text"] {width:200px;height:17px;font-size:14px;padding:5px;}
#content .search #searchBtn{width:80px;height:30px;font-size:14px;padding:5px;text-align:center; font-family:'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content .search #searchBtn:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px}

</style>
</head>
<body>
<%@include file="../header4.jsp" %>
<div id="main">
	<div id="content">
		<h2><a id="bikeError" href="${pageContext.request.contextPath}/admin/adminbikeError.do">신고 내역</a> <a id="bikeRepair" href="${pageContext.request.contextPath}/admin/adminbikeRepairList.do">수리 내역</a></h2>
		<form action="${pageContext.request.contextPath }/admin/adminbikeError.do" method="get">
		<div class="search">
			<select id="searchType" name="searchType">
				<option value="memberName">고객명</option> 
				<option value="memberPhone">연락처</option>
				<option value="rentPlace">대여소</option>
				<option value="errorContent">내용</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요"/>
			<button type="submit" id="searchBtn">검색</button>
		</div>
		</form>
		<table>
				<tr>
					<th>번호</th>
					<th>고객명</th>
					<th>연락처</th>
					<th>대여소</th>
					<th>종류</th>
					<th>번호</th>		
					<th>신고시간</th>
					<th>내용</th>				
				</tr>
			<c:forEach var="ejv" items="${elist}">
					<tr>						
						<td>${ejv.eidx }
						<td>${ejv.memberName}</td>
						<td>${ejv.memberPhone}</td>
						<td>${ejv.rentPlace}</td>
						<td>
						<c:choose>
								<c:when test="${ejv.bikeType eq '일반자전거'}">  
									일반
								</c:when>
								<c:when test="${ejv.bikeType eq '전기자전거'}">  
									전기
								</c:when>
							</c:choose>
						</td>
						<td>${ejv.bikeCode}</td>  
						<td>
				            <fmt:parseDate value="${ejv.errorDay}" pattern="yyyy-MM-dd HH:mm" var="parsedRentDay" /><!-- 날짜 변경 -->
            				<fmt:formatDate value="${parsedRentDay}" pattern="yyyy-MM-dd HH:mm" var="formattedRentDay" /><!-- 시간 설정 변경 -->
	           	 			${formattedRentDay}
						</td>   
						<td><a href="adminbikeErrorContent.do?eidx=${ejv.eidx}">${ejv.errorContent}</a></td>
			
					</tr>
			</c:forEach>
		</table>
		
		<table>
			<tr>
				<td>
					<c:if test="${ pm.prev == true }">
					<a href="${pageContext.request.contextPath }/admin/adminbikeError.do?page=${pm.startPage-1}&searchType=${ pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } "> ◀</a>
					</c:if>
				</td>
				<td>
					<c:forEach var="i"  begin="${pm.startPage}" end="${pm.endPage}"  step="1" >
						<a href="${pageContext.request.contextPath }/admin/adminbikeError.do?page=${ i }&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">${ i }</a>
					</c:forEach>	
				</td>
					<td>
					<c:if test="${pm.next&&pm.endPage >0 }">
					<a href="${pageContext.request.contextPath }/admin/adminbikeError.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">▶</a>
					</c:if>
				</td>
			</tr>
		</table>
		
	
		
	
	
	
	
	
	</div>
	
	<div id="bottom">
	</div>
</div>
</body>

<%-- <%@include file="../footer.jsp" %> --%>
</html>