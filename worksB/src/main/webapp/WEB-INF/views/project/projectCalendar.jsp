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
	.sche-date {
	font-weight: var(--weight-bold);
	font-size: 15px;
	color: var(--color-dark-red);
	margin: 10px 40px;
	}
	.sche-date .text, .task-manager .text {
	font-size: 15px;
	color: var(--color-dark-grey);
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
</style>
</head>
<!-- full calendar  -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<body>
	<div id="calendar-container">
		<div id="calendar">
		</div>
	</div>
	<!-- 오른쪽 붙은 상세조회 모달 -->
	<div id="prjSche-modal">
		<div class="prjSche-modal__content">
			<div class="board-header">
				<div class="board-header-info">
					<img src="${pageContext.request.contextPath}/resources/img/user.png" alt="기본 프로필 사진" class="profile">
					<div class="board-headder-info__memberName"></div>
					<input type="text" class="board-headder-info__regDate">
				</div>
				<div>
					<img class="board-header-btn" src="/hi/resources/icon/ellipsis-vertical-solid.svg">
				</div>
			</div>
			<div class="board-title">
				<div>
					<span>[일정]</span><input type="text" class="board-title-boardTitle">
				</div>
				<div>
					<span class="sche-particir"> </span>
					<span class="sche-nonParticir"> </span>
				</div>
			</div>
			<div class="d-flex" style="margin-right : 40px;">
				<div class="sche-date">
					<span class="text">기간 : </span>
					<span data-start=""><input type="text" class="sche-startDate"></span>
					<span> ~ </span>
					<span data-end=""><input type="text" class="sche-endDate"></span>
				</div>
				<div class="sche-alarm">
					<span></span>
				</div>
			</div>
			<div class="d-flex" style="margin-right: 40px;">
				<div class="sche-addr">
					장소 : <input type="text" class="sche-addr-info">
				</div>
			</div>
			<div class="board-content">
				<div>
				</div>
			</div>
			<!-- 23/08/30 작업 -->
			<div class="sche-btns">
				<button type="button" class="btn-green">참석</button>
				<button type="button">불참</button>
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
			<!-- 댓글 -->
			
		</div>
	</div>
	
	<!-- 업무 상세조회 모달 -->
	<div id="prjTask-modal">
		<div class="prjTask-modal__content">
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
	</div>
	
</body>
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
					
					//프사 확인
					let realPath = result.highTask[0].realProfilePath
					if(result.realProfilePath!==null){
						let profilePath = "${pageContext.request.contextPath}/images/"+realPath
						$('.profile').attr("src", profilePath)
					}
					$('.board-headder-info__regDate').val(result.highTask[0].prjBoardRegdate)
					$('.board-headder-info__memberName').text(result.highTask[0].memberName)
					$('.board-title-boardTitle').val(result.highTask[0].prjBoardTitle)
					$('.board-title div[data-hightaskid]').text('업무 번호 ' + result.highTask[0].taskId)
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
					$('#prjSche-modal').addClass('modal-prjSche-visible');
					$('.board-headder-info__memberName').text(result.memberName)
					$('.board-headder-info__regDate').val(result.boardVO.prjBoardRegdate)
					let realPath = result.realProfilePath
					//프사 확인
					if(result.realProfilePath!==null){
						let profilePath = "${pageContext.request.contextPath}/images/"+realPath
						$('.profile').attr("src", profilePath)
					}
					$('.board-title-boardTitle').val(result.boardVO.prjBoardTitle)
					//시작일 확인
					$('.sche-startDate').val(result.scheVO.startDate)
					//마감일 확인
					$('.sche-endDate').val(result.scheVO.endDate)
					//주소확인
					if(result.scheVO.scheAddr===null){
						result.scheVO.scheAddr = ""
					}
					if(result.scheVO.scheAddrDetail===null){
						result.scheVO.scheAddrDetail = ""
					}
					$('.sche-addr-info').val(result.scheVO.scheAddr+" "+result.scheVO.scheAddrDetail)
					$('.board-content div').append(result.boardVO.prjBoardSubject)
				},
				error:function(error){
					console.log(error)
				}
			});
		}
	};
	//일정조회 모달끄기
	$('#prjSche-modal').on('click', function(e) {
	    if ($(e.target).is('#prjSche-modal')) {
	        $('#prjSche-modal').removeClass('modal-prjSche-visible');
	        $('.board-content div').children().remove();
	    }
	});
	$('#prjTask-modal').on('click', function(e) {
	    if ($(e.target).is('#prjTask-modal')) {
	        $('#prjTask-modal').removeClass('modal-prjSche-visible');
	        $('.board-content div').children().remove();
	    }
	});
	
});
</script>
</html>