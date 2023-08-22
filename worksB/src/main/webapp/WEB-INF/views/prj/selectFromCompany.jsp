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
.list-title {
	font-size: var(--font-regular);
	padding: 0 30px;
	margin-bottom: 15px;
}

.list-box {
	width: 70%;
	margin: 0 auto;	
	font-size: 18px; 
	font-weight: var(--weight-semi-bold);
}

.list {
	padding: 10px 40px;
	margin: 5px 0;
	background-color: rgba(174, 213, 245, 0.1);
	border-radius: 5px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.list-option {
	display: flex;
	align-items: center;
	margin: 20px 0 30px;
	justify-content: space-between;
}

.list-option select {
	width: 100px;
	height: 30px;
	border-radius: 4px;
  	border: 1px solid var(--color-light-blue);
  	outline: none;
}

.list-option select:focus{
	outline: none;
}

.project-name {
	margin-right: 50px;
	height: 30px;
	line-height: 30px;
	display: flex;
	align-items: center;
}

.project-info {
	display: flex;
	align-items: center;
	margin-right: 80px;
}

.dept-list {
	display: flex;
	justify-content: flex-start;
	font-size: 16px; 
	color: var(--color-light-grey);
}

.list-count {
	font-size: var(--font-small); 
	font-weight: var(--weight-bold);
}

.list-count span {
	color: var(--color-red);
	margin-left: 5px;
}

.dept-list li {
	padding: 10px 10px;
	border-radius: 10px;
	margin-right: 10px;
	cursor: pointer;
	border: 1px solid rgba(174, 213, 245, 0);
}

.dept-list li:hover {
	border: 1px solid rgb(174, 213, 245);
	background-color: rgb(174, 213, 245);
	color: white;	
}

.icon {
	width : 30px;
	height : 30px;
}

.prj-icon {
	margin: 0 10px;
	display: inline-block;
}

.list-btn {
	width: 70px;
	height: 34px;
	border-radius: 17px;
	color: white;
	cursor: default;
}
.point {
	cursor: pointer;
}
.green {
	background-color: var(--color-green);
}

.yellow {
	background-color: var(--color-orange);
}

.red {
	background-color: var(--color-red);
}


</style>
</head>

<body>
	<h3 class="list-title">회사 전체 프로젝트</h3>
	<div style="padding: 5px 50px;">
		<ul class="dept-list">
			<li class="view-dept" onclick='viewPart("all")'>전체보기</li>
			<c:forEach items="${deptList }" var="dept">
				<li class="view-dept" onclick='viewPart("${dept.deptId }")' data-id="${dept.deptId }">${dept.deptName }</li>
			</c:forEach>
		</ul>
	</div>
	<div class="list-box">
		<div class="list-option">
			<div class="list-count">전체 <span>${projectList.size() }</span></div>
			<div>
				<select class="option">
					<option value="select1">진행중</option>
					<option value="select2">만료</option>
				</select>
			</div>
		</div>
		<!-- 프로젝트리스트 전체(particirAccp가 Y,N,null로 나뉨) -->
		<c:forEach items="${projectList }" var="list">
			<div class="list">
				<!-- 회사전체공개프로젝트의 경우 -->
				<c:if test="${list.projectAccess eq 'YES' }">
					<div class="project-name">
						<img class="prj-icon" alt="전체공개이미지" title="전체공개" src="${pageContext.request.contextPath }/resources/icon/globe-solid.svg">
						<!-- particirAccp(승인여부)Y -->
						<c:if test="${list.particirAccp eq 'YES' }">
							<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span>  
						</c:if>
						<!-- particirAccp(승인여부)N -->
						<c:if test="${list.particirAccp eq 'NO' }">
							<span><a onclick="accp('${list.projectId}','Y')">${list.projectName}(미승인)</a></span>
						</c:if>
						<!-- particirAccp(승인여부)null(참여신청을 하지 않았다는 의미) -->
						<c:if test="${list.particirAccp eq null }">
							<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span> 
						</c:if>
					</div>
					
					<!-- 참여버튼 클릭 시 참여하기 기능 구현  필요함 -->
					<div class="project-info">
						${list.prjParticirNum }<img class="prj-icon" alt="참가인원" title="참가인원" src="${pageContext.request.contextPath }/resources/icon/user-solid.svg">
						<!-- particirAccp(승인여부)Y -->
						<c:if test="${list.particirAccp eq 'YES' }">
							<button type="button" class="list-btn red">참여중</button>  
						</c:if>
						<!-- particirAccp(승인여부)N -->
						<c:if test="${list.particirAccp eq 'NO' }">
							<button type="button" class="list-btn yellow">승인대기</button>
						</c:if>
						<!-- particirAccp(승인여부)null(승인신청을 하지 않았다는 의미) -->
						<c:if test="${list.particirAccp eq null }">
							<button type="button" class="list-btn green point">참여하기</button>
						</c:if>
					</div>
				</c:if>
				
				<!-- 비공개프로젝트의 경우 -->
				<c:if test="${list.projectAccess eq 'NO' }">
					<div class="project-name">
						<img class="prj-icon" alt="참여자공개이미지" title="참여자만 공개" src="${pageContext.request.contextPath }/resources/icon/lock-solid.svg">
						<!-- particirAccp(승인여부)Y -->
						<c:if test="${list.particirAccp eq 'YES' }">
							<span class="project-name finger" onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span> 
						</c:if>
						<!-- particirAccp(승인여부)N -->
						<c:if test="${list.particirAccp eq 'NO' }">
							<span class="project-name gray finger" title="입장권한이 없습니다"><a onclick="accp('${list.projectId}','N')">${list.projectName}(미승인)</a></span>
						</c:if>
            
            <!--ajax를 이용해서 부서별 조회도 가능하도록 구현하는 것도 추후에....ㅠ -->
						
            <!-- particirAccp(승인여부)null(승인신청을 하지 않았다는 의미) -->
						<c:if test="${list.particirAccp eq null }">
							<span class="project-name gray" title="입장권한이 없습니다">${list.projectName}</span>
						</c:if>
					</div>
					
					<div class="project-info">
						${list.prjParticirNum }<img class="prj-icon" alt="참가인원" title="참가인원" src="${pageContext.request.contextPath }/resources/icon/user-solid.svg">
						<!-- particirAccp(승인여부)Y -->
						<c:if test="${list.particirAccp eq 'YES' }">
							<button type="button" class="list-btn red">참여중</button>  
						</c:if>
						<!-- particirAccp(승인여부)N -->
						<c:if test="${list.particirAccp eq 'NO' }">
							<button type="button" class="list-btn yellow">승인대기</button>
						</c:if>
						<!-- particirAccp(승인여부)null(참여신청을 하지 않았다는 의미) -->
						<c:if test="${list.particirAccp eq null }">
							<button type="button" class="list-btn green point">참여하기</button>
						</c:if>
					</div>
				</c:if>
			</div>
		</c:forEach>
	</div>
</body>
<script>
	//부서별 출력
	function viewPart(info){
		//전체보기
		if(info=='all'){
			$.ajax({
				url:'${pageContext.request.contextPath}/SelectFromCompany',
				type:'GET',
			})
			.done(data=>{
				console.log('success')
			})
			.fail(reject=>{
				console.log(reject)
			})
		}
		else{
			
		}
	}
	let deptInfo=$('.view-dept').val()
	console.log(deptInfo)
	$('.option').change(function() {
		let value=$('.option').val()
		//진행중프로젝트
		if(value=='select1'){
			$.ajax({
				url:''
			})
		}
		//만료된 프로젝트
		else if(value=='select2'){
			
		}
	})
	
</script>
</html>