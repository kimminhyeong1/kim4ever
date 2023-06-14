<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="com.myezen.myapp.domain.BoardVo" %>    
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/*리셋코드*/ 
*{margin:0;padding:0;}
li{list-style:none;}
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'KCC-Ganpan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:auto;}
#main #content h2{text-align:left; margin-top:50px; margin-left:160px; font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}
#main #bottom{width:1440px; height:100px;}
#content table {width:80%; border-collapse:collapse; margin:60px auto 0; font-size:24px; font-family: 'omyu_pretty'; border: 1px solid #ddd;}
#content table tr{border:none;}
#content table th {width:100px; padding:10px; text-align:left;  border: 1px solid #ddd;}
#content table td {padding:10px; text-align:left; line-height:40px;  border: 1px solid #ddd;}
#content table tr th {width:120px; text-align:center;  }
#content table td { white-space: pre-line;}
#content table th:nth-child(4) {border: 1px solid #ddd; }/* 4번째 셀에 외곽선*/
#content #btn{text-align:right; margin-top:20px; margin-right:144px; }
#content #btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content #btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
.maintext{height: auto;  min-height: 200px; width: 1800px; text-align:left; clear:both;  border: 1px solid #ddd;}

/**************************모바일****************************************/





/*****모바일 넓이***/
@media (min-width: 300px) and (max-width: 940px)  {

#main{width:auto; margin:0 auto; text-align:center;}
#main #content{width:auto; height:auto;}
#main #content h2{text-align:left; margin-top:10px; margin-left:10%; font-family: 'GangwonEdu_OTFBoldA'; font-size:13px;}
#main #bottom{width:auto; height:10px;}
#content table {width:80%; height:auto; border-collapse:collapse; margin: auto; font-size:10px; font-family: 'omyu_pretty' ; border-radius:10px;}
#content table tr{border:1px solid #ddd;}
#content table th {width:10px;  text-align:left; border-right:0px solid #ddd;}
#content table td { text-align:left; line-height:2px;  line-height:40px; }
#content table tr th {width:30px; text-align:center;  }
#content table td { white-space: pre-line;}
#content #btn{text-align:right; margin-top:20px; margin-right:10%; }
#content #btn button{width:50px; height:25px; margin:0 auto; text-align:center; font-family: 'omyu_pretty'; font-size:14px; border-radius:10px; border:0px solid #ff9933; background:#ff9933; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); }
#content #btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
.maintext{height: 200px; width: auto; text-align:left;}

}

</style>

</head>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(document).ready(function() {

	var originalFileName = "${bv.filename}";
    var downloadLink = '${pageContext.request.contextPath}/board/displayFile.do?fileName=' + originalFileName + '&down=1';
    var downloadElement = $("<a>")
 	

		
      .attr("href", downloadLink)
      .attr("download", originalFileName)
      .text(originalFileName);
    	$("#download").append(downloadElement);
		
	
  });
	  
	function getOriginalFileName(fileName){	
		var idx = fileName.lastIndexOf("_")+1;	
		return fileName.substr(idx);
	}
	//파일이 이미지일경우
	function getImageLink(fileName){
		
		if (!checkImageType(fileName)) {
			return fileName;
		}	
		//위치 폴더뽑기
		var front = fileName.substr(0,12);
		//alert(front);
		//파일이름뽑기
		var end = fileName.substr(14);	
		//alert(end);
		return front+end;	
	}
	function checkImageType(fileName){
		
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		return fileName.match(pattern);
	}
	

		</script>
<body>
	<div id="main">
		<%@include file="../header.jsp"%>

		<div id="content">
			<h2>게시글 내용</h2>
			<form name="frm">
				<table>

					<tr>
						<th>제목</th>
						<td>${bv.subject}</td>
					</tr>
					<tr>		
						<th>조회수</th>
						<td>${bv.boardView}</td>
						</tr>				

					<tr>
						<th>작성자</th>
						<td>${bv.writer}</td>
					</tr>

					<tr class="maintext">
						<th>글 내용</th>
							<td class="maintext-cell" >${bv.content}</td>

					</tr>
					
					<tr>
						<th>파일다운로드</th>
						<td>
							<div id="download"></div>

							<c:if test="${not empty bv.filename}">
							    <c:set var="exp" value="${fn:substring(bv.filename, fn:length(bv.filename) - 3, fn:length(bv.filename))}" />
							    <c:choose>
							        <c:when test="${exp eq 'jpg' or exp eq 'gif' or exp eq 'png'}">
							            <img src="${pageContext.request.contextPath}/board/displayFile.do?fileName=${bv.filename}"
							                width="100px" height="100px" />
							        </c:when>
							    </c:choose>
							</c:if>
						</td>				
				</table>
				<div id="btn">
					<c:choose>
					  <c:when test="${midx == bv.getMidx() || membertype == '관리자'}">
					    <!-- midx가 동일하거나 membertype가 '관리자'일 때 출력 -->
							<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/board/boardModify.do?bidx=${bv.bidx}'">수정</button>
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?bidx=${bv.bidx}'">삭제</button>
					 	 </c:when>
					</c:choose>
					<c:if test="${0== bv.getLevel_()}">				
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardReply.do?bidx=${bv.bidx}&depth=${bv.depth}&level_=${bv.level_}'   ">답변</button>
					</c:if>
					<button type="button"
						onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">목록</button>				</div>
			</form>
		</div>
</div>
		<div id="bottom"></div>

</body>
<%@include file="../footer.jsp" %>
</html>