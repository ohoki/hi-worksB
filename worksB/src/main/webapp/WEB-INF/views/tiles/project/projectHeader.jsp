<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.7.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>
.project__header {
    padding: 0 30px;
    width: 100%;
    background-color: rgb(253, 252, 220, 0.1);
    height: 100px;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
}

.project__title {
	display: flex;
	justify-content: flex-start;
	margin-bottom: 20px;
	align-items: center;
	color: var(--color-dark-grey);
}

.project__title {
	font-size: var(--font-regular);
	font-weight: var(--weight-bold);
}

.project__title-manager {
	align-self: flex-end;
	font-size: var(--font-micro);
	margin: 0 10px;
	padding-bottom: 2px;
	color: var(--color-light-blue);
}
.project__nav {
	display: flex;
}

.project__nav li{
	padding: 5px 20px 0 20px;
	border-bottom: 3px solid transparent;
}

.project__nav li:hover{
	color: var(--color-dark-red);
	border-bottom: 3px solid var(--color-dark-red);
	cursor: pointer;	
	transition: all 0.5s;	
}

.project__nav a:hover{
	color: var(--color-dark-red);
	transition: all 0.5s;	
}

.modal{
    position:absolute;
    display:none;
    justify-content: center;
    top:0;
    left:-30%;
    width:100%;
    height:100%;
}

.secondModal{
	top:0;
    left:0;
}

.modal-content {
	top:70px;
    left:50px;
    border: 1px solid var(--color-dark-beigie);
    width: 70%;
}

.modal-content li{
	cursor: pointer;
}

.modal-content li:hover{
	background-color: var(--color-beigie);
}

.icon {
	width: 30px;
	height: 30px;
	margin-right: 10px;
	cursor: pointer;
}

#particirAccp-modal{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.1);
	font-size: 12px;
	display: none;
	left: 0;
	top: 0;
}

.particirAccp-modal-title{
	font-size: 15px;
	justify-content: space-between;
	font-weight: var(--weight-bold);
	padding: 5px 10px;
}

.particirAccp-modal-content{
	position: absolute;
	width: 25%;
	height: 30%;
	background-color: white;
	font-size: 12px;
	padding: 20px 15px;
	z-index: 10;
	overflow: auto;
	overflow-x: hidden;
	border-radius: 5px;
}

.modal-visible {
	display: block !important;
}

.particir-check-btn {
	background-color: var(--color-dark-beigie);
    color: var(--color-light-grey);	
	font-weight: var(--weight-bold);
	width: 130px;
	height: 30px;
	border-radius: 5px;
	transition: all 0.5s;
	margin-left: 800px;
}
.particir-check-btn:hover {
	background-color: var(--color-dark-red);
	color: white;
}

.updateAccp, .deleteAccp{
	background-color: var(--color-dark-beigie);
    color: var(--color-light-grey);	
	font-weight: var(--weight-bold);
	width: 50px;
	height: 30px;
	border-radius: 5px;
}

.particir-icon{
	width: 20px;
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

.noEmployee {
	text-align: center;
	margin: 10px auto;
}

</style>
</head>
<body>
<div class="project__header">
	<div class="project__title">
		<!-- 즐겨찾기 여부 -->
		<c:if test="${particirInfo eq null or particirInfo.projectMarkup eq 'A2'}">
			<img class="icon" src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg" data-bookmark="no">	
		</c:if>
		<c:if test="${particirInfo.projectMarkup eq 'A1'}">
			<img class="icon" src="${pageContext.request.contextPath }/resources/icon/star-solid.svg" data-bookmark="yes">	
		</c:if>
		<img class="icon" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg" data-bs-toggle="modal" data-bs-target="#firstModal">
    	<span>${projectInfo.projectName}</span>
    	<span class="project__title-manager">담당자(${projectInfo.managerName})</span>
    </div>
    <div>
		<ul class="project__nav">
			<li><a href="${pageContext.request.contextPath }/projectFeed?projectId=${projectInfo.projectId}">피드</a></li>
			<li><a href="${pageContext.request.contextPath }/projectTask?projectId=${projectInfo.projectId}">업무</a></li>
			<li><a href="${pageContext.request.contextPath}/projectCalendar?projectId=${projectInfo.projectId}">캘린더</a></li>
			<li onclick="location.href='${pageContext.request.contextPath }/filetab?projectId=${projectInfo.projectId}&fileAccess=${projectInfo.fileAccess }'">파일</li>
			<c:if test="${particirInfo.manager eq 'A1'}">
				<button type="button" id="accpList" class="particir-check-btn" data-id="${projectInfo.projectId}">참여신청자</button>
			</c:if>
		</ul>
	</div>
</div>
<!-- 모달 -->
<div class="modal" tabindex="-1" id="firstModal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<ul id="menuList">
					<c:if test="${particirInfo.manager eq 'A1'}">
						<li onclick="location.href='${pageContext.request.contextPath }/member/projectUpdate?projectId=${projectInfo.projectId}'">프로젝트 수정</li>	
					</c:if>
					<c:if test="${particirInfo.manager eq 'A1'}">
						<li class="projectCls">프로젝트 만료</li>	
					</c:if>
					<c:if test="${particirInfo.manager eq 'A2'}">
						<li class="paricirExit">프로젝트 나가기</li>
					</c:if>
					
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 프로젝트 참여 승인 -->
<div id="particirAccp-modal">
	<div class="particirAccp-modal-content">
		<div class="particirAccp-modal-title">
			<span>프로젝트 참여 신청자</span>
			<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
		</div>
		<div id="particirAccp"></div>
	</div>			
</div>

<!-- 프로젝트 참여자 모달 -->
<div id="prjParticir-modal">
	<div class="prjParticir-modal-content">
		<div class="prjParticir-modal-title">
			<span>프로젝트 참여자</span>
			<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
		</div>
		<div id="prjParticir"></div>
	</div>			
</div>

<script>
	$(document).ready(function() {
		$('#menuList li').click(function() {
			var targetModal = $(this).data('target');
			$(targetModal).modal('show');
		});
	});
	
	//즐겨해제
	let bookMark = $('img[data-bookmark]');
	
	bookMark.on('click', function(e) {
		let data = $(e.currentTarget).data('bookmark');
		
		//즐찾 해제
		if(data == 'yes') {
			let result = updateStar('A2');
			
			if(result == 'bookmark-updated') {
				alert('즐겨찾기가 해제되었습니다.');
				$(e.currentTarget).data('bookmark', 'no');
				$(e.currentTarget).attr('src', '${pageContext.request.contextPath }/resources/icon/emptyStar.svg');
			} else {
				alert('즐겨찾기 갱신에 실패했습니다.');
			}
		} else if(data == 'no') {
			let result = updateStar('A1');
			
			if(result == 'bookmark-updated') {
				alert('즐겨찾기에 추가되었습니다.');
				$(e.currentTarget).data('bookmark', 'yes');
				$(e.currentTarget).attr('src', '${pageContext.request.contextPath }/resources/icon/star-solid.svg');
			} else {
				alert('즐겨찾기 갱신에 실패했습니다.');
			}
		}
	});

    //즐겨찾기 관련 정보를 DB에 연동
    function updateStar(markup){
    	let data = { 'projectMarkup': markup, 'projectId': '${projectInfo.projectId}' };
    	let result = $.ajax({
			url:'${pageContext.request.contextPath }/updateStar',
			type:'post', 
			async: false,
			data:JSON.stringify(data),
			contentType:'application/json'
		}).responseText;
    	
    	return result;
	};

	
	//모달 닫기
	$('#particirAccp-modal').on('click', function() {
		$('.modal-visible').removeClass('modal-visible');
	});

	// 프로젝트 참여 승인
	$('#accpList').on('click', function(e){
		let x = e.clientX + 200;
		let y = e.clientY;
		
		$('.particirAccp-modal-content').css('left', x + 'px');
		$('.particirAccp-modal-content').css('top', y + 'px');
		
		let projectId = $(this).data('id');
		$.ajax({
			url : '${pageContext.request.contextPath }/getCheckParticir',
			type : 'GET',
			data : {'projectId' : projectId },
			success : function(particir){
				let particirDiv = $('#particirAccp');
				particirDiv.empty();
				
				if(particir.length != 0){
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
						$(employeeProfile).attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
						
						//스팬 태그
						let span = document.createElement('span');
						span.innerText = particir[i].memberName;
						//히든 인풋 태그 (멤버id값)
						let input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.value = particir[i].memberId;
						
						// 승인 버튼 태그
						let updateAccp = document.createElement('button');
						updateAccp.classList.add('updateAccp')
						updateAccp.innerText = '승인하기';
						
						// 프로젝트 참여자 신청 승인
						updateAccp.addEventListener('click', function() {
							e.stopPropagation();
							updateAccpParticir(projectId, particir[i].memberId);

							$(this).parent().remove();
						});
						
						// 승인 거절 버튼 태그
						let deleteAccp = document.createElement('button');
						deleteAccp.classList.add('deleteAccp');
						deleteAccp.innerText = '승인거절';
						
						// 프로젝트 참여자 신청 승인 거절하기
						deleteAccp.addEventListener('click', function() {
							e.stopPropagation();
							deleteAccpParticir(projectId, particir[i].memberId);

							$(this).parent().remove();
							
						});
						
						//태그 삽입
						employeeDiv.append(employeeProfile);
						employeeDiv.append(span);
						employeeDiv.append(input);
						
						employeeDiv.append(updateAccp);
						employeeDiv.append(deleteAccp);
						
						particirDiv.append(employeeDiv);
					}
				}else{
					let noEmployeeDiv = document.createElement('div');
					noEmployeeDiv.classList.add('noEmployee');
					noEmployeeDiv.innerText = '신청자가 존재하지 않습니다.';
					
					particirDiv.append(noEmployeeDiv);
					
				}
				
				
			},
			error : function(reject){
				console.log(reject);
			}
		})
		$('#particirAccp-modal').addClass('modal-visible');
	})
	
	// 프로젝트 참여자 신청 승인하기
	function updateAccpParticir(projectId, memberId){
		let check = confirm("승인하시겠습니까?");
		if(check){
			$.ajax({
				url: '${pageContext.request.contextPath}/updateAccpParticir',
				type: 'POST',
				data: {'projectId' : projectId, 'memberId' : memberId},
				success: function(response){
					alert('승인되었습니다.');
				},
				error: function(error){
					alert("실패했습니다.");
					console.log(error);
				}
				
			})
		}
	}
	
	// 프로젝트 참여자 승인 취소하기
	function deleteAccpParticir(projectId, memberId){
		let check = confirm("승인 거절하시겠습니까?");
		if(check){
			$.ajax({
				url: '${pageContext.request.contextPath}/deleteAccpParticir',
				type: 'POST',
				data: {'projectId' : projectId, 'memberId' : memberId},
				success: function(response){
					alert('승인 거절되었습니다.');
				},
				error: function(error){
					alert("실패했습니다.");
					console.log(error);
				}
				
			})
		}
		
	};
	
	
	// 프로젝트 만료 - 관리자
	$('.projectCls').on('click', function(e){
		let check = confirm("프로젝트를 만료하시겠습니까?");
		if(check){
			$.ajax({
				url: '${pageContext.request.contextPath}/member/updateProjectCls',
				type: 'POST',
				data: {'projectId' : '${projectInfo.projectId}'},
				success: function(response){
					alert('프로젝트가 만료되었습니다.');
					location.href='${pageContext.request.contextPath }/SelectFromCompany';
				},
				error: function(error){
					alert("실패했습니다.");
					console.log(error);
				}
			})
		}
	});
	
	// 프로젝트 나가기 - 참여자
	$('.paricirExit').on('click', function(e){
		let check = confirm("프로젝트를 나가시겠습니까?");
		if(check){
			$.ajax({
				url: '${pageContext.request.contextPath}/deleteParticir',
				type: 'POST',
				data: {'projectId' : '${projectInfo.projectId}', 'memberId' : '${memberInfo.memberId}'},
				success: function(response){
					location.href='${pageContext.request.contextPath }/projectList';
				},
				error: function(error){
					alert("실패했습니다.");
					console.log(error);
				}
			})
		}
	});
	
</script>
</html>