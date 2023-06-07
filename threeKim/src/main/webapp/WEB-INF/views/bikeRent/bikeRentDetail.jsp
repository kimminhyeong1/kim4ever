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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
 
      
      //휴대폰 번호 인증
        var code2 = "";
        $("#phoneChk").click(function(){
        	
        	var phone = $("#phone").val();
        	
        	$.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/bikeRent/phoneCheck.do?phone=" + phone,
                cache : false,
                success:function(data){
                	if(data == "error"){
                		alert("휴대폰 번호가 올바르지 않습니다. \n회원가입 시 입력한 전화번호를 입력해 주세요")
        				$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
        				$(".successPhoneChk").css("color","red");
        				$("#phone").attr("autofocus",true);
                	}else{	        	
                		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해 주세요.");
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
                    } else {
                        $(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
                        $(".successPhoneChk").css("color", "red");
                        $("#phoneDoubleChk").val("false");
                        $("#phone2").focus();
                    }
                }
            });
        }); 
        
      
        var IMP = window.IMP;
        IMP.init("imp67011510");

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
                merchant_uid: "IMP" + makeMerchantUid,
                name: ' 타:바 자전거 대여',
                amount: '${bjv.rentPrice}', // 가격
                buyer_name: '<%=session.getAttribute("memberName")%>',
                buyer_tel: '구매자 번호',
                buyer_addr: '${bjv.bikeLocation}',
                buyer_postcode: ' ${bjv.bikeCode}',
                popup: true,

                m_redirect_url: ''
            }, function(rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = rsp.name + '결제가 완료되었습니다.' + '\n';
                    msg += '구매자 : ' + rsp.buyer_name + '\n';
                    msg += '대여소위치 : ' + rsp.buyer_addr + '\n';
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    //성공시 제출
                    var fm = document.frm;
                    fm.action = "${pageContext.request.contextPath}/bikeRent/bikeRentUpdate.do";
                    fm.method = "post";
                    fm.submit();
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
        }

</script>
        
 
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section class="container">
			<div id="content">
				<form id="frm" name="frm"  method="post">
				
			    <input type="hidden" name="bkidx" value="${bjv.bkidx}">
			
				<table id="bikeDetail">
				<tr>
					<td rowspan="10"><img src="${pageContext.request.contextPath}/resources/bikeimg/일반자전거.jpg" alt="일반자전거"></td>
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
				    <span id="phoneChk2" class="doubleChk" >인증확인</span><br/>
				    <span class="point successPhoneChk"></span>
					<input type="hidden" id="phoneDoubleChk"/>
				  </td>
				</tr>
				  
				<tr>
				  <td colspan="3">
				  	<button onclick="requestPay()" style="width:100%; height:50px;">대여하기</button>
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