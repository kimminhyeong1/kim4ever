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
		li{list-style:none;}
	a { text-decoration:none; color: inherit;} 
		#main{margin: 0 auto;  width: 1250px;}
		.menu{width:auto; text-align:left; margin: 0 auto; font-size:35px; text-align: center; margin:10px;}
		.gProfileimage img {width:60px;height:60px;object-fit:cover;border-radius:50%; margin-top: 6px;}
		.gMemberList {display:flex;flex-direction:column;align-items:flex-start;text-align:left;font-size:24px;margin:40px 20px;}
		.gMemberList > div {display:flex;align-items:center;margin-bottom:20px;position:relative;}
		.gMemberList > div::after {content:"";position:absolute;bottom:-20px; /* 선의 위치 조정 */left:0;width:100%;height:1px;background-color:#ccc;}
		.gMemberList > div > div:nth-child(1) {width:50px; height:50px;float:left;}
		.gMemberList > div > div:nth-child(2) {height: 25px;     margin-top: 25px; margin-left: 20px;}
		.gMemberList > div > div:nth-child(2) > div,
		.gMemberList > div > div:nth-child(3) > div {display:inline-block; font-size:24px;margin-left:10px;}
		.gmemberName {width:100px;}
		.gmemberInfo {width:350px;}	
		.gmemberAddr {width:500px;}	
		.gmemberType {width:62px;}
		.menu a{margin:10px;}
		.gBtn2 {margin:20px;}
		.gSetContainer h2{font-size:35px; margin-left:20px;}		
		.buttonContainer {display: flex;justify-content: flex-end;}	
.EntrustBtn{width:80px; height:40px; text-align:center; position: relative; bottom: 30px; font-family:'omyu_pretty'; font-size:21px; border-radius:20px; border:0px solid #99CC99; background:#05d100; color:white; float:right;}	
.EntrustBtn:active{background:#2bd727b5; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}	
	.menu #gMemberListLink {color:#bbb;}
  	.menu #gMemberJoinWaitListLink {color:#bbb;}
  	.menu #gPowerEntrustListLink {color:#05d100;}
  	/*************************모바일****************************************/
				/*****모바일 넓이***/
		@media (min-width: 300px) and (max-width: 940px)  {
			#main{margin: 0 auto;  width: auto;}
		
		
			.menu{width:auto; text-align:left; margin: 0 auto; font-size:20px; text-align: center; margin:20px;}
	.gProfileimage img {width:50px;height:50px;object-fit:cover;border-radius:50%; margin-top: 15px;}
	.gMemberList {display:flex;flex-direction:column;align-items:flex-start;text-align:left;font-size:24px;margin:20px 20px;}
	.gMemberList > div {display:flex;align-items:center;margin-bottom:20px;position:relative;}
	.gMemberList > div::after {content:"";position:absolute;bottom:-20px; /* 선의 위치 조정 */left:0;width:100%;height:1px;background-color:#ccc;}
	.gMemberList > div > div:nth-child(1) {width:50px; height:50px;float:left;}
	.gMemberList > div > div:nth-child(2) {height: 25px;     margin-top: 5px; margin-left:10px;}
	.gMemberList > div > div:nth-child(2) > div,
	.gMemberList > div > div:nth-child(3) > div {display:inline-block; font-size:18px;}
	.gmemberName {width:100px;}
	.gmemberInfo {width:200px;  white-space: nowrap;  overflow: hidden; text-overflow: ellipsis;}	
	.gmemberAddr {width:470px;}	
	.gmemberType {width:80px;}
	.menu a{margin:10px;}
	.gBtn2 {margin:20px;}
	.gSetContainer h2{font-size:25px; margin-left:20px; margin-top:20px;}
	.EntrustBtn {width:50px; height:30px; text-align:center; position: relative; bottom: 15px; font-family:'omyu_pretty'; font-size:21px; border-radius:20px; border:0px solid #99CC99; background:#05d100; color:white;     float: right;}	
	.gSetContainer {margin-bottom:20px;}
  	.deport{text-align:right;}
	
					}
				
	</style> 



	
	 
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<h2 class="menu">
				<a id="gMemberListLink" href="${pageContext.request.contextPath}/gathering/gMemberList.do">멤버 리스트</a>
				<a id="gMemberJoinWaitListLink" href="${pageContext.request.contextPath}/gathering/gMemberJoinWaitList.do">가입 대기</a>
				<a id="gPowerEntrustListLink" href="${pageContext.request.contextPath}/gathering/gPowerEntrustList.do">권한 위임</a>
			</h2>
			<section class="gContainer gSetContainer">
				<h2>멤버 목록</h2>
			 					
					<div> 					
					<div class="gMemberList">
						<c:forEach var="smv" items="${gjvsmlist}">
							<c:if test="${smv.gatheringApprovalType eq 'Y'}">
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
										<c:if test="${gmt.gatheringMemberType eq 'TL' || gmt.gatheringMemberType eq 'TLD'}">
											<c:choose>
											    <c:when test="${smv.gatheringMemberType eq 'TL'}">
											        <!-- 모임장인 경우 추방 불가 텍스트를 표시합니다. -->    
											    </c:when>
											    <c:when test="${smv.gatheringMemberType eq 'TLD'}">
											        <!-- 부모임장인 경우 해제을 표시합니다. -->
											        <button type="button" class="EntrustBtn" onclick="fnDownTM('${smv.gatheringMemberType}', ${smv.midx}, ${smv.giidx});">강등</button>
											        <button type="button" class="EntrustBtn" onclick="fnEntrustTL('${smv.gatheringMemberType}', ${smv.midx}, ${smv.giidx});">모임장</button>
											    </c:when>
											    <c:when test="${smv.gatheringMemberType eq 'TM'}">
											        <button type="button" class="EntrustBtn" onclick="fnEntrustTLD('${smv.gatheringMemberType}', ${smv.midx}, ${smv.giidx});">위임</button>
											    </c:when>
											    <c:otherwise>
											    </c:otherwise>
											</c:choose>
										</c:if>	
									</div>													
								</div>
							</c:if>																		
						</c:forEach>
					</div>
				</div>
				
				
				
				
							
				<div>				
					<button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gContent.do'">돌아가기</button>			 	 
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
		<script type="text/javascript">
			function fnEntrustTLD(gatheringMemberType, bmidx, bgiidx) {
				// 모임원을 부모임장으로 위임
			    if (confirm("권한을 위임하시겠습니까?")) {
			        location.href = "<%=request.getContextPath()%>/gathering/gMemberEntrust.do?gatheringMemberType=${gatheringMemberType}&midx="+bmidx+"&giidx="+bgiidx+"";
			    }
			}
			
			function fnEntrustTL(gatheringMemberType, bmidx, bgiidx) {
				  if (confirm("부모임장을 모임장으로 권한위임 하시겠습니까?\n확인을 누르면 모임장님은 부모임장으로 권한이 변경됩니다 !")) {
				    // 첫 번째 리다이렉트 수행
				    fetch('<%=request.getContextPath()%>/gathering/gMemberDownTLD.do?gatheringMemberType=' + gatheringMemberType + '&midx=' + bmidx + '&giidx=' + bgiidx)
				      .then(function(response) {
				        // 첫 번째 리다이렉트 완료 후 두 번째 리다이렉트 수행
				        fetch('<%=request.getContextPath()%>/gathering/gMemberEntrustTL.do?gatheringMemberType=' + gatheringMemberType + '&midx=' + bmidx + '&giidx=' + bgiidx)
				          .then(function(response) {
				            // 두 번째 리다이렉트 완료 후 멤버 목록 페이지로 이동
				            location.href = '<%=request.getContextPath()%>/gathering/gMemberList.do';
				          });
				      });
				  }
				}
			
			function fnDownTM(gatheringMemberType, bmidx, bgiidx) {
				// 부모임장을 모임원으로 강등시킴
			    if (confirm("모임원으로 강등 시키겠습니까?")) {
			        location.href = "<%=request.getContextPath()%>/gathering/gMemberDownTM.do?gatheringMemberType=${gatheringMemberType}&midx="+bmidx+"&giidx="+bgiidx+"";
			    }
			}
			
			
		</script>
	</body>
</html>
