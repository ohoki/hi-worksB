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
		width : 140px;
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
	
	#task-modal .board-header {
		display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 10px 40px;
	}
	
	#task-modal .board-header-info {
		display: flex;
    	align-items: center;
	}
	
	#task-modal .profileImg {
		width: 40px;
	    height: 40px;
	    border-radius: 10px;
	}
	
	
	#task-modal .board-headder-info__memberName {
		margin: 0 20px;
   		font-weight: var(--weight-bold);		
	}
	
	#task-modal .board-title {
		font-size: var(--font-small);
	    font-weight: var(--weight-bold);
	    padding: 5px;
	    margin: 0 40px;
	    border-bottom: 1px solid var(--color-dark-beigie);
	    color: var(--color-dark-grey);
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}
		
	#task-modal .board-title span {
	    color: var(--color-blue);
	}	
	
	#task-modal .board-title span[data-title] {
		color: var(--color-dark-grey);
	}
	
	.board-title div[data-hightaskid] {
	    font-size: var(--font-micro);
	    padding: 5px;
	    border: 1px solid var(--color-dark-red);
	    border-radius: 5px;
	    color: var(--color-dark-red);
	}
	
	#task-modal div[data-processivity] {
	    display: flex;
	    align-items: center;
	    color: var(--color-green);
	}
	
	#task-modal .processivity {
	    width: 150px;
	    height: 7px;
	    border-radius: 2px;
	    background-color: var(--color-light-white);
	    margin-right: 10px;
	}
	
	#task-modal .processivity-value {
	    width: 1%;
	    height: 7px;
	    border-radius: 2px;
	    background-color: var(--color-green);
	}	
	
	#task-modal .sche-date {
	    font-weight: var(--weight-bold);
	    font-size: 15px;
	    color: var(--color-dark-red);
	    margin: 10px 40px;
	}
	
	#task-modal div[data-state] {
	    margin: 0 40px;
	    text-align: left;
	}
	
	#task-modal div[data-state] button {
	    width: 50px;
	    height: 10px;
	    background-color: var(--color-dark-beigie);
	    padding: 10px;
	    border-radius: 5px;
	    color: white;
	    font-weight: var(--weight-bold);
	    line-height: 10px;
	}
	
	#task-modal div[data-state] button.active {
	    background-color: var(--color-dark-red);
	}
	
	#task-modal .board-content  {
		margin: 30px 40px;
	    font-size: var(--font-micro);
	    color: var(--color-dark-grey);
	}
	
	.task-modal__content{
		position: absolute;
		right: 0;
		top: 62px;
		width: 40%;
		height: 90vh;
		background-color: white;
		font-size: 17px;
		padding: 20px 15px;
		z-index: 10;
		overflow: scroll;
		overflow-x:hidden;
	}
	
	#task-modal .task-manager {
	    display: flex;
	    font-weight: var(--weight-bold);
	    font-size: 13px;
	    color: var(--color-blue);
	    margin: 10px 40px;
	    align-items: center;
	}
	
	#task-modal .task-manager .text {
	    font-size: 15px;
	    color: var(--color-dark-grey);
	}
	
	#task-modal div[data-priority] {
	    font-size: var(--font-micro);
	    color: var(--color-green);
	    font-weight: var(--weight-bold);
	}
	
	#task-modal .sub-task-lists {
	    margin: 0 40px 30px 40px;
	}
	
	#task-modal .sub-task-lists-title {
	    margin: 10px 0;
	    font-size: var(--font-micro);
	    font-weight: var(--weight-bold);
	    color: var(--color-dark-grey);
	}
	
	#task-modal .sub-task-item {
	    display: flex;
	    align-items: center;
	    padding: 5px 10px;
	    background-color: rgba(240, 240, 240, 0.2);
	    justify-content: flex-start;
	    margin: 5px 0;
	    border-radius: 5px;
	    text-align: center;
	    border: 1px solid transparent;
	    cursor: pointer;
	}

	#task-modal .sub-state {
	    width: 50px;
	    height: 7px;
	    background-color: var(--color-blue);
	    padding: 10px;
	    border-radius: 5px;
	    color: white;
	    font-weight: var(--weight-bold);
	    font-size: var(--font-micro);
	    line-height: 7px;
	    margin-right: 20px;
	}

	.board-footer {
	    display: flex;
	    justify-content: space-between;
	    margin: 10px 40px;
	    font-size: var(--font-micro);
	}
	
	.board-footer-icon {
	    margin-right: 10px;
	}

	.board-footer-info {
	    margin-left: 10px;
	}

	.d-flex {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	#task-modal .board-comment {
	    padding: 5px 40px;
	    border-top: 1px solid var(--color-dark-beigie);
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    color: var(--color-dark-grey);
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
		z-index: 100;
	}
	
	.task-menu__content{
		width: 100px;
   	 	height: 70px;
		border-radius: 50%;
		position: absolute;
		background-color: white;
		border: 1px solid var(--color-dark-beigie);
		border-radius: 10px;
		padding: 10px 5px;
		z-index: 10;
		text-align: center;
		font-size: var(--font-micro);
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
	
	#update-task-modal {
	    display: none;
	    position: fixed;
	    z-index: 1;
	    left: 0;
	    top: 0;
	    width: 100%;
	    height: 100%;
	    overflow: auto;
	    background-color: rgba(0, 0, 0, 0.4);
	}
	
	.update-task-content {
	    background-color: white;
	    margin: 15% auto;
	    padding: 20px;
	    border: 1px solid #888;
	    width: 50%;
	    box-shadow: 0px 0px 10px 2px #888;
	}
	
	.board-state label {
			width: 70px;
			height: 14px;
			background-color: var(--color-dark-beigie);
			padding: 10px;
			border-radius: 5px;
			color: white;
			font-weight: var(--weight-bold);
			line-height: 14px;
			cursor: pointer;
			text-align: center;
			margin: 0 10px;
			margin-bottom: 20px;
		}
	
	.board-state input:checked + label {
		background-color: var(--color-dark-red);
		border: 3px solid var(--color-dark-red);
	}
</style>
</head>
<body>
	<div>
		<div>
			<input type="text" placeholder="업무명을 검색하세요." class="header__search task__search">
		</div>
		<!-- 전체 업무 조회 -->
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
					<th>업무번호</th>
				</tr>
			</thead>
			<tbody class="taskList" >
				<c:forEach items="${taskList }" var="task">
					<tr data-id="${task.prjBoardId}" class="highTask taskTr">
						<td class="taskBtn"></td>
			            <td class="prjBoardTitle">${task.prjBoardTitle}</td>
			            <td class="state">${task.stateName}</td>
			            <td class="priority">${task.priorityName}</td>
			            <td class="taskManager"></td>
			            <td class="startDate"><fmt:formatDate value="${task.startDate}" pattern="yyyy-MM-dd"/></td>
			            <td class="endDate"><fmt:formatDate value="${task.endDate}" pattern="yyyy-MM-dd"/></td>
			            <td class="prjBoardRegdate"><fmt:formatDate value="${task.prjBoardRegdate}" pattern="yyyy-MM-dd"/></td>
			            <td class="taskId">${task.taskId }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 전체 업무 조회 끝-->
	</div>
	<!-- 업무 상세 조회 모달-->
	<div id="task-modal" data-tasktype="">
		<div class="task-modal__content">
			<div class="board-header">
				<div class="board-header-info">
					<img class="profileImg"alt="" src="">
					<div class="board-headder-info__memberName" data-memberName></div>
					<span data-regdate></span>
				</div>
				<div>
				<img class="task-menu-btn cursor" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">
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
					<span class="text" style="color: var(--color-dark-grey);">기간 : </span>
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
				<div class="board-content"><div>
			</div>
		</div>
		<div class="sub-task-lists">
			<div class="d-flex">
				<div class="sub-task-lists-title">하위업무 <span data-subtaskcount></span></div>
			</div>
			<div class="sub-task-list">
			</div>
		</div>
		<div class="board-footer">
			<div >
				<span class="board-footer-icon"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg"> 좋아요</span>
				<span class="board-footer-icon"><img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg"> 북마크</span>
			</div>
				<div>
					<span class="board-footer-info">댓글 <span data-commentCount></span></span>
					<span class="board-footer-info">좋아요 <span data-likeCount></span></span>
				</div>
			</div>
			<!-- 댓글창 -->
			<div name="board-comment-box">
			</div>
		</div>
	</div>
	<!-- 업무 상세 조회 모달 끝-->
	
	<!-- 업무글 메뉴 모달 -->
	<div id="task-menu-modal">
		<div class="task-menu__content">
			<ul>
				<li class="update-task-btn">수정</li>
				<li class="delete-task-btn">삭제</li>
			</ul>
		</div>
	</div>
	
	<!-- 상위 업무글 수정 -->
	<div id="update-task-modal">
		<div class="update-task-content" id="updateTask">
		    <form action="" method="post">
		    	<div>
		    		<input type="text" name="prjBoardTitle">
		    		<div class="board-state">
						<input type="radio" class="btn-check" name="state" value="G1" id="option1" autocomplete="off">
						<label for="option1">요청</label>
						
						<input type="radio" class="btn-check" name="state" value="G2" id="option2" autocomplete="off">
						<label for="option2">진행</label>
						
						<input type="radio" class="btn-check" name="state" value="G3" id="option3" autocomplete="off">
						<label for="option3">피드백</label>
						
						<input type="radio" class="btn-check" name="state" value="G4" id="option4" autocomplete="off">
						<label for="option4">완료</label>
						
						<input type="radio" class="btn-check" name="state" value="G5" id="option5" autocomplete="off">
						<label for="option5">보류</label>
					</div>
					<div>
						<label for="startDate">시작일 : </label>
						<input type="text" name="startDate" class="date-input startDate" data-date>
						
						<label for="endDate">마감일 : </label>
						<input type="text" name="endDate" class="date-input endDate">
					</div>
					<div class="js-progress create-content-cell">
						<!-- 우선 순위 -->
						<div class="select-priority">
							<div>우선 순위 : </div>
							<select name="priority">
								<option value="">=======</option>
								<option value="F3">낮음</option>
								<option value="F2">보통</option>
								<option value="F1">긴급</option>
							</select>
						</div>
						<!-- 진행율 -->
						<div class="board-progress">
							<div>진행율 : </div>
							<div class="progress-bar">
					       		<div class="progress-bar-size"></div>
							</div>
							<div class="progress-value">0%</div>
							<input type="hidden" name="processivity" value="0">
						</div>
						<!-- 업무 담당자 -->
						<div class="board-taskManager">
							<span class="add-manager-btn">담당자 추가</span>
							<div class="highManagerList"></div>
							<div class="deleteList"></div>
						</div>
						<textarea name="prjBoardSubject"></textarea>
					</div>
					<button type="button" id="update-submit">수정</button>
		    	</div>
		    </form>
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
					console.log(taskData)
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
						manager.text('');
					}
	                
					// 하위 업무
					let subTasks = taskData.subTask;
					
					// 하위업무 있을때 버튼
					if(subTasks.length > 0){
						let taskBtn = taskInfo.find('.taskBtn');
						taskBtn.append('<button class="subTaskBtn">버튼</button>');
					}
					
					for (let j = 0; j < subTasks.length; j++) {
						let subTask = subTasks[j];
						
						// 하위 업무 행 만들기
						let subTaskInfo = $('<tr class="subTask taskTr" data-id="' + subTask.prjBoardId + '"></tr>');

						// 버튼자리 빈 셀
						subTaskInfo.append('<td></td>');

						// 하위 업무 정보
						subTaskInfo.append('<td class="subPrjBoardTitle">' + subTask.prjBoardTitle + '</td>');
						subTaskInfo.append('<td class="subState">' + subTask.stateName + '</td>');
						
						if(subTask.priorityName != null){
							subTaskInfo.append('<td class="subPriority">' + subTask.priorityName + '</td>');
						}else{
							subTaskInfo.append('<td class="subPriority"></td>');
						}

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
							subManager.text('');
						}
						subTaskInfo.append(subManager);
						
						// 하위 업무는 startDate 없음
						subTaskInfo.append('<td></td>');
						if(subTask.endDate != null){
							subTaskInfo.append('<td class="subEndDate">' + subTask.endDate + '</td>');
						}else{
							subTaskInfo.append('<td class="subEndDate"></td>');
						}
						subTaskInfo.append('<td class="subRegdate">' + subTask.prjBoardRegdate + '</td>');
						
						subTaskInfo.append('<td class="subTaskId">' + subTask.taskId + '</td>');
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
	
	$('#task-modal').on('click', function(e) {
	    if ($(e.target).is('#task-modal')) {
	        $('#task-modal').removeClass('modal-task-visible');
	    }
	});
	
	$('#task-menu-modal').on('click', function(e) {
	    if ($(e.target).is('#task-menu-modal')) {
	        $('#task-menu-modal').removeClass('modal-task-visible');
	    }
	});
	
	$('#update-task-modal').on('click', function(e) {
	    if ($(e.target).is('#update-task-modal')) {
	        $('#update-task-modal').removeClass('modal-task-visible');
	    }
	});
	
	// 업무 상세내용 모달
	$(document).on("click", ".taskTr", function(e){
		e.stopPropagation();
		let tr = $(this);
		let prjBoardId = tr.data('id');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/getTaskInfo',
			type : 'GET',
			data : {'prjBoardId' : prjBoardId},
			success : function(taskData) {
				console.log(taskData);
				let taskInfo = $('#task-modal');
				// 클릭한 업무 업무
				let highTask = taskData.highTask[0];
				// 업무 담당자 리스트
				let highManagers = taskData.highManager;
				// 하위 업무리스트
				let subTasks = taskData.subTask;
				
				//초기화
				taskInfo.find('.board-content').children().remove();
				taskInfo.find('div[data-state]').children('button').removeClass('active');
				taskInfo.find('.processivity-value').css('width', "0%");
				
				if(tr.hasClass('highTask') == true) {
					$('#task-modal').data('tasktype', 'high');	
				} else {
					$('#task-modal').data('tasktype', 'sub');
				}
				
				// 클릭한 업무 정보
				//이름
				taskInfo.find('div[data-memberName]').text(highTask.memberName);
				//프로필
				let profileImg = taskInfo.find('.profileImg');
				if (highTask.realProfilePath == null) {
					profileImg.attr('src', '${pageContext.request.contextPath }/resources/img/user.png');
				} else {
					profileImg.attr('src', '${pageContext.request.contextPath}/images/' + highTask.realProfilePath);
				}
				//작성일자
				taskInfo.find('span[data-regdate]').text(highTask.prjBoardRegdate);
				//제목
				taskInfo.find('span[data-title]').text(highTask.prjBoardTitle);
				//업무번호
				taskInfo.find('div[data-hightaskid]').text('업무 번호 ' + highTask.taskId);
				// 기간
		        if(taskData.highTask[0].startDate != null) {
		        	taskInfo.find('span[data-start]').text(highTask.startDate);
					taskInfo.find('span[data-end]').text(highTask.endDate);
		        }else {
		        	taskInfo.find('span[data-start]').parent().remove();
		        }
				//우선순위
				 if(highTask.priorityName != null) {
					 taskInfo.find('div[data-priority]').text('우선순위 : ' + highTask.priorityName);
		        }else {
		        	taskInfo.find('div[data-priority]').remove();
		        }
				// 진행상태 버튼 활성화
                taskInfo.find('div[data-state]').children('button[value=' + highTask.state + ']' ).addClass('active');
                //진척도
                if( highTask.processivity == null) {
                	highTask.processivity = 0;
                }
                taskInfo.find('.processivity-value').css('width', highTask.processivity + "%");
                taskInfo.find('span[data-processivityvalue]').text(highTask.processivity + "%");
                
				//내용
				if(highTask.prjBoardSubject != null) {
					taskInfo.find('.board-content').prepend(highTask.prjBoardSubject);	
				}
				
				// 업무 담당자 
				let manager = taskInfo.find('.task-manager');
				manager.children('span:not(:eq(0))').empty();
				
				if(highManagers.length >1) {
					manager.append('<span>' + highManagers[0].memberName + ' 외 ' + (highManagers.length-1) + '명</span>');	
		     	} else if(highManagers.length == 0) {
		     		manager.append('<span>없음</span>');
		     	} else {
		     		manager.append('<span>' + highManagers[0].memberName + '</span>');
		     	} 
				
				// 하위 업무 리스트
	     		taskInfo.find('span[data-subtaskcount]').empty();
	     		taskInfo.find('.sub-task-list').empty();
		     	
		     	let countSpan = taskInfo.find('span[data-subtaskcount]');
		     	let subTaskList = taskInfo.find(".sub-task-list");
				// 하위 업무 갯수 
				if(subTasks.length != 0){
		     		countSpan.text(subTasks.length);
				}
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
		     	
		     	$('.update-task-btn').attr('data-id', prjBoardId);
		     	$('.delete-task-btn').attr('data-id', prjBoardId);
				
		     	//댓글 정보		     	
		     	getCommentList(prjBoardId, 'C8');
		    }, error : function(reject) {
				console.log(reject);
			}
		});
	});
	
	// 댓글 리스트
	function getCommentList(boardId, boardType){
		$.ajax({
			url : '${pageContext.request.contextPath}/projectCmtList',
			type : 'GET',
			data : {'boardId' : boardId, 'boardType': boardType},
			success : function(comments){
				let boardCommentBox = $('#task-modal').find('div[name="board-comment-box"]');
				
				boardCommentBox.empty();
				
				if(comments.length != 0) {
					for(let i =0; i<comments.length; i++) {
						let boardComment =`
							<div class="board-comment" data-cmtid="\${comments[i].commentId }">
								<div class="d-flex">
									<img src="${pageContext.request.contextPath}/images/\${comments[i].realProfilePath }" alt="회원 프로필 사진" class="profileImg">
									<div>
										<div style="margin: 5px 0;">
											<span style="font-weight: var(--weight-bold);">\${comments[i].memberName }</span>
											<span>\${comments[i].commentRegdate }</span>
										</div>
										<div style="margin: 5px 0;">
											\${comments[i].commentContent }
										</div>
									</div>								
								</div>
							</div>`;
							
						boardCommentBox.prepend(boardComment);
					}
					let moreComment=`
						<div name="moreComment" class="cursor" style="margin-bottom: 5px; padding: 5px 40px; color: var(--color-dark-grey);">
							댓글
						</div>`;
						
					boardCommentBox.prepend(moreComment);
				} 
				// 댓글 수
				$('#task-modal').find('span[data-commentCount]').text(comments.length);
				
			}, error : function(reject) {
				console.log(reject);
			}
		});
	};
	
	// 업무글 메뉴 모달
	$('.task-menu-btn').on('click', function(e){
		let x = e.clientX - 120;
		let y = e.clientY;
		let modalContent = $('.task-menu__content');
		
		modalContent.css('top', y + 'px');
		modalContent.css('left',x + 'px');
		
		$('#task-menu-modal').addClass('modal-task-visible');
	})
	
	// 수정 폼 모달
	$('.update-task-btn').on('click', function(e){
		
		
		$('.modal-task-visible').removeClass('modal-task-visible');
		$('#update-task-modal').addClass('modal-task-visible');
	})
	
	// 상위 업무 글 수정 폼
	$('.update-task-btn').on('click', function(e){
		let taskInfo = $('.update-task-btn');
		let prjBoardId = taskInfo.data('id');
		console.log(prjBoardId)
		
		$.ajax({
			url : '${pageContext.request.contextPath}/getTaskInfo',
			type : 'GET',
			data : {'prjBoardId' : prjBoardId},
			success : function(taskData) {
				console.log(taskData)
				
				let taskInfo = $('#updateTask');
				// 클릭한 업무
				let highTask = taskData.highTask[0];
				
				
				// 폼에 데이터 출력하기!!!!!!!!!!!!
				taskInfo.find('[name=prjBoardTitle]').val(highTask.prjBoardTitle);
				// state 값 - radio
				let state = highTask.state;
				$('.btn-check').each(function() {
					if ($(this).val() == state) {
						$(this).prop('checked', true);
					}
				});
				
				taskInfo.find('[name=startDate]').val(highTask.startDate);
				taskInfo.find('[name=endDate]').val(highTask.endDate)
				
				let priority = highTask.priority;
				taskInfo.find('option[value="' + priority + '"]').prop('selected', true);
				
				taskInfo.find('[name=processivity]').val(highTask.processivity);
				
				// 업무 담당자 리스트
				let managers = taskData.highManager;
            	let managerList = taskInfo.find('.board-taskManager');
            	let memberId = taskInfo.find('.highManagerList');

            	for (let i = 0; i < managers.length; i++) {
                	managerList.prepend('<span>' + managers[i].memberName + '<img class="deleteManager" alt="" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor"></span>');
                	memberId.prepend('<input type="hidden" name="taskManager" value="' + managers[i].prjParticirId + '">')
            	}
            	
	
				taskInfo.find('[name=prjBoardSubject]').val(highTask.prjBoardSubject);
		     	
		    }, error : function(reject) {
				console.log(reject);
			}
		});
	})
	
	// 업무 삭제
	$(".delete-task-btn").on('click', function(e){
		let prjBoardId = $(this).data('id');
		let check = confirm("삭제하시겠습니까?");
		if(check){
			$.ajax({
				url: '${pageContext.request.contextPath}/deleteTask',
				type: 'POST',
				data: {'prjBoardId' : prjBoardId},
				success: function(response){
					console.log(response)
					alert("삭제되었습니다.");
					location.href='${pageContext.request.contextPath}/projectTask?projectId=${projectInfo.projectId}';
				},
				error: function(error){
					alert("삭제에 실패했습니다.");
					console.log(error);
				}
					
			});
			
		}
	});
	
	
</script>


</body>
</html>