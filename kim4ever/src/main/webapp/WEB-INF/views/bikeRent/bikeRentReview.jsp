<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리뷰 작성하기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_bikeRent_mo.css">		
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">
			/*헤더영역 메뉴*/
			header #menu{display: none;}
			/*틀부분*/
			.container{font-size: 24px;border: 1px solid #bbb;margin: 40px auto;width: 55%;padding: 20px;background-color: #fdfcfa;border-radius: 20px;}
			.container>div{padding: 20px; text-align: left;}
			.container>div>p{display: inline-block; } 
			
			.container h1{font-size: 50px; text-align: center;}
			.container h2{font-size: 40px; text-align: center;}
			.container img{width: 30px; height:30px;vertical-align:middle;margin-left:5px;}
			.container button{margin: 30px auto;display:inline-block; width:45%; height:55px;text-align:center; font-family:'omyu_pretty'; font-size:25px; border-radius:20px; border:0px solid #ff9933; background:#ff9933;}
			.container button:active{background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			/*이용내역 내용*/
			#useInfo{width:80%; font-size:22px; line-height:35px;}
			/*이용내역 내용 버튼*/
			#useListBtn{text-align:center;}
			.stateimg {display: flex; justify-content: center; align-items: center;}			
			.stateimg img{width:100px; height:100px; background:white;  border-radius: 10px; padding:5px;   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);}
			.using img{border:5px solid #90EE90; box-shadow: 0 5px 22px rgb(13 254 106 / 70%);}
			.dot img{width:50px; height:50px; background:none;  box-shadow: none;}
			#characterCount{position: absolute;top: 370px;right: 18px;}

			
			
			/****************************모바일**************************/
@media (min-width: 300px) and (max-width: 940px)  {
		header #menu{display: none;}
			/*틀부분*/
			.container{border: 1px solid #bbb;margin: 0 px;width: 90%;padding: 5px ;background-color: #f1f1f1;border-radius: 20px;}
			.container>div{padding: 5px; text-align: left;}
			.container>div>p{display: inline-block; } 
			.container>div>p:nth-child(1){width: 100%; margin-left: 0px; font-size: 12px;} 
			.container>div>p:nth-child(2){width: 5%;} 
			.container img{width: 10px; height:10px;vertical-align:middle;margin-left:5px;}
			.container{font-size: 14px;}
			.container h1{font-size: 20px; text-align: center;}
			.container h2{font-size: 20px; text-align: center;}
			.container button{display:inline-block; width:40%; height:30px;text-align:center; font-family:'omyu_pretty'; font-size:15px; border-radius:20px; border:0px solid #ff9933; background:#ff9933;}
			.container button:active{backgrbound:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			/*이용내역 내용*/
			#useInfo{width:80%; font-size:12px; line-height:15px;}
			/*이용내역 내용 버튼*/
			#useListBtn{text-align:center;}
			.stateimg {display: flex; justify-content: center; align-items: center;}			
			.stateimg img{width:40px; height:40px; background:white;  border-radius: 10px; padding:5px;   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);}
			.using img{border:3px solid #90EE90;}
			
			.dot img{width:20px; height:20px; background:none;  box-shadow: none;}
			#characterCount{position: absolute;top: 225px;right: 18px;}
}		  
</style>  
	<script>
	function validateAndCountCharacters(textarea) {
	  var text = textarea.value;
	  var characterCount = text.length;
	
	  // 특수 문자 도배 검사
	  var specialCharacters = /[\^\$\\.*+?()[\]{}|]/g;
	  if (specialCharacters.test(text)) {
	    textarea.value = text.replace(specialCharacters, '');
	    return;
	  }
	
	  var characterCountSpan = document.getElementById("characterCount");
	  characterCountSpan.textContent = characterCount;
	
	  var maxLength = parseInt(textarea.getAttribute('maxlength'));
	  characterCountSpan.textContent += "/" + maxLength;
	}
	function fnWrite() {
	    var fm = document.frm;
		alert("리뷰가 작성되었습니다.");
	    fm.action = "${pageContext.request.contextPath}/bikeRent/bikeRentReviewAction.do";
	    fm.enctype = "multipart/form-data";
	    fm.method = "post";
	    fm.submit();
	    
	}
	</script>
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section id="content">
				<div class="container">
					<div><h1>이용 후기</h1></div>
					<div><p>후기 작성은 선택이지만, 타바의 발전에 큰 도움이 됩니다 !</p></div>
					<div><p>이용하시면서 불편한 사항이나, 개선 사항 등을 말씀해주세요 !</p></div>
					<div><p>당신의 소중한 후기를 기다리고 있겠습니다<img src="../resources/icon/fullheart.png" /></p></div>
					
					<form name="frm">					
					<div style="position: relative;">
					  <textarea id="myTextarea" style="width: 100%" cols="100" rows="15" name="reviewContent" oninput="validateAndCountCharacters(this)" maxlength="700"></textarea>
					  <span id="characterCount"></span>
					</div>

					<div id="useListBtn">					
						<button onclick="validateForm()" type="button">작성 완료</button>
						<button onclick="location.href='<%=request.getContextPath()%>/'">나가기</button>						
					</div>
					
					<script>
					function validateForm() {
					  var reviewContent = document.getElementsByName('reviewContent')[0].value.trim();
					  
					  if (reviewContent === '') {
					    alert('리뷰를 작성하시려면 \n내용을 입력해주세요.');
					  } else {
					    document.forms['frm'].submit();
					  }
					}
					</script>
					
					</form>
				</div>		
			</section>
		</main>
	</body>
</html>