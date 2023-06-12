<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <% BoardVo bv = (BoardVo)request.getAttribute("bv"); %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/*리셋코드*/ 
*{margin:0;padding:0;}
li{list-style:none;}

@font-face {
    font-family:'GangwonEdu_OTFBoldA';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight:normal;
    font-style:normal;
}
@font-face {
    font-family:'omyu_pretty';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight:normal;
    font-style:normal;
}
@font-face {
    font-family: KCC-Ganpan';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight:normal;
    font-style:normal;
}

#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:auto;}
#main #content h2{text-align:left; margin-top:50px; margin-left:160px; font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}
#main #bottom{width:1440px; height:300px;}
#content table {width:80%; border-collapse:collapse; margin:60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty'; cursor:pointer;  white-space: nowrap;  overflow: hidden; text-overflow: ellipsis;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;  }
#content #btn{text-align:right; margin-top:20px; margin-right:144px; }
#content #btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content #btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>
</head>
<body>

	<div id="main">
		<%@include file="../header.jsp"%>

		<div id="content">
				<div>
					<h2>내가 쓴 글</h2>
					<table>
					    <c:choose>
					        <c:when test="${empty blist}">
					            <tr>
					                <td colspan="5" style="text-align: center; font-family: 'GangwonEdu_OTFBoldA'; font-size: 27px;">작성한 게시글이 없습니다.</td>
					            </tr>
					        </c:when>
					        <c:otherwise>
					            <tr>
					                <th>게시물종류</th>
					                <th>제목</th>
					                <th>작성자</th>
					                <th>작성일</th>
					                <th>조회수</th>
					            </tr>
					            <c:forEach var="bjv" items="${blist}" varStatus="status">
					                <tr>
					                    <td>
					                        <c:choose>
					                            <c:when test="${bjv.boardType == 0}">공지사항</c:when>
					                            <c:when test="${bjv.boardType == 1}">문의게시판</c:when>
					                            <c:when test="${bjv.boardType == 2}">자주묻는질문</c:when>
					                            <c:otherwise>기타</c:otherwise>
					                        </c:choose>
					                    </td>
					                    <td><a href="${pageContext.request.contextPath}/board/boardFaqContent.do?bidx=${bjv.bidx}">${bjv.subject}</a></td>
					                    <td>${bjv.writer}</td>
					                    <td>${bjv.writeDay.substring(0, 10)}</td>
					                    <td>${bjv.boardView}</td>
					                </tr>
					            </c:forEach>
					        </c:otherwise>
					    </c:choose>
					</table>
				</div>
			</div>
		</div>


		<div id="bottom"></div>
</body>
<%@include file="../footer.jsp"%>
</html>