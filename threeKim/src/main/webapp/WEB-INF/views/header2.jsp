<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/*리셋코드*/
*{margin:0;padding:0;}
li{list-style:none;}

/*사이드메뉴바, 로고, 로그인버튼*/
#top_logo{width:1440px; height:200px; text-align:center;}
#top_logo .logo{display:inline-block; text-align:center;}
#top_logo .logo img{width:200px; height:240px; margin-left:140px; cursor:pointer;transition: all 0.3s ease-in-out;}
#top_logo .login {display:flex;justify-content:flex-end;float:right;}
#top_logo .login ul {display:flex;list-style:none;margin:0;padding:0;}
#top_logo .login li {margin-left:20px; font-family: 'GangwonEdu_OTFBoldA'; font-size:21px;}
#top_logo .login a {display:block;padding:6px 10px;background-color:#333;color:#fff;border-radius:20px;text-decoration:none;transition:background-color 0.3s ease;}
#top_logo .login a:hover {background-color: #666;}

/*사이드바*/
.top-menu img {width: 50px; height:auto; float:left;}
.sub-menu{position: fixed; z-index: 9999; width: 100px; height: 300px; transition:0.5s; border-top-right-radius:20px; border-bottom-right-radius:20px;}
.sub-menu ul {list-style: none; padding:0; margin-top: 100px; text-align:left;}
.sub-menu{width: 0; height: 400px; overflow:hidden; background:white ;transition-duration: 0.5s;}
.main-nav-left:hover > .sub-menu{height: 100%;/*사이드바 높이*/width: 450px;/* background: #F7F7F7; */  border:1px solid #999; border-left: 0; overflow: hidden}

/*사이드바 내부*/
.sub-menu-list {display:flex; flex-direction:column; align-items:left; margin-left:30px; clear:both; }
.sub-menu-list img{width:200px; height: auto;}
.sub-menu-list li {width:450px; border-bottom:1px solid #f5f5f5; padding-top: 120px; font-family: 'GangwonEdu_OTFBoldA';}
.sub-menu-list li:first-child {width: 450px;border-bottom: 2px solid orange; padding-top: 120px;}
.sub-menu-list li a{color:#000; text-decoration:none; font-weight:bold; font-size: 21px;}
.sub-menu-list li p{color:#000; text-decoration:none; font-weight:bold; font-size: 21px;}
.sub-menu-list li:hover a {color:#999;text-shadow:none;}

/*사이드바 내부 상단 로그인,회원가입*/
.sub-menu .top-login {display:flex; justify-content:space-between; align-items:center; background-color:#f5f5f5;padding:10px; margin-bottom:10px;}
.sub-menu .top-login a {font-family:'Roboto', sans-serif;  font-size:18px;  text-decoration:none; color:#555; width:50%; text-align:center; padding:10px;}
.sub-menu .top-login a:first-child { border-right: 1px solid #ccc;}

/*메뉴*/
#menu {width: 1440px;height: 100px; text-align:center; display:flex; justify-content:center; align-items:center; box-sizing:border-box;}
#menu p {font-size: 21px; font-weight: bold; font-family: 'GangwonEdu_OTFBoldA'; margin: 20px 40px; margin-top:40px;}
#menu p:hover {color:#ff9900; cursor:pointer;

#content{width:1440px; height:1200px;}
#bottom{width:1440px; height:300px; }

</style>

	<div id="top_logo">
	<div class = main-nav-left> 
		<a href="#" class="top-menu"><img src="${pageContext.request.contextPath}/resources/logo/menu.png"></a><!-- SHOP - 서브메뉴 생성 -->        
			<div class="sub-menu">
				<div class="top-login">
					<a href="<%=request.getContextPath() %>/member/memberLogin.do">로그인</a>
					<a href="<%=request.getContextPath() %>/member/memberJoin.do">회원가입</a>
				</div>

				<ul class ="sub-menu-list">
					<li>
						<p>김가네 님</p>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/member/memberMypage.do'">회원정보 수정</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/rent/rentHistory.do'">대여내역</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/member/memberList.do'">회원관리</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/rent/rentFaultList.do'">신고내역</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">공지사항</span></a>
					</li>
				</ul>
			</div>
	</div>
		<div class="logo" style="display:inline-block;">
		<h1><img src="${pageContext.request.contextPath}/resources/logo/logo7.jpg" alt="타:바" onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/></h1>
		</div>
		<div class="login">
		<ul>
			<li><a href="<%=request.getContextPath() %>/member/memberLogin.do">로그인</a></li>
			<li><a href="<%=request.getContextPath() %>/member/memberJoin.do">회원가입</a></li>
		</ul>
		</div>
	</div>

	
	<div id="menu">
		<p>나의 소모임</p>
		<p>내가 찜한 소모임</p>
		<p>소모임 검색</p>
		<p>근처 모임</p>
		<p>회원 관리</p>
		
		
	</div>
