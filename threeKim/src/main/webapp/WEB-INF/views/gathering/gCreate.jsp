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
		 <style type="text/css">
		 	/*만들기 부분*/
			#main section h3{display: inline-block;font-size: 27px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 500px;height: 200px;font-size: 23px;}
			#main section button{text-align: center;}  
			#main section img{width: 100px;height: 100px;}  

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
						<input id="image" type="file" name="GTImg" onchange="previewImage(event)" />
						<img id="imagePreview" />
					</div>
					
				</div>
				<div>
					<h3>모임 소개 이미지</h3>
					<div>

					<div id="imageUploadContainer">
					  <input id="image" type="file" name="GImg" onchange="uploadImage(event)" />
					</div>
					<div id="previewContainer"></div>

	
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
	      newImageInput.name = 'GImg';
	      newImageInput.onchange = uploadImage;
	      imageUploadContainer.appendChild(newImageInput);
	    }
	  }

	  // Update the thumbnail with the first selected image
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