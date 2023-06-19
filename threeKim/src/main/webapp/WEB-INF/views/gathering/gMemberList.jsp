<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 멤버 리스트</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">		
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
  margin: 40px 20px;
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
  width: 250px;
}	
	
.gmemberType {
  width: 80px;
}	

.DeleteBtn {width:70px; height:40px; margin-top:-10px; margin-left:5px; text-align:center; font-family:'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #99CC99; background:#99CC99;}	
.DeleteBtn:active{background:#339933; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}	
	</style>  
<script type="text/javascript">
function fnDelete(midx, giidx) {
	if (confirm("정말 추방하시겠습니까?")) {
	location.href = '<%=request.getContextPath()%>/gathering/gMemberDelete.do?gatheringMemberDelYN=N&midx=' + midx + '&giidx=' + giidx;

	}
}
</script>
	
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<main id="main">
			<h2 class="menu">
			    <c:choose>
			        <c:when test="${gmt.gatheringMemberType eq 'TL'}">
			            <a id="gMemberListLink" href="${pageContext.request.contextPath}/gathering/gMemberList.do">멤버 리스트</a>
			            <a id="gMemberJoinWaitListLink" href="${pageContext.request.contextPath}/gathering/gMemberJoinWaitList.do">가입 대기</a>
			            <a id="gPowerEntrustListLink" href="${pageContext.request.contextPath}/gathering/gPowerEntrustList.do">권한 위임</a>			            
			        </c:when>
			        <c:when test="${gmt.gatheringMemberType eq 'TLD'}">
			        	<a id="gMemberListLink" href="${pageContext.request.contextPath}/gathering/gMemberList.do">멤버 리스트</a>
			            <a id="gMemberJoinWaitListLink" href="${pageContext.request.contextPath}/gathering/gMemberJoinWaitList.do">가입 대기</a>
			        </c:when>
			        <c:otherwise> 
			            <a id="gMemberListLink" href="${pageContext.request.contextPath}/gathering/gMemberList.do">멤버 리스트</a>
			        </c:otherwise>
   				 </c:choose>
			</h2>
			<section class="gContainer gSetContainer">
				<h2>멤버 인원 수</h2>
				<div> 					
					<div class="gMemberList">
						<c:forEach var="smv" items="${gjvsmlist}">
							<div>
								<div class="gProfileimage">
									<img src="../resources/MemberProfile/${smv.memberProfile}">	
								</div>
								<div>
									<div class="gmemberType">
									<c:choose>
										<c:when test="${smv.gatheringMemberType eq 'TL'}">  
											<span style="color: red;">모임장</span>
										</c:when>
										<c:when test="${smv.gatheringMemberType eq 'TLD'}">  
											부모임장
										</c:when>
										<c:otherwise> 
											모임원
										</c:otherwise>
									</c:choose>									
									</div>
									<div class="gmemberName">${smv.memberName}</div>
									<div class="gmemberInfo">${smv.memberIntro}</div>
									<div class="gmemberAddr">${smv.memberAddr}</div>
									<c:if test="${gmt.gatheringMemberType eq 'TL' || gmt.gatheringMemberType eq 'TLD'}">
										<c:choose>
										    <c:when test="${smv.gatheringMemberType eq 'TL'}">
										        <!-- 모임장인 경우 추방 불가 텍스트를 표시합니다. -->
										        추방 불가
										    </c:when>
										    <c:when test="${smv.gatheringMemberType eq 'TLM'}">
										        <!-- 부모임장인 경우 추방 버튼을 표시합니다. -->
										        <button type="button" class="DeleteBtn" onclick="fnDelete(${smv.midx}, ${smv.giidx});">추방</button>
										    </c:when>
										    <c:when test="${smv.gatheringMemberType eq 'TM'}">
										        <button type="button" class="DeleteBtn" onclick="fnDelete(${smv.midx}, ${smv.giidx});">추방</button>
										    </c:when>
										</c:choose>
									</c:if>	




								</div>													
							</div>																		
						</c:forEach>
					</div>
				</div>
							
							
				<div>				
					<button class="gBtn2" onclick="goBack()">돌아가기</button>
				
					<script>
					  function goBack() {
					    window.history.back();
					  }
					</script>			 	 
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
