<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
	a{
		text-decoration: none;
		color : var(--color-dark-beige);
	}
	#calendar-container {
		width: 70%;
		margin: 0 auto;
	}
	
	
</style>
</head>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- full calendar  -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<body>
	<div id="calendar-container">
		<div id="calendar">
		</div>
	</div>
	<!-- 일정 조회 모달 -->
	<div class="modal fade" id="scheModal" tabindex="-1" aria-labelledby="scheModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				  <h1 class="modal-title fs-5" id="scheModalLabel"></h1>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				  <button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
let scheModal = new bootstrap.Modal(document.getElementById('scheModal'))

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
			myCustomButton : {
				text : '일정추가',
				click : function(){}
			},
			tdlBtn : {
				text : 'to-do-List',
				click : function(){}
			},
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
			right : 'tdlBtn,myCustomButton dayGridMonth,timeGridWeek'
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
		}else if(boardId.substr(0,1)!=="t"){
			scheModal.show();
			$.ajax({
				url:'getScheBoardInfo',
				method:'GET',
				data: {'prjBoardId' : boardId},
				success:function(result){
					console.log(result.boardVO)
					console.log(result.scheVO)
					$('#scheModalLabel').text("일정 조회")
				},
				error:function(error){
					console.log(error)
				}
			});
		}
	};
});
</script>
</html>