<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>타:바-모임-사진첩쓰기</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
      <link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
      <link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo7.png">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1">		
      
      <style type="text/css">
         .gContainer{border: 1px solid #0000;}
         /*사진첩 틀*/ 
         .gContent{; border:1px solid #bbb;background-color:#fbfdfa;border-radius:20px; padding: 20px;box-sizing border-box;display:flex;flex-direction:column;align-items:flex-start;}
         /*사진첩 부분*/
         .card{height: 320px; background-color: #d2dfcc;}
         .cardImg{height: 80%;}
         /*버튼 부분*/
         #createBtn{text-align: right;}   
         /*페이징 부분*/
         .gPaging{font-size: 25px;}   
         /* 사진첩 날짜와 제목 */
         .albumHeader {margin-bottom:20px;text-align:left;    }
         /* 사진첩 내용 */
         .albumContent {width:1000px;height:auto;font-size:24px;line-height:2;border:1px solid #000;}
         .albumContent img {max-width:100%;height:auto;margin-bottom:10px;border-radius:20px;}
         /* 글 작성 테이블 */
         .gContent table {width:100%; border-collapse:collapse; margin: 60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty';}
         .gContent table th{width:140px;padding: 10px;text-align: center;}
         .gContent table td{padding:10px; text-align:left; border-left:1px solid #ddd;}
         .gContent table tr{border:1px solid #ddd;}
         .gContent table input[type="text"],textarea{box-sizing:border-box;width:100%;padding:10px;margin:2px 0;border:1px solid #ccc;border-radius:20px; font-size:21px;}
		 .imagePreview { max-width: 300px; max-height: 300px; width: auto; height: auto;}
		 			/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
				       .gContainer{border: 1px solid #0000;}
         /*사진첩 틀*/ 
         .gContent{width:auto; border:1px solid #bbb;background-color:#fbfdfa;border-radius:20px; padding: 20px;box-sizing border-box;display:flex;flex-direction:column;align-items:flex-start; margin-top: 40px;}
         /*사진첩 부분*/
         .card{height: 320px; background-color: #d2dfcc;}
         .cardImg{height: 80%;}
         /*버튼 부분*/
         #createBtn{text-align: right;}   
         /*페이징 부분*/
         .gPaging{font-size: 25px;}   
         /* 사진첩 날짜와 제목 */
         .albumHeader {margin-bottom:20px;text-align:left;    }
         /* 사진첩 내용 */
         .albumContent {width:auto;height:auto;font-size:20px;line-height:2;border:1px solid #000;}
         .albumContent img {max-width:100%;height:auto;margin-bottom:10px;border-radius:20px;}
         /* 글 작성 테이블 */
         .gContent table {width:100%; border-collapse:collapse; margin: 0 auto; line-height:30px; font-size:24px; font-family: 'omyu_pretty';}
         .gContent table th{width:140px;padding: 10px;text-align: center;}
         .gContent table td{padding:10px; text-align:left; border-left:1px solid #ddd;}
         .gContent table tr{border:1px solid #ddd;}
         .gContent table input[type="text"],textarea{box-sizing:border-box;width:100%;padding:10px;margin:2px 0;border:1px solid #ccc;border-radius:20px; font-size:18px;}
		 .imagePreview { max-width: 200px; max-height: 200px; width: auto; height: auto;}
			#gPhotoAlbumTitleCount{font-size:15px;}
			#gPhotoAlbumContents0Count{font-size:15px;}
			#gPhotoAlbumContents1Count{font-size:15px;}
			#gPhotoAlbumContents2Count{font-size:15px;}
			#gPhotoAlbumContents3Count{font-size:15px;}
			
				}	 
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
    fm.action = "<%=request.getContextPath()%>/gathering/gPhotoAlbumWriteAction.do";
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
	});

	function Back() {
	  history.back();
	}

</script>
   <body>
      <%@include file="../header2.jsp" %>
      <%@include file="header3.jsp" %>
 	<main id="main">
			<form name="frm" >
	    <section class="gContainer">
	        <div class="gContent">
	            <table>
	                <tr>
	                    <th>제목</th>
	                    <td><input type="text" id="gPhotoAlbumTitle"  placeholder="20자이내" name="gPhotoAlbumTitle" oninput="updateCharacterCount('gPhotoAlbumTitle')" maxlength="20" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
	                     <span id="gPhotoAlbumTitleCount"></span>	                    
	                    </td>
	                    
	                </tr>
	                <tr>
	                    <th>대표 이미지</th>
	                    <td><input type="file" id="image" name="GATImg" /></td>
	                </tr>
	                
	                <tbody id="dynamicRows">
	                    <tr>
	                        <th>이미지1</th>
	                        <td>
	                        <input type="file" class="image" name="GAImg" id="image2"onchange="previewImage(event)" required multiple />
	                         <img class="imagePreview" id="imagePreview0" />
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th>내용글1</th>
	                        <td>
	                            <input type="text"  name="gPhotoAlbumContents0"  class="content" name="gPhotoAlbumContents0" placeholder="100자이내" oninput="updateCharacterCount('gPhotoAlbumContents0')" maxlength="100" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" >
	                         	<span id="gPhotoAlbumContents0Count"></span>
	                             
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	        
	        <div id="createBtn">
		        <button type="button" class="gBtn2" style="min-width: 130px"onclick="addRow()">이미지 추가 업로드+</button>
		        <button type="button" class="gBtn2" onclick="fnWrite();">작성하기</button>  
		        <button type="button" class="gBtn2" onclick="Back()">취소하기</button>
	        </div>
	    </section>
	</form>
    </main>
    
 <%@include file="../footer.jsp" %>
      
    
 <script type="text/javascript">
  // 행 추가 함수
  function addRow() {
    var dynamicRows = document.getElementById("dynamicRows");
    var rowCount = dynamicRows.childElementCount / 2;

    //이미지와 내용의 최대 개수를 정의 (이미지와,텍스트는 최대 3개만 올릴 수 있게 제한함)
    var maxCount = 3;

    if (rowCount >= maxCount) {
      alert("더 이상 추가할 수 없습니다.");
      return;
    }

    //이미지 엘리먼트 생성
    var imageRow = document.createElement("tr");
    var imageTh = document.createElement("th");
    imageTh.textContent = "이미지" + (rowCount + 1);
    var imageTd = document.createElement("td");
    var imageInput = document.createElement("input");
    imageInput.type = "file";
    imageInput.className = "image";
    imageInput.name = "GAImg";
    imageInput.onchange = previewImage;
    imageInput.required = true;
    imageInput.multiple = true;
    imageInput.dataset.previewId = "imagePreview" + rowCount; //미리보기 이미지 ID를 저장하기 위한 데이터 속성 추가
    imageTd.appendChild(imageInput);
    imageRow.appendChild(imageTh);
    imageRow.appendChild(imageTd);

    //이미지 미리보기 엘리먼트 생성
    var imagePreview = document.createElement("img");
    imagePreview.className = "imagePreview"; //ID를 클래스로 변경

    imagePreview.id = "imagePreview" + rowCount; //고유한 ID를 미리보기 이미지에 추가
    imageTd.appendChild(imagePreview);

    //내용 엘리먼트 생성
    var contentRow = document.createElement("tr");
    var contentTh = document.createElement("th");
    contentTh.textContent = "내용글" + (rowCount + 1);
    var contentTd = document.createElement("td");
    var contentInput = document.createElement("input");
    contentInput.type = "text";
    contentInput.className = "content";
    contentInput.name = "gPhotoAlbumContents" + rowCount;
    contentInput.placeholder = "100자 이내"; //유효성검사한 필요한요소 추가
    contentInput.setAttribute("oninput", "updateCharacterCount('gPhotoAlbumContents" + rowCount + "')");
    contentInput.setAttribute("maxlength", "100");
    contentInput.setAttribute("onkeyup", "characterCheck(this)");
    contentInput.setAttribute("onkeydown", "characterCheck(this)");//여기까지
    contentTd.appendChild(contentInput);
    contentRow.appendChild(contentTh);
    contentRow.appendChild(contentTd);
    
    dynamicRows.appendChild(imageRow);
    dynamicRows.appendChild(contentRow);
    
    // 글자 수 업데이트를 표시하는 요소 생성
    var countElement = document.createElement("span");
    countElement.id = "gPhotoAlbumContents" + rowCount + "Count";
    contentTd.appendChild(countElement);

    contentRow.appendChild(contentTh);
    contentRow.appendChild(contentTd);

    dynamicRows.appendChild(imageRow);
    dynamicRows.appendChild(contentRow);

    // 글자 수 업데이트 초기화
    updateCharacterCount("gPhotoAlbumContents" + rowCount);

    //이미지 미리보기 초기화
    var newImageInput = imageTd.querySelector(".image");
    newImageInput.addEventListener("change", previewImage);
    previewImage({ target: newImageInput });
  }

  //이미지 미리보기 함수
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

  //페이지 로드 시, 이미지 미리보기 초기화
  window.addEventListener("DOMContentLoaded", function() {
    var images = document.getElementsByClassName("image");

    for (var i = 0; i < images.length; i++) {
      images[i].addEventListener("change", previewImage);
      //파일 입력 엘리먼트에 대해 미리보기 이미지 실행
      previewImage({ target: images[i] });
    }
  });
</script>
   </body>
</html>