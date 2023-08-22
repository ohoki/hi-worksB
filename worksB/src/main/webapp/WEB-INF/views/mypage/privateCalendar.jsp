<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<form id="scheForm" action="${pageContext.request.contextPath}/priScheInsert" method="post">
							<input name="scheTitle" type="text" placeholder="제목을 입력하세요."> <br><hr>
							<input name="startDate" type="text" id="datetimepicker1" autocomplete="off">---
							<input name="endDate" type="text" id="datetimepicker2"  autocomplete="off">
							<label for="alarmDate">알람시간 : </label>
							<select class="alarmDate" name="alarmDate">
						        <option value="">없음</option>
						        <option value="10">10분 전 미리 알림</option>
						        <option value="30">30분 전 미리 알림</option>
						        <option value="60">1시간 전 미리 알림</option>
						        <option value="120">2시간 전 미리 알림</option>
						        <option value="1440">1일 전 미리 알림</option>
							</select><br>
							<label for="memberId">작성자 : </label><input id="memberId" name="memberId" type="text" value="${memberInfo.memberId }" readonly="readonly"><br>
							<label for="coordinate">장소 : </label><input id="coordinate" name="coordinate" type="text" ><br>
							<label for="scheContent">내용 : </label><textarea id="scheContent" name="scheContent" rows="" cols="100%"></textarea>
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
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="selectModalLabel">일정 조회</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
			<form id="scheViewForm" action="${pageContext.request.contextPath }/updateSche" method="post">
				<input name="scheTitle" type="text"> <br><hr>
				<input name="startDate" type="text" id="datetimepicker3"  autocomplete="off">---
				<input name="endDate" type="text" id="datetimepicker4"  autocomplete="off"><br>
				<label for="alarmDate">알람시간 : </label>
					<select class="alarmDate" name="alarmDate">
				        <option value="">없음</option>
				        <option value="10">10분 전 미리 알림</option>
				        <option value="30">30분 전 미리 알림</option>
				        <option value="60">1시간 전 미리 알림</option>
				        <option value="120">2시간 전 미리 알림</option>
				        <option value="1440">1일 전 미리 알림</option>
					</select><br>
				<label for="memberId">작성자 : </label><input name="memberId" type="text" value=""><br>
				<label for="coordinate">장소 : </label><input name="coordinate" type="text" ><br>
				<input id="scheId" name="scheId" type="text" hidden="hidden">
				<label for="scheContent">내용 : </label><textarea name="scheContent" rows="" cols="100%"></textarea>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="updateBtn"></button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
	var scheModal = new bootstrap.Modal(document.getElementById('scheModal'))
	var selectModal = new bootstrap.Modal(document.getElementById('selectModal'))
	
	
	//dateTimePicker
	jQuery.datetimepicker.setLocale('kr');
	$('#datetimepicker1, #datetimepicker2').datetimepicker({
	    format:'Y-m-d H:i',
	    step: 30,
	    lang:'kr'
	});
	
	//일정입력/수정 시 알람시간 부여
    $(".alarmDate").change(function(e) {
        var selectedAlarm = $(this).val(); // 선택한 알람 시간 옵션 가져오기
		var startDate;
        if($(e.target).parent().attr('id')==='scheForm'){
	        startDate = new Date($("#datetimepicker1").val()); // 시작일 가져오기
        }else if($(e.target).parent().attr('id')==='scheViewForm'){
        	startDate = new Date($("#datetimepicker3").val()); // 시작일 가져오기
        }
        var alarmDate = new Date(startDate); // 알람 시간 초기화

        if (selectedAlarm === "10") {
            alarmDate.setMinutes(alarmDate.getMinutes() - 10); // 10분 전
        } else if (selectedAlarm === "30") {
            alarmDate.setMinutes(alarmDate.getMinutes() - 30); // 30분 전
        } else if (selectedAlarm === "60") {
            alarmDate.setHours(alarmDate.getHours() - 1); // 1시간 전
        } else if (selectedAlarm === "120") {
            alarmDate.setHours(alarmDate.getHours() - 2); // 2시간 전
        } else if (selectedAlarm === "1440") {
            alarmDate.setDate(alarmDate.getDate() - 1); // 1일 전
        }
        if (selectedAlarm !== "") {
            var alarmYear = alarmDate.getFullYear();
			var alarmMonth = alarmDate.getMonth()+1;
			var alarmDay = alarmDate.getDate();
			var alarmHours = alarmDate.getHours();
			var alarmMinutes = alarmDate.getMinutes();
			if(alarmMinutes<10){
				alarmMinutes = '0'+alarmMinutes;
			}
			if(alarmHours <10){
				alarmHours ='0'+alarmHours;
			}
			if(alarmDay <10){
				alarmDay ='0'+alarmDay;
			}
			if(alarmMonth <10){
				alarmMonth ='0'+alarmMonth;
			}
			var alarmTime = alarmYear+'-'+alarmMonth+'-'+alarmDay+'_'+alarmHours+':'+alarmMinutes;
			let option = $(`<option selected hidden value=`+alarmTime+`>`+alarmTime+`</option>`);
	        $(".alarmDate").append(option);
        }
        
    });
	
	var calendar 
	//풀캘린더 불러오기
	document.addEventListener('DOMContentLoaded', function() {
		
		//변수선언
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
					click : scheInsert
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
			select : addPrivateSche,
			//ajax로 db데이터 화면에 뿌리기
			//events: data,
			eventClick:eventClickHandler
		});
		calendar.render();
		loadPriSche();
		
		//전체 일정 조회
		function loadPriSche(){
			var calendarAjaxCall = $.ajax({
				  url: "privateScheList",
				  method: "GET",
				  dataType: "json"
			}).done(function(data){
				calendar.removeAllEvents();
				calendar.addEventSource(data)
				calendar.refetchEvents();
			}).fail(function( jqXHR, textStatus ) {
				  alert( "Request failed: " + textStatus );
			});
		};
		
		//날짜 클릭시 일정 입력
		function addPrivateSche(arg) {
			//모달창 띄우기
	        scheModal.show();
			$('#scheForm input,textarea').prop("required", true).prop("readonly", false);
			$('#coordinate').prop("required", false);
			$(".alarmDate option").prop("disabled", false);
			//해당 날짜가져오기
			$('#datetimepicker1').val(arg.startStr);
			$('#datetimepicker2').val(arg.endStr);
			calendar.unselect();
		};
		//로그인한 사용자의 개인스케줄 정보를 ajax를 통해 json형식으로 가져옴
		
		
		//이벤트 클릭시 상세보기
		function eventClickHandler(info){
			let scheId = info.event.id
			let data = { "scheId" : scheId};
			$.ajax({
				url:"selectPsche",
				method:"GET",
				data: data,
				dataType: "json",
				success:function(result){
					selectModal.show();
					//삭제버튼 있을시 삭제
					$('#updateBtn').prev('button').remove();
					//버튼클릭이벤트 정지
					$('#updateBtn').prop("type","button").off("click");
					$('#scheViewForm input,textarea').prop("readonly", true);
					$('#scheViewForm input').eq(0).val(result.title);
					$('#scheViewForm input').eq(1).val(result.start).datetimepicker('destroy');
					$('#scheViewForm input').eq(2).val(result.end).datetimepicker('destroy');
					//알람시간 option태그 생성
					if(result.alarmDate === null){
						var none = "없음";
					}else{
						var none = result.alarmDate;
					}
					let option = $(`<option selected hidden value=`+none+`>`+none+`</option>`);
			        $(".alarmDate").append(option);
			        $(".alarmDate option").prop("disabled",true);
			        
					$('#scheViewForm input').eq(3).val(result.memberId);
					$('#scheViewForm input').eq(4).val(result.coordinate);
					$('#scheViewForm textarea').val(result.scheContent);
					$('#scheId').val(result.scheId);
					$('#updateBtn').text('수정/삭제').on("click", function(){updateScheForm(info)});
				},
				error:function(error){
					alert("조회오류");
				}
			});
		}
		
		//이벤트 등록모달
		function scheInsert() {
			//일정추가 버튼 클릭시 모달창 띄우기
	        scheModal.show();
			$('#scheForm input,textarea').prop("required", true).prop("readonly", false);
			$('#coordinate').prop("required", false);
			$(".alarmDate option").prop("disabled", false);
			//현재시간 입력
			var now = new Date();
			var nowYear = now.getFullYear();
			var nowMonth = now.getMonth()+1;
			var nowDate = now.getDate();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			var after = now.getMinutes()+30;
			if(minutes <10){
				minutes = '0'+minutes;
			}
			var afterhours = hours;
			if(after>59){
				after = after-60;
				if(after <10){
					after = '0'+after
				}
				afterhours = hours+1;
			}
			var nowTime = nowYear+'-'+nowMonth+'-'+nowDate+' '+hours+':'+minutes;
			var nowTimeAfter = nowYear+'-'+nowMonth+'-'+nowDate+' '+afterhours+':'+after;
			$('#datetimepicker1').val(nowTime);
			$('#datetimepicker2').val(nowTimeAfter);
			
		}
		

	
		//일정 수정폼
		function updateScheForm(info){
			$('#scheViewForm input,textarea').prop("readonly", false);
			$('#scheViewForm input').eq(3).prop("readonly", true);
			$('#scheViewForm input').eq(0).focus();
			$('#datetimepicker3, #datetimepicker4').datetimepicker({
			    format:'Y-m-d H:i',
			    step: 30,
			    lang:'kr'
			});
			//알람시간 활성화
			$(".alarmDate option").prop("disabled",false);
			
			$('#updateBtn').text('수정완료');
			let $btn = $('<button type="button" class="btn btn-primary" id="deleteBtn">삭제</button>');
			let scheId = (info.event.id);
			$btn.on("click", function(){deleteSche(scheId)})
			$('#updateBtn').parent().prepend($btn);
			$('#updateBtn').attr("form", "scheViewForm").off("click");
			$('#updateBtn').on("click", function(){updateSche(event, info)});
		};
		
		//일정 수정
		function updateSche(e, info){
			let doIt;
			for(let i = 0; i < $('#scheViewForm input').length-1; i++){
				if(i==4 && ($('#scheViewForm input').eq(4).val()=== null || $('#scheViewForm input').eq(4).val() === "")){
					continue;
				}else if($('#scheViewForm input').eq(i).val()=== null || $('#scheViewForm input').eq(i).val() === ""){
					alert('필수값을 입력해주세요');
					$('#scheViewForm input').eq(i).focus();
					doIt = 1;
					break;
				}
			}
			
			if(doIt != 1){
				//폼태그 배열화
				let obj = serializeObject();
				
				$.ajax({
					url : 'updatePsche',
					method : 'post',
					data : obj,
					success : function(result){
						console.log(result);
						//캘린더 event 업데이트
						loadPriSche();
					},
					error : function(err){
						console.log(err);
					}
				});
				
				//삭제버튼 삭제
				$('#updateBtn').prev('button').remove();
				//모달창 닫기
				selectModal.hide();
				
			}
			
		};
		
		//form데이터 배열화
		function serializeObject(){
			let formData = $('#scheViewForm').serializeArray();
			
			let objectData = {};
			$.each(formData, function(idx, obj){
				objectData[obj.name] = obj.value;
			});
			
			return objectData;
		};

		//일정 삭제
		function deleteSche(scheId){
			let id = {"scheId":scheId}
			$.ajax({
				url:'deletePsche',
				method : 'get',
				data : id,
				success : function(result){
					console.log(result);
					//캘린더 event 업데이트
					loadPriSche();
				},
				error : function(err){
					console.log(err);
				}
			});
			//삭제버튼 삭제
			$('#updateBtn').prev('button').remove();
			//모달창 닫기
			selectModal.hide();
		};
	});
	
</script>
</html>