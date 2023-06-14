<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<%@page import = "java.util.*" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
#content table .image-container {position:relative; width:180px;height:180px;}
#content table #imagePreview {position:absolute; width:100%; height:100%; border:1px solid #000; border-radius:100px;object-fit:cover;}
#content table .button-container {width:200px; margin-left:20px; position:absolute; bottom:680px; left:0; align-items:center; }
#content table .intro-container {width:550px;height:auto; float:right;border:1px solid #ddd; border-radius:50px; display:flex;flex-direction:column;align-items:flex-start;justify-content:center;padding:20px;}
#content table .intro-container h3 {font-size:24px;margin-bottom:10px;border-bottom:1px solid #000;}
#content table input[type="text"] {font-family:'omyu_pretty';font-size:24px;box-sizing:border-box;width:100%;padding:10px;margin-bottom:10px;border:1px solid #ccc;border-radius:4px;}
#content table .intro-container .button-container2 {display:flex;justify-content:flex-end;gap:10px;margin-top:10px;margin-left:480px;}
#content table .button-container2 button{border:1px solid #000; border-radius:50px; width:70px; }





/**************************모바일****************************************/


@media (min-width: 300px) and (max-width: 940px)  {
#main{width:auto; margin:0 auto; text-align:center;}
#main #content{width:auto; height:auto;}
#main #bottom{width:auto; height:10px;}
#content table h2{margin-top:10px; font-size:20px; font-family:'GangwonEdu_OTFBoldA'; }
#content table {position:relative; width:200px; height:20%; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; font-family:'omyu_pretty'; }
#content table th{width:100px; text-align:center; border:1px solid #ddd; padding:2px;}
#content table td {border:1px solid #ddd;padding:5px;text-align:left;vertical-align:middle;height:30px; width:100px;font-size:15px;}
#content table img{width:50px; height:20px; float:right; margin: 0 auto; vertical-align:middle;}
#content table td a {display:flex;  color:#333;}
#content table td a.logout-btn {display:inline-block;padding:10px 20px;background-color:#ff9800;color:#fff;text-decoration:none;border-radius:5px;transition:background-color 0.3s ease;}
#content table td a.logout-btn:hover {background-color: #FF6600;}
#content table .image-container {position:relative; width:100px;height:100px;}
#content table #imagePreview {position:absolute; width:100%; height:100%; border:1px solid #000; border-radius:100px;object-fit:cover;}
#content table .button-container {width:100px; margin-left:10px; position:absolute; bottom:680px; left:0; align-items:center; }
#content table .intro-container {width:250px;height:10px; float:right;border:1px solid #ddd; border-radius:50px; display:flex;flex-direction:column;align-items:flex-start;justify-content:center;padding:10px;}
#content table .intro-container h3 {font-size:14px;margin-bottom:5px;border-bottom:1px solid #000;}
#content table input[type="text"] {font-family:'omyu_pretty';font-size:14px;box-sizing:border-box;width:70%;padding:10px;margin-bottom:10px;border:1px solid #ccc;border-radius:4px;}
#content table .intro-container .button-container2 {display:flex;justify-content:flex-end;gap:10px;margin-bottom:80px;margin-left:50px;}
#content table .button-container2 button{border:none; font-family:'omyu_pretty';  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); border-radius:50px; width:70px; height:20px;}
.intro-container{height:200px; width:50px;}

}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function editIntro() {
    var introText = $('#introText').text();
    var introContainer = $('.intro-container');
    
    if (introContainer.find('input').length === 0) {
        
        introContainer.html(
            '<h3>내 간단 소개</h3>' +
            '<input type="text" id="introInput" placeholder="멤버보기에 있는 소개입니다." value="' + introText + '">' +
            '<div class="button-container2">' +
            '<button onclick="editIntro()">편집하기</button>' +
            '</div>'
        );
    } else {
        // Save the edited intro and display the result
        var intro = $('#introInput').val();
        var midx = '<%= session.getAttribute("midx") %>';
        
        $.ajax({
            url: "${pageContext.request.contextPath}/member/memberUpdateIntro.do?midx=" + midx,
            type: 'POST',
            data: {
                midx: midx,
                memberIntro: intro
            },
            success: function(response) {
                alert('소개가 수정되었습니다.');
                introContainer.html(
                    '<h3>내 간단 소개</h3>' +
                    '<span id="introText">' + intro + '</span>' +
                    '<div class="button-container2">' +
                    '<button onclick="editIntro()">편집하기</button>' +
                    '</div>'
                );
            },
            error: function(xhr, status, error) {
                alert('소개 수정에 실패했습니다: ' + error);
            }
        });
    }
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
				  <!-- 이미지업로드 란  -->
					<form method="post" action="${pageContext.request.contextPath}/member/MypageProfile.do" enctype="multipart/form-data">
						<div class="image-container">
							<img id="imagePreview" />		
						</div>
						<div class="button-container">
							<input id="image" type="file" name="memberProfile" onchange="previewImage(event)" />
							<button>업로드</button>
						</div>
					</form>
                   
                   <!-- 소개 란  -->
          
                    <div class="intro-container">
						<h3>내 간단 소개</h3>
						<c:choose>
			                <c:when test="${empty sessionScope.memberIntro}">
			                    <input type="text" id="introInput" placeholder="멤버보기에 있는 소개입니다." value="멤버보기에 있는 소개입니다.">
			                </c:when>
			                <c:otherwise>
			                    <span id="introText">${sessionScope.memberIntro}</span>
			                </c:otherwise>
			            </c:choose>
			            <div class="button-container2">
			              	<button onclick="editIntro()">편집하기</button>    
			            </div>
					</div>
					
                </td>
            </tr>       
            <tr>
                <td  colspan="2">
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




</div>

</body>
<%@include file="../footer.jsp" %>
</html>