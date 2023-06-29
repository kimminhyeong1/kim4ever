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
			#main section h3{display: inline-block;font-size: 24px; margin-bottom: 10px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 10px 0px 10px 100px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 86%; height: 200px; padding: 5px; font-size: 20px; border-radius: 20px; border: 1px solid #ccc; resize: none;}
			#main section button{text-align: center;}  
			#main section img{width: 100px;height: 100px; border-radius: 10px;}   
			#main section .radio{display: inline-block;width: 4%; margin-top: 10px; } 
			#main section span{font-size: 20px;} 
			#gInfoArea{font-family: 'omyu_pretty';font-size: 24px;box-sizing: border-box;width: 16%;padding: 10px;margin: 2px 0;border: 1px solid #ccc;border-radius: 20px;}
			.gBtn2{margin-bottom:20px;}
			/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
					/*만들기 부분*/
					
			#main section h3{display: inline-block;font-size: 20px;}
			#main section p{display: inline-block; color: #f14242; padding-left: 10px;}
			#main section>div:nth-child(1){margin: 20px 0px 20px 35px;}
			#main section>div:nth-child(2){text-align: center;}
			#main section>div>div{margin: 20px 0px 20px 0px;}
			#main section input {display: block;}
			#main section textarea {display: block; width: 80%; height: 200px;font-size: 20px;}
			#main section button{text-align: center;}  
			#main section img{width: 50px;height: 50px;}  
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
					<input id="gInfoName" class="gInput" type="text" placeholder="내용을 입력해주세요" name="gInfoName" maxlength='8' onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"  oninput="updateCharacterCount('gInfoName')">
					<p id="nameMsg" class="ability_chk" style="display:none;">사용가능한 모임명 입니다.</p>
				   <span id="gInfoNameCount"></span>
				
				</div>
				<div>
					<div>
						<h3>모임 지역</h3>
						<p>필수</p>
					</div>
					<select name="gInfoArea" id="gInfoArea">
						<option value="덕진구" selected="selected">덕진구</option>	
						<option value="완산구">완산구</option>	
					</select>
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
					<input id="gInfoBriefIntroduction" class="gInput" type="text" placeholder="맨 앞에 노출되는 간단 소개글입니다." name="gInfoBriefIntroduction" maxlength='50' onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"  oninput="updateCharacterCount('gInfoBriefIntroduction')">
					 <span id="gInfoBriefIntroductionCount"></span>		
				</div>
				<div>
					<h3>모임 소개글</h3>
					<textarea id="gInfoAreaIntroduction" rows="5" cols="5" placeholder=" 100자이내" name="gInfoAreaIntroduction" maxlength='100' onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"  oninput="updateCharacterCount('gInfoAreaIntroduction')"></textarea>
					 <span id="gInfoAreaIntroductionCount"></span>		
							
				</div>
				<div>
					<div>
						<h3>모임 정원(최대 100명)</h3>
						<p>필수</p>
					</div>
					<input class="gInput" type="number" placeholder="예:5" name="gInfoCapacity" id="gInfoCapacity" max="100" oninput="if (this.value > 100) this.value = 100;">	
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

		function characterCheck(obj){
			var regExp = /[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi;
		    if(regExp.test(obj.value)){
		        alert("특수문자는 입력할 수 없습니다.");
		        obj.value = obj.value.substring( 0 , obj.value.length - 1 );
		    }
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
			  updateCharacterCount('gInfoName');
			  updateCharacterCount('gInfoBriefIntroduction');
			  updateCharacterCount('gInfoAreaIntroduction');
			  
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
        var gInfoArea = document.getElementById("gInfoArea").value;
        var image = document.getElementById("image").value;    
        var imageInfo1 = document.getElementById("imageInfo1").value;    
        var gInfoCapacity = document.getElementById("gInfoCapacity").value;    
        
        if (gInfoName === "") {
            alert("모임 이름을 입력해주세요.");
            return false; // 양식 제출을 중지합니다.
        }

        if (gInfoArea === "") {
            alert("모임 지역을 입력해주세요.");
            return false; // 양식 제출을 중지합니다.
        }
        
        if (image === "") {
            alert("모임 프로필이미지를 올려주세요.");
            return false; // 양식 제출을 중지합니다.
        }
        
        if (imageInfo1 === "") {
            alert("모임 소개이미지를 올려주세요.");
            return false; // 양식 제출을 중지합니다.
        }
        
        if (gInfoCapacity === "") {
            alert("모임 정원을 입력해주세요.");
            return false; // 양식 제출을 중지합니다.
        }
    	 // 추가적인 입력 유효성 검사를 위해 validateInput() 함수 호출
        if (!validateInput()) {
          return false; // 폼 제출 중단
        }

        return true; // 양식을 제출합니다.
    }
    
    function validateInput() {

        var briefIntroduction = document.getElementById("gInfoBriefIntroduction").value;
        var areaIntroduction = document.getElementById("gInfoAreaIntroduction").value;
        
        // 입력 값의 앞뒤 공백 제거하기
        briefIntroduction = briefIntroduction.trim();
        areaIntroduction = areaIntroduction.trim();

        // "간단한 소개" 필드 유효성 검사
        if (briefIntroduction.length === 0) {
          // 빈 입력 처리
          alert("간단한 소개를 입력해주세요.");
          return false;
        } else if (briefIntroduction.length > 100) {
          // 100자를 초과하는 경우 처리
          alert("간단한 소개는 100자 이내로 입력해주세요.");
          return false;
        } else if (!/^[a-zA-Z0-9가-힣\s]+$/.test(briefIntroduction)) {
          // 특수 문자 처리
          alert("간단한 소개에는 영문, 숫자, 한글, 공백 문자만 포함될 수 있습니다.");
          return false;
        }

        // "모임 소개글" 필드 유효성 검사
        if (areaIntroduction.length === 0) {
          // 빈 입력 처리
          alert("모임 소개글를 입력해주세요.");
          return false;
        } else if (areaIntroduction.length > 500) {
          // 100자를 초과하는 경우 처리
          alert("모임 소개글은 100자 이내로 입력해주세요.");
          return false;
        } else if (!/^[a-zA-Z0-9가-힣\s]+$/.test(areaIntroduction)) {
          // 특수 문자 처리
          alert("모임 소개글에는 영문, 숫자, 한글(초성불가), 공백 문자만 포함될 수 있습니다.");
          return false;
        }

        // 유효성 검사 통과
        return true;
      }
    
    
	</script>
	
	
	</body>
</html>