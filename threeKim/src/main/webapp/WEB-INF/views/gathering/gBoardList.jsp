<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 메인화면</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
		<style type="text/css">
			/*게시글 틀*/
			.boardList { width: 100%; height:600px;}
			/**/
			.notice { display: flex; flex-direction: row; align-items: center;}
			.noticecheck {width: 5%; height:40px; margin-left:15px; margin-top:20px;  }
			.noticeTitle {width: 33%; height:40px; margin-top:20px; }
			.noticeContent {text-align : left; height:40px; border-bottom: 1px solid black; padding-left:15px;}
			.profileimage img{width: 50px; height: 50px; object-fit: cover; border-radius: 50%;}
			
		</style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="boardList">
					<div class="notice">
						<div class="noticecheck">공지사항</div>
						<div class="noticeTitle">공지내용입니다</div>
					</div>
						<div class="noticeContent">일정이 취소되었습니다</div>
					<div class="notice">
						<div class="noticecheck">공지사항</div>
						<div class="noticeTitle">제목 2</div>
					</div>
						<div class="noticeContent">공지글 내용</div>
					<div class="notice">
						<div class="noticecheck">공지사항</div>
						<div class="noticeTitle">제목 3</div>
					</div>
						<div class="noticeContent">주의사항</div>
						
					<div class="normal">
						<div class="profileimage"><img alt="프로필사진" src="../resources/images/profile.jpg"></div>
						<div class="normalwriter">작성자</div>
					</div>	
				</div>
					
				
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
