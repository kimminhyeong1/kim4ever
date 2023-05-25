<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		.menu_list {display:flex; flex-direction:column; align-items:left; margin-left:30px; clear:both; width:300px;}
		.menu_list li {width:100px; border-bottom:1px solid #f5f5f5; padding-top:40px; font-family:'GangwonEdu_OTFBoldA';}
		.menu_list li a{color:#000; text-decoration:none; font-weight:bold; font-size:21px;}

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

    </header>