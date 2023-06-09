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

#main{width:1220px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:2400px;}
#main #content h2{text-align:left; margin-top:50px; margin-left:200px; font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}

#main #bottom{width:1440px; height:300px;}
#content table {width:80%; border-collapse:collapse; margin:60px auto 0; line-height:40px; font-size:20px; font-family: 'omyu_pretty'; cursor:pointer;  white-space: nowrap; overflow: hidden;  text-overflow: ellipsis; }
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000; white-space: nowrap; overflow: hidden;  text-overflow: ellipsis; }
#content table td{width:100px;padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC; white-space: nowrap; overflow: hidden;  text-overflow: ellipsis; }


#content #btn{text-align:right; margin-top:20px; margin-right:144px; }
#content #btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content #btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
/*메뉴바 테이블*/
.tab__contents {display:none;}
.show {display: block;}
.tab__list li{
  display: inline-block;
  border: 1px solid #ccc;
  background-color: #f8f8f8;
  padding: 10px 20px;
  cursor: pointer;
  margin-top:30px;
  font-family: 'omyu_pretty';
  font-size:21px;
  border-radius:5px;
}
.tab__list__item.active {background-color:#333;color:#fff;border:1px solid #333;}

 a {color: inherit; text-decoration: none;}
.cell-content {width: 150px;height: 40px; overflow: hidden; text-overflow: ellipsis;}

</style>
</head>
<body>

	<div id="main">
		<%@include file="../header4.jsp"%>

		<div id="content">
			
<!-- 공지사항 -->			

					<h2>게시판관리</h2>
					<table>
						<tr>
							<th>게시판</th>							
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>내용</th>					
							<th>삭제여부</th>
							<th>날짜</th>	
							<th>조회수</th>
							<th>수정</th>
							<th>삭제</th>							
						</tr>
										<c:forEach var="bv" items="${blist}" varStatus="status">
									<tr>				
										<td>
										<c:choose>
									    <c:when test="${bv.boardType} == '0'}">
									      공지
									    </c:when>
									    <c:when test="${bv.boardType} == '1'}">
									      QNA
									    </c:when>
									    <c:when test="${bv.boardType} == '2'}">
									     자주묻는
									    </c:when>
									    <c:otherwise>
									      기타
									    </c:otherwise>
									  </c:choose>									
										
										</td>
										<td>${bv.sortN}</td>									
										<td><div class="cell-content"><a href="${pageContext.request.contextPath}/board/boardNoticeContent.do?bidx=${bv.bidx}">${bv.subject}</a></div></td>									
										<td>${bv.writer}</td>									
										<td><div class="cell-content">${bv.content}</div></td>													
									<td>
									  <c:choose>
									    <c:when test="${bv.boarddelyn == 'N'}">
									      정상
									    </c:when>
									    <c:when test="${bv.boarddelyn == 'Y'}">
									      삭제
									    </c:when>
									    <c:otherwise>
									      기타
									    </c:otherwise>
									  </c:choose>
									</td><td>${bv.writeday.substring(0, 10)}</td>
										<td>${bv.boardView}</td>
										<td><button type="button" style="width: 80px; height: 30px;">수정</button></td>
										<td><button type="button" onclick="check();"	style="width: 80px; height: 30px;">삭제</button></td>
									</tr>	
							</c:forEach>
							</table>
						

		
		
<!-- 버튼 -->
				
	
				</div>


			</div>

	


		<div id="bottom"></div>
</body>
<%@include file="../footer.jsp"%>
</html>