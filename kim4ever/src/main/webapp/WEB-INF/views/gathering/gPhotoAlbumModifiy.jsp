<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-모임-사진첩</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
			/*사진첩 틀*/ 
			.gContent{width:97%; border:1px solid #bbb;background-color:#fbfdfa;border-radius:10px; padding: 20px;box-sizing border-box;display:flex;flex-direction:column;align-items:flex-start; margin-bottom:20px;}
			/*사진첩 부분*/
			.card{height: 320px; background-color: #d2dfcc;}
			.cardImg{height: 80%;}
			/*버튼 부분*/
			#createBtn{text-align: right;}	
			/*페이징 부분*/
			.gPaging{font-size: 25px;}		
			/* 사진첩 날짜와 제목 */
			.albumHeader {margin-bottom:20px;text-align:left; 	}
			/* 사진첩 내용 */
			.albumContent {width:1000px;height:auto;font-size:24px;line-height:2;border:1px solid #000;}
			.albumContent img {max-width:100%;height:auto;margin-bottom:10px;border-radius:5px;}
			/* 글 작성 테이블 */
			.gContent table {width:100%; border-collapse:collapse; margin: 60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty';}
			.gContent table th{width:140px;padding: 10px;text-align: center;}
			.gContent table td{padding:10px; text-align:left; border-left:1px solid #ddd;}
			.gContent table tr{border:1px solid #ddd;}
			.gContent table input[type="text"],textarea{box-sizing:border-box;width:100%;padding:10px;margin:2px 0;border:1px solid #ccc;border-radius:20px;}
			.gContent table textarea{font-size:21px; border-radius:20px; resize:none;}
			.imagePreview {max-width:300px;max-height:300px;width:auto;height:auto; }	
		</style>
	</head>
	
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
   
    
    if (fm.gPhotoAlbumTitle.value == "") {
        alert("제목을 입력하세요");
        fm.gPhotoAlbumTitle.focus();
        return;
    }
        else if (fm.image.value == "") {
            alert("대표이미지를 입력하세요");
            fm.image.focus();
            return;   
        }
	    var additionalImages = document.getElementsByClassName("image");
	    for (var i = 0; i < additionalImages.length; i++) {
	        if (additionalImages[i].value.trim() === "") {
	            alert("이미지를 입력하세요");
	            additionalImages[i].focus();
	            return;
	        }
	    }    
	    var contentsInputs = document.getElementsByClassName("content");
	    for (var j = 0; j < contentsInputs.length; j++) {
	        if (contentsInputs[j].value.trim() === "") {
	            alert("내용을 입력하세요");
	            contentsInputs[j].focus();
	            return;
	        }
	    }
    fm.action = "<%=request.getContextPath()%>/gathering/gPhotoAlbumModifyAction.do?gpaidx=${gpaidx}";
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
	  updateCharacterCount('gPhotoAlbumTitle');
	  updateCharacterCount('gPhotoAlbumContents0');
	  updateCharacterCount('gPhotoAlbumContents1');
	  updateCharacterCount('gPhotoAlbumContents2');

	});

</script>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<form name="frm" >
			<section class="gContainer">
			<c:forEach var="gjv" items="${gmist}" varStatus="status">
				<div class="gContent" >
					<table>	
					 <c:if test="${status.index == 0}">
						<tr>
							<th>제목</th>
							<td><input style="font-size:26px;"type="text" id="gPhotoAlbumTitle" name="gPhotoAlbumTitle" value="${gjv.gPhotoAlbumTitle }"  placeholder="20자이내" name="gPhotoAlbumTitle" oninput="updateCharacterCount('gPhotoAlbumTitle')" maxlength="20" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
							 <span id="gPhotoAlbumTitleCount"></span>   
							</td>
						</tr>
							
						<tr>
							<th>대표 이미지</th>
							<td><input type="file" id="image" name="GATImg"/></td>
						</tr>
					</c:if>
					
						<tr>
							<th>첨부파일</th>
							<td>
							<img class="imagePreview" src="../resources/GAImages/${gjv.imageName}">
							<input type="file" id="image2" name="GAImg" onchange="previewImage(event)"/>
							</td>
						</tr>
						
						<c:if test="${status.index == 0}">
						<tr>
							<th>내용</th>
							<td><textarea id="gPhotoAlbumContents0" name="gPhotoAlbumContents0"  class="content" name="gPhotoAlbumContents0" placeholder="100자이내" oninput="updateCharacterCount('gPhotoAlbumContents0')" maxlength="100" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" >${gjv.gPhotoAlbumContents0 }</textarea>
								<span id="gPhotoAlbumContents0Count"></span>							
							</td>
						</tr>
						</c:if>
						
						<c:if test="${status.index == 1}">
						<tr>
							<th>내용</th>
							<td><textarea id="gPhotoAlbumContents1" name="gPhotoAlbumContents1"  class="content" name="gPhotoAlbumContents0" placeholder="100자이내" oninput="updateCharacterCount('gPhotoAlbumContents0')" maxlength="100" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">${gjv.gPhotoAlbumContents1 }</textarea>
							<span id="gPhotoAlbumContents1Count"></span>
							</td>
						</tr>
						</c:if>
						
						<c:if test="${status.index == 2}">
						<tr>
							<th>내용</th>
							<td><textarea id="gPhotoAlbumContents2" name="gPhotoAlbumContents2"  class="content" name="gPhotoAlbumContents0" placeholder="100자이내" oninput="updateCharacterCount('gPhotoAlbumContents0')" maxlength="100" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">${gjv.gPhotoAlbumContents2 }</textarea>
							<span id="gPhotoAlbumContents2Count"></span>							
							</td>
						</tr>
						</c:if>
					</table>
				
				</div>
			</c:forEach>
				<div id="createBtn">
					<button type="button" class="gBtn2" onclick="fnWrite();">작성하기</button>
					<button class="gBtn2">취소하기</button>
				</div>
			</section>
			</form>
		</main>
		<%@include file="../footer.jsp" %>
		
		
<script type="text/javascript">
	//미리보기 이미지
	function previewImage(event) {
	    var input = event.target;
	    var reader = new FileReader();
	
	    reader.onload = function() {
	      var imagePreview = input.nextElementSibling;
	      imagePreview.src = reader.result;
	    };
	
	    if (input.files && input.files[0]) {
	      reader.readAsDataURL(input.files[0]);
	    }
	  }
	var totalUploads = 0;

	//이미지 업로드
	function uploadImage(event) {
	  var input = event.target;
	  var imageUploadContainer = document.getElementById('imageUploadContainer');
	  var thumbnail = document.getElementById('thumbnail');
	  var previewContainer = document.getElementById('previewContainer');

	  if (totalUploads < 5) {
	    var files = input.files;
	    for (var i = 0; i < files.length; i++) {
	      var file = files[i];
	      var reader = new FileReader();

	      reader.onload = function (e) {
	        var image = document.createElement('img');
	        image.src = e.target.result;
	        previewContainer.appendChild(image);
	      };

	      reader.readAsDataURL(file);
	      totalUploads++;
	    }

	    if (totalUploads < 5) {
	      var newImageInput = document.createElement('input');
	      newImageInput.id = 'image';
	      newImageInput.type = 'file';
	      newImageInput.name = 'GAImg';
	      newImageInput.onchange = uploadImage;
	      imageUploadContainer.appendChild(newImageInput);
	    }
	  }

	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      thumbnail.src = e.target.result;
	      thumbnail.style.display = 'block';
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    thumbnail.src = '#';
	    thumbnail.style.display = 'none';
	  }
	}
</script>
	</body>
</html>
