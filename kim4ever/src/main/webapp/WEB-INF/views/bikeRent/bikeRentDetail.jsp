<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>타:바-자전거 소개</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">				
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent_mo.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		
		<!-- bikeState 유효성 검사  alert 창 스크립트-->
		<script>
		    var alertMessage = "${alertMessage}";
		
		    if (alertMessage !== "") {
		        alert(alertMessage);
		        history.back(); // 이전 페이지로 이동
		    }
		</script>
		
				
<script type="text/javascript">

	var IMP = window.IMP;
	IMP.init("imp01337483");
	
	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes(); // 분
	var seconds = today.getSeconds(); // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;
	
	function requestPay() {
	    IMP.request_pay({
	        pg: 'kakaopay', //카카오 페이
	        pay_method: 'card',
	        merchant_uid: 'merchant_' + new Date().getTime(),
	        name: '대여',
	        amount: '${bjv.rentPrice}', // 가격
	        buyer_name: '<%=session.getAttribute("memberName")%>',
	        buyer_tel: '구매자 번호',
	        buyer_addr: '${bjv.bikeLocation}',
	        buyer_postcode: ' ${bjv.bikeCode}',
	        popup: true,
	        m_redirect_url: "http://localhost:8080/myapp/index.jsp",
	   
    }, function(rsp) {
		console.log(rsp);
		// 결제검증
		$.ajax({
		    type: "POST",
		    url: "${pageContext.request.contextPath}/verifyIamport/" + rsp.imp_uid +"/pay.do",
		    success: function(data) {
		        console.log(data);
		        // 위의 rsp.paid_amount 와 data.response.amount를 비교한 후 로직 실행 (import 서버검증)
		        if (rsp.paid_amount == data.response.amount) {
		            alert("결제 및 결제검증 완료");
		            var fm = document.frm;
		            fm.action = "${pageContext.request.contextPath}/bikeRent/bikeRentUpdate.do";
		            fm.method = "post";
		            fm.submit();
		        } else {
		            alert("결제 실패");
		        }
		    },
		    error: function(xhr, status, error) {
		        console.log("AJAX 요청 실패: " + error);
		    }
		});
	});

	}
    

  $(document).ready(function() {

      //휴대폰 번호 인증
        var code2 = "";
        $("#phoneChk").click(function(){
        	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해 주세요.");
        	var phone = $("#phone").val();
        	$.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/bikeRent/phoneCheck.do?phone=" + phone,
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
                url: "${pageContext.request.contextPath}/bikeRent/verifyPhoneNumber.do",
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

                    document.getElementById('rentButton').disabled = false;

                } else {
                    $(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
                    $(".successPhoneChk").css("color", "red");
                    $("#phoneDoubleChk").val("false");
                    $("#phone2").focus();

                    document.getElementById('rentButton').disabled = true;
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
				<form id="frm" name="frm"  method="post" action="${pageContext.request.contextPath}/bikeRent/bikeRentUpdate.do">
				
			    <input type="hidden" name="bkidx" value="${bjv.bkidx}">
			
				<table id="bikeDetail">
				<tr>					
					<td colspan="3"><img src="${pageContext.request.contextPath}/resources/bikeimg/${bjv.bikeType eq '전기자전거' ? '전기자전거.jpg' : '일반자전거.jpg'}" alt="${bjv.bikeType}"></td>
					</tr>
					<tr>
					<td colspan="3"><h2>${bjv.bikeType}</h2></td>
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
				    <input id="phone" type="text" name="phone" maxlength="11" title="전화번호 입력" />
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
				    <input id="phone2" type="text" name="phone2" maxlength="6" title="인증번호 입력" />
				  </td>
				  
				  <td width="200px;">
				    <span id="phoneChk2" class="doubleChk" >인증확인</span><br/>
				    <span class="point successPhoneChk"></span>
					<input type="hidden" id="phoneDoubleChk"/>
				  </td>
				</tr>
				  
				<tr>
				  <td colspan="3">
					<button id="rentButton" class="rentButton" type="button" onclick="requestPay()" disabled >대여하기</button>
				  </td>
				</tr>
				<tr>
				<td>
				<button>테스트</button>
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