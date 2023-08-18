<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.icon{
	width: 30px;
	height: 30px;
}
.block {
	margin-left: 50px;
}
</style>
</head>
<body>
	<div class="block">
		<h3>회사 전체 프로젝트</h3>
		<br>
		<c:forEach items="${projectList }" var="list">
			<div class="container">
				<ul>
					<li>
						<span hidden>${list.projectId }</span>
						<c:choose>
							<c:when test="${list.projectAccess eq 'YES' }">
								<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span> 
							</c:when>
							<c:when test="${list.projectAccess eq 'NO' }">${list.projectName}</c:when>
						</c:choose>
						<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }
						<c:if test="${list.projectAccess eq 'YES'}">
							<img class="icon" alt="전체공개이미지"  src="${pageContext.request.contextPath }/resources/icon/globe.svg">
						</c:if>
					</li>
				</ul>
			</div>
		</c:forEach>
	</div>
</body>
</html>