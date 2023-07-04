<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.BikeJoinVo" %>
<%@page import = "com.myezen.myapp.domain.GatheringJoinVo" %>
<%@page import = "java.util.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<GatheringJoinVo> gjlist = (ArrayList<GatheringJoinVo>)request.getAttribute("gjlist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타:바-모임리스트</title>
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
#main #content h2{text-align:left; margin-top:50px; margin-left:200px;font-family: 'GangwonEdu_OTFBoldA'; font-size:30px;}
#content table {width:70%; border-collapse:collapse; margin:0 auto; line-height:50px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}

#content table tr th:nth-child(1){width:110px;}
#content table tr th:nth-child(2){width:50px;}
#content table tr th:nth-child(3){width:110px;}
#content table tr th:nth-child(4){width:50px;}
#content table tr th:nth-child(5){width:50px;}
#content table tr th:nth-child(6){width:100px; font-size:18px;}
#content table .report-count {display:inline-block;vertical-align:middle;margin-right:5px;}
#content table .icon-image {height:30px;vertical-align:middle;}
#content table .th-image {height:20px;vertical-align:middle;}
#content #gatheringList{color: #ff7700; margin-right:10px;} 
#content #GReportList{color: #000;} 
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
<script type="text/javascript">
	function fnDelete(memberId) {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href='<%=request.getContextPath()%>/admin/adminmemberDelete.do?memberId='+memberId;
		}
	}
	
	function confirmDelete(giidx) {
		  if (confirm("해당 모임을 삭제하시겠습니까?")) {
		    window.location.href = "${pageContext.request.contextPath}/admin/adminGatheringDelete.do?giidx=" + giidx;
		  }
		}

</script>
</head>

<body>

<div id="main">
	<%@include file="../header4.jsp"%>
	
	<div id="content">
	<h2><a id="gatheringList" href="${pageContext.request.contextPath}/admin/admingatheringList.do" >모임 리스트</a><a id="GReportList" href="${pageContext.request.contextPath}/admin/adminGReportList.do">모임 신고 내역</a></h2>
	<form action="${pageContext.request.contextPath}/admin/admingatheringList.do" method="get">
		<div class="search">
			<select id="searchType" name="searchType">
				<option value="">검색조건</option>
				<option value="gInfoName">모임명</option> 
				<option value="memberName">모임장</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요"/>
			<button type="submit" id="searchBtn">검색</button>
		</div>
	</form>	
	
	
		<table>
		  <tr>
		    <th>모임명</th>
		    <th>모임장</th>
		    <th>생성일</th>
		    <th>모임 인원</th>
		    <th>신고횟수</th>
		    <th>
		    <img src="../resources/btn/caution.png" alt="Warn" class="th-image" /> : 주의
		    <img src="../resources/btn/warn.png" alt="Caution" class="th-image" /> : 경고
		    </th>
		  </tr>
		  
		 <c:forEach var="gjv" items="${gjlist}">
		  <tr>
		    <td><a href="${pageContext.request.contextPath}/admin/admingatheringDetail.do?giidx=${gjv.giidx}">${gjv.gInfoName}</a></td>
		    <td>${gjv.memberName}</td>
		    <td>${gjv.gInfoCreationDay.substring(0, 16)}</td>
		    <td>${gjv.gInfoParticipating}</td>
		    <td>
				<span class="report-count">${gjv.REPORTCNT}번</span>
			  	<c:choose>
				    <c:when test="${gjv.REPORTCNT >= 5}">
				    	<img src="../resources/btn/warn.png" alt="Warn" class="icon-image" />
				    </c:when>
				    <c:when test="${gjv.REPORTCNT >= 3}">
				      	<img src="../resources/btn/caution.png" alt="Caution" class="icon-image" />
				    </c:when>
			  </c:choose>
			</td>
			<td>
				<c:if test="${gjv.REPORTCNT >= 5}">
			    	<button type="button" onclick="confirmDelete('${gjv.giidx}')">모임삭제</button>
		  		</c:if>
			</td>
		  </tr>	
		 </c:forEach> 	  
		</table>
		
		<table>
			<tr>
				<td>
					<c:if test="${pm.prev == true}">
						<a href="${pageContext.request.contextPath}/admin/admingatheringList.do?page=${pm.startPage-1}&searchType=${pm.scri.searchType}&keyword=${scri.keyword}">◀</a>
					</c:if>
				</td>
				<td>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
						<a href="${pageContext.request.contextPath}/admin/admingatheringList.do?page=${i}&searchType=${pm.scri.searchType}&keyword=${scri.keyword}">${i}</a>
					</c:forEach>
				</td>
				<td>
					<c:if test="${pm.next && pm.endPage > 0}">
						<a href="${pageContext.request.contextPath}/admin/admingatheringList.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${scri.keyword}">▶</a>
					</c:if>
				</td>
			</tr>
		</table>
		
		
			
	</div>
	
	<script>
document.addEventListener('DOMContentLoaded', function() {
  var tdElement = document.querySelector('#content table td:nth-child(4)'); // 네 번째 열(인덱스 3)의 테이블 셀을 선택합니다.
  var textContent = tdElement.textContent;
  if (textContent.length > 15) {
    tdElement.textContent = textContent.substring(0, 15) + '...';
  }
});
</script>
	
		
</div>
	
	<div id="bottom">
	</div>

</body>
<%@include file="../footer.jsp" %>
</html>