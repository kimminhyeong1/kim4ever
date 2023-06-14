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
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<style type="text/css">
			a{text-decoration: none; color: #000;}	
			.gContainer{border: 1px solid #0000;}
			/*게시글 틀*/ 
			.gBoardList { width: 100%; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;position: relative;}
			/*게시글 멤버 부분*/
			.gBoardMember{text-align: left; font-size: 20px; margin: 40px 60px; position: relative;} 
			.gBoardMember>div>div:nth-child(1){width: 50px; height: 50px; float: left;}/*프로필*/ 
			.gBoardMember img{width: 50px;  object-fit: cover; border-radius: 50%;}/*프로필이미지*/
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
			.writeBtn{width: 10%; height: 50px;margin-top: 14px;text-align: center;font-family: 'omyu_pretty';font-size: 21px;border-radius: 10px;border: 0px solid #99CC99;background: #99CC99; vertical-align: top;}
			.hidden {display: none;}
		    .fade-in {
		      animation: fadeIn 0.2s ease-in;
		    }
		
		    @keyframes fadeIn {
		      from {
		        opacity: 0;
		      }
		      to {
		        opacity: 1;
		      }
		    }
			/*페이징 부분*/
			.gPaging{font-size: 25px;}
			/*댓글타이틀*/		
			.gBoardCommentTitle{text-align: left;margin-left: 60px;margin-top: 30px;font-size: 25px;font-weight: bold;}
			/*좋아요 부분*/
			.gBoardLike div{margin-bottom: 20px;margin-top: 10px;}
			/*설정 부분*/
			.gBoardSettingBtn{position: absolute; right: 0px;top: 0px; width: 100px;}	
			.gBoardSettingBtn img{width: 35px;}
			.gBoardSettingBtn ul{background: #d5d5d5;border-radius: 5px;width: 110px;padding: 20px;}
			.gBoardSettingBtn li{margin: 5px; border-bottom: 1px solid #bbb;}
			/*댓글 쓰는 부분*/
			.gBoardCommentWrite textarea{resize: none;padding: 20px;font-size: 18px; width: 580px; height: 40px;}
			
		</style>
	    <script>
	        $(document).ready(function() {
	            // AJAX를 사용하여 댓글 양식 제출
	            $("#commentForm").submit(function(event) {
	                event.preventDefault(); // 폼 제출 방지
	                var gCommentContents = $("#gCommentContents").val();
	                var gbidx = $("#gbidx").val();
	                
	                $.ajax({
	                    type: "POST",
	                    url: "${pageContext.request.contextPath}/gathering/gBoardComment.do",
	                    data: { gCommentContents: gCommentContents, gbidx: gbidx },
	                    success: function(data) {
	                    	if (data.value == 1) {
	                    		alert("댓글성공");
		                        // 제출 성공 시 댓글 새로고침
		                        location.reload();
		                        //$("#commentList").load("${pageContext.request.contextPath}/gathering/gBoardContent.do?gbidx=${gbidx}");
		                        //$("#gCommentContents").val(""); // 댓글 입력 필드 초기화
								
								return true;
							} else {
								return false;
							}
	                    },
	                    error: function(xhr, status, error) {
	                        console.error("댓글 제출 에러: " + error);
	                    }
	                });
	            });
	        });
	    </script>
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
						<div class="gBoardSettingBtn" id="settingBtn">
							<img alt="설정리스트" src="../resources/btn/settingBtn.png">
							<ul id="list" class="hidden fade-in">
							  <li><a href="#">게시글 수정</a></li> 
							  <li><a href="#">게시글 삭제</a></li>
							</ul>
						</div>		
					</div>
					<div class="gBoardView">
						<div>${gjv.gBoardTitle}<span>${gjv.gBoardCategory}</span> </div>
						<div>${gjv.gBoardContents}</div>
					</div>
					<div class="gBoardLike">
						<img alt="좋아요" src="../resources/icon/like.png" style="width: 50px;">
						 <div>좋아요수</div>
					</div>
					<div class="gBoardCommentWrite">
					    <form id="commentForm">
					    	<input id="gbidx" type="hidden" name="gbidx" value="${gbidx}">
							<textarea id="gCommentContents" rows="5" cols="100" name="gCommentContents"></textarea>
							<button class="writeBtn">댓글달기</button>
				    	</form>
					</div>
					<div class="gBoardCommentTitle">댓글(댓글갯수)</div>
			    	<c:forEach var="gjvc" items="${gjvclist}">
						<div class="gBoardMember">
							<div>
								<div class="gProfileimage"><img alt="프로필사진" src="../resources/MemberProfile/${gjvc.memberProfile}"></div>
								<div>
									<c:set var="gatheringMemberType" value="${gjvc.gatheringMemberType}" />
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
									<div>${gjvc.memberName}</div>
								</div>
								<div>
									<div>
										<fmt:parseDate value="${gjvc.gCommentWriteDay}" pattern="yyyy-MM-dd HH:mm:ss.S" var="parsedRentDay" />
										<fmt:formatDate value="${parsedRentDay}" pattern="yyyy-MM-dd HH:mm" var="formattedRentDay" />
										${formattedRentDay}
									</div>
								</div>					
								<div>${gjvc.gCommentContents}</div>
								<div class="gBoardSettingBtn SettingBtn2">
									<img alt="설정리스트" src="../resources/btn/settingBtn.png">
						            <ul class="hidden fade-in">
						                <li><a href="#">댓글 수정</a></li> 
						                <li><a href="#">댓글 삭제</a></li>
						            </ul>
								</div>
							</div>
						</div>
					</c:forEach>	
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
		<script>
		  // ID를 사용하여 요소를 가져옵니다.
		  const settingBtn = document.getElementById('settingBtn');
		  const list = document.getElementById('list');
		
		  // settingBtn에 클릭 이벤트 리스너를 추가합니다.
		  settingBtn.addEventListener('click', function() {
		    // list의 'hidden' 클래스를 토글합니다.
		    list.classList.toggle('hidden');
		  });
		</script>
		<script>
		    // 모든 gBoardSettingBtn 요소를 가져옵니다.
		    const settingBtns = document.querySelectorAll('.SettingBtn2');
		
		    // 각 gBoardSettingBtn 요소에 대해 반복합니다.
		    settingBtns.forEach(function(settingBtn) {
		        // 해당 settingBtn에 대한 목록을 가져옵니다.
		        const list = settingBtn.querySelector('ul');
		
		        // 각 settingBtn에 클릭 이벤트 리스너를 추가합니다.
		        settingBtn.addEventListener('click', function() {
		            // 목록의 가시성을 토글합니다.
		            list.classList.toggle('hidden');
		        });
		    });
		</script>
	</body>
</html>
