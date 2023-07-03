<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.BikeJoinVo" %>
<%@page import = "java.util.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<BikeJoinVo> klist = (ArrayList<BikeJoinVo>)request.getAttribute("klist");
%>

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

#main{width:1250px; margin:35px auto 70px; text-align:center; }
#main #content{width:1250px; height:2400px;text-align:center;}
#main #bottom{width:1250px; height:300px; }
#content table .status-available { color:green; }
#content table .status-rented { color:orange; }
#content table .status-disuse { color:red; }
#content table .status-error { color:red; }

#main #content h2{text-align:left; margin-top:50px; margin-left:200px;font-family: 'GangwonEdu_OTFBoldA'; font-size:30px;}
#content p{text-align:right; margin-right:200px;}
#content table {width:70%; border-collapse:collapse; margin:0 auto; line-height:50px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content #bikeAddBtn button{width:250px; height:40px; margin-top:20px; margin-left:630px; text-align:center; cursor:pointer; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content #bikeAddBtn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content table tr th:nth-child(1){width:50px;}
#content table tr th:nth-child(2){width:50px;}
#content table tr th:nth-child(3){width:50px;}
#content table tr th:nth-child(4){width:80px;}
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px;  border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content .search {text-align:right; margin-right:185px; margin-bottom:40px;}
#content .search select {width:120px;height:30px;font-size:14px;padding:5px; cursor:pointer;}
#content .search input[type="text"] {width:200px;height:17px;font-size:14px;padding:5px;}
#content .search #searchBtn{width:80px;height:30px;font-size:14px;padding:5px;text-align:center; font-family:'omyu_pretty'; font-size:21px; cursor:pointer; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content .search #searchBtn:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px}



</style>
<script type="text/javascript">
	function Delete(bkidx) {
		if(confirm(bkidx + " 자전거를 삭제하시겠습니까?")) {
			location.href='${pageContext.request.contextPath}/admin/adminBikeDelete.do?bkidx='+bkidx;
		}
	}
</script>
</head>

<body>

<div id="main">
	<%@include file="../header4.jsp"%>
	
	<div id="content">
		<h2>자전거 리스트</h2>
			<form action="${pageContext.request.contextPath}/admin/adminbikeList.do" method="get">
				<div class="search">
					<select id="searchType" name="searchType">
						<option value="">검색조건</option>
						<option value="bikeCode">번호</option> 
						<option value="bikeType">종류</option>
						<option value="bikeLocation">위치</option>
					</select>
					<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요"/>
					<button type="submit" id="searchBtn">검색</button>
				</div>
			</form>
		
		<table>
			<tr>
				<th>번호</th>
				<th>종류</th>
				<th>위치</th>
				<th>상태</th>
				<th></th>
			</tr>
	
		<c:forEach var="kv" items="${klist}">
			<tr>
				<td>${kv.bikeCode}</td>
				<td>${kv.bikeType}</td>
				<td>${kv.bikeLocation}</td>
				<td>
				<c:choose>
								<c:when test="${kv.bikeState eq 'Y'}">  
									 <span class="status-available">대여 가능</span>
								</c:when>
								<c:when test="${kv.bikeState eq 'N'}">  
									 <span class="status-rented">대여 중</span>
								</c:when>
								<c:when test="${kv.bikeState eq 'E'}">  
									 <a href="${pageContext.request.contextPath }/admin/adminbikeError.do" class="status-error">고장</a>
								</c:when>
								<c:when test="${kv.bikeState eq 'D'}">  
									 <span class="status-disuse">폐기</span>
								</c:when>
				</c:choose>				
				</td>
				<td>
				<c:choose>
					<c:when test="${kv.bikeState eq 'D'}">  
						
					</c:when>
					<c:otherwise> 
						<button type="button" id="Delbtn"onclick="Delete('${kv.bkidx}');">삭제</button>
					</c:otherwise>
				</c:choose>
				</td>
							
			</tr>
		</c:forEach>		
		</table>
		
			<div id="bikeAddBtn">
				<button onclick="location.href='${pageContext.request.contextPath}/bikeRent/bikeRentInfo.do'">자전거 종류 등록/삭제</button>
			</div>
			
			<div id="bikeAddBtn">
				<button onclick="location.href='${pageContext.request.contextPath}/admin/adminbikeRegister.do'">자전거 추가 등록</button>
			</div>
		
			<table>
			<tr>
				<td>
					<c:if test="${ pm.prev == true }">
					<a href="${pageContext.request.contextPath }/admin/adminbikeList.do?page=${pm.startPage-1}&searchType=${ pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } "> ◀</a>
					</c:if>
				</td>
				<td>
					<c:forEach var="i"  begin="${pm.startPage}" end="${pm.endPage}"  step="1" >
						<a href="${pageContext.request.contextPath }/admin/adminbikeList.do?page=${ i }&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">${ i }</a>
					</c:forEach>	
				</td>
					<td>
					<c:if test="${pm.next&&pm.endPage >0 }">
					<a href="${pageContext.request.contextPath }/admin/adminbikeList.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">▶</a>
					</c:if>
				</td>
			</tr>
		</table>
	
	
	
	
	</div>
	
	
	
	
	</div>
	
	<div id="bottom">
	</div>

</body>
<%@include file="../footer.jsp" %>
</html>