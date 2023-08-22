<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
.icon {
	width: 30px;
	height: 30px;
}
.tiled, .list {
	float: right;
	margin-left: 20px;
	margin-right: 20px;
}
.tiled {
	margin-right: 70px;
}
.project-main{
    display: inline-block;
    border-radius: 18px;
    background-color: #fffae0;
    width: 300px;
    height: 150px;
    margin-bottom: 20px;
    margin-left: 10px;
}
.project-content {
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.bar{
    border-top-left-radius: 13px;
    border-bottom-left-radius: 13px;
    background-color: black;
    width: 20px;
    height: 150px;
    float: left;
    margin-right: 10px;
}
.little-icon{
	display:inline-block;
	width: 20px;
	height: 20px;
}
</style>
</head>
<body>
	<div class="block">
		<h3>내프로젝트</h3>
		<br>
		<div class="icons">
			<a href="${pageContext.request.contextPath }/projectGrid"><img class="tiled icon" alt="타일형으로 보기"
				src="${pageContext.request.contextPath }/resources/icon/microsoft.svg"></a>
			<a href="${pageContext.request.contextPath }/projectList"><img class="list icon" alt="리스트로 보기"
				src="${pageContext.request.contextPath }/resources/icon/list.svg"></a>
		</div>
		<h4 class="star-list">즐겨찾기</h4>
		<div class="like-container">
			<c:forEach items="${bookmarked }" var="list">
				<div class="none-star">
		    		<div class="project-main">
		       			<div class="bar"></div>
		        		<div class="project-content">
				            <img class="little-icon colored-star" alt="즐겨찾기 별" src="${pageContext.request.contextPath }/resources/icon/fullStar.svg" data-id="${list.projectId }" data-end="NO"> 
				            <p>${list.projectName}</p>
				           <img class="little-icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }
		        		</div>
	        		</div>
    			</div>
    		</c:forEach>
		</div>
		</div>
		
		
		<h4 class="none-star-list">프로젝트</h4>
		<div class="dislike-container">
			<c:forEach items="${noneBookmarked }" var="list">
				<div class="none-star">
		    		<div class="project-main">
		       			<div class="bar"></div>
		        		<div class="project-content">
				            <img class="little-icon colored-star" alt="즐겨찾기 별" src="${pageContext.request.contextPath }/resources/icon/fullStar.svg" data-id="${list.projectId }" data-end="NO"> 
				            <p>${list.projectName}</p>
				           <img class="little-icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }
		        		</div>
	        		</div>
    			</div>
			</c:forEach>
		</div>
</body>
</html>