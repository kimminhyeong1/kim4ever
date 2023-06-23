<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  response.setStatus(HttpServletResponse.SC_OK); %>
<html>
<head>
<title>타바는 수리중!!..</title>
</head>
<body>
<div class="using">	<img src="${pageContext.request.contextPath}/resources/mobile/fix.gif" alt="자전거대여소"></div>				

<p>타바고장남</p>
<p>404</p>
<p>지속적으로 오류 발생시 타바로 연락주시기 바랍니다</p>
<button onclick="history.go(-1)">뒤로</button>

</body>
</html>