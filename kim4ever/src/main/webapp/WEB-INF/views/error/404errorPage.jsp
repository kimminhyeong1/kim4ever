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
  <h2 class="title">404</h2>
  
</div>

  <script>
    for (let i = 1; i <= 100; i++) {
      document.write('<div class="circle-container"><div class="circle"></div></div>');
    }
  </script> 
  <div class="container2">
 <img src="${pageContext.request.contextPath}/resources/mobile/fix2.gif" alt="자전거대여소">			

<p style="font-size: 27px; font-weight: bold; margin-bottom: 10px;">죄송합니다. 페이지를 찾을 수 없습니다.</p>
<p>요청하신페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.</p>
<p>지속적으로 오류발생시 타:바로 연락주시기 바랍니다.</p>
<p>대표전화:063-000-0000</p>


<button onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button>


</div>
</div>


</body>
</html>