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
</style>
</head>
<body>
	<div>
		<table class="taskTable">
			<thead>
				<tr>
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
					<tr data-id="${task.prjBoardId}">
						<td>${task.prjBoardTitle }</td>
						<td class="taskState"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><fmt:formatDate value="${task.prjBoardRegdate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	
<script>
	$(window).on('DOMContentLoaded', function() {
		let taskBoardList = $('.taskList tr');
		for(let i=0; i<taskBoardList.length; i++){
			$.ajax({
				url : '${pageContext.request.contextPath}/getTaskInfo',
				type : 'GET',
				data : {'prjBoardId' : taskBoardList[i].dataset.id},
				success : function(taskData) {
					console.log(taskData)
					let taskInfo = $(taskBoardList[i]);
					// 상위 업무
					let highTask = taskData.highTask[0];
					// 상위 업무 담당자 리스트
					let highManagers = taskData.highManager;
					// 하위 업무리스트
					let subTasks = taskData.subTask;
					

					
					//상위 업무
					
					
			    }, error : function(reject) {
					console.log(reject);
				}
			});
			
		}
	});
</script>
</body>
</html>