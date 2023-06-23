<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>타바-모임-사진첩</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
      <link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <style type="text/css">
         .gContainer{border: 1px solid #0000;}
         /*사진첩 틀*/ 
         .gContent{width:97%; border:1px solid #bbb;background-color:#f1f1f1;border-radius:10px; padding: 20px;box-sizing border-box;display:flex;flex-direction:column;align-items:flex-start;}
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
         .albumContent img {max-width:100%;height:auto;margin-bottom:10px;border-radius:5px;}
         /* 글 작성 테이블 */
         .gContent table {width:100%; border-collapse:collapse; margin: 60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty';}
         .gContent table th{width:140px;padding: 10px;text-align: center;}
         .gContent table td{padding:10px; text-align:left; border-left:1px solid #ddd;}
         .gContent table tr{border:1px solid #ddd;}
         .gContent table input[type="text"],textarea{box-sizing:border-box;width:100%;padding:10px;margin:2px 0;border:1px solid #ccc;border-radius:4px; font-size:21px;}
		 .imagePreview { max-width: 300px; max-height: 300px; width: auto; height: auto;}	 
      </style>
   </head>
   <body>
      <%@include file="../header2.jsp" %>
      <%@include file="header3.jsp" %>
 	<main id="main">
    <form action="${pageContext.request.contextPath}/gathering/gPhotoAlbumWriteAction.do" method="POST" enctype="multipart/form-data">
	    <section class="gContainer">
	        <div class="gContent">
	            <table>
	                <tr>
	                    <th>제목</th>
	                    <td><input type="text" id="gPhotoAlbumTitle" name="gPhotoAlbumTitle"></td>
	                </tr>
	                <tr>
	                    <th>대표 이미지</th>
	                    <td><input type="file" id="image" name="GATImg" /></td>
	                </tr>
	                
	                <tbody id="dynamicRows">
	                    <tr>
	                        <th>이미지1</th>
	                        <td>
	                        <input type="file" class="image" name="GAImg" onchange="previewImage(event)" required multiple />
	                         <img class="imagePreview" id="imagePreview0" />
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th>내용글1</th>
	                        <td>
	                            <input type="text" class="content" name="gPhotoAlbumContents0"> 
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	        
	        <div id="createBtn">
		        <button type="button" class="gBtn2" onclick="addRow()">이미지 추가 업로드+</button>
		        <button type="submit" class="gBtn2">작성하기</button>  
		        <button class="gBtn2">취소하기</button>
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
    contentTd.appendChild(contentInput);
    contentRow.appendChild(contentTh);
    contentRow.appendChild(contentTd);

    dynamicRows.appendChild(imageRow);
    dynamicRows.appendChild(contentRow);

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