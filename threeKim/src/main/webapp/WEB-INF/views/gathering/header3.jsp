<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header id="gMenu">
	<div id="menu">
		<p onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">모임 정보</p>
		<p onclick="location.href='<%=request.getContextPath()%>/gathering/gBoardList.do'">모임 게시판</p>
		<p onclick="location.href='<%=request.getContextPath()%>/gathering/gPhotoAlbumList.do'">모임 사진첩</p>
		<p onclick="location.href='<%=request.getContextPath()%>/gathering/gModify.do'">모임 수정</p>    
	</div>
</header>
