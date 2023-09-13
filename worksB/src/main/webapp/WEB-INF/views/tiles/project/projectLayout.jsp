<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/img/company_logo.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/8af996bb56.js" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/projectHeader.css">
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.7.0.min.js"></script>
<style >
	.main-page {
		display: flex;
	}
	#aside{
		width: 10%;
		height: 93vh;
	}
	#main{
		width: 90%;
		height: 93vh;
		overflow: auto;
		overflow-x: hidden;
	}
	
	#main::-webkit-scrollbar {
  		width: 15px;	
	}
	
  	#main::-webkit-scrollbar-thumb {
	    background-color: #2f3542;
	    border-radius: 10px;
	    background-clip: padding-box;
	    border: 2px solid transparent;
	    background-color: var(--color-light-red);
  	}
  	
  	#main::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
	    background-color: var(--color-dark-beigie);
  	}
	body {
		height: 100vh;
		overflow: hidden;
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
			<tiles:insertAttribute name="projectHeader"/>
			<tiles:insertAttribute name="content" />
		</main>
	</div>
</body>
</html>