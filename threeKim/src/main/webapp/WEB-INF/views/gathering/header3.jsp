<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<!DOCTYPE html>
<style>
/****************************모바일**************************/
@media (min-width: 300px) and (max-width: 940px)  {
#gMenu{clear:both;}
 .midmenu:hover p {color:#ff9900; cursor:pointer;}
 .midmenu{height:70px; align-items: center; margin:10px;}
 .midmenu p{margin:0 auto;}
}

</style>
<header>
	<div id="menu">
		<div class="midmenu"  onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">
			<img src="${pageContext.request.contextPath}/resources/mobile/g_info.png" alt="모임정보" class="hidden_img">
			<p>&nbsp; 모임 정보</p>
		</div>
		<div class="midmenu" onclick="location.href='<%=request.getContextPath()%>/gathering/gBoardList.do'">
			<img src="${pageContext.request.contextPath}/resources/mobile/g_board.png" alt="모임게시판" class="hidden_img">	
			<p>모임 게시판</p>
		</div>
		<div class="midmenu"  onclick="location.href='<%=request.getContextPath()%>/gathering/gPhotoAlbumList.do'">
			<img src="${pageContext.request.contextPath}/resources/mobile/g_pic.png" alt="모임사진첩" class="hidden_img">	
			<p>모임 사진첩</p>
		</div>
		<div class="midmenu" onclick="location.href='<%=request.getContextPath()%>/gathering/gModify.do'">
			<img src="${pageContext.request.contextPath}/resources/mobile/g_modi.png" alt="모임수정" class="hidden_img">	
			<p>&nbsp; 모임 수정</p>    
		</div>
	</div>
</header>
