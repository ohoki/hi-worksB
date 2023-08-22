<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.full.min.js"></script>

<style>
body{
	background-color : #f7fafd;
}
.form__select,
.form__input-title,
.form__textarea {
	width: 100%;
	padding: 10px;
	border-radius: var(--size-border-radius);
	border: 1px solid var(--color-dark-white);
	font-size: var(--font-small);
	margin-bottom: 15px;
}

.form__textarea{
	height: 300px;
	resize: none; /*textarea 길이 고정*/
}

.modal-title {
    list-style: none;
    height: 100%;
    display: flex;
    align-items: center;
    margin-left: 20px;
}

.modal-title li {
    font-size: 20px;
    height: 100%;
    display: flex;
    align-items: center;
    margin-right: 20px;
}

.modalBoard{
    top:0;
    left:0;
}

.boardForm{
	display: none;	

}

.visible {
	display: block;
}

.modal-header{
	height: 80px;
}

.form-check{
	margin-bottom: 10px;
}

.ui-datepicker {
	width: auto;
}

.progress-bar {
	background-color: #eeeeee;
	height: 20px;
}
.progress-bar-size {
	background-color: #90ddfc;
	height: 100%;
	width: 0;
	transition: width 0.3s ease-in-out;
}

.date-input,
.vote-add-buttons input,
.task-add input {
	border: 1px solid var(--color-light-white);
    border-radius: var(--size-border-radius);
    margin: 5px;
}


a {
    text-decoration: none;
    color: var(--color-dark-beige);
}

.board-container{
	border: 1px solid var(--color-dark-white);
    border-radius: var(--size-border-radius);
    width : 750px;
    background-color : #ffffff;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    margin: 50px auto;
    padding: 30px;
}
.board-header,
.subTask-content{
	display: flex;
	align-items: center;
}
.board-headder-info,
.task-info{
	margin-left: 60px;
}
.board-sub{
	height:250px;
	margin-top: 20px;
	font-size: var(--font-small);
}
.divide{
	border-bottom: 1px solid var(--color-light-white);
	margin: 20px 0;
}
.divide2{
	border-bottom: 1px solid var(--color-light-white);
}
.board-comment{
	background-color : var(--color-light-blue);
	height: 80px;
	padding: 10px;
	
}
.board-title{
	font-size: 27px;
	margin-top: 20px;
	color: var(--color-dark-grey);
    font-weight: var(--weight-bold);
}
.regdate,
.compnoVote{
	color: var(--color-dark-white);
	font-size: var(--font-small);
}
.memberName{
	font-size: var(--font-regular);
	color: var(--color-dark-grey);
}
.vote-sub,
.task_sub{
	height:120px;
}

.voteEndDate{
	color: var(--color-dark-white);
	font-size: 18px;
	margin-bottom: 10px;
}
.voteList,
.subTask-content{
	border-radius: var(--size-border-radius);
	background-color: #f7fafd;
	height: 30px;
	margin-bottom: 10px;
	padding-left: 15px;
}
.task-detail,
.prjParticir_title span{
	font-size: 15px;
}

.prjParticir {
	width: 200px;
	align-items: center;
	justify-content: space-between;
	border-bottom: 1px solid var(--color-dark-white);
	padding: 0 20px 0 5px;
	cursor: pointer;
}

.prjParticir:nth-child(1) {
	border-top: 1px solid var(--color-dark-white);
}

.prjParticir-img {
	width: 40px;
	height: 40px;
}
</style>
</head>
<body>
<div style="display : flex;">
	<div style="width: 70%;">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#boardInsertModal">게시글 작성</button>
		<!-- 게시글 조회 -->
		<c:forEach items="${boards }" var="board">
			<c:if test="${board.boardType eq 'C5'}">
				<div data-list="board" data-type="${board.boardType}" data-id="${board.prjBoardId }" class="board-container">
					<div class="board-header">
						<div class="board-headder-info memberName">${board.memberId } </div>
						<div  class="board-headder-info regdate">${board.prjBoardRegdate }</div>
					</div>
					<div class="board-title divide">
						${board.prjBoardTitle }
					</div>
					<div class="board-sub divide">
						${board.prjBoardSubject }
					</div>
					<div class="board-comment">
						댓글공간
					</div>
				</div>
			</c:if>
			<!-- C6 일정-->
			<c:if test="${board.boardType eq 'C6'}">
				<div data-list="board" data-type="${board.boardType}" data-id="${board.prjBoardId }" class="board-container" id="scheInfo">
					<div class="board-header">
						<div class="board-headder-info memberName">${board.memberId } </div>
						<div  class="board-headder-info regdate">${board.prjBoardRegdate }</div>
					</div>
					<div class="board-title divide">
						${board.prjBoardTitle }
					</div>
					<div class="sche-date divide">
						<div class="sche-startDate" id="sche-startDate">일정시작일</div>
						<div class="sche-endDate" id="sche-endDate">일정종료일</div>
					</div>
					<div class="board-sub divide">
						${board.prjBoardSubject }
					</div>
					<div class="board-comment">
						댓글공간
					</div>
				</div>
			</c:if>
			<!-- C7 투표 -->
			<c:if test="${board.boardType eq 'C7'}">
				<div data-list="board" data-type="${board.boardType}" data-id="${board.prjBoardId }" class="board-container">
					<div class="board-header">
						<div class="board-headder-info memberName">${board.memberId } </div>
						<div  class="board-headder-info regdate">${board.prjBoardRegdate }</div>
					</div>
					<div class="board-title divide">
						${board.prjBoardTitle }
						<span class="compnoVote">(복수투표여부)</span>
					</div>
					<div class="board-sub divide vote-sub">
						${board.prjBoardSubject }
					</div>
					<div class="voteEndDate">투표마감일</div>
					<div class="voteContent">
					</div>
					<div class="board-comment">
						댓글공간
					</div>
				</div>
			</c:if>
			<!-- C8 업무 -->
			<c:if test="${board.boardType eq 'C8'}">
				<div data-list="board" data-type="${board.boardType}" data-id="${board.prjBoardId }" class="board-container">
					<div class="board-header">
						<div class="board-headder-info memberName">${board.memberId } </div>
						<div  class="board-headder-info regdate">${board.prjBoardRegdate }</div>
					</div>
					<div class="board-title divide">
						${board.prjBoardTitle }
					</div>
					<div class="taskState">업무상태</div>
					<div class="task-detail">
						<div class="task-startDate">업무시작일</div>
						<div class="task-endDate">업무종료일</div>
						<div class="task-priority">우선순위</div>
						<div class="task-processivity">진척도</div>
					</div>
					<div class="board-sub task_sub divide2">
						${board.prjBoardSubject }
					</div>
					<div class="subTask">
					</div>
					<div class="board-comment">
						댓글공간
					</div>
				</div>
			</c:if>
		</c:forEach>		
	</div>
	<!-- 게시글 조회 끝 -->
	<div style="width: 25%;">
		<h1>북마크 공간~~</h1>
	</div>
</div>
<script>
	// 게시글 조회
	$(window).on('DOMContentLoaded', function() {
		let boardList = $('[data-list="board"]');
		
		for(let i=0; i<boardList.length; i++) {
			if (boardList[i].dataset.type == 'C6') {
				//일정
				$.ajax({
					url : '${pageContext.request.contextPath}/getScheInfo',
					type : 'GET',
					data : {'prjBoardId' : boardList[i].dataset.id},
					success : function(sche) {
						 let startDate = $(boardList[i]).find('.sche-startDate');
		                 let endDate = $(boardList[i]).find('.sche-endDate');

		                 startDate.text(sche.startDate);
		                 endDate.text(sche.endDate);
					}, error : function(reject) {
						console.log(reject);
					}
				})
			}else if (boardList[i].dataset.type == 'C7') {
				//투표
				$.ajax({
					url : '${pageContext.request.contextPath}/getVoteInfo',
					type : 'GET',
					data : {'prjBoardId' : boardList[i].dataset.id},
					success : function(voteData) {
						let voteEndDate = $(boardList[i]).find('.voteEndDate');
						let compnoVote = $(boardList[i]).find('.compnoVote');
						let voteContent = $(boardList[i]).find('.voteContent');
						
						// 종료일
						let endDate = new Date(voteData.voteInfo[0].endDate);
						voteEndDate.text('투표마감일: ' + endDate.toDateString());
						
						// 복수 투표 여부
						if (voteData.voteInfo[0].compnoVote == 'A1') {
							compnoVote.text('(복수 투표)');
						} else if (voteData.voteInfo[0].compnoVote == 'A2') {
							compnoVote.text('');
						}
						
						// 투표 항목
						for (let j = 0; j < voteData.voteList.length; j++) {
						let voteItem = $('<div>').addClass('voteList').text((j + 1) + '. ' + voteData.voteList[j].listContent);
						voteContent.append(voteItem);
						}
						
						
						
					}, error : function(reject) {
						console.log(reject);
					}
				});
			} else if (boardList[i].dataset.type == 'C8') {
				//업무
				$.ajax({
					url : '${pageContext.request.contextPath}/getTaskInfo',
					type : 'GET',
					data : {'prjBoardId' : boardList[i].dataset.id},
					success : function(taskData) {
						let taskInfo = $(boardList[i]);
						// 상위 업무
						let highTask = taskData.highTask[0];
						// 하위 업무리스트
						let subTasks = taskData.subTask;

						// 우선 순위 priority 구분
				        function getPriority(priority) {
	                        switch (priority) {
	                            case 'F3':
	                                return '낮음';
	                            case 'F2':
	                                return '보통';
	                            case 'F1':
	                                return '긴급';
	                            default:
	                                return priority;
	                        }
                    	}
				        
				        // 업무 상태 state 구분
				        function getState(state) {
	                        switch (state) {
	                            case 'G1':
	                                return '요청';
	                            case 'G2':
	                                return '진행';
	                            case 'G3':
	                                return '피드백';
	                            case 'G4':
	                                return '완료';
	                            case 'G5':
	                                return '보류';
	                            default:
	                                return state;
	                        }
	                    }
				        
				        // 상위 업무 정보
				        taskInfo.find(".task-startDate").text(highTask.startDate);
				        taskInfo.find(".task-endDate").text(highTask.endDate);
				        taskInfo.find(".task-priority").text(getPriority(highTask.priority));
				        taskInfo.find(".task-processivity").text(highTask.processivity);
				        taskInfo.find(".taskState").text(getState(highTask.state));

				        // 하위 업무 리스트
				        let subTasksInfo = taskInfo.find(".subTask");

				        for (let j = 0; j < subTasks.length; j++) {
				        	let subTask = subTasks[j];
				        	let subTaskContent = $('<div class="subTask-content"></div>');
				            subTaskContent.append('<div class="subTask-state task-info">' + getState(subTask.state) + '</div>');
				            subTaskContent.append('<div class="subTask-title task-info">' + subTask.prjBoardTitle + '</div>');
				            subTasksInfo.append(subTaskContent);
				        }
				    }, error : function(reject) {
						console.log(reject);
					}
				});
			}
		}
	});
</script>

<!-- 게시글 작성 -->
<div class="modal modalBoard" tabindex="-1" id="boardInsertModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
            	<ul class="modal-title">
            		<li>글</li>
            		<li>업무</li>
            		<li>일정</li>
            		<li>투표</li>
            	</ul>
            	<input type="hidden" name="memberId" value="${memberInfo.memberId }" id="memberId">
            	<input type="hidden" name="projectId" value="${projectInfo.projectId}" id="projectId">
            	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <!-- 게시글 작성 폼 시작!!! 지도 추가해야됨-->
            <div class="modal-body boardForm visible" id="board">
                <form action="boardInsert" method="post">
					<div>
						<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요.">
					</div>

					<div>
						<textarea class="form__textarea" name="prjBoardSubject" placeholder="내용을 입력하세요."></textarea>
					</div>
					
					<div>
						<label>공개 범위</label> <select class="form__select" name="inspYn">
							<option value="E2">전체 공개</option>
							<option value="E1">프로젝트 관리자만</option>
						</select>
					</div>
		            <div class="modal-footer form__button">
		            	<input type="hidden" name="boardType" value="C5">
		            	<input type="hidden" name="projectId" value="${projectInfo.projectId}">
		                <button type="submit" class="btn btn-primary">등록</button>
		                <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		            </div>
				</form>
            </div>
             <!-- 게시글 작성 폼 끝!!! -->
             
            
            <!-- 상위 업무 작성 폼!!! -->
             <div class="modal-body boardForm" id="task">
                <form id="boardInsert" method="post">
                    <!-- 시작일자 마감일자 우선순위 진척도 추가!!!! 하위업무-->
					<div>
						<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요." required>
					</div>

					<div class="form-check">
						<input type="radio" class="btn-check" name="state" value="G1" id="option1" autocomplete="off" checked>
						<label class="btn btn-outline-info" for="option1">요청</label>
						
						<input type="radio" class="btn-check" name="state" value="G2" id="option2" autocomplete="off">
						<label class="btn btn-outline-success" for="option2">진행</label>
						
						<input type="radio" class="btn-check" name="state" value="G3" id="option3" autocomplete="off">
						<label class="btn btn-outline-warning" for="option3">피드백</label>
						
						<input type="radio" class="btn-check" name="state" value="G4" id="option4" autocomplete="off">
						<label class="btn btn-outline-primary" for="option4">완료</label>
						
						<input type="radio" class="btn-check" name="state" value="G5" id="option5" autocomplete="off">
						<label class="btn btn-outline-danger" for="option5">보류</label>
					</div>
						
					<!-- 업무 담당자 -->
					<div>
						<button type="button" class="btn-add-taskManager" data-bs-toggle="modal" data-bs-target="#add-taskManager">담당자 추가</button>
						<div id="add-taskManager" class="modal" tabindex="-1">
						 	<div class="modal-dialog">
						 		<div class="modal-content prjParticir">
							 		<div class="modal-body">
										<div class="prjParticir_title">
											<span>프로젝트 참여자</span>
										</div>
										<div id="particir">	
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="taskManager">
							
						</div>
					</div>
					<!-- 업무 담당자 끝 -->
					
					<div>
						<textarea class="form__textarea" name="prjBoardSubject" placeholder="내용을 입력하세요." required></textarea>
					</div>
					
					<div>
						<label for="startDate">시작일 추가</label>
						<input type="text" name="startDate" class="date-input startDate">
					</div>
					<div>
						<label for="endDate">마감일 추가</label>
						<input type="text" name="endDate" class="date-input endDate">
					</div>
					
					<!-- 우선 순위 -->
					<div class="select-priority">
						<select name="priority">
							<option value="">우선 순위</option>
							<option value="F3">낮음</option>
							<option value="F2">보통</option>
							<option value="F1">긴급</option>
						</select>
					</div>
					
					<!-- 진척도 -->
					<!-- 진척도 전체 프로그레스-->
					<div class="js-progress create-content-cell">
				        <div class="progress-bar">
				         	<!-- 프로그레스 채우기-->
				            <div class="progress-bar-size" style="width: 0%;"></div>
				        </div>
				        <!-- 프로그레스 버튼-->
				        <div class="progress-graph">
							<span class="progress-button" data-progress-value="0"></span>
							<span class="progress-button" data-progress-value="10"></span>
							<span class="progress-button" data-progress-value="20"></span>
							<span class="progress-button" data-progress-value="30"></span>
							<span class="progress-button" data-progress-value="40"></span>
							<span class="progress-button" data-progress-value="50"></span>
							<span class="progress-button" data-progress-value="60"></span>
							<span class="progress-button" data-progress-value="70"></span>
							<span class="progress-button" data-progress-value="80"></span>
							<span class="progress-button" data-progress-value="90"></span>
							<span class="progress-button" data-progress-value="100"></span>
				        </div>
    				</div>
    				<!-- 진척도 값 표시하기 -->
				    <div class="progress-value">0%</div>
				    <!-- 진척도 값 넘길때 -->
				    <input type="hidden" name="processivity" value="0">
				    
					</form>
						
					<!-- 하위 업무 -->	
					<div class="task-add">
					    <button type="button" class="btn btn-secondary btn-add-subtask">하위업무 추가</button>
					</div>
					<!-- 하위 업무 끝 -->
					
					<div class="task-inspYn">
						<label>공개 범위</label>
						<select class="form__select" name="inspYn">
							<option value="E2">전체 공개</option>
							<option value="E1">프로젝트 관리자만</option>
						</select>
					</div>
		            <div class="modal-footer form__button">
		            	<input type="hidden" name="boardType" value="C8">
		            	<input type="hidden" name="projectId" value="${projectInfo.projectId}">
		                <button type="button" class="btn btn-primary" id="btnAddTask" data-bs-dismiss="modal">등록</button>
		                <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		            </div>
				
            </div>
            
            
            <!-- 일정 작성 폼!!! -->
            <div class="modal-body boardForm" id="sche">
                <form action="boardInsert" method="post">
					<div>
					<label>일정일정</label>
						<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요." required>
					</div>
					
					<div>
						<label for="startDate">시작일</label>
						<input type="text" name="startDate" class="date-input startDate">
					</div>
					<div>
						<label for="endDate">종료일</label>
						<input type="text" name="endDate" class="date-input endDate">
					</div>
					
					<!-- 알람 추가 -->
					
					
					<div>
						<textarea class="form__textarea" name="prjBoardSubject" placeholder="내용을 입력하세요." required></textarea>
					</div>
					
					<div>
						<label>공개 범위</label> <select class="form__select" name="inspYn">
							<option value="E2">전체 공개</option>
							<option value="E1">프로젝트 관리자만</option>
						</select>
					</div>
		            <div class="modal-footer form__button">
		            	<input type="hidden" name="boardType" value="C6">
		            	<input type="hidden" name="projectId" value="${projectInfo.projectId}">
		                <button type="submit" class="btn btn-primary">등록</button>
		                <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		            </div>
				</form>
            </div>
            
            
             <!-- 투표 작성 폼!!! -->
            <div class="modal-body boardForm" id="vote">
                <form action="boardInsert" method="post">
					<div>
						<label>투표투표</label>
						<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요." required>
					</div>

					<div>
						<textarea class="form__textarea" name="prjBoardSubject" placeholder="내용을 입력하세요." required></textarea>
					</div>
					
					<div class="vote-add-buttons">            
			        	<input type="text" name="listContent"> <input type="button" class="btnAdd" value="항목 추가"><br>        
			        </div>
					
					<div>
						<input type="text" name="endDate" class="date-input endDate">
						<label for="endDate">투표 종료일</label>
					</div>
					
					<div class="form-check form-switch">
						<input name="anonyVote" value="A1" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
						<label class="form-check-label" for="flexSwitchCheckDefault">익명 투표</label>
					</div>
					
					<div class="form-check form-switch">
						<input name="compnoVote" value="A1" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
						<label class="form-check-label" for="flexSwitchCheckDefault">복수 투표</label>
					</div>
					
					<div class="form-check form-switch">
						<input name="resultYn" value="A1" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
						<label class="form-check-label" for="flexSwitchCheckDefault">결과 나만 보기</label>
					</div>
					
					<div>
						<label>공개 범위</label> <select class="form__select" name="inspYn">
							<option value="E2">전체 공개</option>
							<option value="E1">프로젝트 관리자만</option>
						</select>
					</div>
					
		            <div class="modal-footer form__button">
		            	<input type="hidden" name="boardType" value="C7">
		            	<input type="hidden" name="projectId" value="${projectInfo.projectId}">
		                <button type="submit" class="btn btn-primary">등록</button>
		                <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		            </div>
				</form>
            </div>
            
        </div>
    </div>
</div>
<!-- 게시글 작성 끝-->
</body>
<script>
	// 이진
	// 게시글 유형 폼 선택
	
	$('ul.modal-title li').click(function(e){
		let target = e.currentTarget.textContent;
		let visibleDiv = $('.visible');
		if(target == '글') {
			visibleDiv.removeClass('visible');
			$('#board').addClass('visible');
			
		}else if(target == '업무') {
			visibleDiv.removeClass('visible');
			$('#task').addClass('visible');
			
		}else if(target == '일정') {
			visibleDiv.removeClass('visible');
			$('#sche').addClass('visible');
			
		}else if(target == '투표') {
			visibleDiv.removeClass('visible');
			$('#vote').addClass('visible');
		}	
	})
	
	// 업무, 투표, 일정
	// 시작일자, 마감일자 범위 선택하기
	$(function () {
		$(".startDate").datepicker({
			dateFormat: "yy-mm-dd",
			// 오늘 이후로 선택 가능하게 설정
			minDate: 0,
			onSelect: function(selectedDate) {
				// 시작일 선택 -> selectedDate
				// 최소 선택 일자를 minDate -> selectedDate로 설정
				$(".endDate").datepicker("option", "minDate", selectedDate);
			}
		});
		
		// 마감 일자 설정
		$(".endDate").datepicker({
			dateFormat: "yy-mm-dd",
			// 오늘 이후로 선택 가능하게 설정
			minDate: 0
		});
		
		// 폼 리셋 버튼을 클릭할 때 날짜 전부 초기화
		$("button[type='reset']").on("click", function() {
			$(".startDate").datepicker("setDate", null);
			$(".endDate").datepicker("setDate", null);
			$(".endDate").datepicker("option", "minDate", 0);
		});
	});
	
	
	//진척도!!
	const progressBar = document.querySelector(".progress-bar");
	const progressBarInner = document.querySelector(".progress-bar-size");
	const progressButtons = document.querySelectorAll(".progress-button");

	progressBar.addEventListener("click", (event) => {
		// 클릭 위치
		// 창 왼쪽부터 클릭한 위치까지 거리 - 프로그레스바 왼쪽 좌표 = 클릭 위치
		const clickedPosition = event.clientX - progressBar.getBoundingClientRect().left;
		
		// 프로그레스 전체 길이
		const totalWidth = progressBar.offsetWidth;
		
		// 진척도 값 계산
		const selectedProgress = Math.round((clickedPosition / totalWidth) * 100 / 10) * 10;

		// 클릭한 진척도 값으로 프로그레스 채우기
		progressBarInner.style.width = selectedProgress + "%";

		progressButtons.forEach(button => {
			const buttonProgress = parseInt(button.getAttribute("data-progress-value"));
			if (buttonProgress <= selectedProgress) {
				// 프로그레스바를 클릭한 값보다 작거나 같은 값만 나타내기
				button.style.display = "inline-block";
			} else {
				button.style.display = "none";
			}
		});
		
		// input에 선택 한 값 넣기
	    const hiddenInput = document.querySelector("input[name='processivity']");
		
		if (hiddenInput) {
			hiddenInput.value = selectedProgress;

			// 선택된 값 표시
			const progressValue = document.querySelector(".progress-value");
			progressValue.textContent = selectedProgress + "%";
		}
	});
	
	// 투표 항목 추가하기
	$(document).ready (function () {                
        $('.btnAdd').click (function () {                                        
            $('.vote-add-buttons').append (                        
                '<input type="text" name="listContent"> <input type="button" class="btnRemove" value="X"><br>'                    
            ); // end append                            
            $('.btnRemove').on('click', function () { 
                $(this).prev().remove (); // text 지우기
                $(this).next ().remove (); // <br> 지우기
                $(this).remove (); // 버튼 지우기
            });
        });                                           
    });
	
	
	// 하위 업무 추가하기
	$(document).ready(function () {
    $('.btn-add-subtask').click(function (event) {
        event.stopPropagation();
        var subtaskForm = `
            <div class="task-add">
                <input type="text" name="prjBoardTitle">
                <div>
                    <label for="endDate">마감일 추가</label>
                    <input type="text" name="endDate" class="date-input endDate">
                </div>
                <div class="select-priority">
                    <select name="priority">
                        <option value="">우선 순위</option>
                        <option value="F3">낮음</option>
                        <option value="F2">보통</option>
                        <option value="F1">긴급</option>
                    </select>
                </div>
                <div class="select-state">
                    <select name="state" class="task-select">
                        <option value="G1">요청</option>
                        <option value="G2">진행</option>
                        <option value="G3">피드백</option>
                        <option value="G4">완료</option>
                        <option value="G5">보류</option>
                    </select>
                </div>
            </div>`;
        
        $('.task-add:last').prev().after(subtaskForm);
    	});
	});

	
	// 업무 등록하기
	$('#btnAddTask').on('click', function(){
		let data={}
		let prjBoardTitle = $('#task #boardInsert').find('[name=prjBoardTitle]').val();
		let prjBoardSubject = $('#task #boardInsert').find('[name=prjBoardSubject]').val();
		let state = $('#task #boardInsert').find('[name=state]:checked').val();
		let inspYn = $('.task-inspYn').find('[name=inspYn]').val();
		let startDate = $('#task #boardInsert').find('[name=startDate]').val();
		let endDate = $('#task #boardInsert').find('[name=endDate]').val();
		let priority = $('#task #boardInsert').find('[name=priority]').val();
		let processivity = $('#task #boardInsert').find('[name=processivity]').val();
		let boardType = 'C8';
		let memberId = $('#memberId').val();
		let projectId = $('#projectId').val();
		console.log(memberId);
		
		let boardVO = {prjBoardTitle, prjBoardSubject, inspYn, projectId, boardType, memberId}
		let taskVO = {state, startDate, endDate, priority, processivity}
		
		let subTask = [];
		$('.task-add').each(function(index,item){
			console.log(item)
			let prjBoardTitle = $(item).find('[name=prjBoardTitle]').val();
			if (prjBoardTitle !== "") {
                let state = $(item).find('[name=state]:checked').val();
                let endDate = $(item).find('[name=endDate]').val();
                let priority = $(item).find('[name=priority]').val();
                subTask.push({ prjBoardTitle, state, endDate, priority });
            }
		})
		
		// 빈객체 지우기
		if (subTask.length > 0 && !subTask[subTask.length - 1].prjBoardTitle) {
        	subTask.pop();
   		}
		
		console.log(JSON.stringify({boardVO, taskVO, subTask}));
		$.ajax({
			url:'taskInsert',
			type:'post',
			data:JSON.stringify({boardVO, taskVO, subTask}),
			contentType:'application/json',
			success:function(data){
				console.log(data);
			},error: function(reject) {
				console.log(reject);
			}
		});
	})
	
	// 프로젝트 참여자 조회
	$('.btn-add-taskManager').click(function(e){
	    let particirDiv = $('#particir');
	    $.ajax({
	    	url : '${pageContext.request.contextPath}/particirList',
	        type: 'GET',
	        data: {'projectId': "${projectInfo.projectId}"},
	        success: function(particir){
	            console.log(particir)
	            let particirList = $('#particir');
	            particirList.empty();
	            
	            for(let i=0; i<particir.length; i++) {
					//div태그
					let particirInfo = document.createElement('div');
					particirInfo.classList.add('flex');
					particirInfo.classList.add('prjParticir');
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
					particirInfo.append(employeeProfile);
					particirInfo.append(span);
					particirInfo.append(input);
					
					particirList.append(particirInfo);
				}
	            
	        },
	        error: function(reject){
	            console.log(reject);
	        }
	    });
	});

	/*
	// 업무담당자 
	$(document).on("click", ".prjParticir",function(e){
		e.stopPropagation();
		
		$('.taskManager').append(
			'<input type="text" name="memberName"> <input type="button" class="btnRmVManager" value="X"><br>'
		);
		$('.btnRmVManager').on('click', function(){
			$(this).prev().remove ();
	        $(this).next().remove ();
	        $(this).remove();
		});
    });                                           
	*/
	
</script>
</html>