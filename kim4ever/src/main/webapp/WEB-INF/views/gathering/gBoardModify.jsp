<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <%@ page import="com.myezen.myapp.domain.BoardVo" %>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타:바-모임-게시글수정</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo7.png">
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		<style type="text/css">
		 	/*모임 게시판 글쓰기 부분*/
			#main section h3{display: inline-block;font-size: 27px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 20px 100px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block; width: 100%;}
			#main section textarea {display: block; width: 100%;height: 200px;font-size: 23px; border-radius:20px; resize:none; padding:5px;}
			#main section button{text-align: center;}  
			#main section img{width: 100px;height: 100px;}
			#main section select{width: 100px; height: 40px; font-size: 18px; font-family: 'omyu_pretty'; border-radius:20px;text-align: center;} 	
			.gBtn2 {margin-bottom:20px;}		
		</style>
	</head>

	
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<form name="frm" >
			
				<input id="gbidx" type="hidden" name="gbidx" value="${gbv.gbidx}">
				<section class="gContainer gSetContainer">
					<div>
						<div> 
							<div>
								<h3>게시글 카테고리</h3>
							</div>
							<select name="gBoardCategory">
								<c:if test="${MGatheringMemberType eq 'TL' or MGatheringMemberType eq 'TLD'}">
									<option>공지사항</option>									
								</c:if>	
								<option>취미</option>	
								<option>일상</option>	
								<option>정모</option>	
								<option>가입인사</option>	
							</select> 
						</div>
						<div>
							<div>
								<h3>게시글 제목</h3>
							</div>
							<input id="gBoardTitle" class="gInput" type="text" name="gBoardTitle" placeholder="내용을 입력해주세요" value="${gbv.gBoardTitle}" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" maxlength="20" oninput="updateCharacterCount('gBoardTitle')">											
       					 <span id="gBoardTitleCount"></span>
						</div>
						<div>
							<h3>게시글 내용</h3>
							<textarea rows="5" cols="5" name="gBoardContents" placeholder="글자제한:500자이내" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"  maxlength="500" oninput="updateCharacterCount('gBoardContents')" >${gbv.gBoardContents}</textarea>		
							 <span id="gBoardContentsCount"></span>
							
						</div>
					</div><!-- 끝-->
					<div>
						<button class="gBtn2" type="button" onclick="fnWrite();">글쓰기</button>				 
					</div>
					
				</section>
			</form>
		</main>
		<%@include file="../footer.jsp" %>
		<script type="text/javascript">
		
			function characterCheck(obj){
				var regExp = /[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi;
			    if(regExp.test(obj.value)){
			        alert("특수문자는 입력할 수 없습니다.");
			        obj.value = obj.value.substring( 0 , obj.value.length - 1 );
			    }
			}
			function fnWrite() {
			    var fm = document.frm;
			    
			    // 특수문자 검사 정규식
			   
			    
			    if (fm.gBoardTitle.value == "") {
			        alert("제목을 입력하세요");
			        fm.gBoardTitle.focus();
			        return;
			    
			    } else if (fm.gBoardContents.value == "") {
			        alert("내용을 입력하세요");
			        fm.content.focus();
			        return;
			    } 
			    fm.action = "${pageContext.request.contextPath}/gathering/gBoardModifyAction.do";
			    fm.enctype = "multipart/form-data";
			    fm.method = "post";
			    fm.submit();
			    }
			
			function updateCharacterCount(inputName) {
				  var input = document.getElementsByName(inputName)[0];
				  var maxLength = parseInt(input.getAttribute('maxlength'));
				  var currentLength = input.value.length;
				  var countElement = document.getElementById(inputName + 'Count');
				  
				  countElement.textContent = currentLength + '/' + maxLength;
				}
			
				// 초기 로딩 시 글자 수 업데이트
				window.addEventListener('DOMContentLoaded', function() {
				  updateCharacterCount('gBoardTitle');
				  updateCharacterCount('gBoardContents');
				});
		
		</script>
	</body>
</html>
