<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.full.min.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
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
	
	.fc .fc-button-primary {
	    background-color: var(--color-dark-beigie);
	    border: none !important;
	    color: var(--color-dark-grey);
	    transition: all 0.5s;
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
	
	.fc-timeGridWeek-button {
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
    
    	
	.fc .fc-button-primary:not(:disabled).fc-button-active:focus, .fc .fc-button-primary:not(:disabled):active:focus {
    	box-shadow: none;
    }
	
	.fc-scheBtn-button {
		width: 70px;
		height: 32px;
		line-height: 15px;
		padding: 0 !important;
		font-size: var(--font-micro) !important;
		background-color: rgb(249, 166, 52, 0.7) !important;
		border: none !important;
		transition: all 0.5s;
		color: white !important;
	}
	
	.fc-scheBtn-button:hover, .fc-scheBtn-button:focus, .fc-scheBtn-button.active {
		background-color: rgb(249, 166, 52) !important;
	}
	
	
	.fc-taskBtn-button {
		width: 70px;
		height: 32px;
		line-height: 15px;
		padding: 0 !important;
		font-size: var(--font-micro) !important;
		background-color: rgb(156, 187, 58, 0.7) !important;
		border: none !important;
		transition: all 0.5s;
		color: white !important;
	}
	
	.fc-taskBtn-button:hover, .fc-taskBtn-button:focus, .fc-taskBtn-button.active {
		background-color: rgb(156, 187, 58) !important;
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
	
	
	
	
	
	
	
	.modal-prjSche-visible {
		display: block !important;
	}
	
	#prjSche-modal, #prjTask-modal, #boardUpdateModal{
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
	/* 일정 수정 모달  */
	.modal {
		left: 0;
	}
	.insert-board-modal {
		border: 1px solid var(--color-dark-beigie);
	    border-radius: 20px;
	    width : 50%;
	    height: 720px;
	    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
	    margin: 5px auto;
	    background-color: white;
	}
	
	.insert-board-modal-header {
		margin: 30px 30px 0 30px;
	}
	
	.insert-board-modal-title {
		display: flex;
		align-items: center;
		justify-content: space-between;
		font-weight: var(--weight-bold);
		color: var(--color-dark-grey);
	}
	
	.insert-board-list {
		display: flex;
		align-items: center;
		justify-content: space-between;
		text-align: center;
	}
	
	.insert-list-item {
		flex-grow: 1;
		cursor: pointer;
		transition: all 0.5s;
		margin-top: 15px;
		font-size: var(--font-micro);
	    color: var(--color-dark-grey);
	    padding: 5px 0;
	    border-bottom: 2px solid var(--color-dark-beigie);
	}
	
	.insert-list-item:hover {
		border-bottom: 2px solid var(--color-dark-red);
	}
	
	.dis-none {
		display: none;
	}
	
	.d-b {
		display: block !important;
	}
	.insert-board-area {
		overflow: scroll;
		overflow-x: hidden;
		max-height: 550px;
	}
	
	.insert-board-area::-webkit-scrollbar, .pin-board::-webkit-scrollbar, .bookmark-board-contets::-webkit-scrollbar {
	    width: 10px;
	  }
	  .insert-board-area::-webkit-scrollbar-thumb, .pin-board::-webkit-scrollbar-thumb, .bookmark-board-contets::-webkit-scrollbar-thumb {
	    background-color: #2f3542;
	    border-radius: 10px;
	    background-clip: padding-box;
	    border: 2px solid transparent;
	    background-color: var(--color-dark-beigie);
	  }
	  .insert-board-area::-webkit-scrollbar-track, .pin-board::-webkit-scrollbar-track, .bookmark-board-contet::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
	    background-color: var(--color-dark-beigie);
	  }
	
	.board-form {
		margin: 10px 30px 0;
		color: var(--color-dark-grey);
		
	}
	
	.board-form-title {
		width: 100%;
		height: 50px;
		border-bottom: 1px solid var(--color-dark-beigie);
		padding: 0 10px;
		margin-bottom: 20px;
	}
	
	.ck.ck-list__item .ck-button {
	    width: 90% !important;
	}
	
	.ck-editor__editable {
	    min-height: 700px;
	}
	
	.modal-footer {
		margin: 0 30px;
		display: block;
		text-align: right;
	}
	
	.modal-footer-select {
		width : 200px;
		height : 40px;
		border : 1px solid var(--color-dark-beigie);
	}
	
	.modal-footer-btn {
		width: 100px;
		height: 50px;
		border-radius: 5px;
		background-color: var(--color-dark-beigie);		
		color: var(--color-light-grey);	
		transition: all 0.5s;
		font-size: var(--font-micro);
		margin-bottom: 20px;
	}
	
	.modal-footer-btn:hover {
		background-color: var(--color-dark-red);	
		color: white;
	}
	
	.board-state {
		text-align: left;
	}
	
	.board-state label {
		width: 70px;
		height: 14px;
		background-color: var(--color-dark-beigie);
		padding: 10px;
		border-radius: 5px;
		color: white;
		font-weight: var(--weight-bold);
		line-height: 14px;
		cursor: pointer;
		text-align: center;
		margin: 0 10px;
		margin-bottom: 20px;
	}
	
	.board-state input:checked + label {
		background-color: var(--color-dark-red);
		border: 3px solid var(--color-dark-red);
	}
	.sche__search{
		margin : 20px 0;
		cursor: default;
	}
	.board-comment {
	    padding: 5px 40px;
	    border-top: 1px solid var(--color-dark-beigie);
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    color: var(--color-dark-grey);
	}
	.board-comment img {
	    margin: 10px 20px 10px 0;
	}
	.profileImg{
	    width: 40px;
	    height: 40px;
	    border-radius: 10px;
	}
	
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
	
	#prjTask-modal div[data-state] button.active {
	    background-color: var(--color-dark-red);
	}
</style>
</head>
<!-- full calendar  -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- ckeditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<!-- 사진 업로드를 위한 ckfinder -->
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<!-- 본문 -->
<body>
	<div class="calander-main-box">
		<div style="text-align: right;">
			<input type="text" placeholder="제목과 내용을 검색하세요." class="header__search sche__search">
		</div>
		<div id="calendar-container">
			<div id="calendar">
			</div>
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
					<input type="text" class="memberId" hidden="true">
				</div>
			</div>
			<div class="board-title">
				<div>
					<span>[일정]</span><input type="text" class="board-title-boardTitle">
				</div>
				<div class="sche-particir-list">
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
					<span class="board-footer-icon" name="prjLike"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg" style="padding-right: 5px;"><span></span></span>
					<span class="board-footer-icon" data-bookmark="no"><img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-regular.svg"> 북마크</span>
				</div>
				<div>
					<span class="board-footer-info">댓글 <span name="commentCount"></span></span>
					<span class="board-footer-info">좋아요 <span name="likeCount"></span></span>
				</div>
			</div>
			<!-- 댓글 -->
			<div name="board-comment-box">
			</div>
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
		<input type="hidden" value="" name="prjBoardId">
		<div class="prjTask-modal__content">
			<input type="text" id="prjTaskId" hidden="true">
			<input type="hidden" value="" name="prjBoardId">
			<div class="board-header">
				<div class="board-header-info">
					<img src="${pageContext.request.contextPath}/resources/img/user.png" alt="기본 프로필 사진" class="profile">
					<div class="board-headder-info__memberName"></div>
					<input type="text" class="board-headder-info__regDate">
				</div>
				<div>
					<!-- <img class="board-header-btn" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg"> -->
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
					<input type="hidden" name="processivity">
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
					<span class="board-footer-icon" name="prjLike"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg" style="padding-right: 5px;"><span></span></span>
					<span class="board-footer-icon" data-bookmark="no"><img alt="북마크 아이콘"
							src="/hi/resources/icon/bookmark-regular.svg"> 북마크</span>
				</div>
				<div>
					<span class="board-footer-info">댓글 <span name="commentCount"></span></span>
					<span class="board-footer-info">좋아요 <span name="likeCount"></span></span>
				</div>
			</div>
			<!-- 댓글 구현 -->
			<div name="board-comment-box">
			</div>
		</div>
		<!-- board 버튼 클릭 시 모달 -->
		<div class="d-none" data-boardmodal>
			<div class="board-modal-content">
				<p data-type="update">게시글 수정</p>
				<p data-type="delete">게시글 삭제</p>
			</div>			
		</div>
	</div>
	
	<!-- 일정 수정 모달 -->
	<div class="modal modalBoard" tabindex="-1" id="boardUpdateModal">
		<div class="insert-board-modal">
			<!-- 공통 양식 -->
		    <div class="insert-board-modal-header">
			   	<!-- 모달페이지 띄우기 위함 -->
			   	<input type="hidden" class="modal-dialog d-none">
				<input type="hidden" class="modal-content d-none">
			   	<div class="insert-board-modal-title">
			   		<div>일정 수정</div>		
			   		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			   	</div>
			   	<input type="hidden" name="memberId" value="${memberInfo.memberId }" id="memberId">
				<input type="hidden" name="projectId" value="${projectInfo.projectId}" id="projectId">
				<input type="hidden" value="" name="prjBoardId" id="prjBoardId">
			</div>
			<!-- 일정 작성 폼!!! -->
			<form action="${pageContext.request.contextPath }/prjScheUpdate" method="post" class="d-b" id="sche" name="sche">
				<div class="insert-board-area">
					<div class="board-form" >
						<input type="text" name="prjBoardId" hidden="true">
						<input type="text" class="board-form-title" name="prjBoardTitle" placeholder="제목을 입력하세요.">
						<div class="m-bt">
							<label for="startDate">시작일 : </label>
							<input type="text" name="startDate" class="date-input startDate" data-date autocomplete="off">
							
							<label for="endDate">마감일 : </label>
							<input type="text" name="endDate" class="date-input endDate" disabled autocomplete="off">
						</div>
						<div class="d-flex m-bt" style="justify-content: flex-start;">
							<div>
								<label>장소 : </label>
								<input type="text" placeholder="일정 장소를 설정해주세요." id="scheAddr" name="scheAddr">
								<input type="text" id="scheAddrDetail" name="scheAddrDetail" placeholder="상세주소" disabled>
							</div>
							<select name="alarmDateCode">
								<option value="" selected>알림 설정</option>
								<option value="L1">10분 전 미리 알림</option>
								<option value="L2">1시간 전 미리 알림</option>
								<option value="L3">1일 전 미리 알림</option>
								<option value="L4">7일 전 미리 알림</option>
							</select>
						</div>
						<textarea name="prjBoardSubject" placeholder="내용을 입력하세요." id="editor7"></textarea>
					</div>
			    </div>
			       
			    <div class="modal-footer">
					<select name="inspYn" class="modal-footer-select">
						<option value="E2">전체 공개</option>
						<option value="E1">프로젝트 관리자만</option>
					</select>
					<input type="hidden" name="boardType" value="C6">
		       		<input type="hidden" name="projectId" value="${projectInfo.projectId}">
	            	<button type="submit" class="modal-footer-btn" data-bs-dismiss="modal">수정</button>
				</div>
			</form>
	    </div>
	</div>
	
	<!-- 업무 수정 모달 -->
	
	
	<!-- 업무 담당자 모달 -->
	<div id="taskManager-modal">
		<div class="taskManager-modal-content">
			<div class="d-flex taskManager-modal-title">
				<span>담당자</span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
			</div>
			<div id="managers"></div>
		</div>			
	</div>
	
	<!-- 일정 참여자 모달 -->
	<div id="scheParticr-modal">
		<div class="scheParticr-modal-content">
			<div class="d-flex scheParticr-modal-title">
				<span></span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
			</div>
			<div id="particirs"></div>
		</div>			
	</div>
</body>
<!-- 상세조회 헤더 버튼 클릭 시 모달 페이지 -->
<script >
	//상세정보 모달페이지 출력
	$('.board-header-btn').on('click', function(e) {
		let modal = $(e.currentTarget).parent().parent().parent().parent().find('div[data-boardmodal]');
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

	$('#boardUpdateModal').on('click',function(e){
		e.stopPropagation();
		if ($(e.target).is('#boardUpdateModal')) {
	        $('#boardUpdateModal').removeClass('d-b');
	    }
	})

	
	$('.board-modal-content p').on('click', function(e) {
		e.stopPropagation();
		
		let memberId = '${memberInfo.memberId}'
		let writer = $('.memberId').val();
		if(memberId!==writer){
			alert("작성자만 수정 가능합니다.");
			return;
			
		}else{
			let boardContainer = $(e.currentTarget).closest('.board-container');
			let boardId = boardContainer.data('id');
			let prjId = '${projectInfo.projectId}';
			let type = $(e.currentTarget).data('type');
			
			if(type == 'update') {
				$('#boardUpdateModal').addClass("d-b")
				updateSche(e);
			}else if(type == 'delete') {
				deleteSche();
			};
		};
	});
	
	// 일정 수정 폼
    function updateSche(e){
		//일정수정
		$('.insert-board-modal-title div').text("일정 수정");
		//수정버튼
		$('.modal-footer button[type="submit"]').text("수정")
		let scheId = $('#prjScheId').val()
		let prjBoardIdInput = $('#prjBoardId');
		let prjId = '${projectInfo.projectId}';
		
		let boardUpdateModal = $('#boardUpdateModal');
		let sche = boardUpdateModal.find('form[name="sche"]');
		
		prjBoardIdInput.val(scheId);
		$.ajax({
			url:'getScheBoardInfo',
			method:'GET',
			data: {"prjBoardId" : scheId},
			dataType:"JSON",
			success:function(result){
				$('.board-form input[name="prjBoardId"]').val(result.boardVO.prjBoardId)
				//제목
				$('.board-form-title').val(result.boardVO.prjBoardTitle); 
				$('.board-form input[name="startDate"]').val(result.scheVO.startDate);
				$('.board-form input[name="endDate"]').val(result.scheVO.endDate);
				$('.board-form input[name="scheAddr"]').val(result.scheVO.scheAddr);
				$('.board-form input[name="scheAddrDetail"]').val(result.scheVO.scheAddrDetail);
				$('.board-form select[name="alarmDateCode"]').val(result.scheVO.alarmDateCode);
				editor7.setData(result.boardVO.prjBoardSubject);
				//ckeditor값 넣기
			},
			error : function(err){
				console.log(err)
			}
		});
	};
	
	//일정 삭제하기
	function deleteSche(){
		let scheId = $('#prjScheId').val()
		
		if (confirm("삭제하시겠습니까?") == true){ 
		   $.ajax({
			  url : 'deleteSche',
			  method : 'GET',
			  data : {"prjBoardId":scheId},
			  success : function(result){
				  if(result==3){
					  alert("삭제완료")
				  };
					$('div[data-boardmodal]').attr('class','d-none');
				//상세조회 모달 끄기
				$('#prjSche-modal').removeClass('modal-prjSche-visible');
				  renderAll();
			  },
			  error : function(err){
				  console.log(err)
			  }
		   });
		}else{
		   console.log("취소되었습니다");
		}
	};
	
	// 댓글 리스트
	function getCommentList(boardId, boardType){
		$.ajax({
			url : '${pageContext.request.contextPath}/projectCmtList',
			type : 'GET',
			data : {'boardId' : boardId, 'boardType': boardType},
			success : function(comments){
				let boardCommentBox = $('.prjTask-modal__content').find('div[name="board-comment-box"]');
				let scheBoardCommentBox = $('.prjSche-modal__content').find('div[name="board-comment-box"]');
				boardCommentBox.empty();
				scheBoardCommentBox.empty();
				
				if(comments.length != 0) {
					for(let i =0; i<comments.length; i++) {
						let boardComment =`
							<div class="board-comment" data-cmtid="\${comments[i].commentId }">
								<div class="d-flex">
									<img src="${pageContext.request.contextPath}/images/\${comments[i].realProfilePath }" alt="회원 프로필 사진" class="profileImg" onerror="this.src='${pageContext.request.contextPath}/resources/img/user.png'">
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
	$('span[name="prjLike"]').on('click', function(e){
		let boardIdInputTag = $(e.currentTarget).parent().parent().parent().find('input[hidden="true"]').eq(0)
		let boardId = boardIdInputTag.val()
		let boardType;
		if(boardIdInputTag.attr('id')==="prjTaskId"){
			boardType = "C8";
		}else if(boardIdInputTag.attr('id')==="prjScheId"){
			boardType = "C6";
		}
		let memberId = '${memberInfo.memberId}';
		$.ajax({
			url : '${pageContext.request.contextPath}/likeBoard',
			type : 'GET',
			data : {'memberId': memberId, 'boardId' : boardId, 'boardType': boardType},
			success : function(like){
				// 게시글 좋아요 수
				getPrjLike(memberId, boardId);
				
				let likeSpan = $('span[name="prjLike"] span');
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
	})
	
	
	// 좋아요 정보
	function getPrjLike(memberId, boardId){
		$.ajax({
			url : '${pageContext.request.contextPath}/getPrjLike',
			type : 'GET',
			data : {'memberId': memberId, 'boardId' : boardId},
			success : function(likeInfo){
				// 게시글 좋아요 수
				$('span[name="likeCount"]').text(likeInfo.boardLike.length);
				
				// 좋아요 여부
				let likeSpan = $('span[name="prjLike"] span');
				likeSpan.empty();
				
				if(likeInfo.memberLike != null) {
					likeSpan.append("좋아요 해제");
				} else {
					likeSpan.append("좋아요");
				}
			},
			error : function(reject){
				console.log(reject)
			}
		})
	};
	
	//북마크 기능
	$('span[data-bookmark]').on('click', function(e) {
		let boardIdInputTag = $(e.currentTarget).parent().parent().parent().find('input[hidden="true"]').eq(0)
		let prjBoardId = boardIdInputTag.val()
		let boardType;
		if(boardIdInputTag.attr('id')==="prjTaskId"){
			boardType = "C8";
		}else if(boardIdInputTag.attr('id')==="prjScheId"){
			boardType = "C6";
		}
		let prjId = '${projectInfo.projectId}';
		let memberId = '${memberInfo.memberId}';
		let bookmark = $(e.currentTarget).data('bookmark');
		let data = {'memberId': memberId, 'projectId': prjId, 'prjBoardId': prjBoardId, 'boardType':boardType};
		if(bookmark == 'no') {
			if(confirm('이 게시글을 북마크 하시겠습니까?')) {
				$.ajax({
					url : '${pageContext.request.contextPath}/insertBookmark',
					type : 'POST',
					data : {'memberId': memberId, 'projectId': prjId, 'prjBoardId': prjBoardId, 'boardType':boardType},
					success : function() {
						$(e.currentTarget).find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg');								
						$(e.currentTarget).data('bookmark', 'yes');
						
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
						$(e.currentTarget).find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-regular.svg').data('data-bookmark', 'no');
						$(e.currentTarget).data('bookmark', 'no');
						
					},
					error : function(reject) {
						console.log(reject);
					}
				})
			}
			
		}
	});
	
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
    	let projectId = ${projectInfo.projectId}

    	$.ajax({
    		url : 'searchCalendar',
    		method : 'GET',
    		data : {"projectId" : projectId, "searchKeyword" : searchKeyword},
    		dataType : 'JSON',
    		success : function(result){
				calendar.removeAllEvents();
				calendar.addEventSource(result.scheList);
				calendar.addEventSource(result.taskList);
    			
    		},
    		error : function(err){
    			console.log(err)
    		}
    		
    	});
    };
    
    $('.btn-close').on('click', function(e) {
    	$('#boardUpdateModal').removeClass('d-b');
    });
</script>

<script>

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

	//업무 게시글 진행상태 변경
	$('#prjTask-modal div[data-state] button').on('click', function(e) {
		let boardContainer = $('#prjTask-modal');
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
	
	//업무 게시글 진척도 변경
	$('.processivity').on("click", function(e) {
		updateProcessivity(e);
		
		let boardContainer = $('#prjTask-modal');
		let prjBoardId = boardContainer.find('input[name="prjBoardId"]').val();
		let processivity = boardContainer.find('input[name=processivity]').val();		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/updateTaskInfo',
			type:'POST',
			data: {'prjBoardId' : prjBoardId, 'processivity' : processivity},
			error : function(reject) {
				console.log(reject);
			}
		})
	});
</script>


<!-- 캘린더 js -->
<script>
	function renderAll(){
		let projectId = ${projectInfo.projectId}
		$.ajax({
			url : 'projectCalendarRender',
		    method: 'GET',
		    dataType: 'JSON',
		    data : {"projectId" : projectId},
		    success : function(result){
				calendar.removeAllEvents();
				calendar.addEventSource(result.scheList);
				calendar.addEventSource(result.taskList);
				calendar.getEventSources()
		    },
		    error : function(error){
		    	
		    }
		});
	};
	function scheFilter(){
		let projectId = ${projectInfo.projectId}
		$.ajax({
			url : 'projectCalendarRender',
		    method: 'GET',
		    dataType: 'JSON',
		    data : {"projectId" : projectId},
		    success : function(result){
				calendar.removeAllEvents();
				calendar.addEventSource(result.scheList);
		    },
		    error : function(error){
		    	
		    }
		});
	}
	function taskFilter(){
		let projectId = ${projectInfo.projectId}
		$.ajax({
			url : 'projectCalendarRender',
		    method: 'GET',
		    dataType: 'JSON',
		    data : {"projectId" : projectId},
		    success : function(result){
				calendar.removeAllEvents();
				calendar.addEventSource(result.taskList);
		    },
		    error : function(error){
		    	
		    }
		});
	}
	
	//초기 버튼 설정
	$(window).on('load', function(e) {
		$('.fc-viewBtn-button').addClass('active');
	});
	
	//캘린더 조건 버튼
	$(document).on('click', '.fc-scheBtn-button,.fc-taskBtn-button, .fc-viewBtn-button ', function(e) {
		$(e.currentTarget).parent().find(".active").removeClass("active");
		$(e.currentTarget).addClass("active");
	});
	
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
					text : '일정',
					click : scheFilter
				},
				taskBtn : {
					text : '업무',
					click : taskFilter
				},
				viewBtn : {
					text : '전체',
					click : renderAll,
				},
				today : {
					text : '월 선택'					
				}
			},
			headerToolbar : {
				left : 'prev,today,next dayGridMonth,timeGridWeek',
				center : 'title',
				right : 'scheBtn,taskBtn,viewBtn'
			},
			dayCellContent: function (info) {
			    var number = document.createElement("a");
			    number.classList.add("fc-daygrid-day-number");
			    number.innerHTML = info.dayNumberText.replace("일", '').replace("日","");
			    if (info.view.type === "dayGridMonth") {
			      return {
			        html: number.outerHTML
			      };
			    }
			    return {
			      domNodes: []
			    };
			},
			locale : "ko",
			navLinks : false, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : insertSche,
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
		

		//일정 입력
		function insertSche(arg){
			$('.insert-board-modal-title div').text("일정 입력");
			$('#boardUpdateModal').addClass("d-b");
			
			//제목초기화
			$('.board-form-title').val("");
			//주소 초기화
			$('#scheAddr').val("");
			$('#scheAddrDetail').val("");
			//선택날짜로 입력값 넣기
			let now = new Date();
			let hours = now.getHours();
			let minutes = now.getMinutes();
			let nowTime = hours+":"+minutes
			
			$('.board-form input[name="startDate"]').val(arg.startStr+" "+nowTime);
			$('.board-form input[name="endDate"]').val(arg.endStr+" "+nowTime);
			$('.modal-footer button[type="submit"]').text("입력")
			calendar.unselect();
		};
		
		
		//날짜 클릭시 상세조회
		function eventClickHandler(info){
			let memberId = '${memberInfo.memberId}'
			let boardId = info.event.id
			if(boardId.substr(0,1)==="t"){
				boardId = boardId.substr(1);
				$.ajax({
					url:'getTaskBoardInfo',
					method : 'GET',
					data : {"prjBoardId" : boardId},
					dataType : 'JSON',
					success : function(result){
						
						$('input[name="prjBoardId"]').val(result.highTask[0].prjBoardId);
						
				     	//북마크 여부 조회 
				     	if(result.markedUserId=="yes"){
							$('.prjTask-modal__content span[data-bookmark]').find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg');								
							$('.prjTask-modal__content span[data-bookmark]').data('bookmark', 'yes');
				     	}else if(result.markedUserId=="no"||result.markedUserId===null){
							$('.prjTask-modal__content span[data-bookmark]').find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-regular.svg');								
							$('.prjTask-modal__content span[data-bookmark]').data('bookmark', 'no');
				     	}
				     	
						$('#prjTask-modal').find('input[name="prjBoardId"]').val(boardId);					     	
						$('#prjTask-modal').addClass('modal-prjSche-visible');
						$('#prjTaskId').val(result.highTask[0].prjBoardId)
						//프사 확인
						let realPath = result.highTask[0].realProfilePath
						if(result.realProfilePath!==null){
							let profilePath = "${pageContext.request.contextPath}/images/"+realPath
							$('.profile').attr("src", profilePath)
							$('.profile').attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
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
						$('.prjTask-modal__content div[data-state]').children('button').removeClass('active');
						$('.prjTask-modal__content div[data-state]').children('button[value=' + result.highTask[0].state + ']' ).addClass('active');
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
				     	$('.task-manager').find('span:not(:eq(0))').remove();
				     	if(result.highManager.length >1) {
				     		$('.d-flex').find('.task-manager').append('<span>' + result.highManager[0].memberName + ' 외 ' + (result.highManager.length-1) + '명</span>');	
				     	} else if(result.highManager.length == 0) {
				     		$('.d-flex').find('.task-manager').append('<span>없음</span>');
				     	} else {
				     		$('.d-flex').find('.task-manager').append('<span>' + result.highManager[0].memberName + '</span>');
				     	};
				     	//업무 내용
				     	$('.board-content div').children().remove();
				     	$('.board-content div').append(result.highTask[0].prjBoardSubject);
				     	// 하위 업무 리스트
				     	if(result.subTask.length == 0) {
				     		$('.prjTask-modal__content').find('span[data-subtaskcount]').text("0");
				     		return;
				     	}else{
					     	let countSpan = $('.prjTask-modal__content').find('span[data-subtaskcount]');
					     	let subTaskList = $('.prjTask-modal__content').find(".sub-task-list");
							// 하위 업무 갯수 
					     	countSpan.text(result.subTask.length);
					     	subTaskList.find('li').remove();
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
				     	//댓글조회
				     	getCommentList(result.highTask[0].prjBoardId, 'C8')

				     	//좋아요 조회
				     	getPrjLike(memberId, boardId)
				     	
					},
					error : function(error){
						console.log(error)
					}
				});
			}else if(boardId.substr(0,1)!=="t"){
				$('.board-content div').children().remove();
				$.ajax({
					url:'getScheBoardInfo',
					method:'GET',
					data: {"prjBoardId" : boardId},
					dataType:"JSON",
					success:function(result){
						
				     	//북마크 여부 조회   board-footer   data-bookmark   img
				     	if(result.markedUserId=="yes"){
							$('.prjSche-modal__content span[data-bookmark]').find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg');								
							$('.prjSche-modal__content span[data-bookmark]').data('bookmark', 'yes');
				     	}else if(result.markedUserId=="no"||result.markedUserId===null){
							$('.prjSche-modal__content span[data-bookmark]').find('img').attr('src', '${pageContext.request.contextPath }/resources/icon/bookmark-regular.svg');								
							$('.prjSche-modal__content span[data-bookmark]').data('bookmark', 'no');
				     	}
						
						$('#prjScheId').val(result.boardVO.prjBoardId);
						$('.memberId').val(result.boardVO.memberId)
						$('#prjSche-modal').addClass('modal-prjSche-visible');
						$('.board-headder-info__memberName').text(result.memberName)
						$('.board-headder-info__regDate').val(result.boardVO.prjBoardRegdate)
						let realPath = result.realProfilePath;
						//프사 확인
						if(result.realProfilePath!==null){
							let profilePath = "${pageContext.request.contextPath}/images/"+realPath;
							$('.profile').attr("src", profilePath);
							$('.prifile').attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
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
						//댓글 조회
				     	getCommentList(result.boardVO.prjBoardId, 'C6')
						//좋아요 조회
				     	getPrjLike(memberId, boardId)
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
		

		//일정 수정 데이터 보내기
		$(document).on('submit', 'form[name="sche"]', function(e){
			e.preventDefault();
			let boardRequestVO = {};
			let boardVO ={};
			let scheVO = {};
			
			let projectId = $('#projectId').val();
			let memberId = $('#memberId').val();
			
			let prjBoardId = $('.board-form input[name="prjBoardId"]').val();
			let prjBoardTitle = $('.board-form-title').val();
			let scheAddr = $('.board-form input[name="scheAddr"]').val();
			let scheAddrDetail = $('.board-form input[name="scheAddrDetail"]').val();
			let alarmDateCode = $('.board-form select[name="alarmDateCode"]').val();
			let prjBoardSubject = editor7.getData();
			//ckeditor 값 넣기
			
			//버튼의 text를 확인후 수정과 입력으로 나눠서 진행
			let btnText = $('.modal-footer button[type="submit"]').text();
			if(btnText==="수정"){
				//날짜 수정
				let startDate = $('.board-form input[name="startDate"]').val();
				let endDate = $('.board-form input[name="endDate"]').val();
				boardVO = {prjBoardId, prjBoardTitle, prjBoardSubject};
				scheVO = {startDate, endDate, scheAddr, scheAddrDetail,alarmDateCode};
				boardRequestVO = {boardVO, scheVO}
				$.ajax({
					url : '${pageContext.request.contextPath}/prjScheUpdate',
					method : 'POST',
					data : JSON.stringify(boardRequestVO),
					contentType:'application/json',
					success:function(data){
						alert('정상적으로 수정되었습니다.');
						$('div[data-boardmodal]').attr('class','d-none');
						$('.sche-addr span[class="sche-addr__info"]').remove();
						//상세조회 모달 끄기
						$('#prjSche-modal').removeClass('modal-prjSche-visible');
						$('#boardUpdateModal').removeClass('d-b');
						renderAll();
					},error: function(reject) {
						console.log(reject);
					}
				});
			}else if(btnText==="입력"){
				if(prjBoardTitle===""||prjBoardTitle===null){
					alert("제목을 입력하세요")
					$('.board-form-title').focus();
					return;
				}
				let boardType = 'C6'
				let startDate = $('.board-form input[name="startDate"]').val();
				let endDate = $('.board-form input[name="endDate"]').val()
				
				boardVO = {prjBoardTitle, prjBoardSubject, projectId, memberId, boardType};
				scheVO = {startDate, endDate, scheAddr, scheAddrDetail, alarmDateCode};
				boardRequestVO = {boardVO, scheVO}

				$.ajax({
					url : '${pageContext.request.contextPath}/calInsertSche',
					method : 'POST',
					data : JSON.stringify(boardRequestVO),
					contentType : 'application/json',
					success : function(result){
						$('div[data-boardmodal]').attr('class','d-none');
						$('.sche-addr span[class="sche-addr__info"]').remove();
						//상세조회 모달 끄기
						$('#prjSche-modal').removeClass('modal-prjSche-visible');
						$('#boardUpdateModal').removeClass('d-b');
						renderAll();
					},
					error : function(err){
						console.log(err);
					}
				});
			}
		});

		
		// 시작일자, 마감일자 범위 선택하기
		$(document).on('click', 'input[data-date]', function(e) {
			//startDate 클릭 시
			if($(e.currentTarget).hasClass('startDate')) {
				let startDate = $(e.currentTarget);
				let endDate = startDate.siblings('.endDate');
				
				// 시작일
				startDate.datetimepicker({
					format:'Y-m-d H:i',
					lang:'kr',
					onSelectDate:function() {
						endDate.prop('disabled', false);
					}
				});
				
				// 마감일
				endDate.datetimepicker({
					format:'Y-m-d H:i',
					lang:'kr',
					// 오늘 이후로 선택 가능하게 설정
					onShow:function(){
						let date = new Date(startDate.val());
						date.setDate(date.getDate() + 1);
						
						this.setOptions({
							minDate:startDate.val()?date:false
						})
					}
				});
			} //endDate 클릭 시 
			else if($(e.currentTarget).hasClass('endDate')) {
				let endDate = $(e.currentTarget);
				
				endDate.datetimepicker({
					format:'Y-m-d H:i',
					// 오늘 이후로 선택 가능하게 설정
					minDate: 0
				});
			}
		});
		
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

<!-- 게시글 작성 SCRIPT -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//ckeditor 시작
	let editor7;
		CKEDITOR.ClassicEditor.create(document.querySelector('#editor7'), {
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
	   	 	editor7 = newEditor;
	    }).catch(error => {
	        console.error(error );
	    });	
	//ckeditor 종료
	
	//다음 주소 api
	$('#scheAddr').on('click', function() {
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
				document.getElementById("scheAddr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("scheAddrDetail").focus();
			}
		}).open();
	});
	//다음 주소 api 종료
	
	
	// 업무 담당자 리스트
	$(document).on('click', '.task-manager', function(e){
		let prjBoardId = $('#prjTaskId').val();
		let x = e.clientX -500 ;
		let y = e.clientY;
		
		$('.taskManager-modal-content').css('left', x + 'px');
		$('.taskManager-modal-content').css('top', y + 'px');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/getManager',
			type : 'GET',
			data : {'prjBoardId' : prjBoardId},
			success : function(managers) {
				let managerDiv = $('#managers');
				managerDiv.empty();
				
				if(managers.length != 0) {
					//멤버 리스트 태그 만들기
					for(let i=0; i<managers.length; i++) {
						//div태그
						let employeeDiv = document.createElement('div');
						employeeDiv.classList.add('flex');
						employeeDiv.classList.add('employee');
						//이미지 태그
						let employeeProfile = document.createElement('img');
						employeeProfile.setAttribute('alt', '회원사진');
						employeeProfile.classList.add('employee-img');
						if(managers[i].realProfilePath != null) {
							employeeProfile.src = "${pageContext.request.contextPath}/images/"+managers[i].realProfilePath;
						}else {
							employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
						}
						employeeProfile.attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
						//스팬 태그
						let span = document.createElement('span');
						span.innerText = managers[i].memberName;
						//히든 인풋 태그 (멤버id값)
						let input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.value = managers[i].memberId;
						//태그 삽입
						employeeDiv.append(employeeProfile);
						employeeDiv.append(span);
						employeeDiv.append(input);
						
						managerDiv.append(employeeDiv);
					}
				} else {
					let noManagerDiv = document.createElement('div');
					noManagerDiv.classList.add('noManager');
					noManagerDiv.innerText = '담당자가 존재하지 않습니다.';
					
					managerDiv.append(noManagerDiv);
				}
			},
			error : function(reject) {
				console.log(reject);
			}
		});
		$('#taskManager-modal').addClass('particir-visible');
	})
	
	$('[id*=modal]').on('click', function() {
		$('.particir-visible').removeClass('particir-visible');
	});
	
	
	//일정 참여자
	
	$(document).on("click", ".sche-particir-list span", function(e) {
		let boardId = $('#prjScheId').val();
		console.log(boardId)
		let scheSpan = $(e.currentTarget);
		let x = e.clientX - 300;
		let y = e.clientY;
		
		$('.scheParticr-modal-content').css('left', x + 'px');
		$('.scheParticr-modal-content').css('top', y + 'px');
		
		if(scheSpan.hasClass('sche-particir')) {
			$('.scheParticr-modal-title').text('참석자');
			getScheParticirList(boardId, 'A1');
		}else {
			$('.scheParticr-modal-title').text('불참자');
			getScheParticirList(boardId, 'A2');
		}
		$('#scheParticr-modal').addClass('particir-visible');
	});
	
	function getScheParticirList(prjBoardId, commonCode) {
		$.ajax({
			url : '${pageContext.request.contextPath}/getParticir',
			type : 'GET',
			data : {'prjBoardId' : prjBoardId, 'attendance' : commonCode},
			success : function(particirs) {
				let particirDiv = $('#particirs');
				particirDiv.empty();
				
				if(particirs.length != 0) {
					//멤버 리스트 태그 만들기
					for(let i=0; i<particirs.length; i++) {
						//div태그
						let employeeDiv = document.createElement('div');
						employeeDiv.classList.add('flex');
						employeeDiv.classList.add('employee');
						//이미지 태그
						let employeeProfile = document.createElement('img');
						employeeProfile.setAttribute('alt', '회원사진');
						employeeProfile.classList.add('employee-img');
						if(particirs[i].realProfilePath != null) {
							employeeProfile.src = "${pageContext.request.contextPath}/images/"+particirs[i].realProfilePath;
						}else {
							employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
						}
						employeeProfile.attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
						//스팬 태그
						let span = document.createElement('span');
						span.innerText = particirs[i].memberName;
						//히든 인풋 태그 (멤버id값)
						let input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.value = particirs[i].memberId;
						//태그 삽입
						employeeDiv.append(employeeProfile);
						employeeDiv.append(span);
						employeeDiv.append(input);
						
						particirDiv.append(employeeDiv);
					}
				} else {
					let noParticirDiv = document.createElement('div');
					noParticirDiv.classList.add('noManager');
					noParticirDiv.innerText = '인원이 존재하지 않습니다.';
					
					particirDiv.append(noParticirDiv);
				}
			},
			error : function(reject) {
				console.log(reject);
			}
		});
	}
	
</script>
</html>