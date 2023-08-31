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

.task-modal__content{
	position: absolute;
	right: 0;
	top: 62px;
	height: 100%;
	width: 40%;
	background-color: white;
	font-size: 17px;
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
	z-index: 100;
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
						<td><button class="subTaskBtn">버튼</button></td>
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
	
	<!-- 업무글 수정 -->
	<div id="update-task-modal">
		<div class="update-task-content" id="updateTask">
			<!-- 
		    <h3>업무수정폼~~!!~!~~~!!!!</h3>
		    <input type="text">
		    <button id="update-submit">저장</button>
		    -->
		    <form action="" method="post">
		    	<div>
		    	<h3>업무수정폼~~!!~!~~~!!!!</h3>
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
	
	
/*
	//여백 누르면 모달페이지 종료
	$('[id*=modal]').on('click', function() {
		$('.modal-task-visible').removeClass('modal-task-visible');
	});
*/

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
		     	
		     	$('.update-task-btn').attr('data-id', prjBoardId);
		     	$('.delete-task-btn').attr('data-id', prjBoardId);
		     	
		     	
		    }, error : function(reject) {
				console.log(reject);
			}
		});
	});
	
	// 업무글 메뉴 모달
	$('.task-menu-btn').on('click', function(e){
		$('#task-menu-modal').addClass('modal-task-visible');
	})
	// 수정 폼 모달
	$('.update-task-btn').on('click', function(e){
		$('.modal-task-visible').removeClass('modal-task-visible');
		$('#update-task-modal').addClass('modal-task-visible');
	})
	
	// 업무 글 수정 폼
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
	
	/*
	$(document).on('click', '.deleteManager', function(e){
		let deleteManagerList = [];
		let managerSpan = $(this).closest('.taskManagerName');
		let prjParticirId = managerSpan.data('particirid');
	    deleteManagerList.push(prjParticirId);

	    managerSpan.remove();

	    console.log(deleteManagerList);
		
	})
	*/
	
	/*
	//담당자 추가 클릭 시 구성원 불러오고 셀렉트 박스
		$(document).on('click', '.add-manager-btn', function(e) {
			let boardTaskManager = $(e.currentTarget).closest('.board-taskManager');
			let addManagerBtn = $(e.currentTarget);
			let selectBox = $('<select class="add-taskManager-select" onchage="addManager(this)")><option value="" selected disabled>담당자 추가</option></select>');
			
			addManagerBtn.remove();
			
			$.ajax({
		    	url : '${pageContext.request.contextPath}/particirList',
		        type: 'GET',
		        data: {'projectId': "${projectInfo.projectId}"},
		        success: function(particir){
		        	for(let i=0; i<particir.length; i++) {
						let option = $('<option>');
						
						option.val(particir[i].prjParticirId);
						option.text(particir[i].memberName);
						
						selectBox.append(option);
					}
		        },
		        error: function(reject){
		            console.log(reject);
		        }
		    });	
			
			boardTaskManager.prepend(selectBox);
			boardTaskManager.prepend('<span>담당자 : </span>');
		});
		
		//담당자 선택시 스팬 추가
		$(document).on('change', '.add-taskManager-select', function(e) {
			let managerSpan = $('<span>');
			let memberId = `<input type="hidden" name="taskManager">`;
			let selectBox = $(e.currentTarget);
			let checkedOption = selectBox.find('option:checked');
			
			if(selectBox.find('option:disabled').length == 4) {
				managerSpan.text('외 1명');
				selectBox.before(managerSpan);
			}else if (selectBox.find('option:disabled').length > 4) {
				selectBox.prev().remove();
				managerSpan.text('외' + (selectBox.find('option:disabled').length-3) + '명');
				selectBox.before(managerSpan);
			} else {
				managerSpan.text(checkedOption.text());
				selectBox.before(managerSpan);
			}
			//담당자 아이디 저장
			memberId = $(memberId).val(checkedOption.val());
			selectBox.next().append(memberId);
			
			checkedOption.prop('disabled', true);
		});
	*/

	//업무 수정 처리하기
	$('#update-submit').on('click', function(e){
		
		
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