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


</style>
</head>
<body>
	<div>
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
			            <td class="highTaskManager"></td>
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
				<!-- 
						<div class="board-header-info">
							<c:if test="${board.realProfilePath eq null }">
								<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
							</c:if>
							<c:if test="${board.realProfilePath ne null }">
								<img src="${pageContext.request.contextPath}/images/${board.realProfilePath }" alt="기본 프로필 사진" class="profile">
							</c:if>
							<div class="board-headder-info__memberName">${board.memberName } </div>
							<fmt:formatDate value="${board.prjBoardRegdate }" pattern="yyyy-MM-dd hh:mm"/>
						</div>
				
						<div>
						<img class="board-header-btn" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">
						</div>
					</div>
				-->
					<div class="board-title">
						<div>
							<span>[업무]</span>
							<span></span>
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
						<div data-prioriy></div>
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
			</div>
		</div>
	</div>
	
<script>
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
                let manager = taskInfo.find('.highTaskManager');
                
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

                    
                 	// 빈 셀
                    subTaskInfo.append('<td></td>');
                    
                    // 하위 업무 정보
                    subTaskInfo.append('<td class="subPrjBoardTitle">' + subTask.prjBoardTitle + '</td>');
                    subTaskInfo.append('<td class="subState">' + subTask.stateName + '</td>');
                    subTaskInfo.append('<td class="subPriority">' + subTask.priorityName + '</td>');
                    subTaskInfo.append('<td></td>');
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
				$('tr').on('click', function(e){
					$('#task-modal').addClass('modal-task-visible');
					
				});
				
            },
            error: function(reject) {
                console.log(reject);
            }
        });

    });
    
});
 
	//여백 누르면 모달페이지 종료
	$('[id*=modal]').on('click', function() {
		$('.modal-task-visible').removeClass('modal-task-visible');
	});

	
	$(document).on("click", ".taskTr", function(e){
		e.stopPropagation();
		let highTask = $(this);
		let prjBoardId = highTask.data('id');
		console.log("======================게시글번호"+prjBoardId)
		$.ajax({
			url : '${pageContext.request.contextPath}/getTaskInfo',
			type : 'GET',
			data : {'prjBoardId' : prjBoardId},
			success : function(taskData) {
				console.log(taskData)
				
				let taskInfo = $('#task-modal');
				// 상위 업무
				let highTask = taskData.highTask[0];
				// 상위 업무 담당자 리스트
				let highManagers = taskData.highManager;
				// 하위 업무리스트
				let subTasks = taskData.subTask;

		        // 상위 업무 정보
				taskInfo.find('span[data-end]').text(highTask.endDate);
		        /*
		        // 시작일
		        taskInfo.find(".task-startDate").text(highTask.startDate);
				// 종료일
		        taskInfo.find(".task-endDate").text(highTask.endDate);
		        
		        // 우선 순위
		        taskInfo.find(".task-priority").text(highTask.priority);
		        
		        // 진척도
		        taskInfo.find(".task-processivity").text(highTask.processivity);
		        
		        // 업무상태
		        taskInfo.find(".taskState").text(highTask.state);
		        
		        // 상위 업무 담당자 리스트
		        let highManagerList = taskInfo.find(".task-manager");
		        for(let k=0; k<highManagers.length; k++){
		        	let highManager = highManagers[k];
		        	
		        	highManagerList.append('<span class="highManagerInfo">' + highManager.memberName + '   </span>');
		        }

		        // 하위 업무 리스트
		        let subTasksInfo = taskInfo.find(".subTask");
		        
		        console.log(subTasksInfo)

		        for (let j = 0; j < subTasks.length; j++) {
		        	let subTask = subTasks[j];
		        	let subTaskContent = $('<div class="subTask-content"></div>');
		            subTaskContent.append('<div class="subTask-state task-info">' + getState(subTask.state) + '</div>');
		            subTaskContent.append('<div class="subTask-title task-info">' + subTask.prjBoardTitle + '</div>');
		            subTasksInfo.append(subTaskContent);
		        }
		        */
		    }, error : function(reject) {
				console.log(reject);
			}
		});
	})

</script>


</body>
</html>