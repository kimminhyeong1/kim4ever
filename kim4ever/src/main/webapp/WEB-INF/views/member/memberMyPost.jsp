<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <% BoardVo bv = (BoardVo)request.getAttribute("bv"); %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>타바-내가 쓴 글</title>

<style>
/*리셋코드*/ 
*{margin:0;padding:0;}
li{list-style:none;}

@font-face {
    font-family:'omyu_pretty';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
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
/****************************모바일**************************/
@media (min-width: 300px) and (max-width: 940px)  {
	#main{width:auto; min-height:87vh; margin:0 auto; text-align:center;}
	#main #content{width:auto; height:auto;}
	#main #content h2{text-align:left; margin-top:50px; margin-left:16px; margin-left:10%; font-size:15px; }
	#main #bottom{width:auto; height:10px;}
	#content table {width:80vw; border-collapse:collapse; margin:10px auto 0; line-height:13px; font-size:14px; font-family: 'omyu_pretty'; cursor:pointer; }
	#content table th{padding: 10px;text-align: center;}
	#content table td{padding: 5px; text-align:center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
	#content #btn{text-align:right; margin-top:20px; margin-right:5%; }
	#content #btn button{width:60px; height:30px; text-align:center; font-family: 'omyu_pretty'; font-size:15px;  border-radius:20px; border:0px solid #ff9933; }
	
	.cell-content {width: 25vw; overflow: hidden; text-overflow: ellipsis;}
	
	
	
	/*메뉴바 테이블*/
	.tab__contents {display:none;}
	.show {display: block;} 
	.tab__list{margin-top:3%;}
	.tab__list li{ display: inline-block; border: none; background-color: #f8f8f8; padding: 5px 7px; cursor: pointer;  font-family: 'omyu_pretty'; font-size:15px; border-radius:20px; margin-top:10px;0.4);}
	.tab__list__item.active {background-color:#ff9933; color:#fff; border:none ;}
	
	 a {color: inherit; text-decoration: none;}
	 .pageing{font-size:20px !important;} 
	 

}
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
					                <td colspan="5" style="text-align: center;  font-size: 25px;">작성한 게시글이 없습니다.</td>
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
</body>
<%@include file="../footer.jsp"%>
</html>