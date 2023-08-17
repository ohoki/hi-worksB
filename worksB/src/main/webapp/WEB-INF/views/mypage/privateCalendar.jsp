<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#calendar-container {
	width: 70%;
	margin: 0 auto;
}

.scheBtn {
	color: black;
}
</style>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<!-- full calendar  -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<body>
	<div>
		<div align="center">
			<h3>마이 캘린더</h3>
			<input type="text" placeholder="검색어를 입력하세요"><button class="scheBtn">검색</button>
		</div>
	</div>
	<div id="calendar-container">
		<div id="calendar" style="position: relative;"></div>
	</div>
    <!-- Modal -->
    <div class="modal fade" id="scheModal" tabindex="-1" aria-labelledby="scheModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정입력</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
					<div>
						<form id="scheForm" action="">
							<input name="scheTitle" type="text" placeholder="제목을 입력하세요."> <br>
							<input name="startDate" type="datetime-local">---<input name="endDate" type="datetime-local"><br>
							<label for="memberId">작성자:</label><input id="memberId" name="memberId" type="text" value="${memberId }" readonly="readonly"><br>
							<label for="coords">장소:</label><input id="coords" name="coordinate" type="text" ><br>
							<label for="scheContent">내용:</label><textarea id="scheContent" name="scheContent" rows="" cols="100%"></textarea>
						</form>
					</div>
                </div>
                <div class="modal-footer">
                    <button type="submit" form="scheForm" class="btn btn-primary">일정 저장</button>
                    <button type="reset" form="scheForm" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	//모달창 띄우기
	var myModal = new bootstrap.Modal(document.getElementById('scheModal'))
	
	//풀캘린더 불러오기
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
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
					click : function() {
						//일정추가 버튼 클릭시 모달창 띄우기
				        myModal.show();
					}
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
				right : 'myCustomButton dayGridMonth,timeGridWeek'
			},
			locale : "ko",
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				//모달창 띄우기
		        myModal.show();
				var title = prompt('일정 추가');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				calendar.unselect()
			}
			//ajax로 db데이터 화면에 뿌리기
			//events:
		});
		calendar.render();
	});
</script>
</html>