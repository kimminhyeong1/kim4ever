<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myezen.myapp.domain.BikeVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
    <script>
        var IMP = window.IMP; 
        IMP.init("imp67011510"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

        function requestPay() {
            IMP.request_pay({
                pg : 'kakaopay', //카카오 페이
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : ' 타:바 자전거 대여"',
                amount : 10,
                buyer_name : ' <%=session.getAttribute("memberName")%>',
                buyer_tel : '구매자 번호',
                buyer_addr : '전주시 덕진구',
                buyer_postcode : '123-456',
                popup: true,

                m_redirect_url: "https://openai.com/blog/chatgpt",  //완료후 이동할 페이지
                	notice_url: "",// 웹훅url 웹훅연동을 생략하시는 경우 결제결과를 정상적으로 수신받지 못하는 상황이 발생

            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
        
        
        
        /*
        }, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/verifyIamport/" + rsp.imp_uid 
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
		        	alert("결제 및 결제검증완료");
	        	} else {
	        		alert("결제 실패");
	        	}
	        });
		});
	}*/
    </script>
	
		<meta charset="UTF-8">
		<title>결제</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">  
	</head>


	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section id="content">
		<h1> kakaoPay 테스트 </h1>
 
    <button onclick="requestPay()">결제하기</button>

 
			
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
	


</html>