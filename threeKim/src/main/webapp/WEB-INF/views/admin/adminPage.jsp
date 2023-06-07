<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 메인화면</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_admin.css">  
		<style type="text/css"> 
	.aContainer{height:800px; }
	.aContent{height:200px; flex-wrap:nowrap; width:100%;}
	.aContent2{display: flex;}	   
    .abox{width:265px; height:150px; margin:20px; padding:30px; box-sizing:border-box; border:1px solid #ccc; text-align:center; border-radius:10px; }	
	.abox2{width:570px; height:350px; margin:20px 20px 20px 35px; padding:5px; box-sizing:border-box; border:1px solid #ccc; text-align:center; border-radius:10px;}
	.abox3{width:570px; height:350px; margin:20px; padding:5px; box-sizing:border-box; border:1px solid #ccc; text-align:center; border-radius:10px;}
	.cardTitle{margin-bottom:40px;}	
	.abox2 table, .abox3 table {width: 70%; border-collapse: collapse;margin: 15px 	83.703px ;line-height: 60px;font-size: 18px;font-family: 'omyu_pretty';}
	.pcontent {font-size:32px;}	
		
		</style>
	</head>
	<body>
		<%@include file="../header4.jsp" %>

		<main id="main">
			<section class="aContainer">
				<div class="aContent">
					<div class="abox">
						<h3 class="cardTitle">총 자전거</h3>
						<p class="pcontent">${bkidxCount}대</p>
					</div>	
					
					<div class="abox"  onclick="location.href='${pageContext.request.contextPath}/admin/adminbikeList.do'">
						<h3 class="cardTitle">대여 중인 자전거</h3>
						<p class="pcontent">${ridxCount}대</p>
					</div>	
					
					<div class="abox" onclick="location.href='${pageContext.request.contextPath}/admin/adminbikeError.do'">
						<h3 class="cardTitle">고장난 자전거</h3>
						<p class="pcontent">${errorCount}대</p>
					</div>	
					
					<div class="abox">
						<h3 class="cardTitle">대여 가능한 자전거</h3>
						<p class="pcontent">${rentCount}대</p>				
					</div>
				
				</div>		
				
				<div class="aContent2">	
					<div class="abox2">
						<table>
							<h2>대여소 현황</h2>													
							<tr>
							<td>송천</td>
							<td>일반 : ${snorCount}대</td>
							<td>전기 : ${seleCount}대</td>							
							</tr>
							<tr>
							<td>효자</td>
							<td>일반 : ${hnorCount}대</td>
							<td>전기 : ${heleCount}대</td>							
							</tr>
							<tr>
							<td>덕진</td>
							<td>일반 : ${dnorCount}대</td>
							<td>전기 : ${deleCount}대</td>							
							</tr>
							<tr>
							<td>평화</td>
							<td>일반 : ${pnorCount}대</td>
							<td>전기 : ${peleCount}대</td>							
							</tr>
							<tr>
							<td>오목</td>
							<td>일반 : ${onorCount}대</td>
							<td>전기 : ${oeleCount}대</td>							
							</tr>
						</table>					
					</div>		
					<div class="abox3">
						<table>
							<h2>이용 현황</h2>													
							<tr>
							<td>5월 30일</td>
							<td>일반 : 55대</td>
							<td>전기 : 26대</td>							
							</tr>
							<tr>
							<td>5월 31일</td>
							<td>일반 : 10대</td>
							<td>전기 : 12대</td>							
							</tr>
							<tr>
							<td>5월 31일</td>
							<td>일반 : 10대</td>
							<td>전기 : 12대</td>							
							</tr>
							<tr>
							<td>5월 31일</td>
							<td>일반 : 10대</td>
							<td>전기 : 12대</td>							
							</tr>
							<tr>
							<td>5월 31일</td>
							<td>일반 : 10대</td>
							<td>전기 : 12대</td>							
							</tr>
						</table>					
					</div>
				</div>	
								
	
			</section>
		</main>

	</body>
</html>
