<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
#main #content{width:1440px; height:2400px;}
#main #content h2{text-align:left; margin-top:50px; margin-left:160px; font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}
#main #bottom{width:1440px; height:300px;}
#content table {width:80%; border-collapse:collapse; margin:60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty'; cursor:pointer;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width: 20px;}
#content table tr th:nth-child(2){width: 80px;}
#content table tr th:nth-child(3){width: 80px;}
#content table tr th:nth-child(4){width: 80px;}
#content table tr th:nth-child(5){width: 20px;}
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

</style>

</head>
<body>
<div id="main">
<%@include file="../header.jsp" %>
   
	<div id="content">
		<div class="tab">
	       <ul class="tab__list">
		        <li class="tab__list__item active" data-list="1">
		            공지사항
		        </li>
		        
		        <li class="tab__list__item" data-list="2">
		            문의게시판
		        </li>
		        
		        <li class="tab__list__item" data-list="3">
		            자주묻는질문
		        </li>
	    	</ul>
	    	
	    <div class="tab__contents show" data-order="1">
	        <h2>공지사항</h2>
              	<table>
	            <tr>
	               <th>No</th>
	               <th>제목</th>
	               <th>작성자</th>
	               <th>작성일</th>
	               <th>조회수</th>
	            </tr>
	         
	            <tr>
	               <td>1</td>
	               <td onclick="location.href='<%=request.getContextPath()%>/board/boardNoticeContent.do'">공지사항</td>
	               <td>관리자</td>
	               <td>2023-04-26</td>
	               <td>17</td>
	            </tr>
	            
	      
   <tr>
<c:set var="number" value="1" /><!-- 숫자시작값 -->
<c:forEach var="bv" items="${blist}" varStatus="status">
  <c:if test="${bv.boardType == 0 && bv.delyn == 'N'}">
    <tr>
      <td>${number}</td>
      <td>
        <a href="${pageContext.request.contextPath}/board/boardNoticeContent.do?bidx=${bv.bidx}">
          ${bv.subject}
        </a>
      </td>
      <td>${bv.writer}</td>
      <td>${bv.writeday.substring(0, 10)}</td>
      <td>${bv.boardView}</td>
    </tr>
    <c:set var="number" value="${number + 1}" /><!-- 번호증가 -->
  
  </c:if>
</c:forEach>


	            </tr>
	            


	      		</table>
	      		<div id="btn">
         		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardNoticeWrite.do'">작성</button>
         		</div> 
        </div>
        
        <div class="tab__contents" data-order="2">
              	<table>
	            <tr>
	               <th>No</th>
	               <th>제목</th>
	               <th>작성자</th>
	               <th>작성일</th>
	               <th>조회수</th>
	            </tr>
	         
	            <tr>
	               <td>1</td>
	               <td onclick="location.href='<%=request.getContextPath()%>/board/boardQnaContent.do'">결제 방법 문의</td>
	               <td>김아무개</td>
	               <td>2023-04-26</td>
	               <td>17</td>
	            </tr>
	            
	            <tr>
<c:set var="number" value="1" /><!-- 숫자시작값 -->
<c:forEach var="bv" items="${blist}" varStatus="status">
  <c:if test="${bv.boardType == 1}">
    <tr>
      <td>${number}</td>
      <td>
        <a href="${pageContext.request.contextPath}/board/boardQnaContent.do?bidx=${bv.bidx}">
          ${bv.subject}
        </a>
      </td>
      <td>${bv.writer}</td>
      <td>${bv.writeday.substring(0, 10)}</td>
      <td>${bv.boardView}</td>
    </tr>
    <c:set var="number" value="${number + 1}" /><!-- 번호증가 -->
  
  </c:if>
</c:forEach>

	            </tr>
	            
	           
	            </table>
	            <div id="btn">
         		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardQnaWrite.do'">작성</button>
         		</div> 
        </div>
       
        <div class="tab__contents" data-order="3">
	        <h2>자주묻는질문</h2>
              	<table>
	            <tr>
	               <th>No</th>
	               <th>제목</th>
	               <th>작성자</th>
	               <th>작성일</th>
	               <th>조회수</th>
	            </tr>
	         
	            <tr>
	               <td>1</td>
	               <td onclick="location.href='<%=request.getContextPath()%>/board/boardFaqContent.do'">자전거 보험 안내</td>
	               <td>김똥개</td>
	               <td>2023-04-26</td>
	               <td>17</td>
	            </tr>
	            	            <tr>
<c:set var="number" value="0" />
<c:forEach var="bv" items="${blist}" varStatus="status">
  <c:if test="${bv.boardType == 2}">
    <c:set var="number" value="${number + 1}" /><!-- 번호증가 -->
    <tr>
      <td>${number}</td>
      <td>
        <a href="${pageContext.request.contextPath}/board/boardFaqContent.do?bidx=${bv.bidx}">
          ${bv.subject}
        </a>
      </td>
      <td>${bv.writer}</td>
      <td>${bv.writeday.substring(0, 10)}</td>
      <td>${bv.boardView}</td>
    </tr>
  </c:if>
</c:forEach>


	            </tr>
	             
	            </table>
	            
	            <!-- 페이지이동 -->
	            <table border=0 style="width:300px;width:800px;">
<tr>
<td style="text-align:right;">
<c:if test="${ pm.prev == true }">
<a href="${pageContext.request.contextPath }/board/boardList.do?page=${pm.startPage-1}&searchType=${ pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } "> ◀</a>
</c:if>
</td>
<td style="text-align:center;width:300px;">
<c:forEach var="i"  begin="${pm.startPage}" end="${pm.endPage}"  step="1" >
	<a href="${pageContext.request.contextPath }/board/boardList.do?page=${ i }&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">${ i }</a>
</c:forEach>	
</td>
<td style="width:200px;text-align:left;">
<c:if test="${pm.next&&pm.endPage >0 }">
<a href="${pageContext.request.contextPath }/board/boardList.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">▶</a>
</c:if>
</td>
</tr>
</table>

	            <div id="btn">
         		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardFaqWrite.do'">작성</button>
         		</div> 
        </div>
        
<script>
const tab = document.querySelector(".tab");
const tabListItems = document.querySelectorAll(".tab__list__item");
const tabContents = document.querySelectorAll(".tab__contents");
const activeItem = document.querySelector(".active");
const showing = document.querySelector(".show");

tab.addEventListener("click", (e)=> {
  const listOrder = e.target.dataset.list;
  tabListItems.forEach(function (item) {
    item.classList.remove("active");
  });
  e.target.classList.add("active");
  if (listOrder) { 
    tabContents.forEach(function (element) {
      if (element.dataset.order == listOrder) {
        element.classList.add("show");
      } else {
        element.classList.remove("show");
      }
    });
  }
});

</script>
	
	 	</div>
       
   </div>
   
   
   <div id="bottom">
  
   </div>
</div>
</body>
<%@include file="../footer.jsp" %>
</html>