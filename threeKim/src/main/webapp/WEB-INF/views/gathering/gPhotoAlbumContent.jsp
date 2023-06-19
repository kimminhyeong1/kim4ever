<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-모임-사진첩</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
			/*사진첩 틀*/ 
			.gContent{width:100%; border:1px solid #bbb;background-color:#f1f1f1;border-radius:10px; padding: 20px;box-sizing border-box;display:flex;flex-direction:column;align-items:flex-start;}
			/*사진첩 부분*/
			.card{height: 320px; background-color: #d2dfcc;}
			.cardImg{height: 80%;}

			/*버튼 부분*/
			#createBtn{text-align: right;}	
			/*페이징 부분*/
			.gPaging{font-size: 25px;}	
			
			/* 사진첩 틀 */ 
			/* 사진첩 날짜와 제목 */
			.albumHeader {
				margin-bottom:20px;
				text-align:left; 
				
			}

			.albumHeader h2 {
				font-size:35px;
				font-weight:bold;
				margin:0;
			}

			.albumHeader p {
				font-size: 24px;
				color: #888;
				margin: 0;
			}

			/* 사진첩 내용 */
			.albumContent {
				width:1000px;
				height:auto;
				font-size: 24px;
				line-height: 2;
				border:1px solid #000;
			}

			.albumContent img {
				max-width: 100%;
				height: auto;
				margin-bottom: 10px;
				border-radius: 5px;
			}

			/* 좋아요 버튼 */
			.likeButton {
				align-self: flex-end;
				width:300px;
				margin-bottom:40px;
				float:right;
				text-align:right;
			}
		</style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="gContent" >
					<div class="likeButton">
						<button class="gBtn2">좋아요</button>
					</div>
					<div class="albumHeader">
						<h2>${gpv.gPhotoAlbumWriteDay}</h2>
						<p>${gpv.gPhotoAlbumTitle }</p>
						
					</div>
					
					<div class="albumContent">
					<p>${gpv.gPhotoAlbumContents }</p>
					</div>
				</div>
				<div id="createBtn">
					<button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gPhotoAlbumModifiy.do'">수정하기</button>
					<button class="gBtn2">삭제하기</button>
				</div>
				
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
