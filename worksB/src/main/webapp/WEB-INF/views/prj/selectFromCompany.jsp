<!-- A1은 YEs A2는 NO -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.icon {
	width: 30px;
	height: 30px;
}

.block {
	margin-left: 50px;
}

.project-name {
	display: inline-block;
	width: 550px;
}

.blank {
	display: inline-block;
	width: 30px;
}

.finger {
	cursor: pointer;
}

.gray {
	color: gray;
}
</style>
</head>

<body>
<!-- 	<div> -->
<%-- 		<c:forEach items="${projectList }" var="list"> --%>
<%-- ${list.projectName } --%>
<%-- ${list.memberId } --%>
<!-- <br> -->
<%-- 		</c:forEach> --%>
<%-- 		<c:forEach items="${particirList }" var="plist"> --%>
<!-- 			<br> -->
<%-- 	${plist.memberId } --%>
<%-- 	${plist.particirAccp } --%>
<!-- 	<br> -->
<%-- 		</c:forEach> --%>
<!-- 	</div> -->

	<div class="block">
		<h3>회사 전체 프로젝트</h3>
		<br>

				<c:forEach items="${projectList }" var="list">
				
				
					<c:if test="${list.projectAccess eq 'YES' }">
						<img class="icon" alt="전체공개이미지" title="전체공개" src="${pageContext.request.contextPath }/resources/icon/globe.svg">
						
						<c:if test="${list.particirAccp eq 'YES' }">
							<span class="project-name finger" onclick="location.href='projectFeed?projectId=${list.projectId}'">&nbsp;${list.projectName}</span> 
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }&nbsp; 
							<hr>
						</c:if>
						
						<c:if test="${list.particirAccp eq 'NO' }">
							<span class="project-name finger"><a onclick="accp('${list.projectId}','Y')">&nbsp;${list.projectName}(미승인)</a></span>
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }&nbsp; 
							<hr>
						</c:if>
						
						<c:if test="${list.particirAccp eq null }">
							<span class="project-name finger" onclick="location.href='projectFeed?projectId=${list.projectId}'">&nbsp;${list.projectName}</span> 
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }&nbsp; 
							<img class="icon finger" alt="참여하기" title="프로젝트에 참여하기" src="${pageContext.request.contextPath }/resources/icon/signPrj.svg">
							<hr>
						</c:if>
					</c:if>
					
					
					<c:if test="${list.projectAccess eq 'NO' }">
						<span class="blank"></span>
							
						<c:if test="${list.particirAccp eq 'YES' }">
							<span class="project-name finger" onclick="location.href='projectFeed?projectId=${list.projectId}'">&nbsp;${list.projectName}</span> 
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }&nbsp; 
							<hr>
						</c:if>
						
						<c:if test="${list.particirAccp eq 'NO' }">
							<span class="project-name gray finger" title="입장권한이 없습니다"><a onclick="accp('${list.projectId}','N')">&nbsp;${list.projectName}(미승인)</a></span>
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }&nbsp; 
							<hr>
						</c:if>
						
						<c:if test="${list.particirAccp eq null }">
							<span class="project-name gray" title="입장권한이 없습니다">&nbsp;${list.projectName}</span>
							<img class="icon finger" alt="참여하기" title="프로젝트에 참여하기" src="${pageContext.request.contextPath }/resources/icon/signPrj.svg">
							<hr>
						</c:if>
					</c:if>
				</c:forEach>
<!-- 이자리에ul있었음 -->
	</div>







	
</body>
<script>
	function accp(id,accp){
		alert('승인되지 않은 프로젝트입니다')
		if(accp=='Y'){
			window.location.href='${pageContext.request.contextPath }/projectFeed?projectId='+id
		}
	}
	
</script>
</html>