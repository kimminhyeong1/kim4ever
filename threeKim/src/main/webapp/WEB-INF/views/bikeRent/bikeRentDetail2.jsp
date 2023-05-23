<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_rent.css">  
<style>
#main{width:1440px; margin:35px auto 70px; text-align:center;}
#content{width:1440px; height:2400px;}
#content table {width:1100px;height:400px;margin:160px auto 20px;text-align:center; border:none;border-collapse: collapse;font-size: 20px; /* 전체 폰트 크기 조정 */font-family: 'omyu_pretty';border-radius: 10px;}
#content table td {border:1px solid #ddd; padding:10px; font-size:24px; line-height:1.5;  text-align:center; text-align:left; border-radius:10px;}
#content table h2 {text-align:center;font-size:36px; margin-bottom: 5px; font-family: 'omyu_pretty';}
#content table p {margin:0; text-align:left; margin-left:10px;}
#content table input[type="number"],
#content table select {padding: 8px; border-radius: 4px;border: 1px solid #ccc;font-size: 18px;width: 200px; margin-bottom: 10px; /* input과 input 사이의 간격 조정 */font-family: 'omyu_pretty';}
#content table input[type="text"]:hover, 
#content table input[type="number"]:hover, 
#content table select:hover {border: 1px solid #FEC337; }
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#bottom{width:1440px; height:300px;}
#content table input[type="text"],textarea{
  font-family: 'omyu_pretty';
  font-size:24px;
  box-sizing: border-box;
  width:100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
#content table td:nth-child(1){width:300px;}
#content table td:nth-child(2){width:700px;}
#content table td:nth-child(3){width:100px;}
</style>
</head>

<body>
	<%@include file="../header.jsp" %>
	<div id="main">
	   
	<div id="content"> 
   
	<table>
		<tr>
			<td rowspan="6" style="width: 300px;"><img src="../resources/bikeimg/일반자전거.jpg" alt="일반자전거"></td>
			<td colspan="3"><h2>일반 자전거</h2></td>
			
		</tr>
	
		<tr>
			<td colspan="3"><p>남녀노소 즐길 수 있는 자전거입니다 !</p></td>
			
		</tr>
	
		<tr>
			<td colspan="3">
			<p>
				<label for="bike-station">대여소 선택:</label>
					<select id="bike-station" name="bike-station">
					<option value="songcheon">송천</option>
					<option value="deokjin">덕진</option>
					<option value="omok">오목</option>
					<option value="pyeonghwa">평화</option>
					<option value="hyoja">효자</option>
					</select><br/>
				<label for="bike-quantity">잔여 자전거:</label>
				<input type="text" id="bike-quantity" name="bike-quantity" style="width:50px;"> 
			</p>
			</td>	
		</tr>
	
		<tr>
		  <td>
		    <label for="phone-number">휴대폰번호</label>
		  </td>
		  <td>
		    <input type="text" id="phone-number" oninput="autoHyphen2(this)" maxlength="13">
		  </td>
		  <td>
		    <button type="button" onclick="sendVerificationCode()">확인</button>
		  </td>
		</tr>
		
		<tr>
		  <td>
		    <label for="verification-code">인증번호</label>
		  </td>
		  <td>
		    <input type="text" id="verification-code" style="flex: 1; width: 210;" maxlength="6">
		  </td>
		  <td>
		    <button type="button" onclick="verifyCode()">대여하기</button>
		  </td>
		</tr>
		  
		<tr>
			<td colspan="3">
			<p>이용 금액 : 0000원
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentHistory.do'">대여하기</button>
			</p>
			</td>
		</tr>
	</table>
 </div>
   
   
   <div id="bottom">
      
   </div>
</div>
<%@include file="../footer.jsp" %>
</body>
ㅇ
</html>