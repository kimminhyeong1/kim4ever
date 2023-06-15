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


#main{width:1250px; margin:35px auto 70px; text-align:center;}
#main #content{width:1250px; height:auto;}
#main #content h2{text-align:left; margin-top:50px; margin-left:200px; font-family: 'GangwonEdu_OTFBoldA'; font-size:30px;}

#main #bottom{width:1250px; height:300px;}
#content table {width:70%; border-collapse:collapse; margin: 0 auto; line-height:50px; font-size:24px; font-family: 'omyu_pretty'; cursor:pointer;  white-space: nowrap; overflow: hidden;  text-overflow: ellipsis; }
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000; white-space: nowrap; overflow: hidden;  text-overflow: ellipsis; }
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC; white-space: nowrap; overflow: hidden;  text-overflow: ellipsis; }


#content #btn{text-align:right; margin-top:20px; margin-right:144px; }
#content button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
 .form-table input[type="submit"] {width:100px; height:30px; text-align:center; font-family: 'omyu_pretty'; font-size:15px; border-radius:10px; border:0px solid black; background:#ff9933;}
 	.form-table select,.form-table input[type="text"] { width:100px; height:30px; text-align:center; font-family: 'omyu_pretty'; font-size:15px; border-radius:10px; }
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
<script>
//삭제된글 알림
    function showAlert(message) {
        alert(message);
    }
    
    
    
    
</script>
</head>
<body>

	<div id="main">
		<%@include file="../header4.jsp"%>

		<div id="content">			
<!-- 공지사항 -->			

		<h2>게시판관리</h2>
					
			<form name="frm" action="${pageContext.request.contextPath}/admin/adminboardList.do"
method="post">
		<table class="form-table" border=0 style="text-align: left; width: 400px;">
			<tr>
				<td>
				<select name="searchType">
						<option value="subject">제목</option>
						<option value="writer">작성자</option>
				</select>
				</td>		
				<td><input type="text" name="keyword" size="10"></td>
				<td><input type="submit" name="submit" value="검색"></td> 
			</tr>
		</table>
	</form>
				<form name="frm2">
				
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
							<th>삭제/복구</th>							
						</tr>
										<c:forEach var="bv" items="${blist}" varStatus="status">
									<tr>				
										<td>
								      <c:choose>
								                <c:when test="${bv.boardType == 0}">공지</c:when>
								                <c:when test="${bv.boardType == 1}">Q&A</c:when>
								                <c:when test="${bv.boardType == 2}">FAQ</c:when>
								                <c:otherwise>오류</c:otherwise>
								            </c:choose>
								            </td>
										<td>${bv.bidx}</td>
										
																			
									<td><!-- 삭제된글은 알림 -->
									    <div class="cell-content">
									        <c:choose>
									            <c:when test="${bv.boarddelyn == 'N'}">
									                <a href="${pageContext.request.contextPath}/board/boardNoticeContent.do?bidx=${bv.bidx}">${bv.subject}</a>
									            </c:when>
									            <c:otherwise>
      									          <span onclick="showAlert('삭제된 글입니다.')">${bv.subject}</span>
									            </c:otherwise>
									        </c:choose>
									    </div>
									</td>
																		
										<td>${bv.writer}</td>									
										<td><div class="cell-content">${bv.content}</div></td>													
									<td>
									  <c:choose>
									    <c:when test="${bv.boarddelyn == 'N'}">
									      
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
										
										  
									<c:choose>
									  <c:when test="${bv.boarddelyn == 'N'}">
									    <td>							<!-- 버튼에 고유한식별자 값을 주고 bidx값을 id로 할당 -->									    
									      <button type="button" onclick="check();" id="deleteButton_${bv.bidx}" style="width: 80px; height: 30px;">삭제</button>
									    </td>
									  </c:when>
									  <c:otherwise>
									    <td><button type="button" onclick="check2();" id="deleteButton_${bv.bidx}" style="width: 80px; height: 30px;">복구</button>
									    </td> 
									  </c:otherwise>
									</c:choose>
									
										
									</tr>	
									
							</c:forEach>
							
							</table>
								</form>
						<table border=0 style="width: 300px; width: 900px;">
		<tr>
			<td style="text-align: right;"><c:if test="${ pm.prev == true }">
					<a 	href="${pageContext.request.contextPath }/admin/adminboardList.do?page=${pm.startPage-1}&searchType=${ pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">◀</a>
				</c:if>
				</td>
			<td style="text-align: center; width: 450px;"><c:forEach var="i"
					begin="${pm.startPage}" end="${pm.endPage}" step="1">
					<a 	href="${pageContext.request.contextPath }/admin/adminboardList.do?page=${ i }&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">${ i }</a>
				</c:forEach>
				</td>
			<td style="width: 200px; text-align: left;"><c:if
					test="${pm.next&&pm.endPage >0 }">
					<a 	href="${pageContext.request.contextPath }/admin/adminboardList.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">▶</a>
				</c:if>
				</td>
		</tr>
		
	</table>

		
		
<!-- 버튼 -->
				
	
				</div>


			</div>


	


		<div id="bottom"></div>
</body>

<script type="text/javascript">


function check() {
	  if (confirm("정말로 삭제하시겠습니까?")) {
	    var bidx = event.target.id.split("_")[1]; // 버튼의 id에서 bidx 값을 추출합니다.
	    var xhr = new XMLHttpRequest();
	    xhr.open("POST", "<%=request.getContextPath()%>/admin/adminboardDeleteAction.do", true);
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.onreadystatechange = function() {
	      if (xhr.readyState === 4 && xhr.status === 200) {
	          location.reload(); // 삭제 후 새로고침 

	      
	      }
	    };
	    xhr.send("bidx=" + bidx);
	  }
	}
function check2() {
	  if (confirm("복구하시겠습니까?")) {
	    var bidx = event.target.id.split("_")[1]; // 버튼의 id에서 bidx 값을 추출합니다.
	    var xhr = new XMLHttpRequest();
	    xhr.open("POST", "<%=request.getContextPath()%>/admin/adminboardBackAction.do", true);
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.onreadystatechange = function() {
	      if (xhr.readyState === 4 && xhr.status === 200) {
	          location.reload(); // 삭제 후 새로고침 

	      
	      }
	    };
	    xhr.send("bidx=" + bidx);
	  }
	}
</script>

<%@include file="../footer.jsp"%>
</html>