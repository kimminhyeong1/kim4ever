<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        /* 리셋코드 */
        *{margin:0;padding:0;}
        li{list-style:none;}

        /*사이드메뉴바, 로고, 로그인버튼*/
        #top_logo{width:1250px; height:200px; text-align:center; position:relative;}
        #top_logo .logo{display:inline-block; text-align:center; position:absolute; left:45.5%; top:50%; transform:translate(-50%, -50%);}
        #top_logo .logo img{width:200px; height:240px; margin-left:140px; cursor:pointer;transition: all 0.3s ease-in-out;}
        #top_logo .login {display:flex;justify-content:flex-end;float:right;}
        #top_logo .login ul {display:flex;list-style:none;margin:0;padding:0;}
        #top_logo .login li {margin-left:20px; font-family: 'GangwonEdu_OTFBoldA'; font-size:21px;}
        #top_logo .login a {display:block;padding:6px 10px;background-color:#333;color:#fff;border-radius:20px;text-decoration:none;transition:background-color 0.3s ease;}
        #top_logo .login a:hover {background-color: #666;}

        .side{width:500px;}

        #content{width:1250px; height:1200px;}
        #bottom{width:1250px; height:300px; }
    </style>
</head>
<body>
    <header>
        <div id="top_logo">
            <div class="logo" style="display:inline-block;">
                <h1><img src="${pageContext.request.contextPath}/resources/logo/logo6.jpg" alt="타:바" onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/></h1>
            </div>
            <div class="login">
                <ul>
                    <% if(session.getAttribute("memberName") != null) { %>
                        <li style="margin-top:10px;">관리자 모드 실행중</li>
                        <li><a href="<%=request.getContextPath() %>/member/memberLogOut.do">나가기</a></li>
                    <% } else { %>
                        <li><a href="<%=request.getContextPath() %>/member/memberLogin.do">로그인</a></li>
                        <li><a href="<%=request.getContextPath() %>/member/memberJoin.do">회원가입</a></li>  
                    <% } %> 
                </ul>
            </div>
        </div>	
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
                    <a href="#"><span class="title" onclick="location.href='<%=request.getContextPath()%>/admin/gSearch.do'">모임 관리</span></a>
                </li>
            </ul>
        </nav>
    </header>
</body>
</html>
