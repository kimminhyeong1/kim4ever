<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*리셋코드*/
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'KCC-Ganpan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

*{margin:0;padding:0;}
li{list-style:none;}
#main{width:1440px; margin:35px auto 70px; text-align:center;}
#content{width:1440px; height:2400px;}
#content table {width:1100px;height:400px;margin:160px auto 20px;text-align:center; border:none;border-collapse: collapse;font-size: 20px; /* 전체 폰트 크기 조정 */font-family: 'omyu_pretty';border-radius: 10px;}
#content table td {border:1px solid #ddd; padding:10px; font-size:20px; line-height:1.5;  text-align:center; text-align:left; border-radius:10px;}
#content table h2 {text-align:center;font-size:36px; margin-bottom: 5px; font-family: 'omyu_pretty';}
#content table p {margin:0; text-align:left; margin-left:20px;}
#content table input[type="number"],
#content table select {padding: 8px; border-radius: 4px;border: 1px solid #ccc;font-size: 18px;width: 200px; /* input의 너비 조정 */ margin-bottom: 10px; /* input과 input 사이의 간격 조정 */font-family: 'omyu_pretty';}
#content table button {padding: 8px;border-radius: 4px;font-size: 14px;cursor: pointer;margin-left: 10px; /* 버튼 간 간격 조정 */font-weight:bold; transition: all 0.2s ;border: 0px solid #Fec339;background:#Fec339}
#content table button {box-shadow: 0px 0px 0px 0px #cc9002}
#content table button:hover  {border: 0px white;   background-color: rgba(254, 195, 57, 0.4); color:grey;}
#content table input[type="text"]:hover, 
#content table input[type="number"]:hover, 
#content table select:hover {border: 1px solid #FEC337; }
#content table button{margin-top:10px; width:80px; height:35px; text-align:center;background:#ff9933;font-family: 'omyu_pretty'; font-size:18px;}
#bottom{width:1440px; height:300px;}
#content table input[type="text"],textarea{
  box-sizing: border-box;
  width:100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
#content table td:nth-child(1){width:200px;}
#content table td:nth-child(2){width:800px;}
#content table td:nth-child(3){width:100px;}
</style>

</head>
<body>
	<div id="main">
	<%@include file="../header.jsp" %>
	   
	<div id="content">
   
	<table>
		<tr>
			<td rowspan="6" style="width: 300px;"><img src="resources/bikeimg/일반자전거.jpg" alt="일반자전거"></td>
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
				<input type="number" id="bike-quantity" name="bike-quantity" min="0" value="0" style="width:50px;"> 
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
		    <input type="text" id="verification-code" style="flex: 1; width: 210; ">
		  </td>
		  <td>
		    <button type="button" onclick="verifyCode()">인증하기</button>
		  </td>
		</tr>
		  
		<tr>
			<td colspan="3">
			<p>이용 금액 : 0000원
				<button type="button" onclick="location.href='rentHistory.jsp'">예약하기</button>
			</p>
			</td>
		</tr>
	</table>
 </div>
   
   
   <div id="bottom">
      
   </div>
</div>
</body>
<script type="text/javascript">
const autoHyphen2 = (target) => {
    target.value = target.value
      .replace(/[^0-9]/g, '')
     .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
   }
</script>
<%@include file="../footer.jsp" %>
</html>