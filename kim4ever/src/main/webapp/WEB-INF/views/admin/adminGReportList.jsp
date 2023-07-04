<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.BikeJoinVo" %>
<%@page import = "java.util.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<BikeJoinVo> alist = (ArrayList<BikeJoinVo>)request.getAttribute("alist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타:바-모임신고내역리스트</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
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

#main{width:1250px; margin:35px auto 70px; text-align:center; }
#main #content{width:1250px; height:2400px;text-align:center;}
#main #bottom{width:1250px; height:300px; }
#main #content h2{text-align:left; margin-top:50px; margin-left:200px;font-family: 'GangwonEdu_OTFBoldA'; font-size:30px; }
#content table {width:70%; border-collapse:collapse; margin:0 auto; line-height:50px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width:60px;}
#content table tr th:nth-child(2){width:50px;}
#content table tr th:nth-child(3){width:100px;}
#content table tr th:nth-child(4){width:50px;}
#content table tr th:nth-child(5){width:130px;}
#content #gatheringList{color: #000; margin-right:10px;} 
#content #GReportList{color: #ff7700;} 
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content .search {text-align:right; margin-right:185px; margin-bottom:40px;}
#content .search select {width:120px;height:30px;font-size:14px;padding:5px; cursor:pointer;}
#content .search input[type="text"] {width:200px;height:17px;font-size:14px;padding:5px;}
#content .search #searchBtn{width:80px;height:30px;font-size:14px;padding:5px;text-align:center; font-family:'omyu_pretty'; font-size:21px; cursor:pointer; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content .search #searchBtn:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px}
.form-table input[type="submit"] {width:100px; height:30px; text-align:center; font-family: 'omyu_pretty'; font-size:15px; border-radius:10px; border:0px solid black; background:#ff9933;}
.form-table select,.form-table input[type="text"] { width:100px; height:30px; text-align:center; font-family: 'omyu_pretty'; font-size:15px; border-radius:10px; }

</style>

</head>

<body>

<div id="main">
	<%@include file="../header4.jsp"%>
	
	<div id="content">
	<h2><a id="gatheringList" href="${pageContext.request.contextPath}/admin/admingatheringList.do" >모임 리스트</a><a id="GReportList" href="${pageContext.request.contextPath}/admin/adminGReportList.do">모임 신고 내역</a></h2>
	<form action="${pageContext.request.contextPath}/admin/adminGReportList.do" method="get">
		<div class="search">
			<select id="searchType" name="searchType">
				<option value="">검색조건</option>
				<option value="gInfoName">모임명</option> 
				<option value="memberName">모임장</option>
				<option value="reporterName">신고자</option>
				<option value="gatheringReportContent">신고내용</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요"/>
			<button type="submit" id="searchBtn">검색</button>
		</div>
	</form>
	
		
		<table>
				<tr>
					<th>모임명</th>
					<th>모임장</th>
					<th>신고 요일</th>
					<th>신고자</th>
					<th>신고 내용</th>
				</tr>
				
			<c:forEach var="gdv" items="${gdlist}">
					<tr>
						<td>${gdv.gInfoName}</td>
						<td>${gdv.TL}</td>
						<td>${gdv.gatheringDeclarationDay.substring(0, 16)}</td>
						<td>${gdv.reporterName}</td>
						<td><a href="adminGReportDetail.do?gdix=${gdv.gdix}">${gdv.gatheringReportContent}</a></td>						
					</tr>
			</c:forEach> 
		</table>
			
		<table>
			<tr>
				<td>
					<c:if test="${pm.prev == true}">
						<a href="${pageContext.request.contextPath}/admin/adminGReportList.do?page=${pm.startPage-1}&searchType=${pm.scri.searchType}&keyword=${scri.keyword}">◀</a>
					</c:if>
				</td>
				<td>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
						<a href="${pageContext.request.contextPath}/admin/adminGReportList.do?page=${i}&searchType=${pm.scri.searchType}&keyword=${scri.keyword}">${i}</a>
					</c:forEach>
				</td>
				<td>
					<c:if test="${pm.next && pm.endPage > 0}">
						<a href="${pageContext.request.contextPath}/admin/adminGReportList.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${scri.keyword}">▶</a>
					</c:if>
				</td>
			</tr>
		</table>
		
		
	</div>
	
	<script>
document.addEventListener('DOMContentLoaded', function() {
	  var tdElements = document.querySelectorAll('#content table td'); // 해당 테이블 셀을 선택합니다.

	  tdElements.forEach(function(tdElement) {
	    var anchorElement = tdElement.querySelector('a'); // td 안에 있는 첫 번째 a 요소를 선택합니다.
	    if (anchorElement) {
	      var textContent = anchorElement.textContent;
	      if (textContent.length > 10) {
	        anchorElement.textContent = textContent.substring(0, 10) + '...';
	      }
	    }
	  });
	});
</script>
	
	
</div>
	
	<div id="bottom">
	</div>

</body>
<%@include file="../footer.jsp" %>
</html>