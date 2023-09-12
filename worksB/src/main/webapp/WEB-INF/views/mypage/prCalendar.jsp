<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link href="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.min.css" rel="stylesheet">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
	
	.calander-main-box {
		width: 85%;
		margin: 0 auto;
	}
	
	.fc .fc-toolbar.fc-header-toolbar {
	    margin-bottom: 15px;
	}
	
	.fc-direction-ltr .fc-button-group > .fc-button:not(:first-child) {
	    border-bottom-left-radius: 0px;
	    border-top-left-radius: 0px;
	    margin-left: 0;
	}
	
	.fc-prev-button {
		width: 10px;
		height: 30px;
		padding: 0 15px 0 0 !important;
		color: white !important;
		background-color: var(--color-dark-red) !important;
	}
	
	.fc-next-button {
		width: 10px;
		height: 30px;
		padding: 0 15px 0 0 !important;
		color: white !important;
		background-color: var(--color-dark-red) !important;
	}
	
	.fc-today-button {
		width: 70px;
		height: 30px;
		line-height: 15px;
		padding: 0 !important;
		font-size: var(--font-micro) !important;
		background-color: var(--color-dark-beigie) !important;
		border: none !important;
		color: var(--color-dark-grey) !important;
		font-weight: var(--weight-bold) !important;
	}
	
	.fc .fc-button:disabled {
	    opacity: 1;
	}

	.fc .fc-button-primary:hover {
	    background-color: var(--color-dark-red);
	}
	.fc-dayGridMonth-button {
		width: 70px;
		height: 30px;
		line-height: 15px;
		padding: 0 !important;
		font-size: var(--font-micro) !important;
	}
	
	.fc-timeGridWeek-button, .fc-tdlBtn-button, .fc-myCustomButton-button{
		width: 70px;
		height: 30px;
		line-height: 15px;
		padding: 0 !important;
		font-size: var(--font-micro) !important;
	}
	
	.fc .fc-button-primary:focus {
    	box-shadow: none;
	}

 	.fc .fc-button:focus {
    	box-shadow: none;
    	outline: none;
	}
	
    .fc .fc-button:active{
	   	box-shadow: none;
	}
    .fc .fc-button-primary {
	    background-color: rgb(254 217 183 / 71%);
	    border: none !important;
	    color: var(--color-dark-grey);
	    transition: all 0.5s;
	}
	.fc .fc-button-primary:not(:disabled).fc-button-active:focus, .fc .fc-button-primary:not(:disabled):active:focus {
    	box-shadow: none;
    }
	.fc-scheBtn-button {
		width: 70px;
		height: 32px;
		line-height: 15px;
		padding: 0 !important;
		font-size: var(--font-micro) !important;
		background-image: linear-gradient(to right, rgba(249, 166, 52, 0.7), rgba(156, 187, 58, 0.7));
		border: none !important;
		transition: all 0.5s;
		color: white !important;
	}
	
	.fc-scheBtn-button:hover, .fc-scheBtn-button:focus, .fc-scheBtn-button.active {
		background-color: rgb(249, 166, 52) !important;
	}
	.fc-allBtn-button {
		width: 70px;
	    height: 32px;
	    line-height: 15px;
	    padding: 0 !important;
	    font-size: var(--font-micro) !important;
	    background-color: rgb(0, 175, 185, 0.7) !important;
	    border: none !important;
	    transition: all 0.5s;
	    color: white !important;
	}
	.fc-allBtn-button:hover, .fc-allBtn-button:focus, .fc-allBtn-button.active {
		background-color: rgb(0, 175, 185) !important;
	}
	.fc-taskBtn-button {
		width: 70px;
		height: 32px;
		line-height: 15px;
		padding: 0 !important;
		font-size: var(--font-micro) !important;
		background-color: rgb(28 215 31 / 60%) !important;
		border: none !important;
		transition: all 0.5s;
		color: white !important;
	}
	
	.fc-taskBtn-button:hover, .fc-taskBtn-button:focus, .fc-taskBtn-button.active {
		background-color: rgb(28 215 31 ) !important;
	}

	.fc-viewBtn-button {
		width: 70px;
		height: 32px;
		line-height: 15px;
		padding: 0 !important;
		font-size: var(--font-micro) !important;
		background-color: rgb(0, 175, 185, 0.7) !important;	
		border: none !important;
		transition: all 0.5s;
		color: white !important;
	}
	
	.fc-viewBtn-button:hover, .fc-viewBtn-button:focus, .fc-viewBtn-button:not(:disabled):active, .fc-viewBtn-button.active {
		background-color: rgb(0, 175, 185) !important;
	}
	
	.fc-toolbar-title {
		color: var(--color-dark-grey);
		font-weight: var(--weight-bold);
		font-size: var(--font-regular) !important;
	}
	
	.fc .fc-button-primary:not(:disabled).fc-button-active, .fc .fc-button-primary:not(:disabled):active {
	    background-color: var(--color-dark-red);
	    border-color: none;
	}
	
	.fc-col-header-cell {
		background-color: var(--color-beigie);
		color: var(--color-dark-grey);
	}
	
	
	.fc-day-sat {
		 color:var(--color-blue); 
	}  
    
    .fc-day-sun {
    	color: var(--color-dark-red);
    }
    
	.fc-event-title-container {
		cursor: pointer;
		text-align: center;
	}
	
	.fc .fc-daygrid-day.fc-day-today {
	    background-color: rgb(253, 252, 220, 0.7);
	}
	
	.fc .fc-daygrid-day-number {
	    font-size: var(--font-micro);
	}
	
	.fc-daygrid-block-event .fc-event-time, .fc-daygrid-block-event .fc-event-title {
	    color: var(--color-dark-grey);
	    font-weight: var(--weight-bold);
	}
	.fc .fc-popover {
	    box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 6px;
	    position: absolute;
	    z-index: 2;
	}
	
	
	#calendar-container {
		width: 70%;
		margin: 0 auto;
	}
	
	.scheBtn {
		color: black;
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

	.sche__search{
		margin-top : 20px;
		width : 350px;
		margin-bottom : 20px;
	}

	.modal-content{
		height: 600px;
		overflow: auto;
	}
	
	.flex {
		display: flex;
	}
	.d-flex {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.modal-prjSche-visible {
		display: block !important;
	}
	.modal-task-visible {
		display: block !important;
	}
	
	#prjSche-modal, #task-modal, #boardUpdateModal{
		position: absolute;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.1);
		font-size: 12px;
		display: none;
		left: 0;
		top: 0;
		z-index: 2;
	}
	
	.prjSche-modal__content, .task-modal__content{
		position: absolute;
		right: 0;
		top: 62px;
		height: 100%;
		width: 40%;
		background-color: white;
		font-size: 17px;
		padding: 20px 15px;
		z-index: 10;
		overflow: scroll;
		overflow-x:hidden;
	}
	

	#task-modal .board-header {
		display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 10px 40px;
	}
	#task-modal .board-header {
		display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 10px 40px;
	}
	
	#task-modal .board-header-info {
		display: flex;
    	align-items: center;
	}
	
	#task-modal .profileImg {
		width: 40px;
	    height: 40px;
	    border-radius: 10px;
	}
	
	
	#task-modal .board-headder-info__memberName {
		margin: 0 20px;
   		font-weight: var(--weight-bold);		
	}
	
	#task-modal .board-title {
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
		
	#task-modal .board-title span {
	    color: var(--color-blue);
	}	
	
	#task-modal .board-title span[data-title] {
		color: var(--color-dark-grey);
	}
	
	.board-title div[data-hightaskid] {
	    font-size: var(--font-micro);
	    padding: 5px;
	    border: 1px solid var(--color-dark-red);
	    border-radius: 5px;
	    color: var(--color-dark-red);
	}
	
	#task-modal div[data-processivity] {
	    display: flex;
	    align-items: center;
	    color: var(--color-green);
	}
	
	#task-modal .processivity {
	    width: 150px;
	    height: 7px;
	    border-radius: 2px;
	    background-color: var(--color-light-white);
	    margin-right: 10px;
	}
	
	#task-modal .processivity-value {
	    width: 1%;
	    height: 7px;
	    border-radius: 2px;
	    background-color: var(--color-green);
	}	
	
	#task-modal .sche-date {
	    font-weight: var(--weight-bold);
	    font-size: 15px;
	    color: var(--color-dark-red);
	    margin: 10px 40px;
	}
	
	#task-modal div[data-state] {
	    margin: 0 40px;
	    text-align: left;
	}
	
	#task-modal div[data-state] button {
	    width: 50px;
	    height: 10px;
	    background-color: var(--color-dark-beigie);
	    padding: 10px;
	    border-radius: 5px;
	    color: white;
	    font-weight: var(--weight-bold);
	    line-height: 10px;
	}
	
	#task-modal div[data-state] button.active {
	    background-color: var(--color-dark-red);
	}
	
	#task-modal .board-content  {
		margin: 30px 40px;
	    font-size: var(--font-micro);
	    color: var(--color-dark-grey);
	}
	
	.task-modal__content{
		position: absolute;
		right: 0;
		top: 62px;
		width: 40%;
		height: 90vh;
		background-color: white;
		font-size: 17px;
		padding: 20px 15px;
		z-index: 10;
		overflow: scroll;
		overflow-x:hidden;
	}
	
	#task-modal .task-manager {
	    display: flex;
	    font-weight: var(--weight-bold);
	    font-size: 13px;
	    color: var(--color-blue);
	    margin: 10px 40px;
	    align-items: center;
	    cursor : pointer;
	}
	
	#task-modal .task-manager .text {
	    font-size: 15px;
	    color: var(--color-dark-grey);
	}
	
	#task-modal div[data-priority] {
	    font-size: var(--font-micro);
	    color: var(--color-green);
	    font-weight: var(--weight-bold);
	}
	
	#task-modal .sub-task-lists {
	    margin: 0 40px 30px 40px;
	}
	
	#task-modal .sub-task-lists-title {
	    margin: 10px 0;
	    font-size: var(--font-micro);
	    font-weight: var(--weight-bold);
	    color: var(--color-dark-grey);
	}
	
	#task-modal .sub-task-item {
	    display: flex;
	    align-items: center;
	    padding: 5px 10px;
	    background-color: rgba(240, 240, 240, 0.2);
	    justify-content: flex-start;
	    margin: 5px 0;
	    border-radius: 5px;
	    text-align: center;
	    border: 1px solid transparent;
	}

	#task-modal .sub-state {
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

	.board-footer {
	    display: flex;
	    justify-content: space-between;
	    margin: 10px 40px;
	    font-size: var(--font-micro);
	}
	
	.board-footer-icon {
	    margin-right: 10px;
	}

	.board-footer-info {
	    margin-left: 10px;
	}

	.d-flex {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	#task-modal .board-comment {
	    padding: 5px 40px;
	    border-top: 1px solid var(--color-dark-beigie);
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    color: var(--color-dark-grey);
	}
	.board-footer-icon:hover {
		color: var(--color-dark-red);
		cursor: pointer;
	}
	.board-footer-icon {
		margin-right: 10px;
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

 	div[data-boardmodal] {
		position: fixed;
		width: 100vw;
		height: 100vh;
		font-size: 12px;
		left: 0;
		top: 0;
		background-color: rgba(0,0,0,0.1);
		z-index: 11;
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
		z-index: 12;
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

	/* todoList 모달 */
	#tdlModal .modal-header{
		background-color: var(--color-beigie);
	    font-weight: bolder;
	}
	#tdlModal .modal-header h5{
	    font-weight: bolder;
	}
	#tdlModal .modal-content {
	    height: 600px;
	    overflow: auto;
	}
	#tdlView{
		padding-left: 20px;
		padding-right: 20px;
		overflow: scroll;
		overflow-x:hidden;
	}
	
	#tdlView .modal-body{
		padding-left: 20px;
		padding-right: 20px;
	}
	#tdlFormView{
		color: var(--color-dark-grey);
	    font-weight: bolder;
	    font-size: 15px;
	}
	.tdlviewtitle{
	    color: var(--color-blue);
	    font-size: 20px;
	    font-weight: bolder;
	} 
	.tdlviewtitle .tdlListTitle {
		color: var(--color-dark-grey);
	}
	.tdlviewtitle span[name="regDate"]{
		margin-left :20px; 
		color: var(--color-dark-grey);
		font-weight: normal;
		font-size: 15px;
	}
	#tdlFormView .applyDate{
		color: var(--color-dark-red);
	}
	#tdlView .tdl_content{
		color: var(--color-dark-grey);
	    font-weight: bolder;
	    font-size: 15px;
	}
	#tdlView .tdl_content p{
		margin-bottom: 5px;
	}
	.progress-bar{
		height: 30px;
		width : 100%;
		background-color: #6c757d5c;
		border-radius: 30px; 
		margin-bottom: 5px;
	}
	.progress-bar__line{
		height : 30px;
		background-color: #06b306b3;
	}
	.tdlView{
		padding : 30px;
	}
	.tdlList-view input[type="text"]{
		margin-left : 5px;
		color: var(--color-dark-grey);
	    font-weight: bolder;
		font-size: 15px
	}
	#tdlModal .btn-primary {
	    color: #000000c2;
	    background-color: #42ff45d6;
	    border-color: #0dfd71;
        font-family: 'Noto Sans KR', sans-serif;
	    font-size: 15px;
	    font-weight: bolder;
	}
	#tdlModal .btn-primary:hover, .btn-primary:active{
	    color: #fff;
	    background-color: #26fb29;
	    border-color: #0dfd71;
	}
	#tdlModal .btn-secondary {
	    color: #fff;
	    background-color: #b5bdc3;
	    border-color: #6c757d;
        font-family: 'Noto Sans KR', sans-serif;
	    font-size: 15px;
	    font-weight: bolder;
	}
	#tdlModal .btn-secondary:hover, .btn-secondary:active{
	    color: #fff;
	    background-color: #919191;
	    border-color: #6c757d;
	}
	#tdlBody input[name="applyDate"]{
		background-color: #4d4d4d21;
	    width: 100px;
	}
	#tdlFormInsert input[name="listTitle"]{
	    height: 30px;
	    width: 300px;
	}

	#tdlBody .tdlList input[type="text"]{
		margin-left : 5px;
		width: 300px;
	    background-color: #9b9a9a17;
	}
	
	
	/* 참여자 */	
	#taskManager-modal, #scheParticr-modal{
		position: absolute;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.1);
		font-size: 12px;
		display: none;
		left: 0;
		top: 0;
		z-index: 20;
	}
	.taskManager-modal-title, .scheParticr-modal-title{
		font-size: 15px;
		justify-content: space-between;
		font-weight: var(--weight-bold);
		padding: 5px 10px;
	}
	
	.taskManager-modal-content, .scheParticr-modal-content{
		position: absolute;
		width: 15%;
		height: 30%;
		background-color: white;
		font-size: 12px;
		padding: 20px 15px;
		z-index: 10;
		overflow: auto;
		overflow-x: hidden;
		border-radius: 5px;
	}
	.particir-visible {
		display: block !important;
	}
	.processivity {
		cursor: pointer;
	}
	
	.processivity-value {
		transition: all 0.5s;
	}
	
	/* 일정 수정 모달  */

	/*오류 : css안입혀짐  */
	div[data-state] button.active{
		background-color: var(--color-dark-red) !important;
	}
	
	#scheViewForm{
		font-size: 15px;
    	color: var(--color-dark-grey);
	}
	
	
/* 	일정 css  */
	#datetimepicker3, #datetimepicker4{
	    width: 130px !important;
	}
	

</style>
</head>
<!-- full calendar  -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
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
						<input name="startDate" type="text" id="datetimepicker1" autocomplete="off">~
						<input name="endDate" type="text" id="datetimepicker2"  autocomplete="off">
						<br>
						<span>작성자 : </span><input id="memberId" name="memberId" type="text" value="${memberInfo.memberName }" readonly="readonly"><br>
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
				<input name="scheTitle" type="text"><hr>
				<span class="text" style="color: var(--color-dark-grey);">기간 : </span>
				<input name="startDate" type="text" id="datetimepicker3"  autocomplete="off">~
				<input name="endDate" type="text" id="datetimepicker4"  autocomplete="off">
				<br>
				<span class="text">작성자 : </span><input name="memberId" type="text" value=""><br>
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
				      	<div>
				      		<span>작성자 : ${memberInfo.memberName }</span>
				      	</div>
				      	<input name="memberId" type="text" value="${memberInfo.memberId }" hidden="ture">
				      	<label for="applyDate">To Do List 해당일자 : </label>
				      	<input name="applyDate" type="text" id="datetimepicker5"  autocomplete="off">
			      	</form>
			      	<div>
				      	<div class="tdlList">
				      	</div>
				      	<button type="button" class="btn btn-primary addTdlLine">To Do List 추가</button>
			      	</div>
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
			      	<input id="listId" name="listId" type="text" hidden="hidden">
			      	<input name="memberId" type="hidden" value="${memberInfo.memberId}" >
			      	<div class="tdlviewtitle">
			      		<span>[제목] </span>
				      	<span name="listTitle" class="tdlListTitle" ></span>
				      	<input type="text" name="listTitle" placeholder="TDL 제목를 입력하세요">
				      	<span name="regDate"></span>
			      	</div>
			      	<hr>
			      	<div>
				      	<span>작성자 : ${memberInfo.memberName }</span>
			      	</div>
			      	<div>
				      	<label for="applyDate">To Do List 해당일자 : </label>
				      	<span class="applyDate"></span>
				      	<input name="applyDate" type="text" id="datetimepicker6"  autocomplete="off">
			      	</div>
		      	</form>
	      		<div class="tdl_content">
		      		<hr>
		      		<p>To Do List 진행도</p>
		      		<div class="progress-bar">
		      			<div class="progress-bar__line"></div>
		      		</div>
		      		<p>To Do List 목록</p>
			      	<div class="tdlList-view">
			      	</div>
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
	<!-- 개인 업무 조회 모달 -->
	<!-- 업무 상세조회 모달 -->
	<div id="task-modal" data-tasktype="">
		<div class="task-modal__content">
			<input type="hidden" id="prjTaskId" value="" name="prjBoardId" data-boardType="C8">
			<div class="board-header">
			<input type="hidden" value="" name="prjBoardId">
				<div class="board-header-info">
					<img class="profileImg"alt="" src="">
					<div class="board-headder-info__memberName" data-memberName></div>
					<span data-regdate></span>
				</div>
				<div name="boardMenu">
				</div>
			</div>
			<div class="board-title">
				<div>
					<span>[업무]</span>
					<span data-title></span>
				</div>
				<div data-hightaskid></div>
			</div>
			<div class="sche-date d-flex">
				<div>
					<span class="text" style="color: var(--color-dark-grey);">기간 : </span>
					<span data-start></span>
					<span> ~ </span>
					<span data-end></span>
				</div>
				<div data-processivity>
					<div class="processivity">
						<div class="processivity-value"></div>
					</div>
					<span data-processivityvalue></span>
					<input type="hidden" name="processivity">
				</div>
			</div>
			<div class="d-flex" style="margin-right: 40px;">
				<div class="task-manager"> 
					<span class="text">담당자 : </span>
				</div>
				<div data-priority></div>
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
				<div class="d-flex">
					<div class="sub-task-lists-title">하위업무 <span data-subtaskcount></span></div>
				</div>
				<div class="sub-task-list">
				</div>
			</div>
			<div class="board-footer">
				<div >
					<span class="board-footer-icon" name="prjLike"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg" style="padding-right: 5px;"><span></span></span>
					<span class="board-footer-icon" data-bookmark="no" name="bookmark-icon"> 북마크</span>
				</div>
				<div>
					<span class="board-footer-info">댓글 <span data-commentCount></span></span>
					<span class="board-footer-info">좋아요 <span data-likeCount></span></span>
				</div>
			</div>
			<!-- 댓글창 -->
			<div name="board-comment-box">
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
	
	//업무조회 모달끄기
	$('#task-modal').on('click', function(e) {
	    if ($(e.target).is('#task-modal')) {
	        $('#task-modal').removeClass('modal-task-visible');
	        /* //버튼 초기화
	        $('.prjTask-modal__content div[data-state]').children('button').css('background-color', '');
	        //작성자 초기화
	        $('.d-flex').find('.task-manager .text').next().remove();
	        $('.prjTask-modal__content').find('span[data-subtaskcount]').text("")
	        $('.prjTask-modal__content').find(".sub-task-list").children().remove();
	        //내용 초기화 
	        $('.board-content div').children().remove();*/
	        $('#task-modal').find('input').val('')
	        $('#task-modal').find('span[name="prjLike"]').val('')
		    $('span[name="prjLike"]').off()
	    }
	});
	
	//검색
	//일정 검색
	$('.sche__search').keydown(function (key) {
		event.stopPropagation();
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
            searchTasknSche();
            $('.sche__search').val("");
        }
    });
    //프로젝트 캘린더 일정/업무 검색
    function searchTasknSche(){
    	let searchKeyword = $('.sche__search').val();
		//검색구문 만들어 넣기!!진행!
    	$.ajax({
    		url : '${pageContext.request.contextPath}/searchPrivateCalendar',
    		method : 'GET',
    		data : {"searchKeyword" : searchKeyword},
    		dataType : 'JSON',
    		success : function(result){
				calendar.removeAllEvents();
				calendar.addEventSource(result);
    		},
    		error : function(err){
    			console.log(err)
    		}
    		
    	});
    };
	
	
	//업무 게시글 진척도 변경
	$('.processivity').on("click", function(e) {
		updateProcessivity(e);
		
		let boardContainer = $('#task-modal');
		let prjBoardId = boardContainer.find('input[name="prjBoardId"]').val();
		let processivity = boardContainer.find('input[name=processivity]').val();		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/updateTaskInfo',
			type:'POST',
			data: {'prjBoardId' : prjBoardId, 'processivity' : processivity},
			success:function(result){
				
			},
			error : function(reject) {
				console.log(reject);
			}
		})
	});
	//업무 게시글 진행상태 변경
	$('.task-modal__content div[data-state] button').on('click', function(e) {
		let boardContainer = $('#task-modal');
		let targetBtn = $(e.currentTarget);
		let prjBoardId = boardContainer.find('input[name="prjBoardId"]').val();
		let state = targetBtn.val();
		
		$.ajax({
			url: '${pageContext.request.contextPath}/updateTaskInfo',
			type:'POST',
			data: {'prjBoardId' : prjBoardId, 'state' : state},
			success : function(result) {
				//업무
				$.ajax({
					url : '${pageContext.request.contextPath}/getTaskInfo',
					type : 'GET',
					data : {'prjBoardId' : prjBoardId},
					success : function(taskData) {
		                let stateBtn = boardContainer.find('div[data-state]');
		                let activeBtn = stateBtn.find('.active');
		                // 진행상태 버튼 활성화
		                activeBtn.removeClass('active');
		                stateBtn.children('button[value=' + taskData.highTask[0].state + ']' ).addClass('active');
				    }, error : function(reject) {
						console.log(reject);
					}
				});
			},
			error : function(reject) {
				console.log(reject);
			}
		})
	});
	function updateProcessivity(e) {
		const progressBar = e.currentTarget;
		const progressBarInner = $(e.currentTarget).children('div');
		// 클릭 위치
		// 창 왼쪽부터 클릭한 위치까지 거리 - 프로그레스바 왼쪽 좌표 = 클릭 위치
		const clickedPosition = event.clientX - progressBar.getBoundingClientRect().left;
		
		// 프로그레스 전체 길이
		const totalWidth = progressBar.offsetWidth;
		
		// 진척도 값 계산
		const selectedProgress = Math.round((clickedPosition / totalWidth) * 100 / 10) * 10;
	
		// 클릭한 진척도 값으로 프로그레스 채우기
		progressBarInner.css('width', selectedProgress + "%");
		
		// input에 선택 한 값 넣기
	    const hiddenInput = $(progressBar).next().next(); 
		
		if (hiddenInput) {
			hiddenInput.val(selectedProgress);
	
			// 선택된 값 표시
			const progressValue = $(progressBar).next();
			progressValue.text(selectedProgress + "%");
		}
	};
	
	// 댓글 리스트
	function getCommentList(boardId, boardType){
		$.ajax({
			url : '${pageContext.request.contextPath}/projectCmtList',
			type : 'GET',
			data : {'boardId' : boardId, 'boardType': boardType},
			success : function(comments){
				let boardCommentBox = $('.task-modal__content').find('div[name="board-comment-box"]');
				let scheBoardCommentBox = $('.prjSche-modal__content').find('div[name="board-comment-box"]');
				boardCommentBox.empty();
				scheBoardCommentBox.empty();

				if(comments.length != 0) {
					for(let i =0; i<comments.length; i++) {
						let boardComment =`
							<div class="board-comment" data-cmtid="\${comments[i].commentId }">
								<div class="d-flex">
									<img src="${pageContext.request.contextPath}/images/\${comments[i].realProfilePath }" alt="회원 프로필 사진" class="profileImg" onerror="this.src='${pageContext.request.contextPath}/resources/img/no-image.jpg'">
									<div>
										<div style="margin: 5px 0;">
											<span style="font-weight: var(--weight-bold);">\${comments[i].memberName }</span>
											<span>\${comments[i].commentRegdate }</span>
										</div>
										<div style="margin: 5px 0;">
											\${comments[i].commentContent }
										</div>
									</div>								
								</div>
							</div>`;
							
						boardCommentBox.prepend(boardComment);
						scheBoardCommentBox.prepend(boardComment);
					}
					let moreComment=`
						<div name="moreComment" class="cursor" style="margin-bottom: 5px; padding: 5px 40px; color: var(--color-dark-grey);">
							댓글
						</div>`;
						
					boardCommentBox.prepend(moreComment);
					scheBoardCommentBox.prepend(moreComment);
				} 
				// 댓글 수
				$('.board-footer').find('span[name="commentCount"]').text(comments.length);
				
			}, error : function(reject) {
				console.log(reject);
			}
		});
	};
	
	// 좋아요 등록/해제
	function likeBoard(memberId, boardId, boardType){
		$.ajax({
			url : '${pageContext.request.contextPath}/likeBoard',
			type : 'GET',
			data : {'memberId': memberId, 'boardId' : boardId, 'boardType': boardType},
			success : function(like){
				console.log(like)
				// 게시글 좋아요 수
				getPrjLike(memberId, boardId);
				
				let likeSpan = $('#task-modal').find('span[name="prjLike"] span');
				likeSpan.empty();
				// 좋아요 상태 표시
				if(like.checkLike == 'like'){
					likeSpan.append("좋아요 해제");
				}else{
					likeSpan.append("좋아요");
				}
			},
			error : function(reject){
				console.log(reject)
			}
		})
	}
	
	
	// 좋아요 정보
	function getPrjLike(memberId, boardId){
		$.ajax({
			url : '${pageContext.request.contextPath}/getPrjLike',
			type : 'GET',
			data : {'memberId': memberId, 'boardId' : boardId},
			success : function(likeInfo){
				// 게시글 좋아요 수
				$('#task-modal').find('span[data-likeCount]').text(likeInfo.boardLike.length);
				$('#prjSche-modal').find('span[data-likeCount]').text(likeInfo.boardLike.length);
				
				// 좋아요 여부
				let likeSpan = $('#task-modal').find('span[name="prjLike"] span');
				likeSpan.empty();
				let scheLikeSpan = $('#prjSche-modal').find('span[name="prjLike"] span');
				scheLikeSpan.empty();
				//업무
				if(likeInfo.memberLike != null) {
					likeSpan.append("좋아요 해제");
				} else {
					likeSpan.append("좋아요");
				}
				//일정
				if(scheLikeSpan.memberLike != null) {
					scheLikeSpan.append("좋아요 해제");
				} else {
					scheLikeSpan.append("좋아요");
				}
			},
			error : function(reject){
				console.log(reject)
			}
		})
	};
	
	// 북마크 정보
	function getBookmarkInfo(memberId, boardId){
		$.ajax({
			url : '${pageContext.request.contextPath}/getBookmarkInfo',
			type : 'GET',
			data : {'memberId': memberId, 'prjBoardId' : boardId},
			success : function(bookmark){

				let bookmarkSpan = $('#task-modal').find('span[name="bookmark-icon"]')
				bookmarkSpan.empty();
				if(bookmark != 0 ){
					let bookmarkImg = `<img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg"> 북마크`;
					bookmarkSpan.prepend(bookmarkImg);
					
				}else{
					let bookmarkImg = `<img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-regular.svg"> 북마크`;
					bookmarkSpan.prepend(bookmarkImg);
				}
			},
			error : function(reject){
				console.log(reject);
			}
		})
	}
	
	// 북마크 등록/해제
	function bookmarkBoard(memberId, projectId, boardId, boardType){
		$.ajax({
			url : '${pageContext.request.contextPath}/bookmarkBoard',
			type : 'GET',
			data : {'memberId': memberId, 'projectId': projectId, 'prjBoardId' : boardId, 'boardType': boardType},
			success : function(bookmark){
				console.log(bookmark)
				getBookmarkInfo(memberId, boardId);
				
				let bookmarkSpan = $('#task-modal').find('span[name="bookmark-icon"]')
				bookmarkSpan.empty();
				
				if(bookmark.checkBookmark == 'bookmark'){
					let bookmarkImg = `<img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg"> 북마크`;
					bookmarkSpan.prepend(bookmarkImg);
				}else{
					let bookmarkImg = `<img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-regular.svg"> 북마크`;
					bookmarkSpan.prepend(bookmarkImg);
				}
			},
			error : function(reject){
				console.log(reject);
			}
		})
	}
	
	
	//북마크
	$('span[data-bookmark]').on('click', function(e) {
		
		console.log(e.currentTarget)
		
		let boardContainer = $(e.currentTarget).parent().parent().parent();
		let prjBoardId = boardContainer.children('input[name="prjBoardId"]').val();
		let boardType = boardContainer.children('input[name="prjBoardId"]').data("boardType");
/* 		console.log(boardContainer.children('input[name="prjBoardId"]'))
		console.log(boardContainer.children('input[name="prjBoardId"]').data())
		console.log(boardContainer.children('input[name="prjBoardId"]').data("boardType"))
		
		console.log(boardContainer.children('input[name="prjBoardId"]').attr("id")) */
		let id= boardContainer.children('input[name="prjBoardId"]').attr("id");
		if(id==="prjScheId"){
			boardType = "C6"
		}else{
			boardType = "C8"
		}
		console.log(boardType)
		let prjId = '${projectInfo.projectId}';
		let memberId = '${memberInfo.memberId}';
		let bookmark = $(e.currentTarget).data('bookmark');
		let data = {'memberId': memberId, 'projectId': prjId, 'prjBoardId': prjBoardId, 'boardType':boardType};
		
		console.log(data)
		if(bookmark == 'no') {
			if(confirm('이 게시글을 북마크 하시겠습니까?')) {
				$.ajax({
					url : '${pageContext.request.contextPath}/insertBookmark',
					type : 'POST',
					data : {'memberId': memberId, 'projectId': prjId, 'prjBoardId': prjBoardId, 'boardType':boardType},
					success : function() {
						$.ajax({
							url : '${pageContext.request.contextPath}/getBookmarkByMe',
							type : 'POST',
							data : {'memberId': '${memberInfo.memberId}', 'projectId': '${projectInfo.projectId}'},
							success : function(pinProjects) {
								let bookmarkUl = $('.bookmark-board-contets ul');
								
								bookmarkUl.empty();
								
								if(pinProjects.length != 0) {
									for(let i=0; i<pinProjects.length; i++) {
										let pinProject = pinProjects[i];
										
										let bookmarkList = `
											<li>
												<img class="pin-board-icon" alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg" style="margin-right: 10px;">
												<a href="#\${pinProject.boardType}\${pinProject.prjBoardId}" style="width: 100%">
													<img class="pin-board-icon" src="${pageContext.request.contextPath }/resources/icon/\${pinProject.boardIconName}" alt="게시글 아이콘">
													<span>\${pinProject.prjBoardTitle}</span>									
												</a>
											</li>`;
											
										bookmarkUl.append(bookmarkList);	
									}
								} else {
									let noBookmark = `<span style="font-size: var(--font-micro);">북마크 된 게시글이 없습니다.</span>`;
									
									bookmarkUl.append(noBookmark);
								}
								$(e.currentTarget).find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg');								
								$(e.currentTarget).data('bookmark', 'yes');
							},
							error : function(reject) {
								console.log(reject);
							}
						})
					},
					error : function(reject) {
						console.log(reject);
					}
				});	
			}
		}else if(bookmark == 'yes') {
			if(confirm('북마크를 해제 하시겠습니까?')) {
				$.ajax({
					url : '${pageContext.request.contextPath}/deleteBookmark',
					type : 'POST',
					data : {'memberId': memberId, 'projectId': prjId, 'prjBoardId': prjBoardId, 'boardType':boardType},
					success : function() {
						$.ajax({
							url : '${pageContext.request.contextPath}/getBookmarkByMe',
							type : 'POST',
							data : {'memberId': '${memberInfo.memberId}', 'projectId': '${projectInfo.projectId}'},
							success : function(pinProjects) {
								let bookmarkUl = $('.bookmark-board-contets ul');
								bookmarkUl.empty();
								
								if(pinProjects.length != 0) {
									for(let i=0; i<pinProjects.length; i++) {
										let pinProject = pinProjects[i];
										
										let bookmarkList = `
											<li>
												<img class="pin-board-icon" alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg" style="margin-right: 10px;">
												<a href="#\${pinProject.boardType}\${pinProject.prjBoardId}" style="width: 100%">
													<img class="pin-board-icon" src="${pageContext.request.contextPath }/resources/icon/\${pinProject.boardIconName}" alt="게시글 아이콘">
													<span>\${pinProject.prjBoardTitle}</span>									
												</a>
											</li>`;
											
										bookmarkUl.append(bookmarkList);	
									}
								} else {
									let noBookmark = `<span style="font-size: var(--font-micro);">북마크 된 게시글이 없습니다.</span>`;
									
									bookmarkUl.append(noBookmark);
								}
								
								$(e.currentTarget).find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-regular.svg').data('data-bookmark', 'no');
								$(e.currentTarget).data('bookmark', 'no');
							},
							error : function(reject) {
								console.log(reject);
							}
						})
					},
					error : function(reject) {
						console.log(reject);
					}
				})
			}
			
		}
	});
	
	//모달 폼 리셋
	$('#selectModal, #scheModal').on('hidden.bs.modal', function (e) {
		$(this).find('form')[0].reset();
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
	
	/* //일정입력/수정 시 알람시간 부여
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
        
    }); */
	//var today = new Date();
	//var month = ('0'+(today.getMonth()+1)).substr(-2);
	//var day = ('0'+today.getDate()).substr(-2);
	
	//tdl line 추가
	$(document).on('click', '.addTdlLine', function(){
		console.log("yes")
		if($(this).parent().parent().parent().attr("class")==="div_block"){
			console.log()
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
	
	//todoLIst 진행도 자동 계산(진행)
	$('.tdlList-view').on('click', 'input[type="checkbox"]', function(e) {
		let target = e.target
		console.log(target)
		let tdlItemId = target.parentNode.getAttribute('id').substr(6)
		console.log(tdlItemId)
		let success = null;
		if($(target).is(':checked')){
			success = "A1"
			console.log(success)
		}else{
			success = "A2"
			console.log(success)
		}
		let data = {'itemId' : tdlItemId, 'success' : success}
		$.ajax({
			url:'${pageContext.request.contextPath}/updateTdlItem',
			method:'POST',
			data:JSON.stringify(data),
			contentType : 'application/json',
			success:function(result){
				console.log(result)
				//진행도 설정
				let optionLength = $('.tdlList-view input[type="checkbox"]').length
				let checkedNum = 0;
				$('.tdlList-view input[type="checkbox"]').each(function(index, element){
					let checked = $(element).prop("checked");
					if(checked){
						checkedNum += 1;
					}
				})
				let bar = (checkedNum/optionLength)*100;
				let percent = Math.floor(bar)
				$('.progress-bar__line').css('width',percent+'%').text(percent+'%')
			},
			error:function(err){
				console.log(err)
			}
		});
	});
	
	
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
					text : '일정/업무',
					click : loadscheTask
				},
				taskBtn : {
					text : 'TDL',
					click : loadTdlView
				},
				allBtn : {
					text : '전체조회',
					click : loadPriSche
				}
			},
			headerToolbar : {
				left : 'prev,today,next dayGridMonth,timeGridWeek',
				center : 'title',
				right : 'tdlBtn,myCustomButton scheBtn,taskBtn,allBtn'
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
		//일정/업무 조회
		function loadscheTask(){
			$.ajax({
				  url: "${pageContext.request.contextPath}/scheTaskView",
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
		//tdl조회 
		function loadTdlView(){
			$.ajax({
				  url: "${pageContext.request.contextPath}/tdlView",
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
    		let w = "W"
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
	    				console.log(result)
	    				tdlModal.show();
	    				//조회모달 띄우기
	    				$('#tdlBody').attr("class","div_hidden");
	    				$('#tdlView').attr("class","div_block");
	    				/* //inputTag 읽기전용으로/제목넣기, 해당날짜넣기,id값넣기
	    				$('#tdlFormView input').prop("readonly",true); */
	    				//제목
	    				$('#tdlFormView span[name="listTitle"]').empty();
	    				$('#tdlFormView .tdlviewtitle span').prop('hidden',false)
	    				$('#tdlFormView span[name="listTitle"]').text(result.todoList[0].listTitle);
	    				$('#tdlFormView input[name="listTitle"]').val(result.todoList[0].listTitle).prop('hidden', true);
	    				//작성일자
	    				$('#tdlFormView span[name="regDate"]').text(result.todoList[0].listRegdate);
	    				//날짜 조회
	    				let applyDate = result.todoList[0].applyDate.substr(0,10);
	    				$('#tdlFormView .applyDate').text(applyDate).prop('hidden',false)
	    				$('#datetimepicker6').val(applyDate).prop('hidden',true).datetimepicker('destroy');
	    				$('#listId').val(result.todoList[0].listId);
    					$('.tdlList-view').append('')
    					//ITEM항목 생성
	    				for(let i = 0; i<result.item.length;i++){
							let divTag = $('<div></div>')
							let labelTag = $('<label></label>').attr("for","input-"+result.item[i].itemId)
							let chkBoxTag = $('<input>').attr("type", "checkbox").attr("id", "input-"+result.item[i].itemId);
							if(result.item[i].success==="A1"){
								chkBoxTag.prop("checked",true);
							}
							let inputTag = $('<input>').attr("type", "text").attr("name", "content");
							let delBtn = $('<img>').attr("class","tdlLineDeleteBtn").attr("src","${pageContext.request.contextPath }/resources/icon/minusCircleBtn.svg").attr("alt","minus SVG").attr("width","20").attr("height","20");
							divTag.append(chkBoxTag)
							labelTag.append(inputTag)
							divTag.append(labelTag)
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
	    	}else if(scheId.substr(0,1)===w){
    			//업무일 경우
	    		let memberId = '${memberInfo.memberId}'
				let boardId = scheId.substr(1);
	    		console.log(boardId)
				$.ajax({
					url:'${pageContext.request.contextPath}/getTaskBoardInfo',
					method : 'GET',
					data : {"prjBoardId" : boardId},
					dataType : 'JSON',
					success : function(taskData){
						console.log(taskData)
						let prjBoardId = boardId
						let taskInfo = $('#task-modal');
						$(taskInfo).addClass('modal-task-visible');
						// 클릭한 업무 업무
						let highTask = taskData.highTask[0];
						// 업무 담당자 리스트
						let highManagers = taskData.highManager;
						// 하위 업무리스트
						let subTasks = taskData.subTask;
						
						//초기화
						taskInfo.find('.board-content').children().remove();
						taskInfo.find('div[data-state]').children('button').removeClass('active');
						taskInfo.find('.processivity-value').css('width', "0%");
						
						$('#task-modal').data('tasktype', 'high');	
						
						taskInfo.find('input[name="prjBoardId"]').val(prjBoardId);
						
						// 클릭한 업무 정보
						console.log(taskData)
				     	//북마크 여부 조회   board-footer   data-bookmark   img
				     	if(taskData.markedUserId=="yes"){
							$('.task-modal__content span[data-bookmark]').find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg');								
							$('.task-modal__content span[data-bookmark]').data('bookmark', 'yes');
				     	}else if(taskData.markedUserId=="no"||taskData.markedUserId===null){
							$('.task-modal__content span[data-bookmark]').find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-regular.svg');								
							$('.task-modal__content span[data-bookmark]').data('bookmark', 'no');
				     	}
						
						
						//이름
						taskInfo.find('div[data-memberName]').text(highTask.memberName);
						//프로필
						let profileImg = taskInfo.find('.profileImg');
						if (highTask.realProfilePath == null) {
							profileImg.attr('src', '${pageContext.request.contextPath }/resources/img/user.png');
						} else {
							profileImg.attr('src', '${pageContext.request.contextPath}/images/' + highTask.realProfilePath);
						}
						
						profileImg.attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
						//작성일자
						taskInfo.find('span[data-regdate]').text(highTask.prjBoardRegdate);
						//제목
						taskInfo.find('span[data-title]').text(highTask.prjBoardTitle);
						//업무번호
						taskInfo.find('div[data-hightaskid]').text('업무 번호 ' + highTask.taskId);
						// 기간
				        if(taskData.highTask[0].startDate != null) {
				        	taskInfo.find('span[data-start]').text(highTask.startDate);
							taskInfo.find('span[data-end]').text(highTask.endDate);
				        }else {
				        	taskInfo.find('span[data-start]').text("상위업무 시작일과 동일");
							taskInfo.find('span[data-end]').text(highTask.endDate);
				        }
						//우선순위
						 if(highTask.priorityName != null) {
							 taskInfo.find('div[data-priority]').text('우선순위 : ' + highTask.priorityName);
				        }else {
				        	taskInfo.find('div[data-priority]').remove();
				        }
						// 진행상태 버튼 활성화
		                taskInfo.find('div[data-state]').children('button[value=' + highTask.state + ']' ).addClass('active');
		                //진척도
		                if( highTask.processivity == null) {
		                	highTask.processivity = 0;
		                }
		                
		                taskInfo.find('.processivity-value').css('width', highTask.processivity + "%");
		                taskInfo.find('span[data-processivityvalue]').text(highTask.processivity + "%");
		                
						//내용
						if(highTask.prjBoardSubject != null) {
							taskInfo.find('.board-content').prepend(highTask.prjBoardSubject);	
						}
						
						// 업무 담당자 
						let manager = taskInfo.find('.task-manager');
						manager.children('span:not(:eq(0))').empty();
						
						if(highManagers.length >1) {
							manager.append('<span>' + highManagers[0].memberName + ' 외 ' + (highManagers.length-1) + '명</span>');	
				     	} else if(highManagers.length == 0) {
				     		manager.append('<span>없음</span>');
				     	} else {
				     		manager.append('<span>' + highManagers[0].memberName + '</span>');
				     	} 
						
						// 하위 업무 리스트
			     		taskInfo.find('span[data-subtaskcount]').empty();
			     		taskInfo.find('.sub-task-list').empty();
				     	
				     	let countSpan = taskInfo.find('span[data-subtaskcount]');
				     	let subTaskList = taskInfo.find(".sub-task-list");
						// 하위 업무 갯수 
						if(subTasks.length != 0){
				     		countSpan.text(subTasks.length);
						}
				     	// 정보 입력
				        for (let j = 0; j < subTasks.length; j++) {
				        	let subTask = subTasks[j];
							let li = $('<li class="sub-task-item">');
				        	let subState = $('<span class="sub-state">');
				        	let subTitle = $('<span class="sub-title">');
						
				        	subState.text(subTask.stateName);
				        	subTitle.text(subTask.prjBoardTitle);
				        	
							li.append(subState);
							li.append(subTitle);
							
							subTaskList.append(li);
				        }
				     	
				     	// 메뉴
				     	$('.update-task-btn').attr('data-id', prjBoardId);
				     	$('.delete-task-btn').attr('data-id', prjBoardId);
				     	
				     	// 작성자만 메뉴 버튼 활성화
				     	let boardMemberId = highTask.memberId;
				     	let memberId = '${memberInfo.memberId}'
				     	let menu = `\${boardMemberId == memberId ? 
			        			`<img class="task-menu-btn cursor" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">` 
			        			: ''}`;
		        			
				     	$('div[name="boardMenu"]').empty();
				     	$('div[name="boardMenu"]').append(menu);
						
				     	//댓글 정보		     	
				     	getCommentList(prjBoardId, 'C8');
				     	
						// 좋아요 여부 / 좋아요 전체 수
						getPrjLike('${memberInfo.memberId}', prjBoardId);
						
						// 좋아요 등록/해제
						$('span[name="prjLike"]').on('click', function() {
						    likeBoard('${memberInfo.memberId}', prjBoardId, 'C8');
						});
						
						// 북마크 정보
						getBookmarkInfo('${memberInfo.memberId}', prjBoardId);
				     	
					},
					error : function(error){
						console.log(error)
					}
				});
			}else if(scheId.substr(0,1)!==t||scheId.substr(0,1)!==w){
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

			let nowTimeAfter = nowYear+'-'+nowMonth+'-'+nowDate+' '+afterhours+':'+after;
			$('#datetimepicker1').val(nowTime);
			$('#datetimepicker2').val(nowTimeAfter);
			$('#editor1').val('')
			editor1.setData('');
			$('.ck-reset_all, .ck-editor__main').css('display', 'block');
			
		};
		//날짜 클릭시 일정 입력모달창
		function addPrivateSche(arg) {
			//모달창 띄우기
	        scheModal.show();
			$('#scheForm input,textarea').prop("required", true).prop("readonly", false);
			$('#scheForm input').eq(3).prop("readonly",true);
			//해당 날짜가져오기
    		let time = hours+":"+minutes
			$('#datetimepicker1').val(arg.startStr+" "+time);
			$('#datetimepicker2').val(arg.endStr+" "+time);
			//내용 초기화
			$('#editor1').val('');
			editor1.setData('');
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
			$('#tdlFormInsert input[name="listTitle"]').prop("required",true);
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
			$('#tdlFormView span[name="listTitle"]')
			//제목
			$('#tdlFormView .tdlviewtitle span').prop('hidden',true)
			$('#tdlFormView input[name="listTitle"]').prop('hidden',false).focus();
			//날짜
			$('#tdlFormView .applyDate').prop("hidden",true);
			$('#datetimepicker6').prop("hidden",false);
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
	for(let i =1; i<3; i++) {
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