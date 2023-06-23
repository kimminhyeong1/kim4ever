<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<!DOCTYPE html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<nav class="side">
            <ul class="menu_list">
                <li>
                    <a href="#"><span class="title" onclick="location.href='<%=request.getContextPath()%>/admin/adminmemberList.do'">회원 관리</span></a>
                </li>
                <li>
                    <a href="#"><span class="title" onclick="location.href='<%=request.getContextPath()%>/admin/adminboardList.do'">게시판 관리</span></a>
                </li>
                <li>
                    <a href="#"><span class="title" onclick="location.href='<%=request.getContextPath()%>/admin/bikeList.do'">자전거 관리</span></a>
                </li>
                <li>
                    <a href="#"><span class="title" onclick="location.href='<%=request.getContextPath()%>/admin/rentalshopList.do'">대여소 관리</span></a>
                </li>
                <li>
                    <a href="#"><span class="title" onclick="location.href='<%=request.getContextPath()%>/admin/adminbikeError.do'">신고 내역</span></a>
                </li>
                <li>
                    <a href="#"><span class="title" onclick="location.href='<%=request.getContextPath()%>/admin/gSearch.do'">모임 관리</span></a>
                </li>
            </ul>
        </nav>
</body>
</html>