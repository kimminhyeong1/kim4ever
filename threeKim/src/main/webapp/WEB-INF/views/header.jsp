<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>

<style>
/*리셋코드*/
*{margin:0;padding:0;}
li{list-style:none;}
/*헤더부분 영역*/
header{width: 1250px;margin: 35px auto 70px;text-align: center;}
/*사이드메뉴바, 로고, 로그인버튼*/
#top_logo{width:1250px; height:200px; text-align:center; position:relative;}
#top_logo .logo{display:inline-block; text-align:center; position:absolute; left:45.5%; top:50%; transform:translate(-50%, -50%);}
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
.sub-menu-list {display:flex; flex-direction:column; align-items:left; margin-left:30px; clear:both;}
.sub-menu-list li {width:450px; border-bottom:1px solid #f5f5f5; padding-top:40px; font-family:'GangwonEdu_OTFBoldA';}
.sub-menu-list li a{color:#000; text-decoration:none; font-weight:bold; font-size:21px;}
.sub-menu-list li p{color:#000; text-decoration:none; font-weight:bold; font-size:25px;}
.sub-menu-list li:hover a {color:#999;text-shadow:none;}
.sub-menu-list #bike{width:450px; border-bottom: 2px solid #ff9933;}
.sub-menu-list #gathering{width:450px; border-bottom:2px solid #99CC99;}


/*사이드바 내부 상단 로그인,회원가입*/
.sub-menu .top-login {display:flex;justify-content:space-between;align-items:center;background-color:#f5f5f5;padding:10px;margin-bottom:10px;}
.sub-menu .top-login a {font-family:'Roboto', sans-serif; font-size:18px; text-decoration none;color:#555; width:50%;text-align:center;padding:10px;}
.sub-menu .top-login a:first-child {border-right: 1px solid #ccc;}

/*메뉴*/
#menu {width: 1250px;height: 100px; text-align:center; display:flex; justify-content:center; align-items:center; box-sizing:border-box;}
#menu p {font-size: 21px; font-weight: bold; font-family: 'GangwonEdu_OTFBoldA'; margin: 20px 40px; margin-top:40px;}
#menu p:hover {color:#ff9900; cursor:pointer;

#content{width:1250px; height:1200px;}
#bottom{width:1250px; height:300px; }

</style>
<header>
	<div id="top_logo">
	<div class = main-nav-left> 
		<a href="#" class="top-menu"><img src="${pageContext.request.contextPath}/resources/logo/menu.png"></a><!-- SHOP - 서브메뉴 생성 -->        
			<div class="sub-menu">
				<div class="top-login">
	           <% if(session.getAttribute("memberName") != null) { %>
	                <a href="<%=request.getContextPath()%>/member/memberMypage.do"><%= session.getAttribute("memberName") %>님</a>
	                <a href="<%=request.getContextPath() %>/member/memberLogOut.do">로그아웃</a>
	             <% } else { %>
	                <a href="<%=request.getContextPath() %>/member/memberLogin.do">로그인</a>
	                <a href="<%=request.getContextPath() %>/member/memberJoin.do">회원가입</a>
	             <% } %> 
	           
	           </div>
	           
				
	
				<ul class ="sub-menu-list">
					
					<li>
						<p id="bike">자전거 대여</p>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/member/memberMypage.do'">마이페이지</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentHistory.do'">대여내역</span></a>
					</li>
					
					
					<% String membertype = (String) pageContext.findAttribute("membertype"); %>
	
					<% if (membertype != null && membertype.equals("관리자")) { %>
					<li>
	                       <a href="#"><span class="title" onclick="location.href='<%=request.getContextPath()%>/member/memberList.do'">회원관리</span></a>
	                   </li>
	                   
	                   <li>
	                       <a href="#"><span class="title" onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentFaultList.do'">신고내역</span></a> 
	                   </li>
	               	<% } %>
				
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">공지사항</span></a>
					</li>
					
					<li>
						<p id="gathering">자전거 소모임</p>
					</li>
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/gathering/gMyPage.do'">나의 소모임</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/gathering/gMyWish.do'">내가 찜한 소모임</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/gathering/gSearch.do'">소모임 검색</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/gathering/gCreate.do'">모임 만들기</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/'">회원관리</span></a>
					</li>
				</ul>
				
			</div>
	</div>
	
		<div class="logo" style="display:inline-block;">
		<h1><img src="${pageContext.request.contextPath}/resources/logo/logo6.jpg" alt="타:바" onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/></h1>
		</div>
		<div class="login">
	   		<ul>
		      <% if(session.getAttribute("memberName") != null) { %>
		            <li style="margin-top:10px;"><%= session.getAttribute("memberName") %>님</li>
		            <li><a href="<%=request.getContextPath() %>/member/memberLogOut.do">로그아웃</a></li>
   		            <li><a href="<%=request.getContextPath() %>/bikeRent/bikeRentUseList.do">이용중인내역</a></li>
		            <li><a href="<%=request.getContextPath() %>/bikeRent/bikeRentReturn.do">반납하기</a></li> 
		        <% } else { %>
		            <li><a href="<%=request.getContextPath() %>/member/memberLogin.do">로그인</a></li>
		            <li><a href="<%=request.getContextPath() %>/member/memberJoin.do">회원가입</a></li>  
		        <% } %> 
		    </ul>
		</div>
	    			
	   	
	</div>
	
	
			
	
	<div id="menu">		
		<p onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentQR.do'">QR 대여하기 </p>
		<p onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentInfo.do'">자전거 소개</p>
		<p onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentLocation.do'">대여소 위치</p>
		<p onclick="location.href='<%=request.getContextPath()%>/course/courseIntro.do'">코스 소개</p>
		<p onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">게시판</p>
		<p onclick="location.href='<%=request.getContextPath()%>/gathering/gList.do'">자전거 모임</p>
	</div>
</header>
	
