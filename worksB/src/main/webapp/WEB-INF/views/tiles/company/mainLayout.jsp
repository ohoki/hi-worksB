<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/8af996bb56.js" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css">
<style >
	.main-page {
		display: flex;
	}
	#aside{
		width: 10%;
		height: 100vh;
	}
	#main{
		width: 90%;
	}
</style>		
</head>
<body>
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<div class="main-page">
		<aside id="aside">
			<tiles:insertAttribute name="aside" />
		</aside>
		<main id="main">
			<tiles:insertAttribute name="content" />
		</main>
	</div>
</body>
</html>