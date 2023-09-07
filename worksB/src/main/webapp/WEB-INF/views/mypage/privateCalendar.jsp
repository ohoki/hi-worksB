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
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
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
	.fc .fc-button-primary{
		background-color: #e76f51;
		border-color : white;
	}
	.fc .fc-button-primary:not(:disabled).fc-button-active, .fc .fc-button-primary:not(:disabled):active {
    background-color: #ef3608;
    border-color: white;
	}
	.fc .fc-button-primary:disabled {
    background-color: #efa491;
    border-color: white;
	}
	.fc .fc-button-primary:hover {
    background-color: #ff4719;
    border-color: #ff4719;
	}
	.sche__search{
		margin-top : 20px;
		width : 350px;
		margin-bottom : 20px;
	}
	.progress-bar{
		height: 30px;
		width : 70%;
		background-color: #6c757d5c;
		border-radius: 30px; 
	}
	.progress-bar__line{
		height : 30px;
		background-color: #06b306b3;
	}
	.tdlView{
		padding : 30px;
	}
	.modal-content{
		height: 600px;
	}
	
</style>
</head>
<!-- full calendar  -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- dateTimePicker -->
<script src="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.full.min.js"></script>
<!-- ckeditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<!-- 사진 업로드를 위한 ckfinder -->
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<body>
	<div>
		<div align="center">
			<h3>마이 캘린더</h3>
			<div align="center">
				<input type="text" placeholder="제목과 내용을 검색하세요." class="header__search sche__search">
			</div>
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
						<div>
							<label for="scheAddr">장소 : </label>
							<input type="text" placeholder="일정 장소를 설정해주세요." id="scheAddrInsert" name="scheAddr">
							<input type="text" id="scheAddrDetail" name="scheAddrDetail" placeholder="상세주소" disabled>
						</div>
						<label for="scheContent">내용 : </label><textarea id="editor1" name="scheContent" ></textarea>
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
				<div>
					<label for="scheAddr">장소 : </label>
					<input type="text" placeholder="일정 장소를 설정해주세요." id="scheAddrUpdate" name="scheAddr">
					<input type="text" id="scheAddrDetail" name="scheAddrDetail" placeholder="상세주소" disabled>
				</div>
				<input id="scheId" name="scheId" type="text" hidden="hidden">
				<label for="scheContent">내용 : </label><textarea name="scheContent" id="editor2" hidden="true"></textarea>
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
	      		<hr>
	      		<p>To Do List 진행도</p>
	      		<div class="progress-bar">
	      			<div class="progress-bar__line"></div>
	      		</div>
	      		<p>To Do List 목록</p>
		      	<div class="tdlList-view">
		      	</div>
	      	</div>
	        <div class="modal-footer">
	          <button type="button" form="tdlFormView" class="btn btn-primary" id="tdlUpdateBtn">TDL 수정</button>
	          <button type="reset" form="tdlFormView" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        </div>
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
	var tdlModal = new bootstrap.Modal(document.getElementById('tdlModal'))
	
	//모달 폼 리셋
	$('#selectModal, #scheModal').on('hidden.bs.modal', function (e) {
		$(this).find('form')[0].reset();
        $(".alarmDate option:eq(0)").prop("selected", true);
	});
	
	$('#tdlModal').on('hidden.bs.modal', function (e) {
		$('.tdlList, .tdlList-view').children().remove();
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
			timeZone : 'local',
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
				  url: "${pageContext.request.contextPath}/privateScheList",
				  method: "GET",
				  dataType: "json"
			}).done(function(data){
				console.log(data)
				calendar.removeAllEvents();
				calendar.addEventSource(data);
				calendar.getEventSources()
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
	    			url:"${pageContext.request.contextPath}/selectTdl",
	    			method:"GET",
	    			data:data,
	    			dataType:"JSON",
	    			success:function(result){
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
    					$('.tdlList-view').append('')
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
    					//진행도 표시
	    				let optionLength = $('.tdlList-view div').length;
	    				let checkboxList = $('.tdlList-view div').find('input[type="checkbox"]')
	    				let checkedLength = 0;
	    				for(let i=0;i<optionLength;i++){
	    					if(checkboxList.eq(i).is(':checked')){
	    						checkedLength += 1;
	    					}
	    				}
	    				let bar = (checkedLength/optionLength)*100;
	    				let percent = Math.floor(bar)
	    				$('.progress-bar__line').css('width',percent+'%').text(percent+'%')
	    				
	    				
	    				$('#tdlUpdateBtn').on('click', function(){tdlUpdateForm(result)});
	    			},
	    			error:function(error){
	    				alert("조회오류");
	    			}
	    		});
	    	}else if(scheId.substr(0,1)!==t){
	    		//개인일정일 경우
				let data = { "scheId" : scheId};
				$.ajax({
					url:"${pageContext.request.contextPath}/selectPsche",
					method:"GET",
					data: data,
					dataType: "json",
					success:function(result){
						console.log(result)
						
						selectModal.show();
						//삭제버튼 있을시 삭제
						$('#updateBtn').prev('button').remove();
						//버튼클릭이벤트 정지
						$('#updateBtn').prop("type","button").off("click");
						$('#scheViewForm input,textarea').prop("readonly", true);
						$('#scheViewForm input[name="scheTitle"]').val(result.title);
						$('#scheViewForm input[name="startDate"]').val(result.start).datetimepicker('destroy');
						$('#scheViewForm input[name="endDate"]').val(result.end).datetimepicker('destroy');
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
	
						$('#scheViewForm input[name="memberId"]').val(memName);
						//주소
						if(result.scheAddr!=null){
							let addrTag = $('#scheViewForm input[name="scheAddr"]')
							let addrDetailTag = $('#scheViewForm input[name="scheAddrDetail"]')
							addrTag.val(result.scheAddr).prop("disabled",true);
							addrDetailTag.val(result.scheAddrDetail).prop("disabled",true);
						}
						//내용 보여주기
						$('.scheSubject').remove();
						$('.ck-reset_all, .ck-editor__main').css('display', 'none');
						let divTag = $('<div></div>');
						divTag.attr('class', 'scheSubject').append(result.scheContent);
						$('#scheViewForm').append(divTag);
						$('#editor2').val(result.scheContent)
						
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
	    let hours = (now.getHours()<10?'0'+now.getHours():now.getHours());
		let minutes = (now.getMinutes()<10?'0'+now.getMinutes():now.getMinutes());
		let after = now.getMinutes()+30;
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
			$('.ck-reset_all, .ck-editor__main').css('display', 'block');
			
		};
		//날짜 클릭시 일정 입력모달창
		function addPrivateSche(arg) {
			//모달창 띄우기
	        scheModal.show();
			$('#scheForm input,textarea').prop("required", true).prop("readonly", false);
			$('#scheForm input').eq(3).prop("readonly",true);
			$(".alarmDate option").prop("disabled", false);
			//해당 날짜가져오기
    		let time = hours+":"+minutes
			$('#datetimepicker1').val(arg.startStr+" "+time);
			$('#datetimepicker2').val(arg.endStr+" "+time);
			$('.ck-reset_all, .ck-editor__main').css('display', 'block');
			calendar.unselect();
		};
		//개인일정 db입력
		$('#insertBtn').on("click", function(event){
			event.preventDefault();
			let title = $('#scheForm input[name="scheTitle"]')
			if(title.val()===''||title.val()===null){
				alert("제목을 입력하세요");
				$('#scheForm input[name="scheTitle"]').focus();
				return;
			}
			
			$('#editor1').val(editor1.getData())
			$('#scheForm input[name="memberId"]').val(memberId);
			let pScheFormInsert = $('#scheForm')
			let pScheObj = serializeObject(pScheFormInsert);
			$.ajax({
				url:"${pageContext.request.contextPath}/priScheInsert",
				method:"POST",
				data : pScheObj,
				success : function(result){
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
				url:'${pageContext.request.contextPath}/todoListInsert',
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

		    $('.tdlList-view > div').each(function() {
		    	let divTagId = $(this).attr("id");
			    if (typeof divTagId === "string") {
					//item항목의 div태그가 id가 있는 경우 => 수정/삭제
					let divTagClass = $(this).attr("class");	
					if(typeof divTagClass ==="string"){
						//item항목의 div태그에 class가 지정되어 있는 경우 => 삭제
						let deleteItemId = divTagId.substr(6)
						let itemId = {itemId : deleteItemId}
						deleteItem.push(itemId);
						console.log(deleteItem)
					}else{
						//item항목의 div태그에 class가 지정안되어 있는 경우 => 수정
						let updateItemId = divTagId.substr(6)
			    		let checkboxValue = $(this).find("input[type='checkbox']").is(":checked");
				        if(checkboxValue){
				        	checkboxValue = "A1"
				        }else{
				        	checkboxValue = "A2"
				        }
				        let inputValue = $(this).find("input[type='text']").val();
				        //item한개의 json화 
				        if(inputValue!=null && inputValue !=""){
					        dataObject = {
					        	itemId : updateItemId,
					            success : checkboxValue,
					            content : inputValue
					        };
				        }else{
				        	return;
				        }
						updateItem.push(dataObject);
						
						console.log(updateItem)
					}
			    } else {
					//item항목의 div태그가 id가 없는 경우 => 신규입력
			        let checkboxValue = $(this).find("input[type='checkbox']").is(":checked");
			        if(checkboxValue){
			        	checkboxValue = "A1"
			        }else{
			        	checkboxValue = "A2"
			        }
			        let inputValue = $(this).find("input[type='text']").val();
			        let tdlListId
			        //item한개의 json화 
			        if(inputValue!=null && inputValue !=""){
				        dataObject = {
				            success : checkboxValue,
				            content : inputValue
				        };
			        }else{
			        	return;
			        }
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
				url:"${pageContext.request.contextPath}/updateToDoList",
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
			//주소검색 활성화
			$('#scheViewForm input[name="scheAddr"]').prop("disabled",false);
			$('#scheViewForm input[name="scheAddrDetail"]').prop("disabled",false);
			//ck에디터 띄우기
			$('.ck-reset_all, .ck-editor__main').css('display','block');
			editor2.setData($('#editor2').val())
			$('.scheSubject').remove();
			//버튼 수정
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
			let title = $('#scheViewForm input[name="scheTitle"]')
			if(title.val()===''||title.val()===null){
				alert("제목을 입력하세요");
				title.focus();
				return;
			}
			
			//폼태그 배열화
			
			$('#editor2').val(editor2.getData())
			let scheViewForm = $('#scheViewForm')
			
			let obj = serializeObject(scheViewForm);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/updatePsche',
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
				url:'${pageContext.request.contextPath}/deletePsche',
				method : 'get',
				data : id,
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
		};
		
		//tdlList 삭제
		function deleteTdlList(result){
			let listId = {"listId":result.todoList[0].listId};
			$.ajax({
				url:'${pageContext.request.contextPath}/deleteToDoList',
				method : 'get',
				data : listId,
				success : function(result){
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
<!-- 게시글 작성 SCRIPT -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//ckeditor 시작
	for(let i =1; i<9; i++) {
		CKEDITOR.ClassicEditor.create(document.querySelector('#editor' + i), {
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
	   	 	  window['editor'+i] = newEditor;
	    })
	    .catch( error => {
	        console.error( error );
	    });	
	};
	//ckeditor 종료
	
	$('#scheAddrInsert').on('click',getAddr)
	$('#scheAddrUpdate').on('click',getAddr)
	
	function getAddr(){
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				$('#scheAddrDetail').prop('disabled', false);
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				    addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
				    addr = data.jibunAddress;
				}
				
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
				    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				        extraAddr += data.bname;
				    }
				    // 건물명이 있고, 공동주택일 경우 추가한다.
				    if(data.buildingName !== '' && data.apartment === 'Y'){
				        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				    }
				    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				    if(extraAddr !== ''){
				        extraAddr = ' (' + extraAddr + ')';
				    }
				    // 조합된 참고항목을 해당 필드에 넣는다.
				    	addr = addr + extraAddr;
				} 
				// 주소 정보를 해당 필드에 넣는다.
				$('input[name="scheAddr"]').val(addr);
				// 커서를 상세주소 필드로 이동한다.
				$('input[name="scheAddrDetail"]').val('');
				$('input[name="scheAddrDetail"]').focus();
			}
		}).open();
	} 
</script>
</html>