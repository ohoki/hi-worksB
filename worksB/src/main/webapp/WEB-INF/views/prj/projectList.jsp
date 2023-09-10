<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/projectList.css">
<style>
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

.modal-visible {
	display: block !important;
}

.list-box {
	min-height: 300px;
	overflow: auto;
	overflow-x: hidden;
}

.list-box::-webkit-scrollbar, .content-left-item:nth-child(1)::-webkit-scrollbar {
    width: 10px;
 }
 
.list-box::-webkit-scrollbar-thumb, .content-left-item:nth-child(1)::-webkit-scrollbar-thumb {
  background-color: #2f3542;
  border-radius: 10px;
  background-clip: padding-box;
  border: 2px solid transparent;
  background-color: var(--color-dark-beigie);
}

.list-box::-webkit-scrollbar-track, .content-left-item:nth-child(1)::-webkit-scrollbar-track {
  background-color: grey;
  border-radius: 10px;
  box-shadow: inset 0px 0px 5px white;
  background-color: var(--color-dark-beigie);
}

.list-title {
	color: var(--color-dark-grey);
}
</style>
</head>
<body>
<!-- !!!!!!!!!!!!!!!!!!!미확인알림 안해뜸!!!!!!!!!!!!!!!!!!!! -->
	<div class="prj-title">
		<h1>내 프로젝트</h1>
	</div>
	<!-- 좋아요를 누른 프로젝트 -->
	<div class="list-box">
		<h2 class="list-title">즐겨찾기</h2>
		<div class="like-container">
			<c:forEach items="${bookmarked }" var="list">
				<div class="list">
					<div class="project-name">
						<img class="icon colored-star" alt="즐겨찾기 별" src="${pageContext.request.contextPath }/resources/icon/fullStar.svg" data-id="${list.projectId }"> 
					<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span>
					<c:if test="${list.projectAccess eq 'YES' }">
						<img class="icon" alt="전체공개이미지" title="전체공개" src="${pageContext.request.contextPath }/resources/icon/globe-solid.svg" style="margin-left: 20px;">
					</c:if>
					<c:if test="${list.projectAccess eq 'NO' }">
						<img class="icon" alt="참여자공개이미지" title="참여자만 공개" src="${pageContext.request.contextPath }/resources/icon/lock-solid.svg" style="margin-left: 20px;">	
					</c:if> 
					</div>
					<div class="project-info">
						${list.prjParticirNum }<img class="icon" name="prjParticirList" data-id="${list.projectId }" alt="참가인원" title="참가인원" src="${pageContext.request.contextPath }/resources/icon/user-solid.svg">
						<!-- 	unreadproject있으면 db로부터 받아와서 첨부하기!! --> 
						<span class="unread-project">1</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- 좋아요를 누르지 않은 프로젝트 -->
	<div class="list-box">
		<h2 class="list-title">프로젝트</h2>
		<div class="dislike-container">
			<c:forEach items="${noneBookmarked }" var="list">
				<div class="list">
					<div class="project-name">
						<img class="icon empty-star" alt="즐겨찾기 별해제" src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg" data-id="${list.projectId }" data-end="NO"> 
						<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span>
						<c:if test="${list.projectAccess eq 'YES' }">
							<img class="icon" alt="전체공개이미지" title="전체공개" src="${pageContext.request.contextPath }/resources/icon/globe-solid.svg" style="margin-left: 20px;">
						</c:if>
						<c:if test="${list.projectAccess eq 'NO' }">
							<img class="icon" alt="참여자공개이미지" title="참여자만 공개" src="${pageContext.request.contextPath }/resources/icon/lock-solid.svg" style="margin-left: 20px;">	
						</c:if> 
					</div>
					<div class="project-info">
						${list.prjParticirNum }<img class="icon" name="prjParticirList" data-id="${list.projectId }" alt="참가인원" title="참가인원" src="${pageContext.request.contextPath }/resources/icon/user-solid.svg">
						<!-- 	unreadproject있으면 db로부터 받아와서 첨부하기!! --> 
						<span class="unread-project">1</span>
					</div>
				</div>
			</c:forEach>
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
</body>
<script>
//즐겨찾기
	//즐찾해제
    document.addEventListener("click",(e)=>{     
       
        if(e.target.className.includes('colored-star')){
        	let star = e.target;

    	    let markup = 'A2';
    	    let prjId = $('.colored-star').data("id");
    	    updateStar(markup, prjId);

    	    star.src = "${pageContext.request.contextPath }/resources/icon/emptyStar.svg"
    	    star.className='icon empty-star';

    	    let dislikeC = document.querySelector('.dislike-container');
    	    let parent = star.parentNode.parentNode;
    	 
    	    dislikeC.appendChild(parent);
        } //즐찾추가
        else if(e.target.className.includes('empty-star')){
        	let empty = e.target;

       	    let markup = 'A1';
       	    let prjId = $('.empty-star').data("id");
       	    updateStar(markup, prjId);

       	    empty.src = "${pageContext.request.contextPath }/resources/icon/fullStar.svg"
       	    empty.className='icon colored-star';

       	    let none = document.querySelector('.like-container');
       	    let pn = empty.parentNode.parentNode;
      
       	    none.appendChild(pn);
    	}
    });
    
    //즐겨찾기 관련 정보를 DB에 연동
    function updateStar(markup,projectId){
    	let data = {
    	        'projectMarkup': markup,
    	        'projectId': projectId
    	    };
		$.ajax({
			url:'${pageContext.request.contextPath }/updateStar',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(data)
		})
		.fail(reject=>{
			console.log(reject);
			alert('즐겨찾기 갱신에 실패하였습니다');
			//window.location.reload()	
		});
};

	

    //drag event
    
    
    //모달 닫기
	$('[id*=modal]').on('click', function() {
		$('.modal-visible').removeClass('modal-visible');
	});
	
	// 프로젝트 참여자 리스트
	$('img[name="prjParticirList"]').on('click', function(e){
		let projectId = $(this).data('id');
		
		let x = e.clientX - 280 ;
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
					employeeProfile.setAttribute('alt', particir[i].memberName);
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
					//태그 삽입
					employeeDiv.append(employeeProfile);
					employeeDiv.append(span);
					employeeDiv.append(input);
					
					particirDiv.append(employeeDiv);
				}
			},
			error : function(reject){
				console.log(reject);
			}
		})
		$('#prjParticir-modal').addClass('modal-visible');
	})
    
    </script>

</html>