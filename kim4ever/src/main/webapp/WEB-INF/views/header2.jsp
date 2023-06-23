<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/*리셋코드*/
*{margin:0;padding:0; word-break:keep-all}
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

/*사이드바*/
.top-menu img {width: 50px; height:auto; float:left;}
.sub-menu{position: fixed; z-index: 9999; width: 100px; height: 300px; transition:0.5s; border-top-right-radius:20px; border-bottom-right-radius:20px;}
.sub-menu ul {list-style: none; padding:0; margin-top: 100px; text-align:left;}
.sub-menu{width: 0; height: 400px; overflow:hidden; background:white ;transition-duration: 0.5s;}
.main-nav-left:hover > .sub-menu{height: 100%;/*사이드바 높이*/width: 450px;/* background: #F7F7F7; */  border:1px solid #999; border-left: 0; overflow: hidden}

/*사이드바 내부*/
.sub-menu-list {display:flex; flex-direction:column; align-items:left; margin-left:30px; clear:both; }
.sub-menu-list li {width:450px; border-bottom:1px solid #f5f5f5; padding-top:40px; font-family:'GangwonEdu_OTFBoldA';}
.sub-menu-list li a{color:#000; text-decoration:none; font-weight:bold; font-size: 21px;}
.sub-menu-list li p{color:#000; text-decoration:none; font-weight:bold; font-size: 25px;}
.sub-menu-list li:hover a {color:#999;text-shadow:none;}
.sub-menu-list li:first-child {width:450px;border-bottom: 2px solid #ff9933; }
.sub-menu-list li:nth-child(6){width:450px; border-bottom:2px solid #99CC99; }


/*사이드바 내부 상단 로그인,회원가입*/
.sub-menu .top-login {display:flex; justify-content:space-between; align-items:center; background-color:#f5f5f5;padding:10px; margin-bottom:10px;}
.sub-menu .top-login a {font-family:'Roboto', sans-serif;  font-size:18px;  text-decoration:none; color:#555; width:50%; text-align:center; padding:10px;}
.sub-menu .top-login a:first-child { border-right: 1px solid #ccc;}

/*메뉴*/
#menu {width: 1250px;height: 100px; text-align:center; display:flex; justify-content:center; align-items:center; box-sizing:border-box;}
#menu p {font-size: 21px; font-weight: bold; font-family: 'GangwonEdu_OTFBoldA'; margin: 20px 40px; margin-top:40px;}
#menu p:hover {color:#99CC99; cursor:pointer;}

#content{width:1250px; height:1200px;}
#bottom{width:1250px; height:300px; }
 .hidden_img {display: none; }
 .change{width: 85px; height: 36px; margin: 0 auto; position: absolute; top: 48px; right:0;}
.change img{width:100%; height:100%;}

/****************************모바일**************************/
@media (min-width: 300px) and (max-width: 940px)  {
header{width:auto;margin:0 auto;}
/*사이드메뉴바, 로고, 로그인버튼*/
#top_logo{width:auto; height:85px; text-align:center; position:relative; margin-top:15px;}
#top_logo .logo{display:inline-block; text-align:center; position:absolute; transform:translate(-50%, -50%);}
#top_logo .logo img{width:75px; height:80px; margin-left:22%; cursor:pointer;transition: all 0.3s ease-in-out;}
#top_logo .login {display:flex;justify-content:flex-end;float:right; margin-right:3%}
#top_logo .login ul {display:flex;list-style:none;margin-top:-5px; padding:0;   flex-direction: column; margin-bottom:5px;}
#top_logo .login li {margin-left:5px; font-family: 'GangwonEdu_OTFBoldA'; font-size:10px;}
#top_logo .login a {display:block;padding:3px 5px;margin-top:5px;background:#99CC99; color:black;border-radius:20px;text-decoration:none;transition:background-color 0.3s ease; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); }
#top_logo .login a:hover {background-color: #666;}

/*사이드바*/
.top-menu img {width: 30px; height:auto; float:left; margin-left:3%}
.sub-menu{position: fixed; z-index: 9999; width: 50px; height: 150px; transition:0.5s; border-top-right-radius:20px; border-bottom-right-radius:20px;}
.sub-menu ul {list-style: none; padding:0;  text-align:left;}
.sub-menu{width: 0; height: 200px; overflow:hidden; background:white ;transition-duration: 0.5s;}
.main-nav-left:hover > .sub-menu{height: 100%;/*사이드바 높이*/width: 70%;/* background: #F7F7F7; */  border:1px solid #999; border-left: 0; overflow: hidden}

/*사이드바 내부*/
.sub-menu-list {display:flex; flex-direction:column; align-items:left; margin-left:30px; clear:both;}
.sub-menu-list li {width:auto; border-bottom:1px solid #f5f5f5; padding-top:20px; font-family:'GangwonEdu_OTFBoldA';}
.sub-menu-list li a{color:#000; text-decoration:none; font-weight:bold; font-size:15px;}
.sub-menu-list li p{color:#000; text-decoration:none; font-weight:bold; font-size:15px;}
.sub-menu-list li:hover a {color:#999;text-shadow:none;}
.sub-menu-list #bike{width:300px; border-bottom: 2px solid #ff9933;}
.sub-menu-list #gathering{width:300px; border-bottom:2px solid #99CC99;}


/*사이드바 내부 상단 로그인,회원가입*/
.sub-menu .top-login {margin-right:0px;display:flex;justify-content:space-between;align-items:center;background-color:#f5f5f5; padding:0px; margin-top:50px; margin-right:0px;}
.sub-menu .top-login a {font-family:'Roboto', sans-serif; font-size:13px; text-decoration none;color:#555; width:50%;text-align:center;padding:10px;}
.sub-menu .top-login a:first-child {border-right: 1px solid #ccc;}



/*메뉴*/
#menu {width:auto; height: 60px; text-align:center; display:flex; justify-content:center; align-items:center; box-sizing:border-box;}
#menu p { height:17px; font-size: 10px; font-weight: bold; font-family: 'GangwonEdu_OTFBoldA'; margin: 2px 2px auto;  word-wrap: break-word; text-align:center;
  display: inline-block; white-space: nowrap;   border-radius:20px;  display: flex; align-items: center;}  

 .topmenu:hover p {color:#ff9900; cursor:pointer;}
 .topmenu{height:70px; align-items: center; margin:10px;}

#content{width:auto; height:1200px;}
#bottom{width:auto; height:300px; }
/* 이미지*/
 .hidden_img {display: block; width:35px; height :35px; margin:0 auto; border-radius: 10px; padding:5px;   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4); }
 .change{width: 41px; height: 18px; margin: 0 auto; position: absolute; top: 0px; right: 16%;}
   
.change img{width:100%; height:100%;}
 
 
 }
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
						<p>자전거 대여</p>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='${pageContext.request.contextPath}/member/memberMypage.do'">마이페이지</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='${pageContext.request.contextPath}/bikerent/bikeRentHistory.do'">대여내역</span></a>
					</li>
					
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">공지사항</span></a>
					</li>
					
					<li>
						<p>자전거 소모임</p>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='${pageContext.request.contextPath}/gathering/gMyPage.do'">나의 소모임</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='${pageContext.request.contextPath}/gathering/gMyWish.do'">내가 찜한 소모임</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='${pageContext.request.contextPath}/gathering/gSearch.do'">소모임 검색</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='${pageContext.request.contextPath}/gathering/gCreate.do'">모임 만들기</span></a>
					</li>
					
				</ul>
			</div>
	</div>
		<div class="logo" style="display:inline-block;">
		<h1><img src="${pageContext.request.contextPath}/resources/logo/logo7.jpg" alt="타:바" onclick="location.href='${pageContext.request.contextPath}/gathering/gList.do'"></h1>
		</div>
			<div class="change"  onclick="location.href='<%=request.getContextPath()%>/index.jsp'">	
			  <img src="${pageContext.request.contextPath}/resources/mobile/change3_1.png" alt="전환버튼" >	 
		 </div>
		 
		 	 
		<div class="login">
	   		<ul>
		   		<c:choose>
		   			<c:when test="${not empty sessionScope.memberName}">
		   				<li style="margin-top:10px;">${memberName}님</li>
			            <li><a href="${pageContext.request.contextPath}/member/memberLogOut.do">로그아웃</a></li>
	   		            <c:if test="${not empty sessionScope.midx && not empty sessionScope.ridx}"> 
	   		            	<li><a href="${pageContext.request.contextPath}/bikeRent/bikeRentUseList.do">이용중인내역</a></li>			
						</c:if>
		   			</c:when>
		   			<c:otherwise>
		   				<li><a href="${pageContext.request.contextPath}/member/memberLogin.do">로그인</a></li>
			            <li><a href="${pageContext.request.contextPath}/member/memberJoin.do">회원가입</a></li>  
		   			</c:otherwise>
		   		</c:choose>
	   		</ul>
		</div>
	</div>


<div id="menu">		
	
		<div class="topmenu"  onclick="location.href='<%=request.getContextPath()%>/gathering/gMyPage.do'">
			<img src="${pageContext.request.contextPath}/resources/mobile/friendship.png" alt="소모임" class="hidden_img">
			<p>나의 소모임</p>
		</div>
		<div class="topmenu"  onclick="location.href='<%=request.getContextPath()%>/gathering/gMyWish.do'">
			 <img src="${pageContext.request.contextPath}/resources/mobile/heart2.png" alt="찜" class="hidden_img">
			<p>찜한 소모임</p>
		</div>
		<div class="topmenu"  onclick="location.href='<%=request.getContextPath()%>/gathering/gSearch.do'">
			<img src="${pageContext.request.contextPath}/resources/mobile/search.png" alt="소모임검색" class="hidden_img">
			<p>소모임 검색</p>
		</div>
		<div class="topmenu"  onclick="location.href='<%=request.getContextPath()%>/gathering/gCreate.do'">
			 <img src=" ${pageContext.request.contextPath}/resources/mobile/reunion.png" alt="모임만들기" class="hidden_img">
			 <p>모임 만들기</p>	
		 </div>
	
	</div>
	

</header>