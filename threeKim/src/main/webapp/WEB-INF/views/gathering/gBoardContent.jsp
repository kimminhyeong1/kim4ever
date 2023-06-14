<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 메인화면</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
			/*게시글 틀*/ 
			.gBoardList { width: 100%; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;position: relative;}
			/*게시글 멤버 부분*/
			.gBoardMember{text-align: left; font-size: 20px; margin: 40px 60px; } 
			.gBoardMember>div>div:nth-child(1){width: 50px; height: 50px; float: left;}/*프로필*/ 
			.gBoardMember img{width: 50px; height: 50px; object-fit: cover; border-radius: 50%;}/*프로필이미지*/
			.gBoardMember>div>div:nth-child(2){height: 25px; margin-left: 70px;}/*모임장,이름*/ 
			.gBoardMember>div>div:nth-child(2)>div{display: inline-block; margin-top: 5px;} 
			.gBoardMember>div>div:nth-child(3)>div{height: 25px; margin-left: 70px; font-size: 15px; margin-top: 5px;}/*날짜*/
			.gBoardMember>div>div:nth-child(4){font-size: 18px; margin-top: 20px; border-bottom: 2px solid #bbb; padding-bottom: 20px;}/*게시글 내용*/
			/*게시글 글 부분*/
			.gBoardView{text-align: left; font-size: 20px; margin: 40px 60px;} 
			.gBoardView>div:nth-child(1){font-size: 30px; clear: both;margin-top: 10px; font-weight: bold;}/*게시글제목*/
			.gBoardView>div:nth-child(1)>span{font-size: 18px;margin-left: 10px;}/*게시글 카테고리*/
			.gBoardView>div:nth-child(2){font-size: 18px; margin-top: 100px; border-bottom: 2px solid #bbb; padding-bottom: 100px;}/*게시글 내용*/
			/*버튼 부분*/
			#writeBtn{text-align: right;}
			.gBoardDelBtn{position: absolute; right: 10px;top: 40px;}/*게시글 삭제버튼*/ 	
			/*페이징 부분*/
			.gPaging{font-size: 25px;}		
		</style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="gBoardList">
					<div class="gBoardMember">
						<div>
							<div class="gProfileimage"><img alt="프로필사진" src="../resources/MemberProfile/${gjv.memberProfile}"></div>
							<div>
								<c:set var="gatheringMemberType" value="${gjv.gatheringMemberType}" />
								<c:choose>
								    <c:when test="${gatheringMemberType eq 'TL'}">
								        <div>모임장</div>
								    </c:when>
								    <c:when test="${gatheringMemberType eq 'TLD'}">
								        <div>[부]모임장</div>
								    </c:when>
								    <c:otherwise>
								        <div>모임원</div>
								    </c:otherwise>
								</c:choose>
								<div>${gjv.memberName}</div>
							</div>
							<div>
								<div>
									<fmt:parseDate value="${gjv.gBoardWriteDay}" pattern="yyyy-MM-dd HH:mm:ss.S" var="parsedRentDay" />
									<fmt:formatDate value="${parsedRentDay}" pattern="yyyy-MM-dd HH:mm" var="formattedRentDay" />
									${formattedRentDay}
									조회수[1000회] 
								</div>
							</div>		
						</div>
					</div>
					<div class="gBoardView">
						<div>${gjv.gBoardTitle}<span>${gjv.gBoardCategory}</span> </div>
						<div>${gjv.gBoardContents}</div>
						<div class="gBoardDelBtn">게시글삭제버튼</div>		
					</div>
					<div class="gBoardLike">
						<img alt="좋아요" src="../resources/icon/like.png" style="width: 50px;">
						 좋아요수
					</div>
					<div class="gBoardCommentWrite">
						<textarea rows="" cols=""></textarea>
						<button type="button">댓글달기</button>
					</div>
					<div>댓글(댓글갯수)</div>
					<div class="gBoardMember">
						<div>
							<div class="gProfileimage"><img alt="프로필사진" src="../resources/MemberProfile/profile.jpg"></div>
							<div>
								<c:set var="gatheringMemberType" value="${gjvb.gatheringMemberType}" />
								<c:choose>
								    <c:when test="${gatheringMemberType eq 'TL'}">
								        <div>모임장</div>
								    </c:when>
								    <c:when test="${gatheringMemberType eq 'TLD'}">
								        <div>[부]모임장</div>
								    </c:when>
								    <c:otherwise>
								        <div>모임원</div>
								    </c:otherwise>
								</c:choose>
								<div>이름${gjvb.memberName}</div>
							</div>
							<div>
								<div>
									2023-06-14
								</div>
							</div>
							<div>게시글내용${gjvb.gBoardContents}</div>					
						</div>
					</div>
					<div class="gPaging">
						<c:if test="${pm.prev == true}">
							<a href="${pageContext.request.contextPath}/gathering/gBoardContent.do?gbidx=${gjv.gbidx}&page=${pm.startPage-1}">◀</a>
						</c:if><!--if문-end-->
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
						<a href="${pageContext.request.contextPath}/gathering/gBoardContent.do?gbidx=${gjv.gbidx}&page=${i}">${i}</a>
						</c:forEach><!--for문-end-->
						<c:if test="${pm.next && pm.endPage > 0}">
							<a href="${pageContext.request.contextPath}/gathering/gBoardContent.do?gbidx=${gjv.gbidx}&page=${pm.endPage+1}">▶</a>
						</c:if><!--if문-end-->
					</div><!-- 페이징 -->
		 		</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
