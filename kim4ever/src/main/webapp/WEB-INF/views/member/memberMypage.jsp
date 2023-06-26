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
#content table td {border:1px solid #bbb;padding:20px;text-align:left;vertical-align:middle;height:100px; font-size:30px;}
#content table .top{position:relative;}
#content table img{width:60px; height:50px; float:right; margin: 0 auto; vertical-align:middle;}
#content table td a {display:flex;  color:#333;}
#content table td a.logout-btn {display:inline-block;padding:10px 20px;background-color:#ff9800;color:#fff;text-decoration:none;border-radius:5px;transition:background-color 0.3s ease;}
#content table td a.logout-btn:hover {background-color: #FF6600;}
#content table .image-container {width:180px;height:180px;}  
#content table #imagePreview {position:absolute; width:122px;  height:122px; border:1px solid #bbb; border-radius:100px;object-fit:cover;top: 43px;left: 65px;}
#content table .button-container {width:200px; margin-left:20px; position:absolute; bottom:680px; left:0; align-items:center; }
#content table .intro-container {width:550px;height:auto; float:right;border:1px solid #ddd; border-radius:50px; display:flex;flex-direction:column;align-items:flex-start;justify-content:center;padding:20px;margin-top: 25px;}
#content table .intro-container h3 {font-size:24px;margin-bottom:10px;border-bottom:1px solid #000;}
#content table input[type="text"] {font-family:'omyu_pretty';font-size:24px;box-sizing:border-box;width:100%;padding:10px;margin-bottom:10px;border:1px solid #ccc;border-radius:4px;}
#content table .intro-container .button-container2 {display:flex;justify-content:flex-end;gap:10px;margin-top:10px;margin-left:430px;}
#content table .button-container2 button{width: 100px;height: 30px;background-color: #ff9800;color: #fff;text-decoration: none;border-radius: 5px;transition: background-color 0.3s ease;border: 1px solid;}
#formImg{float: left;}  
#editImgBtn{position: absolute;top: 569px;right:-500px;width: 100px;height: 30px;background-color: #ff9800;color: #fff;text-decoration: none;border-radius: 5px;transition: background-color 0.3s ease;border: 1px solid;}
#editIntroBtn{position: absolute;top: 110px;right: 45px; z-index:5; width: 100px;height: 30px;background-color: #ff9800;color: #fff;text-decoration: none;border-radius: 5px;transition: background-color 0.3s ease;border: 1px solid;}
#content table #memberProfile{position:absolute; width:122px; height:122px;top: 43px;left: 65px; border:1px solid #bbb; border-radius:100px;object-fit:cover;} 
#UploadImgBtn{position: absolute;top: 569px;right:-500px; width: 100px;height: 30px;background-color: #ff9800;color: #fff;text-decoration: none;border-radius: 5px;transition: background-color 0.3s ease;}
#introText{margin-bottom:0px;}

/**************************모바일****************************************/


@media (min-width: 300px) and (max-width: 940px)  {
#main{width:auto; margin:0 auto; text-align:center;}
#main #content{width:auto; height:auto;}
#main #bottom{width:auto; height:10px;}
#content table h2{margin-top:10px; font-size:20px; font-family:'GangwonEdu_OTFBoldA'; }
#content table {position:relative; width:85%; max-width:550px; height:20%; min-width:320px; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; font-family:'omyu_pretty'; }
#content table th{width:200px; text-align:center; border:1px solid #ddd; padding:8px;}
#content table td {border:1px solid #bbb;padding:10px;text-align:left;vertical-align:middle;height:90px; font-size:15px;}
#content table img{width:20%; height:20%; float:right; margin: 0 auto; vertical-align:middle;}
#content table td a {display:flex;  color:#333;}
#content table td a.logout-btn {display:inline-block;padding:10px 20px;background-color:#ff9800;color:#fff;text-decoration:none;border-radius:5px;transition:background-color 0.3s ease;}
#content table td a.logout-btn:hover {background-color: #FF6600;}
#content table .image-container {position:absolute; width:100px;height:100px;}
#content table #imagePreview {float:center; width:100px; height:100px; border:1px solid #bbb; border-radius:100px;object-fit:cover;}
#content table .button-container { position: relative;width:70%; margin-left:10px;  bottom:10px; left:10px; align-items:center;  font-size:10px;}
#content table .intro-container {width:50%;height:20px; margin-top: 8px; float:right;border:1px solid #ddd; border-radius:50px; padding-top:0px; }
#content table .intro-container h3 {font-size:14px;margin-bottom:5px;border-bottom:1px solid #000;}
#content table input[type="text"] {margin-top: -20px;  font-family:'omyu_pretty';font-size:13px;width:105%;padding:11px;margin-left:-7px; margin-bottom:-63px;border:1px solid #ccc;border-radius:4px;}
#content table .intro-container {display:flex;justify-content:normal;gap:0px;margin-bottom:50px;margin-left:10px; transform: translate(0%, 60%)}
 .button-container2 {display:flex;justify-content:flex-end;gap:10px;margin-bottom:50px;margin-left:50px; transform: translate(0%, 160%)}
 #content table .intro-container .button-container2 {position:absolute; display:flex;justify-content:flex-end;gap:10px;margin-top:-25px;margin-left:55%;}
 
#content table .button-container2 button{position: absolute; border:0px solid; font-family:'omyu_pretty';  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); border-radius:50px; width:70px; height:20px; margin-top: 70px; right: -45px;}
.intro-container{height:170px; width:50px; }
#content table .top{height:100px;}
#editImgBtn{border:0px;top: 0px;right:0px; font-family:'omyu_pretty';  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); border-radius:50px; width:70px; height:20px;text-decoration: none;transition: background-color 0.3s ease; margin-top: 88px; 
    margin-right: 25px; }
#content table #memberProfile{position:absolute; width:100px; height:100px; border:1px solid #bbb; border-radius:100px;object-fit:cover;} 
#UploadImgBtn{border:0px;top: 0px;right:0px; font-family:'omyu_pretty';  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); border-radius:50px; width:70px; height:20px;text-decoration: none;transition: background-color 0.3s ease; margin-top: 88px; 
    margin-right: 25px;}
 #formImg{float: none;}  
 

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
				<td class="top" colspan="2" >
				  <!-- 이미지업로드 란  -->
					<form method="post" action="${pageContext.request.contextPath}/member/MypageProfile.do" enctype="multipart/form-data" id="formImg">
						<div class="image-container">	
								<img id="memberProfile" src="${pageContext.request.contextPath}/resources/MemberProfile/${memberProfile}" />
							<label id="imgLabel" for="image" style="display: none;">
							  <img id="imagePreview" src="${pageContext.request.contextPath}/resources/icon/imgPlus.png" />
							</label>
						</div>
						<div class="button-container">
							<input id="image" type="file" name="memberProfile" onchange="previewImage(event)" style="display: none;"/>
							<button id="UploadImgBtn" style="display: none;">업로드</button>
							<button id="editImgBtn" type="button">프로필편집</button>
						</div>
					</form>
                   
                   <!-- 소개 란  -->
          
                    <div class="intro-container">
						<h3>내 간단 소개</h3>
						<c:choose>
			                <c:when test="${empty sessionScope.memberIntro}">
			                    <input type="text" id="introInput" placeholder="멤버보기에 있는 소개입니다." value="${memberIntro}">
			                </c:when>
			                <c:otherwise>
			                    <span id="introText">${memberIntro}</span>
			                </c:otherwise>
			            </c:choose>
			            <div class="button-container2">
			              	<button id="editIntroBtn" onclick="editIntro()">편집하기</button>    
			            </div> 
					</div>
					
                </td>
            </tr>       
            <tr>
                <td  colspan="2">
					<h2><%= session.getAttribute("memberName") %>님 환영합니다.</h2>
					<a class="logout-btn" style="float:right;  " href="${pageContext.request.contextPath}/member/memberLogOut.do">로그아웃</a>
				</td>
			</tr>
			
			<tr>
				<%-- <td onclick="window.location.href='<%=request.getContextPath() %>/member/memberEditInformation.do'">회원정보수정<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td> --%>
				<td onclick="window.location.href='${pageContext.request.contextPath}/member/memberEditInformation.do'">회원정보수정<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td onclick="window.location.href='${pageContext.request.contextPath}/member/memberMyPost.do'">내 게시글<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		
			<tr>
				<td onclick="window.location.href='${pageContext.request.contextPath}/bikeRent/bikeRentHistory.do'">대여내역<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td  onclick="window.location.href='${pageContext.request.contextPath}/bikeRent/bikeRentQR.do'">자전거 타러가기<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		
			<tr>
				<td onclick="window.location.href='${pageContext.request.contextPath}/gathering/gMyPage.do'">나의 소모임<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
				<td onclick="window.location.href='${pageContext.request.contextPath}/gathering/gMyWish.do'">내가 찜한 모임<img src="../resources/icon/moveicon.png" alt="이동아이콘"></td>
			</tr>
		</table>
		
		  
		  
		
	
		
	</div>




</div>
	<script type="text/javascript">
	document.getElementById('editImgBtn').addEventListener('click', function() {
	    document.getElementById('editImgBtn').style.display = 'none';
	    document.getElementById('memberProfile').style.display = 'none';
	    document.getElementById('UploadImgBtn').style.display = 'block';
	    document.getElementById('imgLabel').style.display = 'block';
	});
	</script>
</body>
<%@include file="../footer.jsp" %>
</html>