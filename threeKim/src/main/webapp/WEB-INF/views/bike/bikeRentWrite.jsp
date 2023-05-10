<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*리셋코드*/

*{margin:0;padding:0;}
li{list-style:none;}
#main{width:1440px; margin:35px auto 70px; text-align:center; }
#content{width:1440px; height:1500px;}
#bottom{width:1440px; height:300px;}
#content table {width:1000px; height:400px; border-collapse:collapse; margin:160px auto 20px; text-align:center;}
#content table td {border:1px solid #ddd; padding:10px;font-size:16px; line-height:1.5; text-align:left; margin-left:60px;}
#content table h2 {font-size:24px; margin-bottom:5px; }
#content table p {margin: 0;}
#content table input[type="text"],textarea{
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
#btn{text-align:right; margin-top:20px; margin-right:220px; }
#btn button{width:100px; height:35px; text-align:center; background:#ff9933; border-radius:10px; border:0px solid #ff9933; font-family:'omyu_pretty'; font-size:24px;}

</style>
</head>
<body>
<div id="main">
<%@include file="../header.jsp" %>
	
	<div id="content">
	
		<table>
			<tr>
				<td rowspan="4" style="width: 300px;"><input type="file" name="uploadfile"/></td>
				<td>
					<label for="name">이름 : </label>
					<input type="text">
				</td>
			</tr>
			
			<tr>
				<td>
				<label for="explan">설명 : </label>
				<input type="text">
				</td>
			</tr>
			
		 	<tr>
				<td>
				<p>
				<label for="bike-station">대여소 선택:</label>
					<select id="bike-station" name="bike-station">
					<option value="samcheon">삼천</option>
					<option value="hyocheon">효천</option>
					<option value="seosin">서신</option>
					<option value="hyoja">효자</option>
					<option value="jungwhasan">중화산동</option>
					</select>
				<label for="bike-quantity">잔여 자전거 수:</label>
				<input type="number" id="bike-quantity" name="bike-quantity" min="0" value="0" style="width:50px;"> 
				</p>
				</td>
			</tr>
			
			<tr>
				<td>
				<label for="price">가격 : </label>
				<input id="price" type="text"/>
				</td>
			</tr>
		 
		</table>
	
		<div id="btn">
			<button type="submit">등록</button>
		</div>
	
	
	</div>
	
	
	
	<div id="bottom">
	 <%@include file="../bottom.jsp" %>
	</div>


</div>
</body>
<%@include file="../footer.jsp" %>
</html>