<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>타다-자전거 소개</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">
		 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

  $(document).ready(function() {
    	
        $("#frm").on("submit", function(e) {
            e.preventDefault(); // 폼 전송 기본 동작 막기 -> submit이 동작했을 때 페이지를 새로고침 안시키기 위해서 사용

            var fm = document.frm;
            fm.action = "${pageContext.request.contextPath}/bikeRent/bikeRentUpdate.do";
            fm.method = "post";
            fm.submit();
        });
  
        
      //휴대폰 번호 인증
        var code2 = "";
        $("#phoneChk").click(function(){
        	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해 주세요.");
        	var phone = $("#phone").val();
        	$.ajax({
                type:"GET",
                url:"phoneCheck.do?phone=" + phone,
                cache : false,
                success:function(data){
                	if(data == "error"){
                		alert("휴대폰 번호가 올바르지 않습니다.")
        				$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
        				$(".successPhoneChk").css("color","red");
        				$("#phone").attr("autofocus",true);
                	}else{	        		
                		$("#phone2").attr("disabled",false);
                		$("#phoneChk2").css("display","inline-block");
                		$(".successPhoneChk").text("인증번호를 입력하세요.");
                		$(".successPhoneChk").css("color","green");
                		$("#phone").attr("readonly",true);
                		code2 = data;
                	}
                }
            });
        });
		
      //휴대폰 인증번호 대조
        $("#phoneChk2").click(function(){
        	var phoneNumber = $("#phone").val();
            var verificationCode = $("#phone2").val();
            $.ajax({
                type: "POST",
                url: "verifyPhoneNumber.do",
                data: {
                    phoneNumber: phoneNumber,
                    verificationCode: verificationCode
                },
                cache: false,
                success: function(data) {
                    if (data === "success") {
                        $(".successPhoneChk").text("인증번호가 일치합니다.");
                        $(".successPhoneChk").css("color", "green");
                        $("#phoneDoubleChk").val("true");
                        $("#phone2").attr("disabled", true);
                    } else {
                        $(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
                        $(".successPhoneChk").css("color", "red");
                        $("#phoneDoubleChk").val("false");
                        $("#phone2").focus();
                    }
                }
            });
        });
        
  })
</script>
        
 
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section class="container">
			<div id="content">
				<form id="frm" name="frm" action="${pageContext.request.contextPath}/bikeRent/bikeRentUpdate.do" method="post">
				
			    <input type="hidden" name="bkidx" value="${bjv.bkidx}">
			
				<table id="bikeDetail">
				<tr>
					<td rowspan="10"><img src="../resources/bikeimg/일반자전거.jpg" alt="일반자전거"></td>
					<td colspan="3"><h2>일반 자전거</h2></td>
				</tr>
			
				<tr>
					<td colspan="3">${bjv.bikeContent }</td>
				</tr>
			
				<tr>
					<td colspan="3">자전거 고유번호 : ${bjv.bikeCode}</td>	
				</tr>
				
				<tr>
					<td colspan="3">자전거 위치 : ${bjv.bikeLocation}대여소</td>
				</tr>
				
				<tr>
					<td colspan="3">이용 요금 : ${bjv.rentPrice}원</td>
				</tr>
			
				<tr>
				  <td colspan="3">
				    <label for="phone">휴대폰 번호</label>
				  </td>
				</tr>
				
				<tr>
				  <td colspan="2">
				    <input id="phone" type="text" name="phone" maxlength="11" title="전화번호 입력" required/>
				  </td>
				  
				  <td width="200px;">
				    <span id="phoneChk" class="doubleChk">인증번호 보내기</span>
				  </td>
				</tr>
				
				<tr>
				  <td colspan="3">
				    <label for="verification-code">인증번호</label>
				  </td>
				</tr>
				
				<tr>
				  <td colspan="2">
				    <input id="phone2" type="text" name="phone2" maxlength="6" title="인증번호 입력" disabled required/>
				  </td>
				  
				  <td width="200px;">
				    <span id="phoneChk2" class="doubleChk" ">인증확인</span><br/>
				    <span class="point successPhoneChk"></span>
					<input type="hidden" id="phoneDoubleChk"/>
				  </td>
				</tr>
				  
				<tr>
				  <td colspan="3">
				  	<button type="submit" style="width:100%; height:50px;">대여하기</button>
				  </td>
				</tr>
			</table>
			</form>
			</div>
			</section> 
		</main>
		<%@include file="../footer.jsp" %>
	</body>

</html>