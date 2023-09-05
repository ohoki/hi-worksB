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

<link href="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.full.min.js"></script>
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
	
	.modal {
		top: 0;
		left: 0;
	}
	.insert-board-modal {
		border: 1px solid var(--color-dark-beigie);
	    border-radius: 20px;
	    width : 50%;
	    height: 850px;
	    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
	    margin: 5px auto;
	    background-color: white;
	    position: absolute;
	    left: 50%;
	    top : 50%;
	    transform: translate(-50%, -50%);
	}
	
	.insert-board-modal-header {
		margin: 30px 30px 0 30px;
	}
	
	.insert-board-modal-title {
		display: flex;
		align-items: center;
		justify-content: space-between;
		font-weight: var(--weight-bold);
		color: var(--color-dark-grey);
	}
	
	.insert-board-area {
		overflow: scroll;
		overflow-x: hidden;
		max-height: 550px;
	}
	
	.insert-board-area::-webkit-scrollbar, .pin-board::-webkit-scrollbar, .bookmark-board-contets::-webkit-scrollbar {
	    width: 10px;
	 }
	  
  	.insert-board-area::-webkit-scrollbar-thumb, .pin-board::-webkit-scrollbar-thumb, .bookmark-board-contets::-webkit-scrollbar-thumb {
	    background-color: #2f3542;
	    border-radius: 10px;
	    background-clip: padding-box;
	    border: 2px solid transparent;
	    background-color: var(--color-dark-beigie);
  	}
  	.insert-board-area::-webkit-scrollbar-track, .pin-board::-webkit-scrollbar-track, .bookmark-board-contet::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
	    background-color: var(--color-dark-beigie);
  	}
	
	.board-form {
		margin: 10px 30px 0;
		color: var(--color-dark-grey);
	}
	
	.board-form-title {
		width: 100%;
		height: 50px;
		border-bottom: 1px solid var(--color-dark-beigie);
		padding: 0 10px;
		margin-bottom: 20px;
	}
	
	.ck.ck-list__item .ck-button {
	    width: 90% !important;
	}
	
	.ck-editor__editable {
	    min-height: 700px;
	}
	
	.board-state {
	    text-align: left;
	}
	
	.board-state input:checked + label {
	    background-color: var(--color-dark-red);
    	border: 3px solid var(--color-dark-red);
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
	
	.startDate, .endDate {
	    width: 200px;
	    height: 30px;
	    border: 1px solid var(--color-dark-beigie) !important;
	    color: var(--color-dark-grey);
	    font-size: var(--font-micro);
	    margin-right: 20px;
	}
	
	.insert-board-modal .progress-bar {
		background-color: var(--color-light-white);
 		width: 300px;
		height: 20px;
		border-radius:5px;
		margin: 10px;
		cursor: pointer;
	}
		
	.insert-board-modal .progress-bar-size {
		width: 1%;
		height: 20px;
		border-radius:5px;
		background-color: var(--color-green);
		transition: all 0.5s;
	}
	
	.insert-board-modal .progress-value {
		width: 20px;
	}
	
	.insert-board-modal .js-progress {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-right: 200px;
		margin: 10px 0;
	}
	
	.insert-board-modal .board-progress {
		display: flex;
		align-items: center;
	}
	
	.select-priority {
		display: flex;
		align-items: center;
	}
	
	select[name=priority] {
		width: 100px;
		height: 30px;
		border: 1px solid var(--color-dark-beigie);
		background-color: white;
		color: var(--color-dark-grey);
		font-size: var(--font-micro);
		margin-left: 20px;
	}
	
	.insert-board-modal .add-taskManager-select {
	    width: 130px;
	    height: 30px;
	    border: 1px solid var(--color-dark-beigie);
	    background-color: white;
	    color: var(--color-dark-grey);
	    font-size: var(--font-micro);
	    margin-left: 20px;
	}
	
	.insert-board-modal .board-taskManager span {
	    margin-right: 10px;
	}
	
	.insert-board-modal .modal-footer {
		margin: 0 30px;
		display: block;
		text-align: right;
	}
	
	.insert-board-modal .modal-footer-select {
		width : 200px;
		height : 40px;
		border : 1px solid var(--color-dark-beigie);
	}
	
	.insert-board-modal .modal-footer-btn {
		width: 100px;
		height: 50px;
		border-radius: 5px;
		background-color: var(--color-dark-beigie);		
		color: var(--color-light-grey);	
		transition: all 0.5s;
		font-size: var(--font-micro);
		margin-bottom: 20px;
	}
	
	.insert-board-modal .modal-footer-btn:hover {
		background-color: var(--color-dark-red);	
		color: white;
	}
		
	.add-taskManager-select option:disabled {
		color: var(--color-light-white);
	}
	
	.deleteManager {
		cursor: pointer;	
	}
	
	#updateSubTask-modal {
		position: absolute;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.1);
		font-size: 12px;
		display: none;
		left: 0;
		top: 0;
	}
	
	#updateSubTask-modal {
		z-index: 2000;
	}
	
	.updateSubTask-modal-content {
		position: absolute;
		background-color: white;
		width: 40%;
		height: 40%;
		top:40%;
		left: 50%;
		transform: translate(-50%, -50%);
		border-radius: 10px;
		text-align: center;
		padding: 30px 0 15px 0;
		color: var(--color-dark-grey);
		border: 1px solid var(--color-dark-beigie);
	}
	
	.update-board-modal-title {
		display: flex;
		align-items: center;
		justify-content: space-between;
		font-weight: var(--weight-bold);
		color: var(--color-dark-grey);
		padding: 0 30px;
	}
	
	#updateSubTask-modal .board-taskManager {
	    padding: 10px 30px;
	    text-align: left;
	    margin-bottom: 20px;
	}
	
	.board-taskManager span {
	    margin-right: 10px;
	}
	
	#updateSubTask-modal .updateSubTask-modal-btn{
		width: 100px;
		height: 40px;
		background-color: var(--color-dark-red);
		border-radius: 5px;
		color: var(--color-white);
		font-weight: var(--weight-bold);
		margin-left: 10px;
		transition: all 0.5s;
	}
	
	#updateSubTask-modal .updateSubTask-modal-btn:hover{
		background-color: var(--color-white);
		color: var(--color-dark-red);
		border: 1px solid var(--color-dark-red);
	}
	
	#updateSubTask-modal button[type=reset]{
		width: 100px;
		height: 40px;
		border-radius: 5px;
		font-weight: var(--weight-bold);
		margin-left: 10px;
		background-color: var(--color-white);
		color: var(--color-dark-red);
		border: 1px solid var(--color-dark-red);
	}
		
	
	#updateSubTask-modal input:disabled{
		background-color: #fff;
	}
	
	#updateSubTask-modal input[name=prjBoardTitle]{
		width: 95%;
	}
	
	#updateSubTask-modal .board-state{
		padding: 10px 30px;
	}
	
	#updateSubTask-modal .task-select{
		width: 100px;
		height: 30px;
		border: 1px solid var(--color-dark-beigie);
		background-color: white;
		color: var(--color-dark-grey);
		font-size: var(--font-micro);
		margin-left: 20px;
	}
	
	#updateSubTask-modal .select-state{
		text-align: left;
		margin-left: 30px;
	}
	
	#updateSubTask-modal .board-taskManager{
		padding: 10px 30px;
		text-align: left;
		margin-bottom: 20px;
	}
	
	#updateSubTask-modal span, #updateSubTask-modal label{
		font-size: var(--font-micro);
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
	
	.board-footer-icon:hover {
		color: var(--color-dark-red);
		cursor: pointer;
	}
	
	.board-footer-info {
		margin-left: 10px;
	}
</style>
</head>
<body>
	<!-- ckeditor -->
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
	<!-- 사진 업로드를 위한 ckfinder -->
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>

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
		<input type="hidden" value="" name="prjBoardId">
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
				<span class="board-footer-icon" name="prjLike"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg" style="padding-right: 5px;"><span></span></span>
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
				<li class="update-task-btn" data-bs-toggle="modal" data-bs-target="#boardUpdateModal">수정</li>
				<li class="delete-task-btn">삭제</li>
			</ul>
		</div>
	</div>
	
	<!-- 게시글 수정 HTML -->
	<div class="modal modalBoard" tabindex="-1" id="boardUpdateModal" data-id>
		<div class="insert-board-modal">
		    <div class="insert-board-modal-header">
		    	<!-- 모달페이지 띄우기 위함 -->
		    	<input type="hidden" class="modal-dialog d-none">
				<input type="hidden" class="modal-content d-none">
		    	<div class="insert-board-modal-title">
		    		<div>게시물 수정</div>		
		    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		    	</div>
				<input type="hidden" value="" name="prjBoardId" id="prjBoardId">
			</div>
			<form name="task">
				<div class="insert-board-area">
					<div class="board-form" >
						<input type="text" class="board-form-title" name="prjBoardTitle" placeholder="제목을 입력하세요.">
						<div class="board-state">
							<input type="radio" class="btn-check" name="state" value="G1" id="option6" autocomplete="off" checked>
							<label for="option6">요청</label>
							
							<input type="radio" class="btn-check" name="state" value="G2" id="option7" autocomplete="off">
							<label for="option7">진행</label>
							
							<input type="radio" class="btn-check" name="state" value="G3" id="option8" autocomplete="off">
							<label for="option8">피드백</label>
							
							<input type="radio" class="btn-check" name="state" value="G4" id="option9" autocomplete="off">
							<label for="option9">완료</label>
							
							<input type="radio" class="btn-check" name="state" value="G5" id="option10" autocomplete="off">
							<label for="option10">보류</label>
						</div>
						<div>
							<label for="startDate">시작일 : </label>
							<input type="text" name="startDate" class="date-input startDate" data-date autocomplete="off">
							
							<label for="endDate">마감일 : </label>
							<input type="text" name="endDate" class="date-input endDate" autocomplete="off">
						</div>
						
						<!-- 진척도 -->
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
						</div>
						
						<!-- 업무 담당자 -->
						<div class="board-taskManager" style="margin-bottom: 20px;">
						
						</div>
						<!-- 업무 담당자 끝 -->
						
						<textarea name="prjBoardSubject" placeholder="내용을 입력하세요." id="editor"></textarea>
					</div>	
					<!-- 하위업무 등록 -->
					<div style="height: 20px;">
					</div>
		        </div>
		        <div class="modal-footer">
					<select name="inspYn" class="modal-footer-select">
						<option value="E2">전체 공개</option>
						<option value="E1">프로젝트 관리자만</option>
					</select>
					<input type="hidden" name="boardType" value="C8">
	             	<button type="reset" class="modal-footer-btn">취소</button>
	             	<button type="button" class="modal-footer-btn" name="btnAddTask" data-bs-dismiss="modal">수정</button>
				</div>
			</form>
	    </div>
	</div>

	<!-- 하위 업무 정보 모달 -->
	<div id="updateSubTask-modal">
		<form>
			<div class="updateSubTask-modal-content">
				<!-- 모달페이지 띄우기 위함 -->
		    	<input type="hidden" class="modal-dialog d-none">
				<input type="hidden" class="modal-content d-none">
				<input type="hidden" name="boardId" value="">
				<input type="hidden" name="highPrjBoardId" value="">
				<input type="hidden" name="highTaskId" value="">
				<div class="update-board-modal-title">
		    		<div>게시물 수정</div>		
		    		<button  type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		    	</div>
				<input type="text" class="board-form-title" name="prjBoardTitle" placeholder="제목을 입력하세요.">
				<div class="board-state">
					<input type="radio" class="btn-check" name="state" value="G1" id="option11" autocomplete="off" checked>
					<label for="option11">요청</label>
					
					<input type="radio" class="btn-check" name="state" value="G2" id="option12" autocomplete="off">
					<label for="option12">진행</label>
					
					<input type="radio" class="btn-check" name="state" value="G3" id="option13" autocomplete="off">
					<label for="option13">피드백</label>
					
					<input type="radio" class="btn-check" name="state" value="G4" id="option14" autocomplete="off">
					<label for="option14">완료</label>
					
					<input type="radio" class="btn-check" name="state" value="G5" id="option15" autocomplete="off">
					<label for="option15">보류</label>
				</div>
	     		<div class="d-flex m-bt" style="padding: 10px 30px; justify-content: flex-start;">
					<div class="select-priority">
						<span>우선 순위 : </span>
			          	<select name="priority">
			                <option value="">=======</option>
			                <option value="F3">낮음</option>
			                <option value="F2">보통</option>
			                <option value="F1">긴급</option>
			          	</select>
		      		</div>
			      	<div style="margin-left:100px;">
						<label for="endDate">마감일 : </label>
						<input type="text" name="endDate" class="date-input endDate" data-date autocomplete="off" style="margin:0 0 0 20px;">
				 	</div>
				</div>
	            <div class="board-taskManager">
				</div>
				<button type="reset">삭제하기</button>
				<button type="button" class="updateSubTask-modal-btn">수정하기</button>
			</div>
		</form>
	</div>

<script>
	//CK 에디터
	CKEDITOR.ClassicEditor.create(document.querySelector('#editor'), {
	    toolbar: {
	    	 items: [
				'alignment', '|',
				'heading', '|',
				'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
				'exportPDF', 'insertImage', 'mediaEmbed',
				'-',
				'specialCharacters', '|',
				'bold', 'italic', 'strikethrough', 'underline', 'subscript', 'superscript', '|',                     
				'findAndReplace', 'selectAll'
	         ],
	         shouldNotGroupWhenFull: true
	     },
	    // Changing the language of the interface requires loading the language file using the <script> tag.
	    language: 'ko',
	    // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
	    heading: {
	        options: [
	            { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
	            { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
	            { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
	            { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
	            { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
	            { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
	            { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
	        ]
	    },
	    // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
	    placeholder: '내용을 입력하세요.',
	    // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
	    fontFamily: {
	        options: [
	            'default',
	            '궁서체',
	    		'돋움',
	            'Arial, Helvetica, sans-serif',
	            'Courier New, Courier, monospace',
	            'Georgia, serif',
	            'Lucida Sans Unicode, Lucida Grande, sans-serif',
	            'Tahoma, Geneva, sans-serif',
	            'Times New Roman, Times, serif',
	            'Trebuchet MS, Helvetica, sans-serif',
	            'Verdana, Geneva, sans-serif',
	        ],
	        supportAllValues: true
	    },
	    // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
	    fontSize: {
	        options: [ 10, 12, 14, 16, 18, 20, 22 ],
	        supportAllValues: true
	    },
	    // The "super-build" contains more premium features that require additional configuration, disable them below.
	    // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
	    removePlugins: [
	        // These two are commercial, but you can try them out without registering to a trial.
	        // 'ExportPdf',
	        // 'ExportWord',
	        'CKBox',
	        'EasyImage',
	        // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
	        // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
	        // Storing images as Base64 is usually a very bad idea.
	        // Replace it on production website with other solutions:
	        // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
	        // 'Base64UploadAdapter',
	        'RealTimeCollaborativeComments',
	        'RealTimeCollaborativeTrackChanges',
	        'RealTimeCollaborativeRevisionHistory',
	        'PresenceList',
	        'Comments',
	        'TrackChanges',
	        'TrackChangesData',
	        'RevisionHistory',
	        'Pagination',
	        'WProofreader',
	        // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
	        // from a local file system (file://) - load this site via HTTP server if you enable MathType
	        'MathType'
	    ]
		}).then(newEditor => {
		 	window['editor'] = newEditor;
	})
	.catch( error => {
	    console.error( error );
	});	
	//ckeditor 종료


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
					console.log(taskData);
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
						let subTaskInfo = $('<tr class="subTask taskTr" data-id="' + subTask.prjBoardId + '" data-highTask="' + subTask.highTaskId + '" data-highBoard="'+ taskData.highTask[0].prjBoardId +'" data-bs-toggle="modal" data-bs-target="#updateSubTask-modal"></tr>');

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
					$('.highTask').on('click', function(e){
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
	
	// 업무 상세내용 모달 (상위업무)
	$(document).on("click", ".highTask", function(e){
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
				taskInfo.find('input[name="prjBoardId"]').val(prjBoardId);
				
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
		     	
				// 좋아요 여부 / 좋아요 전체 수
				getPrjLike('${memberInfo.memberId}', prjBoardId);
				
				// 좋아요 등록/해제
				$('span[name="prjLike"]').on('click', function() {
				    likeBoard('${memberInfo.memberId}', prjBoardId, 'C8');
				});
				
		     
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
		
	})
	
	// 상위 업무 글 수정 폼
	$('.update-task-btn').on('click', function(e){
		let prjBoardId = $('#task-modal').find('input[name="prjBoardId"]').val();
		let updateTaskBox = $('#boardUpdateModal');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/getTaskInfo',
			type : 'GET',
			data : {'prjBoardId' : prjBoardId},
			success : function(taskData) {
				let highTask = taskData.highTask[0];
				
				updateTaskBox.data('id', prjBoardId);
				
				// 폼에 데이터 출력하기!!!!!!!!!!!!
				updateTaskBox.find('[name=prjBoardTitle]').val(highTask.prjBoardTitle);
				// state 값 - radio
				let state = highTask.state;
				$('#boardUpdateModal .btn-check').each(function() {
					if ($(this).val() == state) {
						$(this).prop('checked', true);
					}
				});
				// 날짜
				updateTaskBox.find('[name=startDate]').val(highTask.startDate);
				updateTaskBox.find('[name=endDate]').val(highTask.endDate);
				// 우선순위
				let priority = highTask.priority;
				updateTaskBox.find('option[value="' + priority + '"]').prop('selected', true);
				// 진척도
				updateTaskBox.find('.progress-bar-size').css('width', highTask.processivity + '%');
				updateTaskBox.find('.progress-value').text(highTask.processivity + '%');
				updateTaskBox.find('[name=processivity]').val(highTask.processivity);
				// 업무 담당자 리스트
				let managers = taskData.highManager;
            	let managerList = updateTaskBox.find('.board-taskManager');
				
            	//상위 업무 담당자 공간 비우고 내용 추가	
            	managerList.empty();
            	
            	if(managers.length != 0) {
	            	for (let i = 0; i < managers.length; i++) {
	                	managerList.prepend('<span name='+ managers[i].prjParticirId +'>'  + managers[i].memberName + '<img class="deleteManager" alt="삭제" src="${pageContext.request.contextPath}/resources/icon/red-xmark-solid.svg" class="cursor" style="margin-left:5px;"></span>');
	            	}
            	}
				// 셀렉트 박스 생성		            	
    			let selectBox = $('<select class="add-taskManager-select" onchage="addManager(this)")><option value="" selected disabled>담당자 추가</option></select>');
    			$.ajax({
    		    	url : '${pageContext.request.contextPath}/particirList',
    		        type: 'GET',
    		        data: {'projectId': "${projectInfo.projectId}"},
    		        success: function(particir){
    		        	for(let i=0; i<particir.length; i++) {
    						let option = $('<option>');
    						
    						option.val(particir[i].prjParticirId);
    						option.text(particir[i].memberName);
    						
    						for(let j=0; j<managers.length; j++) {
    							if(particir[i].prjParticirId == managers[j].prjParticirId) {
    								option.prop('disabled', true);
    							}	        						}
    						
    						selectBox.append(option);
    					}
    		        },
    		        error: function(reject){
    		            console.log(reject);
    		        }
    		    });	
    			
    			managerList.append(selectBox);
    			managerList.prepend('<span>담당자 : </span>');
    			
            	//상위 업무 게시글 내용
    			editor.setData(highTask.prjBoardSubject);
            	
		    }, error : function(reject) {
				console.log(reject);
			}
		});
	});

	//상위 업무 수정
	$('#boardUpdateModal button[name="btnAddTask"]').on('click', function(){
		let updateTaskBox = $('#boardUpdateModal');
		let prjBoardId = updateTaskBox.data('id');
		let prjBoardTitle = updateTaskBox.find('[name=prjBoardTitle]').val();
		let prjBoardSubject = editor.getData();
		let state = updateTaskBox.find('[name=state]:checked').val();
		let inspYn = updateTaskBox.find('[name=inspYn]').val();
		let startDate = updateTaskBox.find('[name=startDate]').val();
		let endDate = updateTaskBox.find('[name=endDate]').val();
		let priority = updateTaskBox.find('[name=priority]').val();
		let processivity = updateTaskBox.find('[name=processivity]').val();
		let boardType = 'C8';
		let memberId = $('#memberId').val();
		let projectId = '${projectInfo.projectId}';
		
		
		let boardVO = {prjBoardId, prjBoardTitle, prjBoardSubject, inspYn, projectId, boardType, memberId};
		let taskVO = {state, startDate, endDate, priority, processivity};
		
		// 상위 업무 담당자 리스트
		let prjManager =[];
		$('#boardUpdateModal .board-taskManager').eq(0).find('span:not(:eq(0))').each(function(index, item){
	        let prjParticirId = $(item).attr('name');
	        prjManager.push({prjBoardId, prjParticirId});
	    });
		
		console.log(JSON.stringify({boardVO, taskVO, prjManager}));
		$.ajax({
			url:'${pageContext.request.contextPath}/updateTask',
			type:'POST',
			data:JSON.stringify({boardVO, taskVO, prjManager}),
			contentType:'application/json',
			success:function(data){
				alert('정상적으로 수정되었습니다.');
				location.href='${pageContext.request.contextPath}/projectTask?projectId=' + data;
			},error: function(reject) {
				console.log(reject);
			}
		});
	});
	//상위 업무 수정 종료
	
	//하위 업무 정보 출력
	$(document).on("click", ".subTask", function(e){ 
		e.stopPropagation();
		
		let prjBoardId = $(e.currentTarget).data('id');
		let highTaskId = $(e.currentTarget).data('highTask');
		let highPrjBoardId = $(e.currentTarget).data('highBoard');
		let taskModal = $('#updateSubTask-modal');
		
		$('.modal-backdrop').addClass('show');
		$('.modal-backdrop').css('display', 'block');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/getTaskInfo',
			type : 'GET',
			data : {'prjBoardId' : prjBoardId},
			success : function(taskData) {
				
				taskModal.find('button.updateSubTask-modal-btn').attr('name', 'updateForm');
				taskModal.find('button.updateSubTask-modal-btn').text('수정하기');
				taskModal.find('input').prop('disabled', true);
				taskModal.find('select').prop('disabled', true);
				taskModal.find('button[type="radio"]').prop('disabled', true);
				taskModal.find('input[name="boardId"]').val(prjBoardId);
				taskModal.find('input[name="highTaskId"]').val(highTaskId);
				taskModal.find('input[name="highPrjBoardId"]').val(highPrjBoardId);
				
    			// 하위 업무 추가하기
    			let subTask = taskData.highTask[0];
    			let managers = taskData.highManager;
    			let boardTitle = taskModal.find('input[name="prjBoardTitle"]');
    			let boardState = taskModal.find('.board-state');
    			let boardPriority = taskModal.find('.select-priority');
    			let inputDate = taskModal.find('input[name=endDate]');
    			let taskManagerBox = taskModal.find('.board-taskManager');
    			
    			boardTitle.val(subTask.prjBoardTitle);
    			boardState.find('input[value=' + subTask.state + ']').prop('checked', true);
    			boardPriority.find('option[value=' + subTask.priority + ']').prop('selected', true);
    			inputDate.val(subTask.endDate != null ? subTask.endDate : '-');
    			
    			taskManagerBox.empty();
    			
   				if(managers.length != 0) {
   					for (let i = 0; i < managers.length; i++) {
   						taskManagerBox.prepend('<span name='+ managers[i].prjParticirId +'>' + managers[i].memberName + '</span>');
	            	}	
   				} else {
   					taskManagerBox.prepend('<span name=""> 없음 </span>');
   				}
   				taskManagerBox.prepend('<span>담당자 : </span>');
		    }, error : function(reject) {
				console.log(reject);
			}
		});	
	});
	
	//하위 업무 수정 폼 전환
	$(document).on('click', '#updateSubTask-modal button[name="updateForm"]', function(e) {
		let taskModal = $('#updateSubTask-modal');
		let boardId = taskModal.find('input[name="boardId"]').val();
		let highTaskId = taskModal.find('input[name="highTaskId"]').val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/getTaskInfo',
			type : 'GET',
			data : {'prjBoardId' : boardId},
			success : function(taskData) {
				taskModal.find('input[name="prjBoardTitle"]').focus();
				taskModal.find('input').prop('disabled', false);
				taskModal.find('select').prop('disabled', false);
				taskModal.find('button[type="radio"]').prop('disabled', false);
				taskModal.find('button.updateSubTask-modal-btn').attr('name', 'updateBtn');
				taskModal.find('button.updateSubTask-modal-btn').text('수정완료');
				
    			// 하위 업무 추가하기
    			let subTask = taskData.highTask[0];
    			let managers = taskData.highManager;
    			let taskManagerBox = taskModal.find('.board-taskManager');
    			
    			taskManagerBox.empty();
    			
					for (let i = 0; i < managers.length; i++) {
						taskManagerBox.prepend('<span name='+ managers[i].prjParticirId +'>' + managers[i].memberName + '<img class="deleteManager" alt="" src="${pageContext.request.contextPath}/resources/icon/red-xmark-solid.svg" class="cursor" style="margin-left:5px;"></span>');
            	}	
   				
					// 셀렉트 박스 생성		            	
    			let subSelectBox = $('<select class="add-taskManager-select" onchage="addManager(this)")><option value="" selected disabled>담당자 추가</option></select>');
    			$.ajax({
    		    	url : '${pageContext.request.contextPath}/particirList',
    		        type: 'GET',
    		        data: {'projectId': '${projectInfo.projectId}'},
    		        success: function(particir){
    		        	for(let i=0; i<particir.length; i++) {
    						let option = $('<option>');
    						
    						option.val(particir[i].prjParticirId);
    						option.text(particir[i].memberName);
    						
    						for(let k=0; k<managers.length; k++) {
    							if(particir[i].prjParticirId == managers[k].prjParticirId) {
    								option.prop('disabled', true);
    							}	        						}
    						subSelectBox.append(option);
    					}
    		        },
    		        error: function(reject){
    		            console.log(reject);
    		        }
    		    });	
    			
   				taskManagerBox.append(subSelectBox);
   				taskManagerBox.prepend('<span>담당자 : </span>');
		    }, error : function(reject) {
				console.log(reject);
			}
		})
	});
	
	//하위 업무 수정
	$(document).on('click', '#updateSubTask-modal button[name="updateBtn"]', function(e) {
		let taskModal = $('#updateSubTask-modal');
		let prjBoardId = taskModal.find('input[name="boardId"]').val();
		let highPrjBoardId = taskModal.find('input[name="highPrjBoardId"]').val();
		let highTaskId = taskModal.find('input[name="highTaskId"]').val();
		let prjBoardTitle = taskModal.find('[name=prjBoardTitle]').val();
		let state = taskModal.find('[name=state]:checked').val();
		let endDate = taskModal.find('[name=endDate]').val();
		let priority = taskModal.find('[name=priority]').val();
		let boardType = 'C8';
		let memberId = $('#memberId').val();
		let projectId = $('#projectId').val();
		
		let boardVO = {prjBoardId, prjBoardTitle, projectId, boardType, memberId};
		let taskVO = {state, endDate, priority, highTaskId};
		
		//업무 담당자 리스트
		let prjManager =[];
		taskModal.find('.board-taskManager').find('span:not(:eq(0))').each(function(index, item){
	        let prjParticirId = $(item).attr('name');
	        prjManager.push({prjBoardId, prjParticirId});
	    });
		
		console.log(JSON.stringify({boardVO, taskVO, prjManager}));
		// 수정
		$.ajax({
			url:'${pageContext.request.contextPath}/updateTask',
			type:'POST',
			data:JSON.stringify({boardVO, taskVO, prjManager}),
			contentType:'application/json',
			success:function(data){
				alert('정상적으로 수정되었습니다.');
				$('#updateSubTask-modal').removeClass('show');
				$('#updateSubTask-modal').css('display', 'none');
				$('.modal-backdrop').removeClass('show');
				$('.modal-backdrop').css('display', 'none');
				
			},error: function(reject) {
				console.log(reject);
			}
		});
	});
	
	//상위 업무 삭제
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
	
	//하위 업무 삭제
	$(document).on('click', '#updateSubTask-modal button[type="reset"]', function(e) {
		let taskModal = $('#updateSubTask-modal');
		let highPrjBoardId = taskModal.find('input[name="highPrjBoardId"]').val();
		let prjBoardId = taskModal.find('input[name="boardId"]').val();
		
		if(confirm('선택하신 업무를 삭제하시겠습니까?')){
			$.ajax({
				url: '${pageContext.request.contextPath}/deleteTask',
				type: 'POST',
				data: {'prjBoardId' : prjBoardId},
				success: function(response){
					$('#updateSubTask-modal').removeClass('show');
					$('#updateSubTask-modal').css('display', 'none');
					$('.modal-backdrop').removeClass('show');
					$('.modal-backdrop').css('display', 'none');
					
				},
				error: function(error){
					alert("삭제에 실패했습니다.");
					console.log(error);
				}
			});
		}
	});
	
	
	//진척도!!
	$('.progress-bar').on("click", function(event) {
		const progressBar = event.currentTarget;
		const progressBarInner = $(event.currentTarget).find('.progress-bar-size');
		// 클릭 위치
		// 창 왼쪽부터 클릭한 위치까지 거리 - 프로그레스바 왼쪽 좌표 = 클릭 위치
		const clickedPosition = event.clientX - progressBar.getBoundingClientRect().left;
		
		// 프로그레스 전체 길이
		const totalWidth = progressBar.offsetWidth;
		
		// 진척도 값 계산
		const selectedProgress = Math.round((clickedPosition / totalWidth) * 100 / 10) * 10;

		// 클릭한 진척도 값으로 프로그레스 채우기
		/* progressBarInner.style.width = selectedProgress + "%"; */
		progressBarInner.css('width', selectedProgress + "%");
		
		// input에 선택 한 값 넣기
	    const hiddenInput = $(progressBar).next().next(); /* document.querySelector("#boardInsertModal input[name='processivity']") */;
		
		if (hiddenInput) {
			hiddenInput.val(selectedProgress);

			// 선택된 값 표시
			const progressValue = $(progressBar).next();/* document.querySelector("#boardInsertModal .progress-value") */;
			progressValue.text(selectedProgress + "%");
		}
	});
	
	// 시작일자, 마감일자 범위 선택하기
	$(document).on('click', 'input[data-date]', function(e) {
		//startDate 클릭 시
		if($(e.currentTarget).hasClass('startDate')) {
			let startDate = $(e.currentTarget);
			let endDate = startDate.siblings('.endDate');
			
			// 시작일
			startDate.datetimepicker({
				format:'Y-m-d H:i',
				lang:'kr',
				onSelectDate:function() {
					endDate.prop('disabled', false);
				}
			});
			
			// 마감일
			endDate.datetimepicker({
				format:'Y-m-d H:i',
				lang:'kr',
				// 오늘 이후로 선택 가능하게 설정
				onShow:function(){
					let date = new Date(startDate.val());
					date.setDate(date.getDate() + 1);
					
					this.setOptions({
						minDate:startDate.val()?date:false
					})
				}
			});
		} //endDate 클릭 시 
		else if($(e.currentTarget).hasClass('endDate')) {
			let endDate = $(e.currentTarget);
			
			endDate.datetimepicker({
				format:'Y-m-d H:i',
				// 오늘 이후로 선택 가능하게 설정
				minDate: 0
			});
		}
	});
	
	//담당자 선택시 스팬 추가
	$(document).on('change','.add-taskManager-select', function(e) {
		let managerSpan = $('<span>');
		let deleteManager = $('<img class="deleteManager" alt="" src="${pageContext.request.contextPath}/resources/icon/red-xmark-solid.svg" class="cursor" style="margin-left:5px;">');
		let memberId = `<input type="hidden" name="taskManager">`;
		let selectBox = $(e.currentTarget);
		let checkedOption = selectBox.find('option:checked');
		
		managerSpan.attr('name', checkedOption.val());
		managerSpan.text(checkedOption.text());
		managerSpan.append(deleteManager);
		selectBox.before(managerSpan);

		//담당자 아이디 저장
		memberId = $(memberId).val(checkedOption.val());
		selectBox.next().append(memberId);
		
		checkedOption.prop('disabled', true);
	});
	
	//담당자 선택 삭제
	$(document).on('click', '.deleteManager', function(e) {
		e.stopPropagation();
		let managerSpan = $(e.currentTarget).parent();
		let prjParticirId = managerSpan.attr('name');
		managerSpan.parent().find('option[value=' + prjParticirId +']').prop('disabled', false);
		managerSpan.remove();
		
	});
	
	
	
	// 좋아요 등록/해제
	function likeBoard(memberId, boardId, boardType){
		$.ajax({
			url : '${pageContext.request.contextPath}/likeBoard',
			type : 'GET',
			data : {'memberId': memberId, 'boardId' : boardId, 'boardType': boardType},
			success : function(like){
				// 게시글 좋아요 수
				getPrjLike(memberId, boardId);
				
				let likeSpan = $('#task-modal').find('span[name="prjLike"] span');
				likeSpan.empty();
				// 좋아요 상태 표시
				if(like.checkLike == 'like'){
					likeSpan.append("좋아요 해제");
				}else{
					likeSpan.append("좋아요");
				}
			},
			error : function(reject){
				console.log(reject)
			}
		})
	}
	
	
	// 좋아요 정보
	function getPrjLike(memberId, boardId){
		$.ajax({
			url : '${pageContext.request.contextPath}/getPrjLike',
			type : 'GET',
			data : {'memberId': memberId, 'boardId' : boardId},
			success : function(likeInfo){
				// 게시글 좋아요 수
				console.log(likeInfo)
				$('#task-modal').find('span[data-likeCount]').text(likeInfo.boardLike.length);
				
				// 좋아요 여부
				let likeSpan = $('#task-modal').find('span[name="prjLike"] span');
				likeSpan.empty();
				
				if(likeInfo.memberLike != null) {
					likeSpan.append("좋아요 해제");
				} else {
					likeSpan.append("좋아요");
				}
			},
			error : function(reject){
				console.log(reject)
			}
		})
	};
	/*
	// 북마크
	function getBookMark(memberId, projectId){
		$.ajax({

		})
	}
	*/
</script>


</body>
</html>