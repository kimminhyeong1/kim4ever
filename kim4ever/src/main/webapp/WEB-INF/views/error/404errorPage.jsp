<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  response.setStatus(HttpServletResponse.SC_OK); %>
<html>
<head>
<title>타바404</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_error.css?after"  type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">		
</head>
<style>
</style>
<body>

<div class="container">

<div class="content">
  <h2 class="text-shadows">404</h2>
</div>

  <script>
    for (let i = 1; i <= 100; i++) {
      document.write('<div class="circle-container"><div class="circle"></div></div>');
    }
  </script> 
  <div class="container2">
 <img src="${pageContext.request.contextPath}/resources/mobile/fix.gif" alt="자전거대여소">			

<p>타바고장남</p>
<p>지속적으로 오류 발생시 타바로 연락주시기 바랍니다</p>
<button onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button>


</div>
</div>


</body>
</html>