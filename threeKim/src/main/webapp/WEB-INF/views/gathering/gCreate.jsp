<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 만들기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">		
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		 <style type="text/css">
		 	/*만들기 부분*/
			#main section h3{display: inline-block;font-size: 18px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 80%; height: 200px;font-size: 23px;}
			#main section button{text-align: center;}  
			#main section img{width: 100px;height: 100px;}   
			#main section .radio{display: inline-block;width: 4%; margin-top: 10px; } 
			#main section span{font-size: 20px;} 
			
			/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
					/*만들기 부분*/
		   #gatheringIntro{width:100%; height:auto; background-color:#F8F8F8;  border-radius:10px;  }  
					
			#main section h3{display: inline-block;font-size: 27px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 80%; height: 200px;font-size: 23px;}
			#main section button{text-align: center;}  
			#main section img{width: 100px;height: 100px;}  
			#main section .radio{display: inline-block;width: 4%; margin-top: 10px; } 
			#main section span{font-size: 20px;} 
				}
		 </style>
	</head>
	<body>
	<%@include file="../header2.jsp" %>
	<main id="main">
		<form method="post" action="${pageContext.request.contextPath}/gathering/gCreateAction.do" enctype="multipart/form-data">
		<section class="gContainer gSetContainer">
			<div>
				<div> 
					<div>
						<h3>모임 이름</h3>
						<p>필수</p>
					</div>
					<input class="gInput" type="text" placeholder="내용을 입력해주세요" name="gInfoName">
				</div>
				<div>
					<div>
						<h3>모임 지역</h3>
						<p>필수</p>
					</div>
					<input class="gInput" type="text" placeholder="내용을 입력해주세요" name="gInfoArea">										
				</div>
				<div>
					<h3>모임 프로필 이미지</h3>
					<div>										
						<input id="image" type="file" name="GTImg" onchange="previewImage(event)" style="display: none;"/>
						<label for="image">
						  <img id="imagePreview" src="${pageContext.request.contextPath}/resources/icon/photoFrame.png" />
						</label>
					</div>
					
				</div>
				<div>
					<h3>모임 소개 이미지</h3>
					<div>

					<div id="imageUploadContainer">
					  <input id="imageInfo" type="file" name="GImg" onchange="uploadImage(event)" style="display: none;"/>
					</div>
					<div id="previewContainer" style="display: inline-block;"></div>
					<label for="imageInfo">
						<img id="imagePreviewInfo" src="${pageContext.request.contextPath}/resources/icon/photoFrame.png" />
					</label>
	
					</div>
	
				</div>
				<div>
					<h3>모임 간단 소개글</h3>
					<input class="gInput" type="text" placeholder="맨 앞에 노출되는 간단 소개글입니다." name="gInfoBriefIntroduction">		
				</div>
				<div>
					<h3>모임 소개글</h3>
					<textarea rows="5" cols="5" placeholder="글자제한:500자이내" name="gInfoAreaIntroduction"></textarea>		
				</div>
				<div>
					<div>
						<h3>모임 정원(최대 100명)</h3>
						<p>필수</p>
					</div>
					<input class="gInput" type="number" placeholder="예:5" name="gInfoCapacity">	
				</div>
				<div>
					<div>
						<h3>승인타입</h3>
						<p>필수</p>
					</div>
					<input class="radio" type="radio" name="gInfoJoinType" value="자유가입" checked="checked"> <span>자유가입</span>
					<input class="radio" type="radio" name="gInfoJoinType" value="승인가입"> <span>승인가입</span> 
				</div>
			</div>
			<div>
				<button class="gBtn2">만들기</button>				 
			</div>
		</section> 
		</form>
	</main>
	<%@include file="../footer.jsp" %>
	<script type="text/javascript">
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
	var totalUploads = 0;

	  function uploadImage(event) {
	    var input = event.target;
	    var imageUploadContainer = document.getElementById('imageUploadContainer');
	    var previewContainer = document.getElementById('previewContainer');
	    var imageLabel = document.getElementById('imageLabel');
		var imagePreviewInfo = document.getElementById('imagePreviewInfo');
	    if (totalUploads < 5) {
	      var files = input.files;
	      for (var i = 0; i < files.length; i++) {
	        var file = files[i];
	        var reader = new FileReader();

	        reader.onload = function(e) {
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
	        newImageInput.name = 'GImg';
	        newImageInput.onchange = uploadImage;
	        newImageInput.style.display = 'none';
	        imageUploadContainer.appendChild(newImageInput);
	      } else {
	        // 사진이 5개 이상이면 추가 이미지 업로드 숨기기
	        imagePreviewInfo.style.display = 'none';
	      }
	    }

	    // 썸네일 업데이트 
	    var thumbnail = document.getElementById('imagePreview2');
	    if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function(e) {
	        thumbnail.src = e.target.result;
	      };
	      reader.readAsDataURL(input.files[0]);
	    } else {
	      thumbnail.src = '${pageContext.request.contextPath}/resources/icon/photoFrame.png';
	    }
	  }


	</script>
	</body>
</html>