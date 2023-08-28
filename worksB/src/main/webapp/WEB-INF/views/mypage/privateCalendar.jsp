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
	.div_hidden{
		display: none;
	}
	.div_show{
		display: block;
	}
	.tdlLineDeleteBtn-hidden{
		display: none;
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
						<label for="memberId">작성자 : </label><input id="memberId" name="memberId" type="text" value="${memberInfo.memberName }" readonly="readonly"><br>
						<label for="coordinate">장소 : </label><input id="coordinate" name="coordinate" type="text" ><br>
						<label for="scheContent">내용 : </label><textarea id="scheContent" name="scheContent" rows="" cols="90%"></textarea>
					</form>
                </div>
                <div class="modal-footer">
                    <button type="submit" form="scheForm" class="btn btn-primary" id="insertBtn">일정 저장</button>
                    <button type="reset" form="scheForm" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
				<label for="scheContent">내용 : </label><textarea name="scheContent" rows="" cols="90%"></textarea>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="updateBtn"></button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- to-do-List Modal -->
	<div class="modal fade" id="tdlModal" tabindex="-1" aria-labelledby="tdlModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="tdlModalLabel">To Do List</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <!-- tdl 입력폼 -->
      	  <div id="tdlBody">
		      <div class="modal-body">
			      	<form id="tdlFormInsert">
				      	<input type="text" name="listTitle" placeholder="TDL 제목를 입력하세요"><hr>
				      	<label for="memberId">작성자 : </label><input name="memberId" type="text" value="${memberInfo.memberName }" readonly><br>
				      	<label for="applyDate">To Do List 해당일자 : </label><input name="applyDate" type="text" id="datetimepicker5"  autocomplete="off">
			      	</form>
			      	<div class="tdlList">
			      	</div>
			      	<button type="button" class="btn btn-primary addTdlLine">To Do List 추가</button>
		      </div>
		      <div class="modal-footer">
			      <button type="submit" form="tdlFormInsert" class="btn btn-primary" id="tdlInsertBtn">TDL 저장</button>
			      <button type="reset" form="tdlFormInsert" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
	      </div>
	      <!-- tdl 조회폼 -->
	      <div id="tdlView">
		  	<div class="modal-body">
		      	<form id="tdlFormView">
			      	<input type="text" name="listTitle" placeholder="TDL 제목를 입력하세요"><hr>
			      	<label for="memberId">작성자 : </label><input name="memberId" type="text" value="${memberInfo.memberName }" readonly><br>
			      	<label for="applyDate">To Do List 해당일자 : </label><input name="applyDate" type="text" id="datetimepicker6"  autocomplete="off">
			      	<input id="listId" name="listId" type="text" hidden="hidden">
		      	</form>
		      	<div class="tdlList-view">
		      	</div>
	      	</div>
	        <div class="modal-footer">
	          <button type="button" form="tdlFormView" class="btn btn-primary" id="tdlUpdateBtn">TDL 수정</button>
	          <button type="reset" form="tdlFormView" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        </div>
	      </div>
	      <!-- tdl 수정/삭제폼 -->
 <!--   	      <div id="tdlUpdate">
		  	<div class="modal-body">
		      	<form id="tdlFormUpdate">
			      	<input type="text" name="listTitle" placeholder="TDL 제목를 입력하세요"><hr>
			      	<label for="applyDate">To Do List 해당일자 : </label><input name="applyDate" type="text" id="datetimepicker6"  autocomplete="off">
			      	<div class="tdlList">
			      	</div>
			      	<button type="button" class="btn btn-primary addTdlLine" id="addTdlLine">To Do List 추가</button>
		      	</form>
	      	</div>
	        <div class="modal-footer">
	          <button type="button" form="tdlFormView" class="btn btn-primary" id="tdlUpdateBtn">TDL 수정</button>
	          <button type="reset" form="tdlFormView" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        </div>
	      </div> -->
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
	var tdlModal = new bootstrap.Modal(document.getElementById('tdlModal'))
	
	//모달 폼 리셋
	$('#selectModal, #scheModal').on('hidden.bs.modal', function (e) {
		$(this).find('form')[0].reset();
        $(".alarmDate option:eq(0)").prop("selected", true);
	});
	
	$('#tdlModal').on('hidden.bs.modal', function (e) {
		$('.tdlList, tdlList-view').children().remove();
		if($('.tdlList-view').next()!==null){
			$('.tdlList-view').next().remove();
		}
		$('#tdlUpdateBtn').prev().remove();
		$('#tdlUpdateBtn').text("TDL 수정").off();
	});
	
	//dateTimePicker
	jQuery.datetimepicker.setLocale('kr');
	$('#datetimepicker1').datetimepicker({
		format:'Y-m-d H:i',
		step: 30,
		lang:'kr',
		onShow:function( ct ){
			this.setOptions({
				maxDate:jQuery('#datetimepicker2').val()?jQuery('#datetimepicker2').val():false
			})
		}
	});
	$('#datetimepicker2').datetimepicker({
		format:'Y-m-d H:i',
		step: 30,
		lang:'kr',
		onShow:function( ct ){
			this.setOptions({
				minDate:$('#datetimepicker1').val()?jQuery('#datetimepicker1').val():false
			})
		}
	});
	$('#datetimepicker5').datetimepicker({
	    format:'Y-m-d',
	    lang:'kr',
	    timepicker:false
	});
	
	//일정입력/수정 시 알람시간 부여
    $(".alarmDate").change(function(e) {
    	let selectedAlarm = $(this).val(); // 선택한 알람 시간 옵션 가져오기
    	let startDate;
        if($(e.target).parent().attr('id')==='scheForm'){
	        startDate = new Date($("#datetimepicker1").val()); // 시작일 가져오기
        }else if($(e.target).parent().attr('id')==='scheViewForm'){
        	startDate = new Date($("#datetimepicker3").val()); // 시작일 가져오기
        }
        let alarmDate = new Date(startDate); // 알람 시간 초기화

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
        	let alarmYear = alarmDate.getFullYear();
        	let alarmMonth = ('0'+(alarmDate.getMonth()+1)).substr(-2);
        	let alarmDay = ('0'+alarmDate.getDate()).substr(-2);
        	let alarmHours = alarmDate.getHours();
        	let alarmMinutes = alarmDate.getMinutes();
			if(alarmMinutes<10){
				alarmMinutes = '0'+alarmMinutes;
			}
			if(alarmHours <10){
				alarmHours ='0'+alarmHours;
			}
			let alarmTime = alarmYear+'-'+alarmMonth+'-'+alarmDay+'_'+alarmHours+':'+alarmMinutes;
			let option = $(`<option selected hidden value=`+alarmTime+`>`+alarmTime+`</option>`);
	        $(".alarmDate").append(option);
        }
        
    });
	//var today = new Date();
	//var month = ('0'+(today.getMonth()+1)).substr(-2);
	//var day = ('0'+today.getDate()).substr(-2);
	
	//tdl line 추가
	$(document).on('click', '.addTdlLine', function(){
		if($(this).parent().parent().attr("class")==="div_block"){
			let divTag = $('<div></div>')
			let chkBoxTag = $('<input>').attr("type", "checkbox").attr("name", "success").attr("value","A1");
			let inputTag = $('<input>').attr("type", "text").attr("name", "content").attr("placeholder","List를 입력하세요");
			let delBtn = $('<img>').attr("class","tdlLineDeleteBtn").attr("src","${pageContext.request.contextPath }/resources/icon/minusCircleBtn.svg").attr("alt","minus SVG").attr("width","20").attr("height","20");
			divTag.append(chkBoxTag)
			divTag.append(inputTag)
			divTag.append(delBtn)
			$(this).prev().append(divTag);
		}
	});
	
	//todolist 줄 삭제
	$(document).on('click', '.tdlLineDeleteBtn', function(e) {
		let divTagId = $(this).parent().attr("id");
	    if (typeof divTagId === "string") {
			$(this).parent().attr("class", "div_hidden");	//클릭한 요소가 id값이 있을 경우 div_hidden클래스 부여
	    } else {
            $(this).parent().remove(); // 클릭한 요소만 삭제
            console.log('no');
	    }
	});
	
	//개인일정 입력시 memberId값 부여
	let memberId = `${memberInfo.memberId}`

	
	
	var calendar 
	//풀캘린더 불러오기
	document.addEventListener('DOMContentLoaded', function() {
		$('input').attr("autocomplete","off");
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
				tdlBtn : {
					text : 'to-do-List',
					click : toDoListInsert
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
			select : addPrivateSche,
			//ajax로 db데이터 화면에 뿌리기
			//events: data,
			eventClick:eventClickHandler
		});
		calendar.render();
		loadPriSche();
		
		//전체 일정 조회/재조회
		function loadPriSche(){
			$.ajax({
				  url: "privateScheList",
				  method: "GET",
				  dataType: "json"
			}).done(function(data){
				calendar.removeAllEvents();
				calendar.addEventSource(data);
				calendar.getEventSources()
				//calendar.refetchEvents();
			}).fail(function( jqXHR, textStatus ) {
				  alert( "Request failed: " + textStatus );
			});
		};
		
		
		//이벤트 클릭시 상세보기
		function eventClickHandler(info){
			let scheId = info.event.id
	    	let memName = `${memberInfo.memberName}`
    		let t = "t"
    		//todoList일 경우
	    	if(scheId.substr(0,1)===t){
	    		let listId = scheId.substr(1)
				let data = { "listId" : listId};
	    		$.ajax({
	    			url:"selectTdl",
	    			method:"GET",
	    			data:data,
	    			dataType:"JSON",
	    			success:function(result){
	    				console.log(result)
	    				tdlModal.show();
	    				//조회모달 띄우기
	    				$('#tdlBody').attr("class","div_hidden");
	    				$('#tdlView').attr("class","div_block");
	    				//inputTag 읽기전용으로/제목넣기, 해당날짜넣기,id값넣기
	    				$('#tdlFormView input').prop("readonly",true);
	    				$('#tdlFormView input').eq(0).val(result.todoList[0].listTitle);
	    				let applyDate = result.todoList[0].applyDate.substr(0,10);
	    				$('#tdlFormView input').eq(2).val(applyDate).datetimepicker('destroy');
	    				$('#listId').val(result.todoList[0].listId);
    					$('.tdlList-view').append('<p></p>').text("To Do List 목록")
    					$('.tdlList-view').append('<hr>')
    					//ITEM항목 생성
	    				for(let i = 0; i<result.item.length;i++){
							let divTag = $('<div></div>')
							let chkBoxTag = $('<input>').attr("type", "checkbox").prop("disabled",true);
							if(result.item[i].success==="A1"){
								chkBoxTag.prop("checked",true);
							}
							let inputTag = $('<input>').attr("type", "text").attr("name", "content");
							let delBtn = $('<img>').attr("class","tdlLineDeleteBtn").attr("src","${pageContext.request.contextPath }/resources/icon/minusCircleBtn.svg").attr("alt","minus SVG").attr("width","20").attr("height","20");
							divTag.append(chkBoxTag)
							divTag.append(inputTag)
							divTag.append(delBtn)
							divTag.attr("id","Items-"+result.item[i].itemId)
							$('.tdlList-view').append(divTag);
	   						let contents = result.item[i].content
							$('.tdlList-view input[name="content"]').eq(i).val(contents).prop("readonly",true);
							$('.tdlLineDeleteBtn').attr("class","tdlLineDeleteBtn-hidden")
	    				}
	    				
	    				$('#tdlUpdateBtn').on('click', function(){tdlUpdateForm(result)});
	    			},
	    			error:function(error){
	    				alert("조회오류");
	    			}
	    		});
	    		//개인일정일 경우
	    	}else if(scheId.substr(0,1)!==t){
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
						let option
						if(result.alarmDate === null){
							let none = "없음";
							option = $(`<option selected hidden value="">`+none+`</option>`);
						}else{
							let none = result.alarmDate;
							option = $(`<option selected hidden value=`+none+`>`+none+`</option>`);
						}
				        $(".alarmDate").append(option);
				        $(".alarmDate option").prop("disabled",true);
	
						$('#scheViewForm input').eq(3).val(memName);
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
		}
		
		//현재시간 입력
		var nowTime;
		let now = new Date();
		let nowYear = now.getFullYear();
		let nowMonth = ('0'+(now.getMonth()+1)).substr(-2);
		let nowDate = ('0'+now.getDate()).substr(-2);
		let hours = now.getHours();
		let minutes = now.getMinutes();
		let after = now.getMinutes()+30;
		if(minutes <10){
			minutes = '0'+minutes;
		}
		let afterhours = hours;
		if(after>59){
			after = after-60;
			if(after <10){
				after = '0'+after
			}
			afterhours = hours+1;
		}
		nowTime = nowYear+'-'+nowMonth+'-'+nowDate+' '+hours+':'+minutes;
		//일정 등록모달
		function scheInsert() {
			//일정추가 버튼 클릭시 모달창 띄우기
	        scheModal.show();
			$('#scheForm input,textarea').prop("required", true).prop("readonly", false);
			$('#coordinate').prop("required", false);
			$('#scheForm input').eq(3).prop("readonly",true);
			$(".alarmDate option").prop("disabled", false);

			let nowTimeAfter = nowYear+'-'+nowMonth+'-'+nowDate+' '+afterhours+':'+after;
			$('#datetimepicker1').val(nowTime);
			$('#datetimepicker2').val(nowTimeAfter);
			
		};
		//날짜 클릭시 일정 입력모달창
		function addPrivateSche(arg) {
			//모달창 띄우기
	        scheModal.show();
			$('#scheForm input,textarea').prop("required", true).prop("readonly", false);
			$('#coordinate').prop("required", false);
			$('#scheForm input').eq(3).prop("readonly",true);
			$(".alarmDate option").prop("disabled", false);
			//해당 날짜가져오기
			$('#datetimepicker1').val(arg.startStr);
			$('#datetimepicker2').val(arg.endStr);
			calendar.unselect();
		};
		//개인일정 db입력
		$('#insertBtn').on("click", function(event){
			event.preventDefault();
			for(let i=0;i<$('#scheForm input').length-1;i++){
				if($('#scheForm input').eq(i).val()===null || $('#scheForm input').eq(i).val()===''){
					alert("필수값을 입력해주세요");
					$('#scheForm input').eq(i).focus();
					return false;
				};
			};
			if($('#scheForm textarea').val()===null || $('#scheForm textarea').val()===''){
				alert("필수값을 입력해주세요");
				$('#scheForm textarea').focus();
				return false;
			};
			$('#scheForm input[name="memberId"]').val(memberId);
			let pScheFormInsert = $('#scheForm')
			let pScheObj = serializeObject(pScheFormInsert);
			$.ajax({
				url:"priScheInsert",
				method:"POST",
				data : pScheObj,
				success : function(result){
					console.log(result);
					loadPriSche();
					scheModal.hide();
					
				},
				error : function(error){
					console.log(error)
				}
			});
		});
		
		//todoList db입력
		function toDoListInsert(){
			tdlModal.show()
			$('#tdlBody').attr("class","div_block");
			$('#tdlView').attr("class","div_hidden");
			$('#tdlFormInsert input').eq(2).prop("required",true);
			$('#datetimepicker5').val(nowTime.substr(0,10));
		};
		//tdlformInsert 
		$('#tdlFormInsert').on("submit", function(event){
			event.preventDefault();
			if($('#tdlFormInsert input[name="listTitle"]').val()===null || $('#tdlFormInsert input[name="listTitle"]').val()===""){
				alert("제목을 입력해주세요")
				$('#tdlFormInsert input[name="listTitle"]').focus();
				return false;
			}
			if($('#tdlFormInsert input[name="applyDate"]').val()===null || $('#tdlFormInsert input[name="applyDate"]').val()===""){
				alert("날짜를 입력해주세요")
				$('#tdlFormInsert input[name="listTitle"]').focus();
				return false;
			}
			$('#tdlFormInsert input[name="memberId"]').val(memberId);
			let tdlFormInsert = $('#tdlFormInsert')
			let tdlObj = serializeObject(tdlFormInsert);

		 	//item 항목 json화
		    let itemDataArray = [];
		    // .tdlList 아래의 각 div 요소를 순회
		    $(".tdlList > div").each(function() {
		        let checkboxValue = $(this).find("input[type='checkbox']").is(":checked");
		        if(checkboxValue){
		        	checkboxValue = "A1"
		        }else{
		        	checkboxValue = "A2"
		        }
		        let inputValue = $(this).find("input[type='text']").val();
		        let dataObject;
		        if(inputValue!=null && inputValue !=""){
			        dataObject = {
			            success : checkboxValue,
			            content : inputValue
			        };
		        }else{
		        	return;
		        }
		        // 데이터를 JSON 형식으로 저장할 객체 생성
		        // 객체를 배열에 추가
		        itemDataArray.push(dataObject);
		    });

			let wholeTdl = [];
			wholeTdl.push(tdlObj);
			for(let i =0;i<itemDataArray.length;i++){
				wholeTdl.push(itemDataArray[i]);
			}
			let jsonData = JSON.stringify(wholeTdl);
			
			let memberName = `${memberInfo.memberName}`
 			$.ajax({
				url:'todoListInsert',
				method:'POST',
				data : jsonData,
				contentType : 'application/json',
				success:function(result){
					//캘린더 event 업데이트
					loadPriSche();
					tdlModal.hide();
					$('#tdlFormInsert input[name="memberId"]').val(memberName);
					$('#tdlFormInsert input[name="listTitle"]').val("");
				},
				error:function(error){
					console.log(error)
		 			tdlModal.hide();
				}
			}); 
		});
		
		//tdl 수정폼
		function tdlUpdateForm(result){
			$('#tdlFormView input').eq(0).prop("readonly",false).focus();
			$('#tdlFormView input').eq(2).prop("readonly",false);
			$('#datetimepicker6').datetimepicker({
			    format:'Y-m-d',
			    lang:'kr',
			    timepicker:false
			});
			$('.tdlList-view div').find('input').prop("readonly",false).prop("disabled",false);
			//tdl content 추가 버튼
			$('.tdlList-view').parent().append($('<button type="button" class="btn btn-primary addTdlLine">To Do List 추가</button>'))
			$('.tdlList-view img[class="tdlLineDeleteBtn-hidden"]').attr("class","tdlLineDeleteBtn")
			//삭제버튼
			let $deleteTdlbtn = $('<button type="button" class="btn btn-primary" id="deleteTdlBtn">삭제</button>');
			$('#tdlUpdateBtn').parent().prepend($deleteTdlbtn);
			$deleteTdlbtn.on("click", function(){deleteTdlList(result)})
			$('#tdlUpdateBtn').off("click");
			$('#tdlUpdateBtn').text('수정완료').on('click',function(){
				tdlUpdate();
			})
		};
		//tdl수정
		function tdlUpdate(){
			//날짜정보 있는지 확인
			let applyDate = $('#datetimepicker6').val();
			if(applyDate === null || applyDate === "" ){
				alert("날짜를 입력하세요")
				applyDate.focus();
				return false
			};
			//todoList항목 json화
			let tdlFormView = $('#tdlFormView')
			let obj = serializeObject(tdlFormView);
	
			let todoList=[];
			todoList.push(obj)
			//item 항목 json화
		    let itemDataArray = {};
			
		    // .tdlList 아래의 각 div 요소를 순회
		    let updateItem = [];
		    let insertItem = [];
		    let deleteItem = [];
	        let dataObject;
	    	function getItems(div){
	    		let checkboxValue = div.find("input[type='checkbox']").is(":checked");
		        if(checkboxValue){
		        	checkboxValue = "A1"
		        }else{
		        	checkboxValue = "A2"
		        }
		        let inputValue = div.find("input[type='text']").val();
		        //item한개의 json화 
		        if(inputValue!=null && inputValue !=""){
			        dataObject = {
			            success : checkboxValue,
			            content : inputValue
			        };
		        }else{
		        	return;
		        }
	    	};
	    	function getUpdateItems(div,id){
	    		let checkboxValue = div.find("input[type='checkbox']").is(":checked");
		        if(checkboxValue){
		        	checkboxValue = "A1"
		        }else{
		        	checkboxValue = "A2"
		        }
		        let inputValue = div.find("input[type='text']").val();
		        //item한개의 json화 
		        if(inputValue!=null && inputValue !=""){
			        dataObject = {
			        	itemId : id,
			            success : checkboxValue,
			            content : inputValue
			        };
		        }else{
		        	return;
		        }
	    	}
	    	
		    $('.tdlList-view > div').each(function() {
		    	let divTagId = $(this).attr("id");
			    if (typeof divTagId === "string") {
					//item항목의 div태그가 id가 있는 경우 => 수정/삭제
					let divTagClass = $(this).attr("class");	
					if(typeof divTagClass ==="string"){
						//item항목의 div태그에 class가 지정되어 있는 경우 => 삭제
						let deleteItemId = divTagId.substr(-1)
						let itemId = {itemId : deleteItemId}
						deleteItem.push(itemId);
						console.log(deleteItem)
					}else{
						//item항목의 div태그에 class가 지정안되어 있는 경우 => 수정
						let updateItemId = divTagId.substr(-1)
						getUpdateItems($(this),updateItemId);
						updateItem.push(dataObject);
						console.log(updateItem)
					}
			    } else {
					//item항목의 div태그가 id가 없는 경우 => 신규입력
			        getItems($(this));
			        // 객체를 배열에 추가
					insertItem.push(dataObject);
					console.log(insertItem)
			    }
		    });

			//let updateItemList = {"update" : updateItem}
			//itemDataArray.push(updateItemList);
			//let deleteItemList = {"delete" : deleteItem}
			//itemDataArray.push(deleteItemList);
			//let insertItemList = {"insert" : insertItem}
			//itemDataArray.push(insertItemList);
			itemDataArray={todoList, updateItem, deleteItem, insertItem};
			console.log(itemDataArray)
			console.log(JSON.stringify(itemDataArray))
		    //json화 된 데이터들을 리스트에 담기
			
			$.ajax({
				url:"updateToDoList",
				method : 'post',
				data : JSON.stringify(itemDataArray),
				contentType : 'application/json',
				success : function(result){
					//캘린더 event 업데이트
					loadPriSche();
					console.log(result);
				},
				error : function(err){
					console.log(err);
				}
			});
			$('#tdlUpdateBtn').prev('button').remove();
			tdlModal.hide();
			$('#tdlUpdateBtn').text('TDL 수정');
			$('#tdlUpdateBtn').off("click");
		};
	
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
				
				let scheViewForm = $('#scheViewForm')
				
				let obj = serializeObject(scheViewForm);
				
				$.ajax({
					url : 'updatePsche',
					method : 'post',
					data : obj,
					success : function(result){
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
		function serializeObject(form){
			let formData = form.serializeArray();
			
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
		
		//tdlList 삭제
		function deleteTdlList(result){
			let listId = {"listId":result.todoList[0].listId};
			$.ajax({
				url:'deleteToDoList',
				method : 'get',
				data : listId,
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
			$('#tdlUpdateBtn').prev('button').remove();
			$('#tdlUpdateBtn').text("TDL 수정").off();
			//모달창 닫기
			tdlModal.hide();
		}
	});
	
</script>
</html>