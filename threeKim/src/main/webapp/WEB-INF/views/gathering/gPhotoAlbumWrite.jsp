<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			/* 글 작성 테이블 */
			.gContent table {width:100%; border-collapse:collapse; margin: 60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty';}
			.gContent table th{width:140px;padding: 10px;text-align: center;}
			.gContent table td{padding: 10px; text-align:left; border-left:1px solid #ddd;}
			.gContent table tr{border:1px solid #ddd;}
			.gContent table input[type="text"],textarea{
			  box-sizing: border-box;
			  width: 100%;
			  padding: 10px;
			  margin: 2px 0;
			  border: 1px solid #ccc;
			  border-radius: 4px;
			}
		
		</style>
		
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
		<form action="${pageContext.request.contextPath}/gathering/gPhotoAlbumWriteAction.do" method="POST">
			<section class="gContainer">
				<div class="gContent" >
				
					<table>
						<tr>
							<th>작성자</th>
							<td>김가네</td>
						</tr>
						
						<tr>
							<th>제목</th>
							<td><input type="text" id="gPhotoAlbumTitle" name="gPhotoAlbumTitle"></td>
						</tr>
						
						<tr>
							<th>작성일자</th>
							<td></td>
						</tr>
						
						<tr>
							<th>첨부파일</th>
							<td><input type="file" id="imageInput"><button id="uploadButton">이미지 업로드</button></td>
						</tr>
						
						<tr>
							<th>내용</th>
							<td><textarea id="gPhotoAlbumContents" name="gPhotoAlbumContents" cols="97" rows="43" style="font-size: 26px;"></textarea></td>
						</tr>
					
					</table>
					
				</div>
				<div id="createBtn">
					<button type="submit" class="gBtn2">작성하기</button>
					<button class="gBtn2">취소하기</button>
				</div>
				
			</section>
			</form>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
