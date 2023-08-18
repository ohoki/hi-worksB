<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

<style>
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

.date-input{
	border: 1px solid var(--color-light-white);
    border-radius: var(--size-border-radius);
    margin: 5px;
}

.vote-add-buttons input{
	border: 1px solid var(--color-light-white);
    border-radius: var(--size-border-radius);
    margin: 5px;
}

a {
    text-decoration: none;
}

</style>
</head>
<body>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#boardInsertModal">게시글 작성</button>

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
            	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <!-- 게시글 작성 폼 시작!!! 지도 추가해야됨-->
            <div class="modal-body boardForm visible" id="board">
                <form action="boardInsert" method="post">
					<div>
						<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요." required>
					</div>

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
		            	<input type="hidden" name="boardType" value="C5">
		            	<input type="hidden" name="projectId" value="${projectInfo.projectId}">
		                <button type="submit" class="btn btn-primary">등록</button>
		                <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		            </div>
				</form>
            </div>
             <!-- 게시글 작성 폼 끝!!! 지도 추가해야됨-->
             
            
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
				    
				    <!-- 우선 순위 -->
					<div class="select-priority">
						<select name="priority">
							<option value="">우선 순위</option>
							<option value="F3">낮음</option>
							<option value="F2">보통</option>
							<option value="F1">긴급</option>
						</select>
					</div>
					</form>
						
					<!-- 하위 업무 -->	
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
					</div>
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
					</div>
					
					<div>
						<label>공개 범위</label>
						<select class="form__select" name="inspYn">
							<option value="E2">전체 공개</option>
							<option value="E1">프로젝트 관리자만</option>
						</select>
					</div>
		            <div class="modal-footer form__button">
		            	<input type="hidden" name="boardType" value="C8">
		            	<input type="hidden" name="projectId" value="${projectInfo.projectId}">
		                <button type="button" class="btn btn-primary" id="btnAddTask">등록</button>
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
	
	
	$('#btnAddTask').on('click', function(){
		let data={}
		let prjBoardTitle = $('#task #boardInsert').find('[name=prjBoardTitle]').val();
		let prjBoardSubject = $('#task #boardInsert').find('[name=prjBoardSubject]').val();
		let state = $('#task #boardInsert').find('[name=state]:checked').val();
		let inspYn = $('#task #boardInsert').find('[name=inspYn]:selected').val();
		let projectId = $('#task #boardInsert').find('[name=projectId]').val();
		let startDate = $('#task #boardInsert').find('[name=startDate]').val();
		let endDate = $('#task #boardInsert').find('[name=endDate]').val();
		let priority = $('#task #boardInsert').find('[name=priority]:selected').val();
		let boardType = 'C7';
		let memberId = $('#memberId').val();
		console.log(memberId);
		
		let boardVO = {prjBoardTitle, prjBoardSubject, inspYn, projectId, boardType, memberId}
		let taskVO = {state, startDate, endDate, priority}
		
		let subTask = [];
		$('.task-add').each(function(index,item){
			console.log(item)
			let prjBoardTitle = $(item).find('[name=prjBoardTitle]').val();
			let state = $(item).find('[name=state]:checked').val();
			let endDate = $(item).find('[name=endDate]').val();
			let priority = $(item).find('[name=priority]:selected').val();
			subTask.push({prjBoardTitle, state, endDate, priority})
		})
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
	
</script>
</html>