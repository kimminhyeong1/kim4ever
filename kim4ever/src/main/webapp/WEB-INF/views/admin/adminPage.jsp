<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 메인페이지</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_admin.css">  
		<style type="text/css"> 
	.aContainer{height:800px; }
	.aContent{height:200px; flex-wrap:nowrap; width:100%;}
	.aContent2{display: flex;}	   
    .abox{width:265px; height:150px; margin:20px; padding:30px; box-sizing:border-box; border:1px solid #ccc; text-align:center; border-radius:10px; }	
	.abox2{width:570px; height:auto; margin:0 20px 40px 35px; padding:-5px; box-sizing:border-box; border:1px solid #ccc; text-align:center; border-radius:10px;}
	.abox3{width:570px; height:auto; margin:0 20px 40px 20px; padding:-5px; box-sizing:border-box; border:1px solid #ccc; text-align:center; border-radius:10px;}
	/* .abox3{width:570px; margin:20px; padding:5px; box-sizing:border-box; border:1px solid #ccc; text-align:center; border-radius:10px;} */
	.cardTitle{margin-bottom:40px; border-bottom:1px solid #ddd;}	
	.abox2 table, .abox3 table {width: 60%; border-collapse: collapse;margin: 15px 	83.703px ;line-height: 60px;font-size: 18px;font-family: 'omyu_pretty';}
	.pcontent {font-size:32px;}	
	.abox2 th{font-size:35px;}
	.abox3 th{font-size:35px;}
	h2{margin-top:20px; padding-bottom:20px; border-bottom:1px solid #ddd;}
		
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
					
					<div class="abox" onclick="location.href='${pageContext.request.contextPath}/admin/adminbikeList.do'">
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
				
				<script>
				function openPopup(url) {
					window.open(url, "_blank", "width=800,height=600"); // 팝업 창 열기					
				}
				</script>
				
				<div class="aContent2">	
					<div class="abox2">
						<table>
						<h2>대여소 현황</h2>																				
							<tr>
								<th>대여소</th>
								<th>일반</th>
								<th>전기</th>
							</tr>	
							<c:forEach var="rblist" items="${rblist}">
	           				<tr>
						         <td>${rblist.rentalshopName}대여소</td>
						         <td>${rblist.bikeNorCnt}대</td>
						         <td>${rblist.bikeEleCnt}대</td>
			        		</tr>
        					</c:forEach>
						</table>					
					</div>		
					<div class="abox3">
						<table>
			   			 <h2>이용 현황</h2>
			    <thead>
			        <tr>
			            <th>날짜</th>
			            <th>일반</th>
			            <th>전기</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="rbclist" items="${rbclist}">
			            <tr>
			                <td>${rbclist.dayago}</td>
				         	<td>${rbclist.rentNorCount}대</td>
				         	<td>${rbclist.rentEleCount}대</td>
			            </tr>
			        </c:forEach>
			    </tbody>
			</table>					
					</div>
				</div>	
								
	
			</section>
		</main>

	</body>
</html>
