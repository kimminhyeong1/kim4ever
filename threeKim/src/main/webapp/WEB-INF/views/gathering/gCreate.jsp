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
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>		
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
					
			#main section h3{display: inline-block;font-size: 20px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 20px 0px 20px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 80%; height: 200px;font-size: 20px;}
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
		<form method="post" action="${pageContext.request.contextPath}/gathering/gCreateAction.do" enctype="multipart/form-data" onsubmit="return validateForm();">
		<section class="gContainer gSetContainer">
			<div>
				<div> 
					<div>	
						<h3>모임 이름</h3>
						<p>필수</p>
					</div>
					<input id="gInfoName" class="gInput" type="text" placeholder="내용을 입력해주세요" name="gInfoName">
					<p id="nameMsg" class="ability_chk" style="display:none;">사용가능한 모임명 입니다.</p>
				</div>
				<div>
					<div>
						<h3>모임 지역</h3>
						<p>필수</p>
					</div>
					<input class="gInput" type="text" placeholder="내용을 입력해주세요" name="gInfoArea">
					<p id="areaMsg" class="ability_chk" style="display:none;">입력.</p>										
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
						  <input id="imageInfo1" type="file" name="GImg" onchange="previewImage2(event, 1)" style="display: none;">
						  <input id="imageInfo2" type="file" name="GImg" onchange="previewImage2(event, 2)" style="display: none;">
						  <input id="imageInfo3" type="file" name="GImg" onchange="previewImage2(event, 3)" style="display: none;">
						  <input id="imageInfo4" type="file" name="GImg" onchange="previewImage2(event, 4)" style="display: none;">
						  <input id="imageInfo5" type="file" name="GImg" onchange="previewImage2(event, 5)" style="display: none;">
						</div>
						<div id="previewContainer" style="display: inline-block;">
						  <label for="imageInfo1">
						    <img id="imagePreview1" src="${pageContext.request.contextPath}/resources/icon/photoFrame.png">
						  </label>
						  <label for="imageInfo2">
						    <img id="imagePreview2" src="${pageContext.request.contextPath}/resources/icon/photoFrame.png">
						  </label>
						  <label for="imageInfo3">
						    <img id="imagePreview3" src="${pageContext.request.contextPath}/resources/icon/photoFrame.png">
						  </label>
						  <label for="imageInfo4">
						    <img id="imagePreview4" src="${pageContext.request.contextPath}/resources/icon/photoFrame.png">
						  </label>
						  <label for="imageInfo5">
						    <img id="imagePreview5" src="${pageContext.request.contextPath}/resources/icon/photoFrame.png">
						  </label>
						</div>
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
		//전역변수
		$(document).ready(function(){
		var nameFlag;
		
			
			$("#gInfoName").blur(function(){//blur input값에 쓰고 다른데로 갈때 발동
				var name = document.getElementById("gInfoName").value;
				var oMsg = document.getElementById("nameMsg");
				var oMsgC = document.getElementById("nameMsgCheck");
			
				nameFlag = false;
				
				if (name == "") {				
				    oMsg.style.display = "block";
				    oMsg.style.color = "red";
					oMsg.style.padding = "15px 0px 0px 5px";
					oMsg.style.textAlign = "left"; 
					oMsg.className = "ability_chk";
					oMsg.innerHTML = "모임 이름을 입력해주세요.";
					return false;
				}
				
				 try {
						// 성공 Api
						var url = '${pageContext.request.contextPath}/gathering/gInfoNameCheck.do';
						var param = [{ name: "gInfoName", value: name }];

						$.ajax({
							url: url,
							data: param,
							type: "GET",
							contentType: "application/json;",
							dataType: "json",
							success: function (data) {
								if (data.value == 1) {
									oMsg.style.display = "block";
									oMsg.style.color = "red";
									oMsg.style.padding = "15px 0px 0px 5px";
									oMsg.style.textAlign = "left";
									oMsg.className = "ability_chk";
									oMsg.innerHTML = "이미 사용중인 모임명입니다.";
									return false;
								} else {
									oMsg.style.display = "block";
									oMsg.style.color = "red";
									oMsg.style.padding = "15px 0px 0px 5px";
									oMsg.style.textAlign = "left";
									oMsg.className = "ability_chk submit";
									oMsg.innerHTML = "사용 가능한 모임명입니다.";
								}
								nameFlag = true;	
								return true;
							},
							error: function (error) {
								alert("Error");
							}
						});
					} catch (e) {
						if (window.bridgeGotTime) {
							throw e;
						 } else {
							//page reload?
						 }
					}
					return true; 
					
			});
		});		

	
	</script>
	
	
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
	
	function previewImage2(event, index) {
		  var input = event.target;
		  var reader = new FileReader();

		  reader.onload = function() {
		    var preview = document.getElementById('imagePreview' + index);
		    preview.src = reader.result;
		  };

		  if (input.files && input.files[0]) {
		    reader.readAsDataURL(input.files[0]);
		  }
		}

	
	








	







	</script>
	
	<script>
    function validateForm() {
        var gInfoName = document.getElementById("gInfoName").value;
        var gInfoArea = document.getElementsByName("gInfoArea")[0].value;

        if (gInfoName === "") {
            alert("모임 이름을 입력해주세요.");
            return false; // 양식 제출을 중지합니다.
        }

        if (gInfoArea === "") {
            alert("모임 지역을 입력해주세요.");
            return false; // 양식 제출을 중지합니다.
        }

        return true; // 양식을 제출합니다.
    }
</script>
	
	
	</body>
</html>