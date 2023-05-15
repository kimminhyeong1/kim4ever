<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Home</title>
<style>
/*리셋코드*//*5.12  12.33*/

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
#main #content{width:1440px;height:1800px;}
#main #bottom{width:1440px; height:300px;}
#bike{display:flex; flex-wrap:wrap; justify-content:space-between; width:100%; align-items:center;}
.bike-box {position:relative; display:inline-block; margin:20px; width:250px; text-align:center; top:80px; border:1px solid #ddd; border-radius:10px;}
.bike-box img {width:100%; height: auto;  border-radius:20px;}
 .bike-description{border-bottom:1px solid #ddd; border-top:1px solid #ddd;}
.bike-box img:hover{opacity:1; cursor:pointer; transform:scale(1.1); transition:all 0.3s ease-in-out;}
.bike-description {font-family:'omyu_pretty'; margin:10px 0;font-size:24px;}
.bike-rules {font-family:'omyu_pretty'; margin:40px auto;width:70%; padding: 20px;background-color:#f1f1f1; border-radius:10px;}
.bike-rules h2 {font-family:'KCC-Ganpan'; text-align:center; font-size:35px; color:#333; margin-bottom: 20px;}
.bike-rules p {font-family:'omyu_pretty'; text-align:left; margin-left:40px; font-size:24px; padding:15px 15px; letter-spacing:3px;}

/* 버튼 */
.edit-btn {display:block; width:100px; height:30px; padding:0; margin:10px 80px 15px 80px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
.edit-btn:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
.rent-btn{display:block; width:100px; height:30px; padding:0; margin:10px 80px 15px 80px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
.rent-btn:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>
<!-- <script type="text/javascript">
//버튼 요소 가져오기
const rentBtn = document.querySelector('.rent-btn');
const editBtn = document.querySelector('.edit-btn'); 

// 일반 사용자인 경우 대여하기 버튼만 보이게 하기
if (userType === 'normal') {
  editBtn.style.display = 'none';
} 
// 관리자인 경우 작성 페이지 버튼만 보이게 하기
else if (userType === 'admin') {
  rentBtn.style.display = 'none';
  editBtn.style.display = 'block';
}

// 버튼 클릭 시 페이지 이동
rentBtn.addEventListener('click', () => {
  window.location.href = '상세페이지 URL';
});

editBtn.addEventListener('click', () => {
  window.location.href = '작성페이지 URL';
});
</script> -->
</head>
<body>
   <div id="main">
   <%@include file="../header.jsp" %>

   <div id="content">
   
         <div class="bike-rules">
            <h2>자전거 이용 수칙</h2>
            <p>1. 자전거 이용시간은 오전9시부터 오후10시까지입니다.</p>
            <p>2. 자전거 이용 시 안전수칙을 준수하시고 음주 시 이용이 불가합니다. </p>
            <p>3. 대여는 5개의 대여소에서 가능하며, 반납은 빌린곳과 무관하게 <br>&nbsp;&nbsp;&nbsp;어느 대여소에서든 가능합니다.</p>
            <p>4.자전거 고장/이용 문의는 대여내역에서 신고 접수 부탁드립니다! </p>
         </div>
   
   
      <section id="bike" class="clearfix">
      
         <div class="bike-box">
            <img src="../resources/bikeimg/일반자전거.jpg" alt="일반자전거">
            <p class="bike-description">일반자전거</p>
            <button class="rent-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentDetail.do'">대여하기</button>
              <!-- <button class="edit-btn">등록</button> admin로그인 시 대여하기 말고 등록 버튼 보이게 하기-->
         </div>
         
         <div class="bike-box">
            <img src="../resources/bikeimg/전기자전거.jpg" alt="전기자전거">
            <p class="bike-description">전기자전거</p>
            <button class="rent-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentDetail.do'">대여하기</button>
         </div>
         
         <div class="bike-box">
            <img src="../resources/bikeimg/커플자전거.jpg" alt="커플자전거">
            <p class="bike-description">커플자전거</p>
            <button class="rent-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentDetail.do'">대여하기</button>
         </div>
         
         <div class="bike-box">
            <img src="../resources/bikeimg/2인자전거.jpg" alt="2인자전거">
            <p class="bike-description">2인자전거</p>
            <button class="rent-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentDetail.do'">대여하기</button>
         </div>
         
         <div class="bike-box">
            <img src="../resources/bikeimg/하이브리드 자전거1.jpg" alt="하이브리드1">
            <p class="bike-description">하이브리드 자전거</p>
            <button class="rent-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentDetail.do'">대여하기</button>
         </div>
         
         <div class="bike-box">
            <img src="../resources/bikeimg/하이브리드 자전거2.jpg" alt="하이브리드2">
            <p class="bike-description">하이브리드 자전거</p>
            <button class="rent-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentDetail.do'">대여하기</button>
         </div>
         
         <div class="bike-box">
            <img src="../resources/bikeimg/미니벨로.jpg" alt="미니벨로자전거">
            <p class="bike-description">미니벨로</p>
            <button class="rent-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentDetail.do'">대여하기</button>
         </div>
         
            
         <div class="bike-box">
            <img src="../resources/bikeimg/어르신자전거.jpg" alt="어르신자전거">
            <p class="bike-description">어르신자전거</p>
            <button class="rent-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentDetail.do'">대여하기</button>
         </div>
         
         <div class="bike-box">
            <img src="../resources/btn/+button.png" alt="" onclick="location.href='bikeRentWrite.do'">
            <p class="bike-description"></p>
            <button class="edit-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentWrite.do'">등록</button>
         </div>
         
         <div class="bike-box">
            <img src="../resources/btn/+button.png" alt="" onclick="location.href='bikeRentWrite.do'">
            <p class="bike-description"></p>
            <button class="edit-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentWrite.do'">등록</button>
         </div>
         
         <div class="bike-box">
            <img src="../resources/btn/+button.png" alt="" onclick="location.href='bikeRentWrite.do'">
            <p class="bike-description"></p>
            <button class="edit-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentWrite.do'">등록</button>
         </div>
         
         <div class="bike-box">
            <img src="../resources/btn/+button.png" alt="" onclick="location.href='bikeRentWrite.do'">
            <p class="bike-description"></p>
            <button class="edit-btn" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRentWrite.do'">등록</button>
         </div>
        
      </section>
   
   </div>
    
   <div id="bottom">
   <%@include file="../bottom.jsp" %>
   </div>
</div>
</body>
<%@include file="../footer.jsp" %>
</html>