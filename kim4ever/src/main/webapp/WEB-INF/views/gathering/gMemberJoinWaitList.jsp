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
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">
		li{list-style:none;}
		a { text-decoration:none; color: inherit;}
		#main{margin: 0 auto;  width: 1250px;}
		.menu{width:auto; text-align:left; margin: 0 auto; font-size:35px; text-align: center; margin:10px;}
		.gProfileimage img {width:50px;height:50px;object-fit:cover;border-radius:50%;}
		.gMemberList {display:flex;flex-direction:column;align-items:flex-start;text-align:left;font-size:24px;margin:40px 20px;}
		.gMemberList > div {display:flex;align-items:center;margin-bottom:20px;position:relative;}
		.gMemberList > div::after {content:"";position:absolute;bottom:-20px; /* 선의 위치 조정 */left:0;width:100%;height:1px;background-color:#ccc;}
		.gMemberList > div > div:nth-child(1) {width:50px; height:50px;float:left;}
		.gMemberList > div > div:nth-child(2) {height: 29px;  margin-top: 10px;  margin-left: 10px;  justify-content: center;    display: inherit;}
		.gMemberList > div > div:nth-child(2) > div,
		.gMemberList > div > div:nth-child(3) > div {display:inline-block; font-size:24px;margin-left:10px;}
		.gmemberName {width:100px;}
		.gmemberInfo {width:420px;  white-space: nowrap;  overflow: hidden; text-overflow: ellipsis;}	
		.gmemberAddr {width:500px;}	
		.gmemberType {width:62px;}
		.menu a{margin:10px;}
		.gBtn2 {margin:20px;}
		.gSetContainer h2{font-size:35px; margin-left:20px;}		
		.buttonContainer {display: flex;justify-content: flex-end;}	
		.buttonContainer button {width:100px; height:40px; margin: 5px 10px 20px 0; text-align:center; font-family:'omyu_pretty'; font-size:21px; border-radius:20px; border:0px solid #99CC99; background:#05d100 ; color:white;}	
		.buttonContainer button:active{background:#2bd727b5; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
		.menu #gMemberListLink {color:#bbb; }
  		.menu #gMemberJoinWaitListLink {color:#05d100;}
  		.menu #gPowerEntrustListLink {color:#bbb}
  			.buttonContainer {justify-content: center; margin-top:10px;}
  		
  		
  		
  		/*************************모바일****************************************/
				/*****모바일 넓이***/
	@media (min-width: 300px) and (max-width: 940px)  {
			#main{margin: 0 auto;  width: auto;}
		
		
			.menu{width:auto; text-align:left; margin: 0 auto; font-size:20px; text-align: center; margin:20px;}
			.gProfileimage img{width: 45px; height: 45px; object-fit: cover; border-radius: 50%;}/*프로필이미지*/
.gMemberList {text-align: left; font-size: 20px; margin: 10px 20px;} 
			.gMemberList >div>div:nth-child(1){width: 50px; height: 50px; float: left;}/*프로필*/ 
			.gProfileimage img {width: 45px; height: 45px; object-fit: cover; border-radius: 50%; margin-top: 17px;}/*프로필이미지*/
		.gMemberList >div>div:nth-child(2){height: 25px; margin-left: 0px; margin-top:0px; display:inline-block;}/*모임장,이름*/ 
	.gMemberList >div>div:nth-child(2)>div{display: inline-block; margin-top: 5px; font-size:20px; width: 240px;} 
		.gMemberList >div>div:nth-child(3)>div:nth-child(1){height: 25px; margin-left: 60px; font-size: 12px; margin-top: 5px;}/*날짜 카테고리*/ 
		.gMemberList >div:nth-child(2){clear: both;margin-top: 0px; font-size:20px;}/*게시글제목*/
		.gMemberList >div:nth-child(2)>span{font-size: 18px;}/*게시글 카테고리*/
			.gMemberList >div:nth-child(3){font-size: 18px; margin-top: 10px;  padding-bottom: 5px; margin-top: 0px;}/*게시글 내용*/
	.gmemberName {width:100px;}
	.gmemberInfo {width:width:70%;  white-space: nowrap;  overflow: hidden; text-overflow: ellipsis;}	
	.gmemberAddr {width:470px;}	
	.gmemberType {width:80px;}
	.gmemberInfo{font-size:18px;}
	.menu a{margin:10px;}
	.gBtn2 {margin:20px;}
	.gSetContainer h2{font-size:25px; margin:10px 20px;}
	.DeleteBtn {width:50px; height:30px; text-align:center; position: relative; bottom: 15px; font-family:'omyu_pretty'; font-size:21px; border-radius:20px; border:0px solid #99CC99; background:#05d100; color:white;     float: right;}	
	.DeleteBtn:active{background:#2bd727b5; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
	.buttonContainer button{font-size:15px; width:70px; height:30px;}
	.buttonContainer {justify-content: center;}
  	.deport{text-align:right;}
  	.gSetContainer {margin-bottom:20px}
	

					}
				
				
		</style>  
		
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
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
				<h2>멤버 승인 대기</h2>
				<div class="buttonContainer">
				    <button class="selectAll">전체 선택</button>
				    <button class="cancelAll">전체 취소</button>
				    <button class="JoinAccess">가입 승인</button>
				    <button class="JoinRefuse">승인 거절</button>
				</div>			
				<div class="gMemberList">
					<c:forEach var="smv" items="${gjvsmlist}">
						<c:choose>
							<c:when test="${smv.gatheringApprovalType eq 'W'}">
								<div>
									<div class="gProfileimage">
										<img src="${pageContext.request.contextPath}/resources/MemberProfile/${smv.memberProfile}">	
									</div>
									<div>							
										<div class="gmemberName">${smv.memberName}</div>
										<div class="gmemberInfo">${smv.memberIntro}</div>
										<input type="checkbox" id="checkbox" name="selectedMembers" value="${smv.midx}">
									</div>													
								</div>																			
							</c:when>
							<c:when test="${smv.gatheringApprovalType eq 'Y' or smv.gatheringApprovalType ne 'W'}">
								
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div>				
					<button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gContent.do'">돌아가기</button>			 	 
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
		<script type="text/javascript">
			$(document).ready(function() {
				// "전체 선택" 버튼을 클릭했을 때 모든 체크박스를 선택
				$('.selectAll').click(function() {
					$('.gMemberList input[type="checkbox"]').prop('checked', true);
				});
			
				// "전체 취소" 버튼을 클릭했을 때 모든 체크박스를 해제
				$('.cancelAll').click(function() {
					$('.gMemberList input[type="checkbox"]').prop('checked', false);
				});
			
				// "가입 승인" 버튼을 클릭했을 때 AJAX를 사용하여 선택된 멤버 정보를 컨트롤러로 전달
				$('.JoinAccess').click(function() {
					var selectedMembers = [];
					$('.gMemberList input[type="checkbox"]:checked').each(function() {
						selectedMembers.push($(this).val());
					});
			
					$.ajax({
						url: '${pageContext.request.contextPath}/gathering/processJoinAccess.do',
						type: 'POST',
						contentType: 'application/json',
						data: JSON.stringify({ selectedMembers: selectedMembers }),
						success: function(response) {
							alert('가입 승인이 완료되었습니다.');
							location.reload();
						},
						error: function(xhr, status, error) {
							alert('가입 승인 처리 중 오류가 발생했습니다.');
						}
					});
				});
				// "승인 거절" 버튼을 클릭했을 때 선택된 멤버를 서버로 전송
				$('.JoinRefuse').click(function() {
					var selectedMembers = [];
					$('.gMemberList input[type="checkbox"]:checked').each(function() {
						selectedMembers.push($(this).val());
					});
	
					$.ajax({
						url: '${pageContext.request.contextPath}/gathering/processJoinRefuse.do',
						type: 'POST',
						contentType: 'application/json',
						data: JSON.stringify({ selectedMembers: selectedMembers }),
						success: function(response) {
							alert('가입 거절이 완료되었습니다.');
							location.reload();
						},
						error: function(xhr, status, error) {
							alert('가입 거절 처리 중 오류가 발생했습니다.');
						}
					});
				});
			});
		</script>
	</body>
</html>
