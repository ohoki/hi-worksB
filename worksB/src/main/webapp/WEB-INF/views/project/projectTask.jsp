<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border: 1px solid var(--color-light-grey);
}
.sub-task {
    display: none;
    padding-left: 20px;
  }
</style>
</head>
<body>
	<div>
		<table class="taskTable">
			<thead>
				<tr>
					<th></th>
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
					<tr data-id="${task.prjBoardId}" class="highTask">
						<td></td>
			            <td class="prjBoardTitle">${task.prjBoardTitle}</td>
			            <td class="state">${task.state}</td>
			            <td class="priority">${task.priority}</td>
			            <td class="highTaskManager"></td>
			            <td class="startDate"><fmt:formatDate value="${task.startDate}" pattern="yyyy-MM-dd"/></td>
			            <td class="endDate"><fmt:formatDate value="${task.endDate}" pattern="yyyy-MM-dd"/></td>
			            <td class="prjBoardRegdate"><fmt:formatDate value="${task.prjBoardRegdate}" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>

        			</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
<script>
$(window).on('DOMContentLoaded', function() {
	let taskBoardList = $('.highTask');
	for(let i=0; i<taskBoardList.length; i++){
		$.ajax({
			url : '${pageContext.request.contextPath}/getTaskDetail',
			type : 'GET',
			data : {'prjBoardId' : taskBoardList[i].dataset.id},
			success : function(taskData) {
				console.log(taskData)
				let taskInfo = $(taskBoardList[i]);
				let highManagers = taskData.highManager;
				let subTasks = taskData.subTask;

				// 하위 업무 정보 출력
				let subTasksInfo = $('');
				for (let j = 0; j < subTasks.length; j++) {
					let subTask = subTasks[j];

				
				
				}

			}, error: function(reject) {
				console.log(reject);
			}
		});
	}
});
</script>
</body>
</html>