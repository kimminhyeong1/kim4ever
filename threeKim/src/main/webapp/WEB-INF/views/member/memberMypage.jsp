<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<%@page import = "java.util.*" %>  
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
#main #content{width:1440px; height:2400px;}
#main #bottom{width:1440px; height:300px;}
#content table h2{margin-top:40px; font-size:40px; font-family:'GangwonEdu_OTFBoldA'; }
#content table {position:relative; width:60%; height:20%; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; font-family:'omyu_pretty'; }
#content table th{width:200px; text-align:center; border:1px solid #ddd; padding:8px;}
#content table td {border:1px solid #ddd;padding:20px;text-align:left;vertical-align:middle;height:100px; font-size:30px;}
#content table img{width:60px; height:50px; float:right; margin: 0 auto; vertical-align:middle;}
#content table td a {display:flex;  color:#333;}
#content table td a.logout-btn {display:inline-block;padding:10px 20px;background-color:#ff9800;color:#fff;text-decoration:none;border-radius:5px;transition:background-color 0.3s ease;}
#content table td a.logout-btn:hover {background-color: #FF6600;}
#content table .image-container {position:absolute; top:10px; left:0; width:220px;height:260px;}
#content table #imagePreview { position:absolute; top:0;left:0; width:100%; height:70%;border:1px solid #000;border-radius:100px;object-fit:cover;}
#content table .button-container { position:absolute;bottom:0;left:0; text-align:left; margin-top:10px;}
#content table .intro-container {width:550px;height:auto; margin-bottom:100px;float:right;border:1px solid #000;display:flex;flex-direction:column;align-items:flex-start;justify-content:center;padding:20px;}
#content table .intro-container h3 {font-size:24px;margin-bottom:10px;border-bottom:1px solid #ddd;}
#content table input[type="text"] {font-family:'omyu_pretty';font-size:24px;box-sizing:border-box;width:100%;padding:10px;margin-bottom:10px;border:1px solid #ccc;border-radius:4px;}
#content table .intro-container .button-container2 {display:flex;justify-content:flex-end;gap:10px;margin-top:10px;margin-left:480px;}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function writeIntro() {
    $('.intro-container').html('<h3>내 간단 소개</h3>' +
        '<input type="text" id="introInput" placeholder="멤버보기에 있는 소개입니다." value="">' +
        '<div class="button-container2">' +
        '<button onclick="saveIntro()">확인</button>' +
        '</div>');
}

function editIntro() {
    var introText = $('#introText').text();
    $('.intro-container').html('<h3>내 간단 소개</h3>' +
        '<input type="text" id="introInput" placeholder="멤버보기에 있는 소개입니다." value="' + introText + '">' +
        '<div class="button-container2">' +
        '<button onclick="saveIntro()">확인</button>' +
        '</div>');
}

function saveIntro() {
    var intro = $('#introInput').val();
    var midx = '<%= session.getAttribute("midx") %>'; // 로그인한 사용자의 midx 값을 세션에서 받아옵니다.
    
    $.ajax({
        url: "${pageContext.request.contextPath}/member/memberUpdateIntro.do?midx=" + midx,
        type: 'POST',
        data: {
            midx: midx,
            memberIntro: intro
        },
        success: function(response) {
            alert('소개가 수정되었습니다.');
            if (intro !== "") {
                $('.intro-container').html('<h3>내 간단 소개</h3>' +
                    '<span id="introText">' + intro + '</span>' +
                    '<div class="button-container2">' +
                    '<button onclick="editIntro()">수정</button>' +
                    '</div>');
            } else {
                $('.intro-container').html('<h3>내 간단 소개</h3>' +
                    '<div class="button-container2">' +
                    '<button onclick="writeIntro()">작성</button>' +
                    '</div>');
            }
        },
        error: function(xhr, status, error) {
            alert('소개 수정에 실패했습니다: ' + error);
        }
    });
}


//////////////////////////////////////////////////////////
//이미지업로드

function previewImage(event) {
	  var input = event.target;
	  var reader = new FileReader();

	  reader.onload = function() {
	    var preview = document.getElementById('imagePreview');
	    preview.src = reader.result;
	  };

	  if (input.files && input.files[0]) {
	    reader.readAsDataURL(input.files[0]);
	  }
	}
</script>
</head>
<body>
<div id="main">

	<%@include file="../header.jsp" %>
	
	<div id="content">
		<table>
			<tr>
				<td colspan="2" >
					 <form method="post" action="${pageContext.request.contextPath}/gathering/gMypageProfile.do" enctype="multipart/form-data">
					<div class="image-container">
					  <img id="imagePreview" />
					  <div class="button-container">
		            <input id="image" type="file" name="GTImg" onchange="previewImage(event)" />
					<button>업로드</button>
                    </div>
					</div>	
                     </form>
                   
                   
          
                    <div class="intro-container">
					<h3>내 간단 소개</h3>
					<c:choose>
		                <c:when test="${empty mv.memberIntro}">
		                    <input type="text" id="introInput" placeholder="멤버보기에 있는 소개입니다." value="">
		                </c:when>
		                <c:otherwise>
		                    <span id="introText">${mv.memberIntro}</span>
		                </c:otherwise>
		            </c:choose>
		            <div class="button-container2">
		                <button onclick="writeIntro()">작성</button>
		                <button onclick="editIntro()">수정</button>
		                <button onclick="saveIntro()">확인</button>
		            </div>
					</div>
					
                </td>
            </tr>       
            <tr>
                <td colspan="2">
					<h2><%= session.getAttribute("memberName") %>님 환영합니다.</h2>
					<a class="logout-btn" style="float:right;  " href="<%=request.getContextPath() %>/member/memberLogOut.do">로그아웃</a>
				</td>
			</tr>
			
			<tr>
				<%-- <td onclick="window.location.href='<%=request.getContextPath() %>/member/memberEditInformation.do'">회원정보수정<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td> --%>
				<td onclick="window.location.href='<%=request.getContextPath() %>/member/memberEditInformation.do'">회원정보수정<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td onclick="window.location.href='<%=request.getContextPath() %>/member/memberMyPost.do'">내 게시글<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		
			<tr>
				<td onclick="window.location.href='<%=request.getContextPath() %>/bikeRent/bikeRentHistory.do'">대여내역<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td  onclick="window.location.href='<%=request.getContextPath() %>/bikeRent/bikeRentQR.do'">자전거 타러가기<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		
			<tr>
				<td onclick="window.location.href='<%=request.getContextPath() %>/gathering/gMyPage.do'">나의 소모임<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td onclick="window.location.href='<%=request.getContextPath() %>/gathering/gMyWish.do'">내가 찜한 모임<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		</table>
		
		  
		  
		
	
		
	</div>
	
	<div id="bottom">	
	
	</div>





</div>

</body>
<%@include file="../footer.jsp" %>
</html>