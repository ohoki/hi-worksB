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
<link href="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.min.css" rel="stylesheet">
<style>
	#calendar-container {
		width: 70%;
		margin: 0 auto;
	}
	
	.scheBtn {
		color: black;
	}
	a{
		text-decoration: none;
		color : var(--color-dark-beige);
	}
	.fc .fc-button-group > .fc-button.fc-button-active, .fc .fc-button-group > .fc-button:active, .fc .fc-button-group > .fc-button:focus, .fc .fc-button-group > .fc-button:hover {
    	z-index: 0 !important;
	}
</style>
</head>
<!-- full calendar  -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- dateTimePicker -->
<script src="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.full.min.js"></script>
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
    <!-- 일정추가 Modal -->
    <div class="modal fade" id="scheModal" tabindex="-1" aria-labelledby="scheModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="scheModalLabel">일정입력</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
					<div>
						<form id="scheForm" action="priScheInsert" method="post">
							<input name="scheTitle" type="text" placeholder="제목을 입력하세요." required="required"> <br><hr>
							<input name="startDate" type="text" id="datetimepicker1" required="required" autocomplete="off">---
							<input name="endDate" type="text" id="datetimepicker2" required="required" autocomplete="off"><br>
							<label for="memberId">작성자 : </label><input id="memberId" name="memberId" type="text" value="${memberId }" readonly="readonly"><br>
							<label for="coordinate">장소 : </label><input id="coordinate" name="coordinate" type="text" ><br>
							<label for="scheContent">내용 : </label><textarea id="scheContent" name="scheContent" rows="" cols="100%" required="required"></textarea>
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
    <!-- 상세조회 Modal -->
	<div class="modal fade" id="selectModal" tabindex="-1" aria-labelledby="selectModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="selectModalLabel">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        ...
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
	//입력성공시 메세지
	printMessage(`${result}`);
	
	function printMessage(msg){
		if(msg == null || msg == '') return;
		alert(msg);
	}

	//입력모달창 띄우기
	var myModal = new bootstrap.Modal(document.getElementById('scheModal'))
	var selectModal = new bootstrap.Modal(document.getElementById('selectModal'))
	
	
	//dateTimePicker
	jQuery.datetimepicker.setLocale('kr');
	$('#datetimepicker1, #datetimepicker2').datetimepicker({
	    format:'Y-m-d H:i',
	    step: 30,
	    lang:'kr'
	});
	
/* 	// datepicker 선언
	$("#dateEnd").datetimepicker({...옵션};

	// datepicker 선택된 값 불러오기 (1.13 jquery UI datepicker 기준)
	let selectDate = $("#dateEnd").datetimepicker("getDate"); */
	
	//일정입력
	function priScheInsert(){

	}
	
	//단건조회
	function priScheSelect(){
		
	}
	
	
	var calendar ;
	//풀캘린더 불러오기
	document.addEventListener('DOMContentLoaded', function() {
		//로그인한 사용자의 개인스케줄 정보를 ajax를 통해 json형식으로 가져옴
		var request = $.ajax({
			  url: "privateScheList",
			  method: "GET",
			  dataType: "json"
			}); 
		request.done(function(data){
			console.log(data)
			var calendarEl = document.getElementById('calendar');
			calendar = new FullCalendar.Calendar(calendarEl, {

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
							//현재시간 입력
							var now = new Date();
							var nowYear = now.getFullYear();
							var nowMonth = now.getMonth()+1;
							var nowDate = now.getDate();
							var hours = now.getHours();
							var minutes = now.getMinutes();
							$('#datetimepicker1').val(nowYear+'-'+nowMonth+'-'+nowDate+' '+hours+':'+minutes);
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
				navLinks : false, // can click day/week names to navigate views
				selectable : true,
				selectMirror : true,
				select : function(arg) {
					//모달창 띄우기
			        myModal.show();
					//해당 날짜가져오기
					$('#datetimepicker1').val(arg.startStr);
					$('#datetimepicker2').val(arg.endStr);

					calendar.unselect()
				},
				//ajax로 db데이터 화면에 뿌리기
				events: data,
				eventClick:function(info){
					console.log(info.event.id)
					$.ajax({
						url:"selectPsche",
						method:"GET",
						data: info.event.id,
						success:function(data){
							selectModal.show();
						},
						error:function(error){
							console.log(error)
						}
					});
				}
			});
			calendar.render();
		});
		
		request.fail(function( jqXHR, textStatus ) {
			  alert( "Request failed: " + textStatus );
		});
		
	});
</script>
</html>