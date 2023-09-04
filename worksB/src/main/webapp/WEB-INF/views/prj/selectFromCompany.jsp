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
.list-option button{
	width: 100px;
	height: 40px;
	margin-left: 20px;
	background-color: var(--color-beigie);
	border-radius: 5px;
	color: var(--color-dark);
	font-weight: var(--weight-bold);
	border : 1px solid var(--color-dark-beigie);
}
.list-option button:hover {
	background-color: var(--color-dark-red);
	color: var(--color-white);
	border : 1px solid var(--color-dark-red);
	transition: all 0.5s;
}
.list-title {
	font-size: var(--font-regular);
	padding: 0 30px;
	margin-bottom: 15px;
	color: var(--color-dark-grey);
	margin-top: 30px;
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
	border-radius: 5px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: rgb(253, 252, 220, 0.2);
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
  	border: 1px solid var(--color-dark-beigie);
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

.project-name span {
	cursor: pointer;
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
	padding: 7px 10px;
	border-radius: 10px;
	margin-right: 10px;
	cursor: pointer;
	border: 1px solid rgba(174, 213, 245, 0);
}
.dept-list li:hover {
	border: 1px solid var(--color-dark-beigie);
	background-color: var(--color-dark-beigie);
	color: var(--color-dark-red);	
	transition: all 0.5s;
}
.prj-icon {
	margin: 0 10px;
	display: inline-block;
	cursor: pointer;
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
	background-color: #29bf12;
}
.yellow {
	background-color: var(--color-orange);
}
.red {
	background-color: var(--color-red);
}


#prjParticir-modal{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.1);
	font-size: 12px;
	display: none;
	left: 0;
	top: 0;
}

.prjParticir-modal-title{
	font-size: 15px;
	justify-content: space-between;
	font-weight: var(--weight-bold);
	padding: 5px 10px;
}

.prjParticir-modal-content{
	position: absolute;
	width: 15%;
	height: 30%;
	background-color: white;
	font-size: 12px;
	padding: 20px 15px;
	z-index: 10;
	overflow: auto;
	overflow-x: hidden;
	border-radius: 5px;
}

.d-flex {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.modal-visible {
	display: block !important;
}
</style>
</head>
<!-- A1은 YES A2는 NO -->
<body>
    <form name="deptInfo" action="${pageContext.request.contextPath }/SelectFromCompany">
    	<input type="hidden" name="deptId" value="${projectVO.deptId }">
    	<input type="hidden" name="projectCls" value="${projectVO.projectCls }">
    </form>
    <h1 class="list-title">회사 전체 프로젝트</h1>
	<div style="padding: 5px 50px;">
		<ul class="dept-list">
			<li class="view-dept" onclick="viewPart('')">전체보기</li>
			<c:forEach items="${deptList }" var="dept">
				<li class="view-dept" onclick="viewPart('${dept.deptId}')" data-id="${dept.deptId }">${dept.deptName }</li>
			</c:forEach>
		</ul>
	</div>
	<div class="list-box">
		<div class="list-option">
			<div class="list-count">전체 <span>${projectList.size() }</span></div>
			<div>
				<select class="option">
					<option value="A2" selected>진행중</option>
					<option value="A1">만료</option>
				</select>
				<button onclick="location.href='${pageContext.request.contextPath }/projectInsert'">프로젝트 생성</button>
			</div>
		</div>
		<!-- 프로젝트리스트 전체(particirAccp가 Y,N,null로 나뉨) -->
		<c:forEach items="${projectList }" var="list">
			<div class="list">
				<!-- 회사전체공개프로젝트의 경우 -->
					<div class="project-name">
						<c:if test="${list.projectAccess eq 'YES' }">
							<img class="prj-icon" alt="전체공개이미지" title="전체공개" src="${pageContext.request.contextPath }/resources/icon/globe-solid.svg">
						</c:if>
						<c:if test="${list.projectAccess eq 'NO' }">
							<img class="prj-icon" alt="참여자공개이미지" title="참여자만 공개" src="${pageContext.request.contextPath }/resources/icon/lock-solid.svg">	
						</c:if>
						<span data-cls="${list.projectCls }" data-access="${list.projectAccess}" data-accp="${list.particirAccp}" data-prjid="${list.projectId }" class="prj-move">${list.projectName}</span>
					</div>
					
					<!-- 참여버튼 클릭 시 참여하기 기능 구현  필요함 -->
					<div class="project-info">
						${list.prjParticirNum }<img class="prj-icon" name="prjParticirList" data-id="${list.projectId }" alt="참가인원" title="참가인원" src="${pageContext.request.contextPath }/resources/icon/user-solid.svg">
						<c:if test="${list.projectCls eq 'NO' }">						
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
<!-- 								매니저승인없이 가입할 수 있는 경우 -->
								<c:if test="${list.managerAccp eq 'NO'}" >
									<button type="button" title="버튼을 누르면 바로 참여가 가능합니다" class="list-btn green point" onclick="signup('${list.projectId}','${list.managerAccp}', this)">참여하기</button>									
								</c:if>
								<!-- 								매니저승인이 필요한 경우 -->
								<c:if test="${list.managerAccp eq 'YES'}">
									<button type="button" title="승인이 필요한 프로젝트입니다" class="list-btn green point" onclick="signup('${list.projectId}','${list.managerAccp}', this)">참여하기</button>									
								</c:if>
							</c:if>
						</c:if>
					</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- 프로젝트 참여자 모달 -->
	<div id="prjParticir-modal">
		<div class="prjParticir-modal-content">
			<div class="d-flex prjParticir-modal-title">
				<span>프로젝트 참여자</span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
			</div>
			<div id="prjParticir"></div>
		</div>			
	</div>
</body>
<script>
	//프로젝트div클릭시 피드로 이동
	$('.prj-move').on('click',(e=>{
		let access=$(e.target).data("access");
		let accp=$(e.target).data("accp");
		let id=$(e.target).data("prjid");
		//전체 공개
		if(access == 'YES') {
			location.href='${pageContext.request.contextPath }/projectFeed?projectId='+id;
			return;
		}
		//비공개 && 승인 완료
		console.log(accp);
		if(accp == 'YES') {
			location.href='${pageContext.request.contextPath }/projectFeed?projectId='+id;
			return;	
		} //비공개 && (승인 대기 or 승인 신청 x) 
		else {
			alert('프로젝트 참가 대상자가 아닙니다.');
			return;
		}
	}));
	
	//부서정보를 컨트롤러에 넘김
	function viewPart(dept){
		deptInfo.deptId.value=dept;
		deptInfo.submit();
	}
	
	//select에 따른 데이터변동
	$('.option').change(function() {
		deptInfo.projectCls.value=$('.option').val();
		deptInfo.submit();	
	})
	//페이지가 바뀌어도 selectBox가 변동되지 않도록 하기 위함	
	if("${projectVO.projectCls }"!=""){
		$('.option').val("${projectVO.projectCls }");		
	}

	
	//참여하기버튼
	function signup(prjId,maccp, target){
		if(maccp=='NO'){
			alert('프로젝트의 일원이 되었습니다');
			location.href='${pageContext.request.contextPath }/signIn?projectId='+prjId+'&accp=A1';
		}else if(maccp='YES'){
			$.ajax({
				url:'${pageContext.request.contextPath }/signOnly',
				type:'POST',
				data: {'projectId': prjId, 'particirAccp': 'A2'}
			})
			.done(data=>{
				if(data == 'success') {
					alert('참여승인을 기다려 주세요');
					$(target).text('승인대기');
					target.className='list-btn yellow';
				}
			})
			.fail(reject=>{
				console.log(reject);
			});
		}
	};
	
	//모달 닫기
	$('[id*=modal]').on('click', function() {
		$('.modal-visible').removeClass('modal-visible');
	});
	
	// 프로젝트 참여자 리스트
	$('img[name="prjParticirList"]').on('click', function(e){
		let projectId = $(this).data('id');
		
		let x = e.clientX + 15;
		let y = e.clientY;
		
		$('.prjParticir-modal-content').css('left', x + 'px');
		$('.prjParticir-modal-content').css('top', y + 'px');
		
		$.ajax({
			url : '${pageContext.request.contextPath }/particirList',
			type : 'GET',
			data : {'projectId': projectId},
			success : function(particir){
				let particirDiv = $('#prjParticir');
				particirDiv.empty();
				
				for(let i=0; i<particir.length; i++) {
					//div태그
					let employeeDiv = document.createElement('div');
					employeeDiv.classList.add('flex');
					employeeDiv.classList.add('employee');
					//이미지 태그
					let employeeProfile = document.createElement('img');
					employeeProfile.setAttribute('alt', '회원사진');
					employeeProfile.classList.add('employee-img');
					if(particir[i].realProfilePath != null) {
						employeeProfile.src = "${pageContext.request.contextPath}/images/"+particir[i].realProfilePath;
					}else {
						employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
					}
					//스팬 태그
					let span = document.createElement('span');
					span.innerText = particir[i].memberName;
					//히든 인풋 태그 (멤버id값)
					let input = document.createElement('input');
					input.setAttribute('type', 'hidden');
					input.value = particir[i].memberId;
					//태그 삽입
					employeeDiv.append(employeeProfile);
					employeeDiv.append(span);
					employeeDiv.append(input);
					
					particirDiv.append(employeeDiv);
				}
			},
			error : function(reject){
				console.log(list);
			}
		})
		$('#prjParticir-modal').addClass('modal-visible');
	})
	
</script>
</html>