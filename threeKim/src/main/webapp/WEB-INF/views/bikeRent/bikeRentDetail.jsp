<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function rental() {
    $(document).ready(function() {
        $("#frm").on("submit", function(e) {
            e.preventDefault(); // 폼 전송 기본 동작 막기 -> submit이 동작했을 때 페이지를 새로고침 안시키기 위해서 사용

            var fm = document.frm;
            fm.action = "${pageContext.request.contextPath}/bikeRent/bikeRentUpdate.do";
            fm.method = "post";

            fm.submit();
        });
    }); 
}
</script>
		<meta charset="UTF-8">
		<title>타다-자전거 소개</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css"> 

 
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
				    <label for="phone-number">휴대폰번호</label>
				  </td>
				</tr>
				
				<tr>
				  <td colspan="2">
				    <input type="text" id="phone-number" oninput="autoHyphen2(this)" maxlength="13">
				  </td>
				  
				  <td>
				    <button type="button" onclick="sendVerificationCode()">인증번호발송</button>
				  </td>
				</tr>
				
				<tr>
				  <td colspan="3">
				    <label for="verification-code">인증번호</label>
				  </td>
				</tr>
				
				<tr>
				  <td colspan="2">
				    <input type="text" id="verification-code" style="flex: 1; width: 210;" maxlength="6">
				  </td>
				  
				  <td>
				    <button type="button" onclick="verifyCode()">인증확인</button>
				  </td>
				</tr>
				  
				<tr>
				  <td colspan="3">
				  	<button type="submit" style="width:100%; height:50px;">대여하기</button>
				  	
				  	<%-- onclick="location.href='<%=request.getContextPath() %>/bikeRent/bikeRentUseList.do?bkidx=${bjv.bkidx }'" --%>
				  </td>
				</tr>
			</table>
			</form>
			</div>
			</section> 
		</main>
		<%@include file="../footer.jsp" %>
	</body>
<!-- <script type="text/javascript">
function autoHyphen2(target) {
	  target.value = target.value
	    .replace(/[^0-9]/g, '')
	    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
	    .replace(/(\-{1,2})$/g, "");
	}
</script> -->
</html>