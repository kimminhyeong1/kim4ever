<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#top_logo{width:1440px; height:200px;text-align:center;}
#top_logo h1 img{width:200px; height:240px;margin-right:40px; cursor:pointer;transition: all 0.3s ease-in-out;}


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
.sub-menu .top-login {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #f5f5f5;
  padding: 10px;
  margin-bottom: 10px;
}
.sub-menu .top-login a {
  font-family: 'Roboto', sans-serif; 
  font-size: 18px; 
  text-decoration: none;
  color: #555; 
  width: 50%;
  text-align: center;
  padding: 10px;
}
.sub-menu .top-login a:first-child { border-right: 1px solid #ccc;
}

/*메뉴*/
#menu {width: 1440px;height: 100px; text-align:center;display:flex; justify-content:center; align-items:center; box-sizing:border-box;}
#menu p {font-size: 21px; font-weight: bold; font-family: 'GangwonEdu_OTFBoldA'; margin: 20px 40px; margin-top:40px;}
#menu p:hover {color:#ff9900; cursor:pointer;

#content{width:1440px; height:1200px;}
#bottom{width:1440px; height:300px; }

#bike{display:flex; flex-wrap:wrap; justify-content:space-between;  width: 100%;}
.bike-box {display:flex;flex-direction: column; width: 280px; height: 350px; border:1px solid #000; margin:200px 20px 50px 20px;position:relative; overflow:hidden;}
.bike-box img { position: absolute;top: 40%;left: 50%;transform: translate(-50%, -50%);max-width: 100%;max-height: 100%;}
.bike-description{margin-top: auto;text-align: center;}

</style>
</head>
<body>
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
						<p>쓰리김 님</p>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/member/memberMypage.do'">회원정보 수정</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/rent/rentHistory.do'">대여내역</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/rent/rentFaultList.do'">신고내역</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/member/memberList.do'">회원관리</span></a>
					</li>
					
					<li>
						<a href="#"><span class = "title" onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">공지사항</span></a>
					</li>
				</ul>
			</div>
	</div>
		<h1><img src="${pageContext.request.contextPath}/resources/logo/logo6.jpg" alt="타:바" onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/></h1>									
	</div>

	
	<div id="menu">
		<p onclick="location.href='<%=request.getContextPath()%>/bike/bikeRent.do'">자전거 대여</p>
		<p onclick="location.href='<%=request.getContextPath()%>/rent/rentLocation.do'">대여소 위치</p>
		<p onclick="location.href='<%=request.getContextPath()%>/course/courseIntro.do'">코스 소개</p>
		<p onclick="location.href='<%=request.getContextPath()%>/bike/bikeGathering.do'">자전거 모임</p>
		<p onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">게시판</p>
		
	</div>


</body>

</html>