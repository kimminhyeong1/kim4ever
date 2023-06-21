<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타바-모임-사진첩</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script><!-- 풀캘린더 라이브러리 -->  
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
			/*사진첩 틀*/ 
			.gContent{width:97%; border:1px solid #bbb;background-color:#f1f1f1;border-radius:10px; padding: 20px;}
			/*버튼 부분*/
			#createBtn{text-align: right; margin-top:20px; }	
			/*페이징 부분*/
			.gPaging{font-size: 25px;}	
			/*사진첩 헤더*/   
			.albumHeader {display:flex;align-items:center;justify-content:space-between;border:1px solid #000;width:100%;height:80px;padding:0 20px;}
			.albumHeader h2 {font-size:35px;font-weight:bold;margin:0;}
			.albumHeader button {font-size:16px;padding:10px 20px;}
			/*사진첩 제목 */
			.albumTitle {width:100%;text-align:left;border:1px solid #000;padding:20px;margin-top:20px;}
			.albumTitle p {font-size:24px;margin:0;}
			/*사진첩 이미지 */
			.albumImage {width:100%;height:400px;border:1px solid #000; padding:20px;margin-top:20px;display:flex;justify-content:center;align-items:center;}
			.albumImage img {max-width:100%;max-height:100%;}
			/*사진첩 내용글 */
			.albumContent {width:100%;border:1px solid #000;padding:20px;margin-top:20px;}
			.albumContent p {font-size:24px;line-height:1.5;margin:0;}
			
		</style>
		
		<script type="text/javascript">
		    function deletePhotoAlbum(midx, gpaidx) {
		        var confirmExit = confirm("사진첩을 삭제하시겠습니까?");
		        if (confirmExit) {
		            $.ajax({
		                url: "${pageContext.request.contextPath}/gathering/gPhotoAlbumDelete.do?midx=" + midx + "&gpaidx=" + gpaidx,
		                method: "POST",
		                success: function(response) {
		                    alert("삭제가 완료되었습니다.");
		                    window.location.href = "${pageContext.request.contextPath}/gathering/gPhotoAlbumList.do";
		                },
		                error: function(xhr, status, error) {
		                    // 에러 발생 시 수행할 작업
		                }
		            });
		        }
		    }
		</script>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
		   <c:forEach var="gjv" items="${gjvList}" varStatus="status">
		        <div class="gContent">
		           <c:if test="${status.index == 0}">
		                <div class="albumHeader">
		                    <h2>${gjv.gPhotoAlbumWriteDay.substring(0, 10)}</h2>
		                    <button>좋아요</button>
		                </div>
		                <div class="albumTitle">
		                    <p>${gjv.gPhotoAlbumTitle}</p>
		                </div>
                  </c:if>
                  
                  
		            <div class="albumImage">
		                <img src="../resources/GAImages/${gjv.imageName}">
		            </div>
		            
		            
	                <c:forEach var="contentIndex" begin="0" end="2">
			            <c:set var="contentName" value="gPhotoAlbumContents${contentIndex}" />
			            <c:if test="${not empty gjv[contentName]}">
			                <div class="albumContent">
			                    <p>${gjv[contentName]}</p>
			                </div>
			            </c:if>
			        </c:forEach>
			            
			            
                 
		          
		           
		        </div>
		     </c:forEach>
		    <div id="createBtn">
		         <c:if test="${not empty gjvList}">
        <c:set var="firstGjv" value="${gjvList[0]}" />
        <c:if test="${not empty firstGjv.gpaidx}">
            <button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gPhotoAlbumModifiy.do?gpaidx=${firstGjv.gpaidx}'">수정하기</button>
        </c:if>
    </c:if>
		        <button class="gBtn2" onclick="deletePhotoAlbum(${midx}, ${gpaidx});">삭제하기</button>
		    </div>
		</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>