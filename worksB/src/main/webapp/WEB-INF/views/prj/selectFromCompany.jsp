<!-- A1은 YEs A2는 NO -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.project-name{
	display:inline-block;
	width:550px;
}
.blank{
	display:inline-block;
	width: 30px;
}
.finger{
	cursor: pointer;
}
.gray{
	color: gray;
}
</style>
</head>
<body>
<div>
<c:forEach items="${projectList }" var="list">
${list.projectName }
${list.memberId }
<br>
<!-- 프로젝트가 전체공개인경우,참여권한이y/n/참여신청을 하지 않은 경우로 구분된다 -->

<!-- prj_particier테이블에 member_id가 등록된 경우에 참여권한이 Y/N로 나뉨 -->

<!-- 프로젝트가 전체공개가 아닌 경우, 세션에 있는 member_id와 일치여부에 따라 달라짐					     -->
</c:forEach>
</div>
	<div class="block">
		<h3>회사 전체 프로젝트</h3>
		<br>
		<c:forEach items="${projectList }" var="list">
			<div class="container">
				<ul>
					<li>
						<c:if test="${list.projectAccess eq 'YES'}">
							<img class="icon" alt="전체공개이미지" title="전체공개"  src="${pageContext.request.contextPath }/resources/icon/globe.svg">
						</c:if>
						<c:if test="${list.projectAccess ne 'YES'}">
							<span class="blank"></span>
						</c:if>

						<c:choose>		
						    <c:when test="${list.projectAccess eq 'YES'}">
						    	<c:if test="${list.memberId eq memberId}">
							    	<c:if test="${list.particirAccp eq 'YES'}">
							            <span class="project-name finger" onclick="location.href='projectFeed?projectId=${list.projectId}'">&nbsp;${list.projectName}</span> 
							        </c:if>
							        <c:if test="${list.particirAccp eq 'NO' }">
						            	<span class="project-name finger"><a onclick="accp('${list.projectId}','Y')">&nbsp;${list.projectName}</a></span>
						        	</c:if>
						    	</c:if>
						    	
						    	<c:if test="${list.memberId ne memberId }">
							        <c:if test="${list.particirAccp eq 'YES'}">
							            <span class="project-name finger" onclick="location.href='projectFeed?projectId=${list.projectId}'">&nbsp;${list.projectName}</span> 
							        </c:if>
							        <c:if test="${list.particirAccp eq null}">
							            <span class="project-name finger" onclick="location.href='projectFeed?projectId=${list.projectId}'">&nbsp;${list.projectName}</span> 
							        </c:if>
							        <c:if test="${list.particirAccp eq 'NO' }">
							            <span class="project-name finger"><a onclick="accp('${list.projectId}','Y')">&nbsp;${list.projectName}</a></span>
							        </c:if>
						    	</c:if>
						    </c:when>

						    
						    <c:when test="${list.projectAccess eq 'NO' }">
						    	<c:if test="${list.memberId eq memberId}">
							<!--참여신청이 승인된 경우 -->
						    		<c:if test="${list.particirAccp eq 'YES'}">
						    			<span class="project-name finger" onclick="location.href='projectFeed?projectId=${list.projectId}'">&nbsp;${list.projectName}</span> 
						    		</c:if>
							<!--참여신청이 승인되지 않은 경우 -->
						    		<c:if test="${list.particirAccp eq 'NO' }">
						            	<span class="project-name"><a onclick="accp('none','n')">&nbsp;${list.projectName}</a></span>
						        	</c:if>
						    	</c:if>
							<!--member_id가 session의 것과 일치하지 않으면 프로젝트로의 접근이 불가함 -->
						    	<c:if test="${list.memberId ne memberId}">
						        	<span class="project-name gray" title="입장권한이 없습니다">&nbsp;${list.projectName}</span>
						    	</c:if>
						    	
						    </c:when>

						</c:choose>
						
						<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }&nbsp;
						
						<c:if test="${list.memberId ne memberId and list.particirAccp eq null }">
							<img class="icon finger" alt="참여하기" title="프로젝트에 참여하기" src="${pageContext.request.contextPath }/resources/icon/signPrj.svg">
						</c:if>
					</li>
					<hr>
				</ul>
			</div>
		</c:forEach>
	</div>
</body>
<script>
	function accp(id,accp){
		alert('승인되지 않은 프로젝트입니다')
		if(accp=='Y'){
			window.location.href='projectFeed?projectId='+id
		}
	}
	
</script>
</html>