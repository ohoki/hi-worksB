<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.7.0.min.js"></script>
<style>
table{
	border: 1px solid var(--color-light-grey);
}

th, td {
	border: 1px solid var(--color-light-grey);
	width : 120px;
}
  
tr{
	cursor: pointer;
}

tr:hover{
	background-color : var(--color-beigie);
}
.highTask{
	background-color : var(--color-light-white);
}

.subTaskBtn{
	background-color : var(--color-dark-blue);
}

.modal-task-visible {
	display: block !important;
}

#task-modal{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.1);
	font-size: 12px;
	display: none;
	left: 0;
	top: 0;
}

.task-modal__content{
	position: absolute;
	right: 0;
	top: 62px;
	height: 100%;
	width: 40%;
	background-color: white;
	font-size: 12px;
	padding: 20px 15px;
	z-index: 10;
}

.flex {
	display: flex;
}

.task__search{
	margin-top : 20px;
	width : 350px;
	margin-bottom : 20px;
}

#task-menu-modal{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.1);
	font-size: 12px;
	display: none;
	left: 0;
	top: 0;
}

.task-menu__content{
	width: 200px;
	height: 150px;
	border-radius: 50%;
	position: absolute;
	top: 100px;
	right: 240px;
	background-color: white;
	border: 1px solid var(--color-dark-beigie);
	border-radius: 10px;
	padding: 10px 5px;
	z-index: 10;
}

.task-menu__content li {
	cursor: pointer;
	padding: 5px 0;
	font-size : 15px;
}

.task-menu__content li:hover {
	background-color: var(--color-beigie);
}

.task-menu__content li span {
	display: inline-block;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	margin-right: 10px;
}

</style>
</head>
<body>
	<div>
		<div>
			<input type="text" placeholder="업무명을 검색하세요." class="header__search task__search">
		</div>
		<table class="taskTable">
			<thead>
				<tr>
					<th>버튼자리</th>
					<th>업무명</th>
					<th>상태</th>
					<th>우선순위</th>
					<th>담당자</th>
					<th>시작일</th>
					<th>마감일</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody class="taskList" >
				<c:forEach items="${taskList }" var="task">
					<tr data-id="${task.prjBoardId}" class="highTask taskTr">
						<td><button class="subTaskBtn">버튼</button></td>
			            <td class="prjBoardTitle">${task.prjBoardTitle}</td>
			            <td class="state">${task.stateName}</td>
			            <td class="priority">${task.priorityName}</td>
			            <td class="taskManager"></td>
			            <td class="startDate"><fmt:formatDate value="${task.startDate}" pattern="yyyy-MM-dd"/></td>
			            <td class="endDate"><fmt:formatDate value="${task.endDate}" pattern="yyyy-MM-dd"/></td>
			            <td class="prjBoardRegdate"><fmt:formatDate value="${task.prjBoardRegdate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<div id="task-modal">
			<div class="task-modal__content">
				<div class="board-header">
					<div class="board-header">
						<div class="board-header-info">
							<img class="profileImg"alt="" src="">
							<div class="board-headder-info__memberName" data-memberName></div>
							<span data-regdate></span>
						</div>
						<div>
						<img class="task-menu-btn" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">
						</div>
					</div>
					<div class="board-title">
						<div>
							<span>[업무]</span>
							<span data-title></span>
						</div>
						<div data-hightaskid></div>
					</div>
					<div class="sche-date d-flex">
						<div>
							<span class="text">기간 : </span>
							<span data-start></span>
							<span> ~ </span>
							<span data-end></span>
						</div>
						<div data-processivity>
							<div class="processivity">
								<div class="processivity-value"></div>
							</div>
							<span data-processivityvalue></span>
						</div>
					</div>
					<div class="d-flex" style="margin-right: 40px;">
						<div class="task-manager"> 
							<span class="text">담당자 : </span>
						</div>
						<div data-priority></div>
					</div>
					<div data-state>
						<button type="button" value="G1">요청</button>
						<button type="button" value="G2">진행</button>
						<button type="button" value="G3">피드백</button>
						<button type="button" value="G4">완료</button>
						<button type="button" value="G5">보류</button>
					</div>
					<div class="board-content">
						<div>
						</div>
					</div>
					<div class="sub-task-lists">
						<div class="sub-task-lists-title">하위업무 <span data-subtaskcount></span></div>
						<div class="sub-task-list">
						</div>
					</div>
					<div class="board-footer">
						<div >
							<span class="board-footer-icon"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg"> 좋아요</span>
							<span class="board-footer-icon"><img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg"> 북마크</span>
						</div>
						<div>
							<span class="board-footer-info">댓글 7</span>
							<span class="board-footer-info">좋아요 14</span>
						</div>
					</div>
					<c:if test="ㄴㅇㄹ">
						<div>
							댓글 더보기
						</div>
						<!-- for each로 최신 댓글 2개만 -->
							<div class="board-comment">
								<div>
									<img alt="#" src="#">
									<div>
										<div>
											회원정보
										</div>
										<div>
											댓글내용
										</div>
									</div>
								</div>
								<div>
									<a href="#">수정</a>
									<a href="#">삭제</a>
								</div>
							</div>
						<!-- 여기까지 -->	
					</c:if>
					<!-- 
					<div class="comment-input">
						<c:if test="${memberInfo.realProfilePath eq null }">
							<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
						</c:if>
						<c:if test="${memberInfo.realProfilePath ne null }">
							<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="profile">
						</c:if>
							<input type="text" placeholder="댓글을 입력해주세요."><button type="button">등록</button>
					</div>
					-->
				</div>
			</div>
		</div>
	</div>
	<div id="task-menu-modal">
		<div class="task-menu__content">
			<ul>
				<li><span class=""></span>수정</li>
				<li><span class=""></span>삭제</li>
			</ul>
		</div>
	</div>
<script>

// 업무 리스트
	$(document).ready(function() {
		let taskBoardList = $('.highTask');
	    
		taskBoardList.each(function() {
			let taskInfo = $(this);
			let prjBoardId = taskInfo.data('id');

			$.ajax({
				url: '${pageContext.request.contextPath}/getTaskInfo',
				type: 'GET',
				data: { 'prjBoardId': prjBoardId },
				success: function(taskData) {
					// 업무 담당자
					let taskManagers = taskData.highManager;
					let manager = taskInfo.find('.taskManager');
	                
					if (taskManagers.length == 1) {
						manager.text(taskManagers[0].memberName); 
					} else if (taskManagers.length > 1) {
						let count = taskManagers.length - 1;
						let text = " 외 " + count + "명";
						manager.text(taskManagers[0].memberName + text);
					} else {
						manager.text('-');
					}
	                
					// 하위 업무
					let subTasks = taskData.subTask;
					
					for (let j = 0; j < subTasks.length; j++) {
						let subTask = subTasks[j];
						
						// 하위 업무 행 만들기
						//let subTaskInfo = $('<tr class="subTask"></tr>');
						let subTaskInfo = $('<tr class="subTask taskTr" data-id="' + subTask.prjBoardId + '"></tr>');

						// 버튼자리 빈 셀
						subTaskInfo.append('<td></td>');

						// 하위 업무 정보
						subTaskInfo.append('<td class="subPrjBoardTitle">' + subTask.prjBoardTitle + '</td>');
						subTaskInfo.append('<td class="subState">' + subTask.stateName + '</td>');
						subTaskInfo.append('<td class="subPriority">' + subTask.priorityName + '</td>');

						// 하위 업무 담당자
						let subManagers = taskData.subManager[subTask.prjBoardId];
						let subManager = $('<td class="taskManager"></td>');

						if (subManagers && subManagers.length > 0) {
						    if (subManagers.length == 1) {
						    	subManager.text(subManagers[0].memberName);
						    } else {
						        let count = subManagers.length - 1;
						        let text = " 외 " + count + "명";
						        subManager.text(subManagers[0].memberName + text);
						    }
						} else {
							subManager.text('-');
						}
						subTaskInfo.append(subManager);
						
						// 하위 업무는 startDate 없음
						subTaskInfo.append('<td>-</td>');
						subTaskInfo.append('<td class="subEndDate">' + subTask.endDate + '</td>');
						subTaskInfo.append('<td class="subRegdate">' + subTask.prjBoardRegdate + '</td>');
						// 상위 업무 바로 밑에 하위 업무 행 넣기
						taskInfo.after(subTaskInfo);
					}

					// 버튼 클릭시 하위 업무 접거나 펼치기
					let subTaskRows = taskInfo.nextUntil('.highTask', '.subTask'); 
					let subTaskBtn = taskInfo.find('.subTaskBtn');
					
					subTaskBtn.click(function(e) {
						e.stopPropagation();
						subTaskRows.toggle(); 
					});
					
					// 업무 상세글 모달 띄우기
					$('.taskTr').on('click', function(e){
						$('#task-modal').addClass('modal-task-visible');
					
					});
					
				},
				error: function(reject) {
					console.log(reject);
				}
			});

	    });
	    
	});
	
	
/*
	//여백 누르면 모달페이지 종료
	$('[id*=modal]').on('click', function() {
		$('.modal-task-visible').removeClass('modal-task-visible');
	});
*/
	// 업무 상세내용 모달
	$(document).on("click", ".taskTr", function(e){
		e.stopPropagation();
		let highTask = $(this);
		let prjBoardId = highTask.data('id');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/getTaskInfo',
			type : 'GET',
			data : {'prjBoardId' : prjBoardId},
			success : function(taskData) {
				
				let taskInfo = $('#task-modal');
				// 클릭한 업무 업무
				let highTask = taskData.highTask[0];
				// 업무 담당자 리스트
				let highManagers = taskData.highManager;
				// 하위 업무리스트
				let subTasks = taskData.subTask;
				
				// 클릭한 업무 정보
				taskInfo.find('div[data-memberName]').text(highTask.memberName);
				taskInfo.find('span[data-regdate]').text(highTask.prjBoardRegdate);
				taskInfo.find('span[data-title]').text(highTask.prjBoardTitle);
				taskInfo.find('div[data-hightaskid]').text('업무 번호 ' + highTask.taskId);
				taskInfo.find('span[data-start]').text(highTask.startDate);
				taskInfo.find('span[data-end]').text(highTask.endDate);
				taskInfo.find('div[data-state]').text(highTask.state);
				taskInfo.find('div[data-priority]').text('우선순위 : ' + highTask.priorityName);
				taskInfo.find('div[data-processivity]').text(highTask.processivity);
				taskInfo.find('.board-content').text(highTask.prjBoardSubject);
		        
				let profileImg = taskInfo.find('.profileImg');
				if (highTask.realProfilePath == null) {
					profileImg.attr('src', '${pageContext.request.contextPath }/resources/img/user.png');
				} else {
					profileImg.attr('src', '${pageContext.request.contextPath}/images/' + highTask.realProfilePath);
				}
				
				// 업무 담당자 
				let taskManagers = taskData.highManager;
				let manager = taskInfo.find('.task-manager');
				manager.empty();
				if (taskManagers.length == 1) {
						manager.append('<span>' + taskManagers[0].memberName + '</span>');
					} else if (taskManagers.length > 1) {
						for(let i=0; i<taskManagers.length; i++){
							manager.append('<span>' + taskManagers[i].memberName + '</span>');
						}
					} else {
						manager.append('<span>없음</span>');
					}
				
				// 하위 업무 리스트
	     		taskInfo.find('.sub-task-list').empty();
		     	
		     	let countSpan = taskInfo.find('span[data-subtaskcount]');
		     	let subTaskList = taskInfo.find(".sub-task-list");
				// 하위 업무 갯수 
		     	countSpan.text(subTasks.length);
		     	// 정보 입력
		        for (let j = 0; j < subTasks.length; j++) {
		        	let subTask = subTasks[j];
					let li = $('<li class="sub-task-item">');
		        	let subState = $('<span class="sub-state">');
		        	let subTitle = $('<span class="sub-title">');
				
		        	subState.text(subTask.stateName);
		        	subTitle.text(subTask.prjBoardTitle);
		        	
					li.append(subState);
					li.append(subTitle);
					
					subTaskList.append(li);
		        }
		    }, error : function(reject) {
				console.log(reject);
			}
		});
	})
	
	$('.task-menu-btn').on('click', function(e){
		$('#task-menu-modal').addClass('modal-task-visible');
	})
	
	
</script>


</body>
</html>