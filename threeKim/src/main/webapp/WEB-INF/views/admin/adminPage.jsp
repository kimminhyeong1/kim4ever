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
			.list{width:300px; border:1px solid #000;}
			
			.menu_list {
				display: flex;
				flex-direction: column;
				align-items: flex-start;
				margin-left: 30px;
				clear: both;
			}

			.menu_list li {
				width: 100%;
				border-bottom: 1px solid #f5f5f5;
				padding-top: 40px;
				font-family: 'GangwonEdu_OTFBoldA';
			}

			.menu_list li a {
				color: #000;
				text-decoration: none;
				font-weight: bold;
				font-size: 21px;
			}
		</style>
	</head>
	<body>
		<%@include file="../header4.jsp" %>

		<main id="main">
			<section class="aContainer">
				<div class="aContent"> 
					
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
