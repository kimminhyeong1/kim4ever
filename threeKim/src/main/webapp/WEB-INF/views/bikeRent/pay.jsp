<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myezen.myapp.domain.BikeVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	  		<meta charset="UTF-8">
		<title>응답해더 확인용</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">				
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent_mo.css?수정중">
		
		 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">


    function requestPay() {
        var IMP = window.IMP;
        IMP.init("imp01337483");
      
        IMP.request_pay({
            pg: 'kakaopay', //카카오 페이
            pay_method: 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name: ' 타:바 자전거 대여',
            amount: '1000', // 가격
            buyer_name: '<%=session.getAttribute("memberName")%>',
            buyer_tel: '구매자 번호',
            buyer_addr: '${bjv.bikeLocation}',
            buyer_postcode: ' ${bjv.bikeCode}',
            popup: true,
            m_redirect_url: "http://localhost:8080/myapp/index.jsp"
        }, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "${pageContext.request.contextPath}/verifyIamport/" + rsp.imp_uid +"/pay.do"
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
	}
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
		<h1> kakaoPay 테스트 이용 요금 : ${bjv.rentPrice}원</h1>
 
    <button onclick="requestPay()">결제하기</button>

 
			
			</section>
			
			
			
			
		</main>
		<%@include file="../footer.jsp" %>
	</body>
	<table id="bikeDetail_mo">
		
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
			</table>


</html>