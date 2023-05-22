<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<%@page import = "java.util.*" %>    
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<MemberVo> alist = (ArrayList<MemberVo>)request.getAttribute("alist");
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

#main{width:1440px; margin:35px auto 70px; text-align:center; }
#main #content{width:1440px; height:2400px;text-align:center;}
#main #bottom{width:1440px; height:300px; }
#main #content h2{text-align:left; margin-top:50px; margin-left:300px;font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}
#content table {width:60%; border-collapse:collapse; margin:60px auto 0; line-height:60px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width:30px;}
#content table tr th:nth-child(2){width:40px;}
#content table tr th:nth-child(3){width:120px;}
#content table tr th:nth-child(4){width:40px;}
#content table tr th:nth-child(5){width:30px;}
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}

</style>
<script type="text/javascript">
	function fnDelete(memberId) {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href='<%=request.getContextPath()%>/member/memberDelete.do?memberId='+memberId;
		}
	}
</script>
</head>
<body>
<div id="main">
	
	<%@include file="../header.jsp"%>

	<div id="content">
		<h2>회원 리스트</h2>
		<table>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>가입일</th>
					<th>등급</th>
					<th>삭제</th>
				</tr>
				<%for(MemberVo mv : alist){ %>
				<tr>
					<%-- <td><%=mv.getMemberid() %></td> --%>
					<td><a href="memberListProfile.do?memberId=<%=mv.getMemberid()%>"><%=mv.getMemberid() %></a></td>
					<td><%=mv.getMembername() %></td>
					<td><%=mv.getWriteday() %></td>
					<td><%=mv.getMembertype() %></td>
					<td>
					<% if (mv.getMembertype().equals("관리자")) { %>
						삭제금지
					<% } else { %>
						<button type="button" onclick="fnDelete('<%=mv.getMemberid()%>');">삭제</button>
					<% } %>		
					</td>
				</tr>
				<%} %>
		</table>
		
	</div>
	
	
	
	
	</div>
	
	<div id="bottom">
	</div>

</body>
<%@include file="../footer.jsp" %>
</html>