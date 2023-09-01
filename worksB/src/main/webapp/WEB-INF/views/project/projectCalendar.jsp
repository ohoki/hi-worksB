<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{
		text-decoration: none;
		color : var(--color-dark-beige);
	}
	.dis-none {
		display: none;
	}
	.d-b {
		display: block !important;
	}
	#calendar-container {
		width: 70%;
		margin: 0 auto;
	}
	.modal-prjSche-visible {
	display: block !important;
	}
	#prjSche-modal, #prjTask-modal{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.1);
	font-size: 12px;
	display: none;
	left: 0;
	top: 0;
	}
	.prjSche-modal__content, .prjTask-modal__content{
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
	
	.board-title div[data-hightaskid] {
		font-size: var(--font-micro);
		padding: 5px;
		border: 1px solid var(--color-dark-red);
		border-radius: 5px;
		color: var(--color-dark-red);
	}
	.board-footer-info {
		margin-left: 10px;
	}
	.board-footer-icon:hover {
		color: var(--color-dark-red);
		cursor: pointer;
	}
	.board-footer-icon {
		margin-right: 10px;
	}
	.board-footer {
		display: flex;
		justify-content: space-between;
		margin: 10px 40px;
		font-size: var(--font-micro);
	}
	.board-content{
		margin: 30px 40px;
		font-size: var(--font-micro);
		color: var(--color-dark-grey);	
	}	
	.board-title span {
		color: var(--color-blue);
	}
	.board-title {
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
	.board-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 20px 40px;
	}
	
	.board-header-info {
		display: flex;
		align-items: center;
	}
	
	.board-headder-info__memberName {
		margin: 0 20px;
		font-weight: var(--weight-bold);
	}		
	.sche-date {
		font-weight: var(--weight-bold);
		font-size: 15px;
		color: var(--color-dark-red);
		margin: 10px 40px;
	}
	
	.sche-addr {
		font-weight: var(--weight-bold);
		font-size: 15px;
		color: var(--color-dark-grey);
		margin: 10px 40px;
	}
	
	.sche-date .text, .task-manager .text {
		font-size: 15px;
		color: var(--color-dark-grey);
	}
	
	.sche-alarm {
		font-weight: var(--weight-bold);
		font-size: 15px;
		color: var(--color-light-blue);
	}
		
	.sche-btns {
		margin: 20px auto;
		text-align: center;
	}
	.sche-btns button {
		width: 70px;
		height: 35px;
		background-color: var(--color-light-red);
		border-radius: 5px;
		color: white;
		font-weight: var(--weight-bold);
		margin: 0 20px;
		transition: all 0.3s;
	}
	
	.sche-btns button:hover {
		background-color: var(--color-dark-red);
	}
	
	.btn-green {
		background-color: #def4c6 !important;
	}
	
	.btn-green:hover {
		background-color: var(--color-green) !important;
	}
	
	.sche-particir, .sche-nonParticir {
		font-size: var(--font-micro);
		padding: 0 10px;
		cursor: pointer;
	}
	
	.sche-particir {
		color: var(--color-green) !important;
	}
	
	.sche-nonParticir {
		color: var(--color-dark-red) !important;
	}
	.profile{
		width: 10%;
		height: 10%;
	}
	.sche-startDate, .sche-endDate, .sche-addr-info{
		display: inline-block;
	}
	.sche-addr-info{
		width: 200%;
	}
	div[data-prioriy] {
	font-size: var(--font-micro);
	color: var(--color-green);
	font-weight: var(--weight-bold);
	}
	
	div[data-state] {
		margin: 0 40px;
		text-align: left;
	}
	
	div[data-state] button{
		width: 50px;
		height: 10px;
		background-color: var(--color-dark-beigie);
		padding: 10px;
		border-radius: 5px;
		color: white;
		font-weight: var(--weight-bold);
		line-height: 10px;
	}
	
	div[data-processivity] {
		display: flex;
		align-items: center;
		color: var(--color-green);
	}
	
	.processivity {
		width: 150px;
		height: 7px;
		border-radius:2px;
		background-color: var(--color-light-white);
		margin-right: 10px;
	}
	
	.processivity-value {
		width: 1%;
		height: 7px;
		border-radius:2px;
		background-color: var(--color-green);
	}
	
	.sub-task-lists {
		margin: 0 40px 30px 40px;
	}
	
	.sub-task-lists-title {
		margin: 10px 0;
		font-size: var(--font-micro);
		font-weight: var(--weight-bold);
		color: var(--color-dark-grey);
	}
	
	.sub-task-item {
		display: flex;
		align-items: center;
		padding: 5px 10px;
		background-color: rgba(240, 240, 240, 0.2);
		justify-content: flex-start;
		margin: 5px 0;
		border-radius: 5px;
		text-align: center;
	}
	
	.sub-state {
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
	.task-manager{
		display: flex;
		font-weight: var(--weight-bold);
		font-size: 13px;
		color: var(--color-blue);
		margin: 10px 40px;
		align-items: center;
	}
	
	.task-manager span {
		margin-right: 10px;
		cursor: pointer;
	}
	.d-flex {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
 	div[data-boardmodal] {
		position: fixed;
		width: 100vw;
		height: 100vh;
		font-size: 12px;
		left: 0;
		top: 0;
		background-color: rgba(0,0,0,0.1);
	}
	.board-modal-content {
		position: absolute;
		width: 6%;
		height: 7%;
		right: 4%;
		top: 4%;
		background-color: white;
		border: 1px solid var(--color-dark-beigie);
		border-radius: 10px;
		padding: 5px 15px;
		z-index: 10;
	}
	.board-modal-content p{
		margin-bottom: 5px;
		padding: 5px;
		color: var(--color-dark-grey);
		cursor: pointer;
	}
	.board-modal-content p:hover {
		background-color: var(--color-beigie);
	}
	.board-header-btn {
		cursor: pointer;
		padding-left: 10px;
	}
</style>
</head>
<!-- full calendar  -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<body>
	<div id="calendar-container">
		<div id="calendar">
		</div>
	</div>
	<!-- 일정 상세조회 모달 -->
	<div id="prjSche-modal">
		<div class="prjSche-modal__content">
			<input type="text" id="prjScheId" hidden="true">
			<div class="board-header">
				<div class="board-header-info">
					<img src="${pageContext.request.contextPath}/resources/img/user.png" alt="기본 프로필 사진" class="profile">
					<div class="board-headder-info__memberName"></div>
					<input type="text" class="board-headder-info__regDate">
				</div>
				<div>
					<img class="board-header-btn" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">
				</div>
			</div>
			<div class="board-title">
				<div>
					<span>[일정]</span><input type="text" class="board-title-boardTitle">
				</div>
				<div>
					<span class="sche-particir">참석 <span class="sche-particir-count"></span></span>
					<span class="sche-nonParticir">불참 <span class="sche-nonParticir-count"></span></span>
				</div>
			</div>
			<div class="d-flex" style="margin-right : 40px;">
				<div class="sche-date">
					<span class="text">기간 : </span>
					<span data-start></span>
					<span> ~ </span>
					<span data-end></span>
				</div>
				<div class="sche-alarm">
					<span></span>
				</div>
			</div>
			<div class="d-flex" style="margin-right: 40px;">
				<div class="sche-addr">
					<span class="text">장소 : </span>
				</div>
			</div>
			<div class="board-content">
				<div>
				</div>
			</div>
			<div class="sche-btns">
				<button type="button" class="btn-green" name="attend">참석</button>
				<button type="button" name="nonAttend">불참</button>
			</div>
			<div class="board-footer">
				<div>
					<span class="board-footer-icon"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg">
						좋아요</span>
					<span class="board-footer-icon" data-bookmark="no"><img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-regular.svg"> 북마크</span>
				</div>
				<div>
					<span class="board-footer-info">댓글 7</span>
					<span class="board-footer-info">좋아요 14</span>
				</div>
			</div>
			<!-- 댓글 -->
			
		</div>
		<!-- board 버튼 클릭 시 모달 -->
		<div class="d-none" data-boardmodal>
			<div class="board-modal-content">
				<p data-type="update">게시글 수정</p>
				<p data-type="delete">게시글 삭제</p>
			</div>			
		</div>
	</div>
	
	<!-- 업무 상세조회 모달 -->
	<div id="prjTask-modal">
		<div class="prjTask-modal__content">
			<input type="text" id="prjTaskId" hidden="true">
			<div class="board-header">
				<div class="board-header-info">
					<img src="${pageContext.request.contextPath}/resources/img/user.png" alt="기본 프로필 사진" class="profile">
					<div class="board-headder-info__memberName"></div>
					<input type="text" class="board-headder-info__regDate">
				</div>
				<div>
					<img class="board-header-btn" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">
				</div>
			</div>
			<div class="board-title">
				<div>
					<span>[업무]</span><input type="text" class="board-title-boardTitle">
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
			<div class="board-footer">
				<div>
					<span class="board-footer-icon"><img alt="좋아요 아이콘" src="/hi/resources/icon/face-laugh-wink-solid.svg">
						좋아요</span>
					<span class="board-footer-icon" data-bookmark="no"><img alt="북마크 아이콘"
							src="/hi/resources/icon/bookmark-regular.svg"> 북마크</span>
				</div>
				<div>
					<span class="board-footer-info">댓글 7</span>
					<span class="board-footer-info">좋아요 14</span>
				</div>
			</div>
			<!-- 댓글 구현 -->
			
		</div>
		<!-- board 버튼 클릭 시 모달 -->
		<div class="d-none" data-boardmodal>
			<div class="board-modal-content">
				<p data-type="update">게시글 수정</p>
				<p data-type="delete">게시글 삭제</p>
			</div>			
		</div>
	</div>
	
</body>
<!-- 모달 페이지 -->
<script >
	//모달페이지 출력
	$('.board-header-btn').on('click', function(e) {
		let modal = $(e.currentTarget).parent().parent().parent().parent().find('div[data-boardmodal]');
		console.log(modal)
		let modalContent = modal.children('.board-modal-content');
		let x = e.clientX - 150;
		let y = e.clientY + 5;
		
		modalContent.css('top', y + 'px');
		modalContent.css('left',x + 'px');
		modal.addClass('d-b');
	});
	
	//여백 누르면 모달페이지 종료
	$('div[data-boardmodal]').on('click', function(e) {
		$(e.currentTarget).removeClass('d-b');
	});
	
	$('.board-modal-content p').on('click', function(e) {
		e.stopPropagation();
		let boardContainer = $(e.currentTarget).closest('.board-container');
		let boardId = boardContainer.data('id');
		let prjId = '${projectInfo.projectId}';
		let type = $(e.currentTarget).data('type');
		
		if(type == 'update') {
			console.log(boardContainer.html);
		}else if(type == 'delete') {
			
		}
	});
</script>
<!-- 캘린더 js -->
<script>
var calendar 
//풀캘린더 불러오기
document.addEventListener('DOMContentLoaded', function() {
	$('input').attr("autocomplete","off");
	//변수선언
	var calendarEl = document.getElementById('calendar');
	calendar = new FullCalendar.Calendar(calendarEl, {
		themeSystem: 'united',
		dayMaxEventRows : true, // for all non-TimeGrid views
		views : {
			timeGrid : {
				dayMaxEventRows : 6
			// adjust to 6 only for timeGridWeek/timeGridDay
			}
		},
		customButtons : {
			scheBtn : {
				text : '일정필터',
				click : function(){
					//일정필터 
				}
			},
			taskBtn : {
				text : '업무필터',
				click : function(){
					//업무필터
				}
			}
		},
		headerToolbar : {
			left : 'prev,today,next scheBtn,taskBtn',
			center : 'title',
			right : 'dayGridMonth,timeGridWeek'
		},
		locale : "ko",
		navLinks : false, // can click day/week names to navigate views
		selectable : true,
		selectMirror : true,
		select : function(){},
		//ajax로 db데이터 화면에 뿌리기
		//events: data,
		eventClick : eventClickHandler
	});
	calendar.render();
	let scheList = ${scheList}
	let taskList = ${taskList}
	calendar.removeAllEvents();
	calendar.addEventSource(scheList);
	calendar.addEventSource(taskList);

	function eventClickHandler(info){
		let boardId = info.event.id
		if(boardId.substr(0,1)==="t"){
			console.log(boardId.substr(1))
			boardId = boardId.substr(1)
			$.ajax({
				url:'getTaskBoardInfo',
				method : 'GET',
				data : {"prjBoardId" : boardId},
				dataType : 'JSON',
				success : function(result){
					console.log(result)
					console.log(result.highTask[0])
					$('#prjTask-modal').addClass('modal-prjSche-visible');
					$('#prjTaskId').val(result.highTask[0].prjBoardId)
					//프사 확인
					let realPath = result.highTask[0].realProfilePath
					if(result.realProfilePath!==null){
						let profilePath = "${pageContext.request.contextPath}/images/"+realPath
						$('.profile').attr("src", profilePath)
					}
					//작성일자
					$('.board-headder-info__regDate').val(result.highTask[0].prjBoardRegdate)
					//작성자
					$('.board-headder-info__memberName').text(result.highTask[0].memberName)
					//업무 제목
					$('.board-title-boardTitle').val(result.highTask[0].prjBoardTitle)
					//업무 번호
					$('.board-title div[data-hightaskid]').text('업무 번호 ' + result.highTask[0].taskId)
					//업무 진행 상황
					$('.prjTask-modal__content div[data-state]').children('button[value=' + result.highTask[0].state + ']' ).css('background-color', 'var(--color-dark-red)');
					//업무 날짜 지정
			        if(result.highTask[0].startDate != null) {
			        	$('.prjTask-modal__content .sche-date').find('span[data-start]').text(result.highTask[0].startDate);
			        	$('.prjTask-modal__content .sche-date').find('span[data-end]').text(result.highTask[0].endDate);	
			        }else {
			        	startDate.parent().remove();
			        };
			        //업무 진행도
			        $('.prjTask-modal__content .sche-date').find('.processivity-value').css('width', result.highTask[0].processivity + "%");
			        $('.prjTask-modal__content .sche-date').find('span[data-processivityvalue]').text(result.highTask[0].processivity + "%");	
			        //업무 우선순위
             		if(result.highTask[0].priorityName != null) {
             			$('.prjTask-modal__content .d-flex').find('div[data-prioriy]').text('우선순위 : ' + result.highTask[0].priorityName);
			        }else {
			        	$('.prjTask-modal__content .d-flex').find('div[data-prioriy]').remove();
			        };
			     	// 상위 업무 담당자
			     	if(result.highManager.length >1) {
			     		$('.d-flex').find('.task-manager').append('<span>' + result.highManager[0].memberName + ' 외 ' + (result.highManager.length-1) + '명</span>');	
			     	} else if(result.highManager.length == 0) {
			     		$('.d-flex').find('.task-manager').append('<span>없음</span>');
			     	} else {
			     		$('.d-flex').find('.task-manager').append('<span>' + result.highManager[0].memberName + '</span>');
			     	};
			     	//업무 내용
			     	$('.board-content div').append(result.highTask[0].prjBoardSubject)
			     	// 하위 업무 리스트
			     	if(result.subTask.length == 0) {
			     		$('.prjTask-modal__content').find('span[data-subtaskcount]').text("0");
			     		return;
			     	}else{
				     	let countSpan = $('.prjTask-modal__content').find('span[data-subtaskcount]');
				     	let subTaskList = $('.prjTask-modal__content').find(".sub-task-list");
						// 하위 업무 갯수 
				     	countSpan.text(result.subTask.length);
				     	// 정보 입력
				        for (let j = 0; j < result.subTask.length; j++) {
				        	let subTask = result.subTask[j];
							let li = $('<li class="sub-task-item">');
				        	let subState = $('<span class="sub-state">');
				        	let subTitle = $('<span class="sub-title">');
						
				        	subState.text(subTask.stateName);
				        	subTitle.text(subTask.prjBoardTitle);
				        	
							li.append(subState);
							li.append(subTitle);
							
							subTaskList.append(li);
				        }
			     	}
			     	
				},
				error : function(error){
					console.log(error)
				}
			});
		}else if(boardId.substr(0,1)!=="t"){
			$.ajax({
				url:'getScheBoardInfo',
				method:'GET',
				data: {"prjBoardId" : boardId},
				dataType:"JSON",
				success:function(result){
					console.log(result)
					
					$('#prjScheId').val(result.boardVO.prjBoardId);
					$('#prjSche-modal').addClass('modal-prjSche-visible');
					$('.board-headder-info__memberName').text(result.memberName)
					$('.board-headder-info__regDate').val(result.boardVO.prjBoardRegdate)
					let realPath = result.realProfilePath;
					//프사 확인
					if(result.realProfilePath!==null){
						let profilePath = "${pageContext.request.contextPath}/images/"+realPath;
						$('.profile').attr("src", profilePath);
					}
					//제목 확인
					$('.board-title-boardTitle').val(result.boardVO.prjBoardTitle);
					//참석자 불참석자 확인
					$('.sche-particir-count').text(result.scheVO.attendanceYes);
					$('.sche-nonParticir-count').text(result.scheVO.attendanceNo);
					//시작일 확인
					$('.sche-date span[data-start]').text(result.scheVO.startDate);
					//마감일 확인
					$('.sche-date span[data-end]').text(result.scheVO.endDate);
					//주소확인
					if(result.scheVO.scheAddrDetail===null){
						result.scheVO.scheAddrDetail = ""
					}
					if(result.scheVO.scheAddr != null) {
						$('.sche-addr').append('<span class="sche-addr__info"> ' + result.scheVO.scheAddr + result.scheVO.scheAddrDetail + '</span>');
	                }else {
	                	$('.sche-addr').empty();
	                }
					$('.board-content div').append(result.boardVO.prjBoardSubject);
				},
				error:function(error){
					console.log(error)
				}
			});
		}
	};
	// 일정 참여
	$('.sche-btns button').on('click', function(e) {
		let btn = $(e.currentTarget);
		let prjParticirId = '${particirInfo.prjParticirId }';
		let attendYesCount = $('.sche-particir-count');
		let attendNoCount = $('.sche-nonParticir-count');
		let boardId = $('#prjScheId').val();
		let attendance = '';
		//DB 저장
		if (btn.hasClass('btn-green')) {
				btn.next().removeClass('active');
				btn.attr('class', 'btn-green active');	
				attendance = 'A1';
			}	
			else {
				btn.prev().removeClass('active');
				btn.attr('class', 'active');
				attendance = 'A2';
			}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/sheParticipate',
			type : 'POST',
			data : {'prjParticirId' : prjParticirId ,'prjBoardId' : boardId, 'attendance' : attendance},
			success : function() {
				//새 정보
				$.ajax({
					url : '${pageContext.request.contextPath}/getScheInfo',
					type : 'GET',
					data : {'prjBoardId': boardId, 'memberId': '${memberInfo.memberId}', 'projectId': '${projectInfo.projectId}' },
					success : function(sche) {
		                //참석 인원 값
		                attendYesCount.text(sche.attendanceYes);
		                attendNoCount.text(sche.attendanceNo);
					}, error : function(reject) {
						console.log(reject);
					}
				})
			},
			error : function(reject) {
				console.log(reject);
			}
		});
	})
	
	
	//일정조회 모달끄기
	$('#prjSche-modal').on('click', function(e) {
	    if ($(e.target).is('#prjSche-modal')) {
	        $('#prjSche-modal').removeClass('modal-prjSche-visible');
	        $('.board-title-boardTitle').val("");
	        $('.sche-addr__info').remove();
	        $('.board-content div').children().remove();
	    }
	});
	//업무조회 모달끄기
	$('#prjTask-modal').on('click', function(e) {
	    if ($(e.target).is('#prjTask-modal')) {
	        $('#prjTask-modal').removeClass('modal-prjSche-visible');
	        //버튼 초기화
	        $('.prjTask-modal__content div[data-state]').children('button').css('background-color', '');
	        //작성자 초기화
	        $('.d-flex').find('.task-manager .text').next().remove();
	        $('.prjTask-modal__content').find('span[data-subtaskcount]').text("")
	        $('.prjTask-modal__content').find(".sub-task-list").children().remove();
	        //내용 초기화
	        $('.board-content div').children().remove();
	    }
	});
	
});
	//230901 작업 완료 !!!!!
	let doit;
</script>
</html>