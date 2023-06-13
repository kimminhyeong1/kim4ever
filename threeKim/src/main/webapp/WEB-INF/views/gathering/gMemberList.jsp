<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 멤버 리스트</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
	<style type="text/css">
.menu {
  width: 500px;
  text-align: left;
  margin-top: 50px;
  margin-left: 460px;
  font-size: 25px;
}

.gProfileimage img {
  width: 50px;
  height: 50px;
  object-fit: cover;
  border-radius: 50%;
}

.gMemberList {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  text-align: left;
  font-size: 20px;
  margin: 40px 40px;
}

.gMemberList > div {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
  position: relative;
}

.gMemberList > div::after {
  content: "";
  position: absolute;
  bottom: -5px; /* 선의 위치 조정 */
  left: 0;
  width: 100%;
  height: 1px;
  background-color: #ccc;
}

.gMemberList > div > div:nth-child(1) {
  width: 50px;
  height: 50px;
  float: left;
}

.gMemberList > div > div:nth-child(2) {
  height: 25px;
  margin-left: 10px;
}

.gMemberList > div > div:nth-child(2) > div,
.gMemberList > div > div:nth-child(3) > div {
  display: inline-block;
  margin-top: 5px;
  font-size: 20px;
  margin-left: 10px;
}

.gmemberName {
  width: 100px;
}

.gmemberInfo {
  width: 250px;
}
	
.gmemberAddr {
  width: 200px;
}	
	
.gmemberType {
  width: 80px;
}	

.DeleteBtn button {width:70px; height:40px; margin-top:-10px; margin-left:5px; text-align:center; font-family:'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #99CC99; background:#99CC99;}	
.DeleteBtn button:active{background:#339933; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}	
	</style>  
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<main id="main">
			<h2 class="menu">
				<a id="gMemberListLink" href="${pageContext.request.contextPath}/gathering/gMemberList.do">멤버 리스트</a>
				<a id="gMemberJoinWaitListLink" href="${pageContext.request.contextPath}/gathering/gMemberJoinWaitList.do">가입 대기</a>
				<a id="gPowerEntrustListLink" href="${pageContext.request.contextPath}/gathering/gPowerEntrustList.do">권한 위임</a>
			</h2>
			<section class="gContainer gSetContainer">
				<h2>멤버 인원 수</h2>
				<div> 					
					<div class="gMemberList">
						<div>
							<div class="gProfileimage"><img alt="프로필사진" src="../resources/images/profile.jpg"></div>
								<div>
									<div class="gmemberType">모임장</div>
									<div class="gmemberName">김가네</div>
									<div class="gmemberInfo">타사모 모임장 김가네입니다</div>
									<div class="gmemberAddr">전주시 덕진구 인후동</div>	
									<div class="DeleteBtn"><button>금지</button></div>
								</div>													
						</div>																		
					</div>
				</div>
				<div> 					
					<div class="gMemberList">
						<div>
							<div class="gProfileimage"><img alt="프로필사진" src="../resources/images/profile.jpg"></div>
								<div>
									<div class="gmemberType">부모임장</div>
									<div class="gmemberName">김김김</div>
									<div class="gmemberInfo">반갑습니다</div>
									<div class="gmemberAddr">전주시 완산구 평화동</div>	
									<div class="DeleteBtn"><button>추방</button></div>
								</div>													
						</div>																		
					</div>					
				</div>
				<div> 					
					<div class="gMemberList">
						<div>
							<div class="gProfileimage"><img alt="프로필사진" src="../resources/images/profile.jpg"></div>
								<div>
									<div class="gmemberType">일반멤버</div>
									<div class="gmemberName">김회원</div>
									<div class="gmemberInfo">주말에 자전거를 즐겨탑니다</div>
									<div class="gmemberAddr">전주시 덕진구 금암동</div>	
									<div class="DeleteBtn"><button>추방</button></div>
								</div>													
						</div>																		
					</div>
				</div>
				
				
				
				
				<div>				
					<button class="gBtn2">돌아가기</button>			 	 
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
