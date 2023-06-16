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
<title>Insert title here</title>
<style>
/*리셋코드*/

*{margin:0;padding:0;}
li{list-style:none;}
a{color:inherit; text-decoration:none;}

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
#content #memberList{color: #ff7700; margin-right:10px;} 
#content #memberOutList{color:#000;}
#content table {width:70%; border-collapse:collapse; margin:0 auto; line-height:50px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width:20px;}
#content table tr th:nth-child(2){width:100px;}
#content table tr th:nth-child(3){width:95px;}
#content table tr th:nth-child(4){width:80px;}
#content table tr th:nth-child(5){width:40px;}
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content .search {text-align:right; margin-right:185px; margin-bottom:40px;}
#content .search select {width:120px;height:30px;font-size:14px;padding:5px;}
#content .search input[type="text"] {width:200px;height:17px;font-size:14px;padding:5px;}
#content .search #searchBtn{width:80px;height:30px;font-size:14px;padding:5px;text-align:center; font-family:'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content .search #searchBtn:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px}

 

</style>
<script type="text/javascript">
	function fnDelete(memberId) {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href='<%=request.getContextPath()%>/admin/adminmemberDelete.do?memberId='+memberId;
		}
	}
</script>
</head>

<body>

<div id="main">
	<%@include file="../header4.jsp"%>
	
	<div id="content">
	<h2><a id="memberList" href="${pageContext.request.contextPath}/admin/adminmemberList.do" >회원 리스트</a><a id="memberOutList" href="${pageContext.request.contextPath}/admin/adminmemberOutList.do">탈퇴 회원 리스트</a></h2>
	<form action="${pageContext.request.contextPath}/admin/adminmemberList.do" method="get">
		<div class="search">
			<select id="searchType" name="searchType">
				<option value="memberId">아이디</option> 
				<option value="memberName">이름</option>
				<option value="memberType">등급</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요"/>
			<button type="submit" id="searchBtn">검색</button>
		</div>
	</form>
		
		<table>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>가입일</th>
					<th>등급</th>
					<th>삭제</th>
				</tr>
				
				<c:forEach var="bjv" items="${alist}">
					<tr>
						<td><a href="adminmemberListProfile.do?memberId=${bjv.memberId}">${bjv.memberId}</a></td>
						<td>${bjv.memberName}</td>
						<td>${bjv.writeDay.substring(0, 10)}</td>
						<td>${bjv.memberType}</td>
						<td>
							<c:choose>
								<c:when test="${bjv.memberType eq '관리자'}">  
									삭제금지
								</c:when>
								<c:otherwise> 
									<button type="button" onclick="fnDelete('${bjv.memberId}');">삭제</button>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
		</table>
		<table>
			<tr>
				<td>
					<c:if test="${ pm.prev == true }">
					<a href="${pageContext.request.contextPath }/admin/adminmemberList.do?page=${pm.startPage-1}&searchType=${ pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } "> ◀</a>
					</c:if>
				</td>
				<td>
					<c:forEach var="i"  begin="${pm.startPage}" end="${pm.endPage}"  step="1" >
						<a href="${pageContext.request.contextPath }/admin/adminmemberList.do?page=${ i }&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">${ i }</a>
					</c:forEach>	
				</td>
					<td>
					<c:if test="${pm.next&&pm.endPage >0 }">
					<a href="${pageContext.request.contextPath }/admin/adminmemberList.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">▶</a>
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