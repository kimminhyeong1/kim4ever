<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>타다-자전거 고장/신고</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_rent.css"> 
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
	<style>
	
	#main{width:1250px; margin:35px auto 70px; text-align:center; }
	#content{width:1250px; height:1500px;}
	#bottom{width:1250px; height:300px;}
	#content img{width:600px; height:400px; margin-top:40px;}
	#content table {width:600px; height:400px; border-collapse:collapse; margin:50px auto 20px; text-align:center;}
	#content table td {border:1px solid #ddd; padding:10px;font-size:16px; line-height:1.5; margin-left:60px;}
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
	
	#content button{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
	#content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
	</style>
		<script type="text/javascript">
		$(document).ready(function(){
	    	$("#btn1").click(function(){

	            var fm = document.frm;
	      			
	      			 fm.action ="<%=request.getContextPath()%>/bikeRent/bikeRentFaultAction.do";  
	      			 fm.method = "POST";
	      			 fm.submit();
	
	       });//$("#btn1").click(function(){-----end
			
		});
		</script>
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<div id="main">	
			<div id="content">
				<h2>자전거 고장/신고</h2>
				<form name="frm" id="frm">
					<input type="hidden" value="${ridx}" name="ridx">
					<input type="hidden" value="${URL1}" name="URL1">
					<input type="hidden" value="${URL2}" name="URL2">
					<table>
						<tr>
							<td>
								<img src="../resources/bikeimg/bikeDetail.png" alt="bikeDetail">
							</td> 
						</tr>
					 	<tr>
					 		<td>
								<textarea cols="100" rows="15" name="errorContent"></textarea>
							</td>
						</tr>
						<tr>
							<td>
							 	<button type="button" id="btn1">작성하기</button>
							 	
							</td> 
						</tr>	
					</table>
				</form>
			</div>
			
			<div id="bottom">
			 <%@include file="../bottom.jsp" %>
			</div>
		</div>
		<%@include file="../footer.jsp" %>
	</body>
</html>