<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link href="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/dateTimePicker/jquery.datetimepicker.full.min.js"></script>
	
	<style>
	input:-webkit-autofill {
		webkit-box-shadow: 0 0 0 1000px white inset;
		box-shadow: 0 0 0 1000px white inset;
	}
	
	a {
	    text-decoration: none;
	    color: var(--color-dark-beige);
	}
	
	.board-insert-btn {
		display: block;
		float: right;
		margin:20px 15% 30px 0;
		width: 15%;
		height: 40px;
		border-radius: 5px;
		background-color: var(--color-dark-beigie);		
		color: var(--color-light-grey);	
		font-weight: var(--weight-bold);
		transition: all 0.5s;
	}
	
	.board-insert-btn:hover {
		background-color: var(--color-dark-red);
		color: white;
	}
	
	.board-container{
		border: 1px solid var(--color-beigie);
	    border-radius: 20px;
	    width : 70%;
	    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
	    margin: 30px auto;
	    clear: both;
	}
	
	.profile {
		width: 40px;
		height: 40px;
		border-radius: 10px;
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
	
	.board-header-btn {
		cursor: pointer;
		padding-left: 10px;
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
	
	.f-start {
		justify-content: flex-start;
	}
	
	
	.board-title span {
		color: var(--color-blue);
	}
	
	.board-content{
		margin: 30px 40px;
		font-size: var(--font-micro);
		color: var(--color-dark-grey);	
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
	
	.board-footer-icon:hover {
		color: var(--color-dark-red);
		cursor: pointer;
	}
	
	.board-footer-info {
		margin-left: 10px;
	}
	
	.board-comment {
	
	}
	
	.comment-input {
		border-top: 1px solid var(--color-dark-beigie);
		padding: 20px 40px;	
		display: flex;
		align-items: center;
		position: relative;
	}
	
	.comment-input input{
		width: 90%;
		height: 40px;
		border: 1px solid var(--color-dark-beigie);
		border-radius: 5px;
		margin-left: 20px;
	}
	
	.comment-input button {
		width: 50px;
		height: 30px;
		position: absolute;
		top: 25px;
		right: 60px;
		border-radius: 5px;
		background-color: var(--color-dark-beigie);		
		color: var(--color-light-grey);	
		transition: all 0.5s;
		font-size: var(--font-micro);
	}
	
	.comment-input button:hover {
		background-color: var(--color-dark-red);	
		color: white;
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
	
	.voteContent {
		margin: 0 40px;
		margin-bottom: 30px;
	}
	
	.voteContent-info {
		text-align: right;
		font-size: var(--font-micro);
	}
	
	.anonyVote {
		color: var(--color-light-blue);
		margin-left: 20px;
	} 
	
	.compnoVote{
		color: var(--color-dark-red);
	}
	
	.vote-lists input {
		display: none;
	}
	
	.vote-lists label {
		cursor: pointer;
		width: 15px;
		height: 15px;
		border: 3px solid var(--color-light-red);
		border-radius: 50%;
		position: relative;
		transition: all 0.3s;
		margin-right: 10px;
	}
	
	.vote-lists input:checked + label {
		background-color: var(--color-dark-red);
		border: 3px solid var(--color-dark-red);
	}
	
	.vote-lists img {
		width: 15px;
		height: 15px;
		line-height: 10px;
		position: absolute;
		top: 0;
		right: 0;
	}
	
	.vote-list {
		display: flex;
		align-items: center;
		justify-content: flex-start;
		padding: 5px 10px;
		background-color: rgba(240, 240, 240, 0.2);
		margin: 5px;
		border-radius: 5px;
	}
	
	.vote-btn {
		margin-top: 20px;
		text-align: center;
		transition: all 0.3s;
	}
	
	.vote-btn button {
		width: 70px;
		height: 35px;
		background-color: var(--color-light-red);
		border-radius: 5px;
		color: white;
		font-weight: var(--weight-bold);
	}
	
	
	.board-title div[data-hightaskid] {
		font-size: var(--font-micro);
		padding: 5px;
		border: 1px solid var(--color-dark-red);
		border-radius: 5px;
		color: var(--color-dark-red);
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
		width: 30px;
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
	
	.modalBoard{
	    top:0;
	    left:0;
	}
	
	.insert-board-modal {
		border: 1px solid var(--color-dark-beigie);
	    border-radius: 20px;
	    width : 50%;
	    height: 850px;
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
	
	.insert-board-area::-webkit-scrollbar {
	    width: 10px;
	  }
	  .insert-board-area::-webkit-scrollbar-thumb {
	    background-color: #2f3542;
	    border-radius: 10px;
	    background-clip: padding-box;
	    border: 2px solid transparent;
	  }
	  .insert-board-area::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
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
	
	.add-taskManager-select{
		width: 130px;
		height: 30px;
		border: 1px solid var(--color-dark-beigie);
		background-color: white;
		color: var(--color-dark-grey);
		font-size: var(--font-micro);
		margin-left: 20px;
	}
	
	.add-taskManager-select option:disabled {
		color: var(--color-light-white);
	}
	
	.board-taskManager {
		margin-bottom: 20px;
	}
	
	.board-taskManager span {
		margin-right: 10px;
	}
	
	.add-manager-btn {
		text-decoration: underline;
		color: var(--color-blue);
		cursor: pointer;
	}
	
	.startDate, .endDate {
		width: 200px;
		height: 30px;
		border: 1px solid var(--color-dark-beigie) !important;
		color: var(--color-dark-grey);
		font-size: var(--font-micro);
		margin-right: 20px;
	}
	
	.progress-bar {
		background-color: var(--color-light-white);
		width: 300px;
		height: 20px;
		border-radius:5px;
		margin: 10px;
	}
	
	.progress-bar-size {
		width: 1%;
		height: 20px;
		border-radius:5px;
		background-color: var(--color-green);
		transition: all 0.5s;
	}
	
	.progress-value {
		width: 20px;
	}
	
	.js-progress {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-right: 60px;
		margin: 10px 0;
	}
	
	.board-progress {
		display: flex;
		align-items: center;
	}
	
	.select-priority {
		display: flex;
		align-items: center;
	}
	
	select[name=priority] {
		width: 100px;
		height: 30px;
		border: 1px solid var(--color-dark-beigie);
		background-color: white;
		color: var(--color-dark-grey);
		font-size: var(--font-micro);
		margin-left: 20px;
	}
	
	.board-sub-task {
		margin: 20px 30px;
	}
	
	.add-sub-task-btn {
		text-decoration: underline;
		color: var(--color-blue);
		cursor: pointer;
	}
	
	.sub-task-manager input, .sub-task-manager select {
		width: 200px;
		height: 30px;
		border: 1px solid var(--color-dark-beigie) !important;
		color: var(--color-dark-grey);
		font-size: var(--font-micro);
	}
	
	.board-sub-task-title {
		color: var(--color-dark-grey);
		font-weight: var(--weight-bold);
		font-size: var(--font-small);
		margin-bottom: 10px;
	}
	
	.m-bt {
		margin-bottom: 10px;
	}
	</style>
</head>
<body>
	<!-- ckeditor -->
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
	<!-- 사진 업로드를 위한 ckfinder -->
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
	
	<!-- 게시글 출력 HTML -->
	<div style="display : flex;">
		<div style="width: 65%;">
			<button type="button" class="board-insert-btn" data-bs-toggle="modal" data-bs-target="#boardInsertModal">게시글 작성</button>
			<!-- 게시글 조회 -->
			<c:forEach items="${boards }" var="board">
				<!-- C5 일반 게시글 -->
				<c:if test="${board.boardType eq 'C5'}">
					<div data-list="board" data-type="${board.boardType}" data-id="${board.prjBoardId }" class="board-container">
						<div class="board-header">
							<div class="board-header-info">
								<c:if test="${board.realProfilePath eq null }">
									<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
								</c:if>
								<c:if test="${board.realProfilePath ne null }">
									<img src="${pageContext.request.contextPath}/images/${board.realProfilePath }" alt="기본 프로필 사진" class="profile">
								</c:if>
								<div class="board-headder-info__memberName">${board.memberName } </div>
								<fmt:formatDate value="${board.prjBoardRegdate }" pattern="yyyy-MM-dd hh:mm"/>
							</div>
							<div>
							<img class="board-header-btn" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">
							</div>
						</div>
						<div class="board-title">
							<div>
								<span>[일반]</span> ${board.prjBoardTitle }
							</div>
						</div>
						<div class="board-content">
							${board.prjBoardSubject }
						</div>
						<div class="board-footer">
							<div >
								<span class="board-footer-icon"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg"> 좋아요</span>
								<span class="board-footer-icon"><img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg"> 북마크</span>
							</div>
							<div>
								<span class="board-footer-info">댓글 7</span>
								<span class="board-footer-info">좋아요 14</span>
							</div>
						</div>
						<c:if test="ㄴㅇㄹ">
							<div>
								댓글 더보기
							</div>
							<!-- for each로 최신 댓글 2개만 -->
								<div class="board-comment">
									<div>
										<img alt="#" src="#">
										<div>
											<div>
												회원정보
											</div>
											<div>
												댓글내용
											</div>
										</div>
									</div>
									<div>
										<a href="#">수정</a>
										<a href="#">삭제</a>
									</div>
								</div>
							<!-- 여기까지 -->	
						</c:if>
						<div class="comment-input">
							<c:if test="${memberInfo.realProfilePath eq null }">
								<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
							</c:if>
							<c:if test="${memberInfo.realProfilePath ne null }">
								<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="profile">
							</c:if>
								<input type="text" placeholder="댓글을 입력해주세요."><button type="button">등록</button>
						</div>
					</div>
				</c:if>
	
				<!-- C6 일정-->
				<c:if test="${board.boardType eq 'C6'}">
					<div data-list="board" data-type="${board.boardType}" data-id="${board.prjBoardId }" class="board-container">
						<div class="board-header">
							<div class="board-header-info">
								<c:if test="${board.realProfilePath eq null }">
									<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
								</c:if>
								<c:if test="${board.realProfilePath ne null }">
									<img src="${pageContext.request.contextPath}/images/${board.realProfilePath }" alt="기본 프로필 사진" class="profile">
								</c:if>
								<div class="board-headder-info__memberName">${board.memberName } </div>
								<fmt:formatDate value="${board.prjBoardRegdate }" pattern="yyyy-MM-dd hh:mm"/>
							</div>
							<div>
							<img class="board-header-btn" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">
							</div>
						</div>
						<div class="board-title">
							<div>
								<span>[일정]</span> ${board.prjBoardTitle }
							</div>
							<div>
								<span class="sche-particir">참석 2</span>
								<span class="sche-nonParticir">불참 3</span>
							</div>
						</div>
						<div class="sche-date">
							<span class="text">기간 : </span>
							<span data-start></span>
							<span> ~ </span>
							<span data-end></span>
						</div>
						<div class="board-content">
							<div>
								${board.prjBoardSubject }
							</div>
						</div>
						<div class="sche-btns">
							<button type="button" class="btn-green">참석</button>
							<button type="button">불참</button>
						</div>
						<div class="board-footer">
							<div >
								<span class="board-footer-icon"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg"> 좋아요</span>
								<span class="board-footer-icon"><img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg"> 북마크</span>
							</div>
							<div>
								<span class="board-footer-info">댓글 7</span>
								<span class="board-footer-info">좋아요 14</span>
							</div>
						</div>
						<c:if test="ㄴㅇㄹ">
							<div>
								댓글 더보기
							</div>
							<!-- for each로 최신 댓글 2개만 -->
								<div class="board-comment">
									<div>
										<img alt="#" src="#">
										<div>
											<div>
												회원정보
											</div>
											<div>
												댓글내용
											</div>
										</div>
									</div>
									<div>
										<a href="#">수정</a>
										<a href="#">삭제</a>
									</div>
								</div>
							<!-- 여기까지 -->	
						</c:if>
						<div class="comment-input">
							<c:if test="${memberInfo.realProfilePath eq null }">
								<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
							</c:if>
							<c:if test="${memberInfo.realProfilePath ne null }">
								<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="profile">
							</c:if>
								<input type="text" placeholder="댓글을 입력해주세요."><button type="button">등록</button>
						</div>
					</div>
				</c:if>
				
				<!-- C7 투표 -->
				<c:if test="${board.boardType eq 'C7'}">
					<div data-list="board" data-type="${board.boardType}" data-id="${board.prjBoardId }" class="board-container">
						<div class="board-header">
							<div class="board-header-info">
								<c:if test="${board.realProfilePath eq null }">
									<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
								</c:if>
								<c:if test="${board.realProfilePath ne null }">
									<img src="${pageContext.request.contextPath}/images/${board.realProfilePath }" alt="기본 프로필 사진" class="profile">
								</c:if>
								<div class="board-headder-info__memberName">${board.memberName } </div>
								<fmt:formatDate value="${board.prjBoardRegdate }" pattern="yyyy-MM-dd hh:mm"/>
							</div>
							<div>
							<img class="board-header-btn" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">
							</div>
						</div>
						<div class="board-title">
							<div>
								<span>[투표]</span> ${board.prjBoardTitle }						
							</div>
							<div>
								<span class="sche-particir">참여인원 2</span>
							</div>
						</div>
						<div class="sche-date">
							<span class="text">투표 마감일 : </span>
							<span> ~ </span>
							<span data-end></span>
						</div>
						<div class="board-content">
							<div>
								${board.prjBoardSubject }
							</div>
						</div>
						<div class="voteContent">
							<div class="voteContent-info">
								<span class="compnoVote"></span>
								<span class="anonyVote"></span>
							</div>
							<div class="vote-lists">
								<ul>
								</ul>
							</div>
							<div class="vote-btn">
								<button type="button" disabled>투표</button>
							</div>
						</div>
						<div class="board-footer">
							<div >
								<span class="board-footer-icon"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg"> 좋아요</span>
								<span class="board-footer-icon"><img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg"> 북마크</span>
							</div>
							<div>
								<span class="board-footer-info">댓글 7</span>
								<span class="board-footer-info">좋아요 14</span>
							</div>
						</div>
						<c:if test="ㄴㅇㄹ">
							<div>
								댓글 더보기
							</div>
							<!-- for each로 최신 댓글 2개만 -->
								<div class="board-comment">
									<div>
										<img alt="#" src="#">
										<div>
											<div>
												회원정보
											</div>
											<div>
												댓글내용
											</div>
										</div>
									</div>
									<div>
										<a href="#">수정</a>
										<a href="#">삭제</a>
									</div>
								</div>
							<!-- 여기까지 -->	
						</c:if>
						<div class="comment-input">
							<c:if test="${memberInfo.realProfilePath eq null }">
								<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
							</c:if>
							<c:if test="${memberInfo.realProfilePath ne null }">
								<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="profile">
							</c:if>
								<input type="text" placeholder="댓글을 입력해주세요."><button type="button">등록</button>
						</div>
					</div>
				</c:if>
				
				<!-- C8 업무 -->
				<c:if test="${board.boardType eq 'C8'}">
					<div data-list="board" data-type="${board.boardType}" data-id="${board.prjBoardId }" class="board-container">
						<div class="board-header">
							<div class="board-header-info">
								<c:if test="${board.realProfilePath eq null }">
									<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
								</c:if>
								<c:if test="${board.realProfilePath ne null }">
									<img src="${pageContext.request.contextPath}/images/${board.realProfilePath }" alt="기본 프로필 사진" class="profile">
								</c:if>
								<div class="board-headder-info__memberName">${board.memberName } </div>
								<fmt:formatDate value="${board.prjBoardRegdate }" pattern="yyyy-MM-dd hh:mm"/>
							</div>
							<div>
							<img class="board-header-btn" src="${pageContext.request.contextPath }/resources/icon/ellipsis-vertical-solid.svg">
							</div>
						</div>
						<div class="board-title">
							<div>
								<span>[업무]</span> ${board.prjBoardTitle }
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
								${board.prjBoardSubject }
							</div>
						</div>
						<div class="sub-task-lists">
							<div class="sub-task-lists-title">하위업무 <span data-subtaskcount></span></div>
							<div class="sub-task-list">
							</div>
						</div>
						<div class="board-footer">
							<div >
								<span class="board-footer-icon"><img alt="좋아요 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg"> 좋아요</span>
								<span class="board-footer-icon"><img alt="북마크 아이콘" src="${pageContext.request.contextPath }/resources/icon/bookmark-solid.svg"> 북마크</span>
							</div>
							<div>
								<span class="board-footer-info">댓글 7</span>
								<span class="board-footer-info">좋아요 14</span>
							</div>
						</div>
						<c:if test="ㄴㅇㄹ">
							<div>
								댓글 더보기
							</div>
							<!-- for each로 최신 댓글 2개만 -->
								<div class="board-comment">
									<div>
										<img alt="#" src="#">
										<div>
											<div>
												회원정보
											</div>
											<div>
												댓글내용
											</div>
										</div>
									</div>
									<div>
										<a href="#">수정</a>
										<a href="#">삭제</a>
									</div>
								</div>
							<!-- 여기까지 -->	
						</c:if>
						<div class="comment-input">
							<c:if test="${memberInfo.realProfilePath eq null }">
								<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="profile">
							</c:if>
							<c:if test="${memberInfo.realProfilePath ne null }">
								<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="profile">
							</c:if>
								<input type="text" placeholder="댓글을 입력해주세요."><button type="button">등록</button>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>	
				<!-- 게시글 조회 끝 -->
		<div style="width: 25%;">
			<h1>북마크 공간~~</h1>
		</div>
	</div>
	
	<!-- 게시글 출력 SCRIPT -->
	<script> 
		//투표 항목 선택 시 버튼 색상 변경 && 복수 투표 여부
		function checkBtn(e) {
			let checkBox = $(e).closest('.vote-lists').find('input[type=checkbox]');
			let voteBtn = $(e).closest('.vote-lists').next().children('button');
			let compnoSpan = $(e).closest('.vote-lists').prev().children('.compnoVote');
			let count = $(e).closest('.vote-lists').find('input[type=checkbox]:checked').length;
			let isChecked = false;
			
			for(let i=0; i<checkBox.length; i++) {
				if(checkBox[i].checked == true) {
					isChecked = true;
				}	
			}
			
			if(isChecked) {
				voteBtn.css('background-color', 'var(--color-dark-red)');
				voteBtn.attr("disabled", false);
			} else {
				voteBtn.css('background-color', 'var(--color-light-red)');
				voteBtn.attr("disabled", true);
			}
			
			if(compnoSpan.text() == '') { //단일 투표
				if(count > 1) {
					alert('한개의 항목만 투표 가능합니다.');
					$(e).prop("checked", false);
				}	
			}
		}; 
			
		// 게시글 조회
		$(window).on('DOMContentLoaded', function() {
			let boardList = $('[data-list="board"]');
			
			for(let i=0; i<boardList.length; i++) {
				if (boardList[i].dataset.type == 'C6') {
					//일정
					$.ajax({
						url : '${pageContext.request.contextPath}/getScheInfo',
						type : 'GET',
						data : {'prjBoardId' : boardList[i].dataset.id},
						success : function(sche) {
							 let startDate = $(boardList[i]).find('span[data-start]');
			                 let endDate = $(boardList[i]).find('span[data-end]');
	
			                 startDate.text(sche.startDate);
			                 endDate.text(sche.endDate);
						}, error : function(reject) {
							console.log(reject);
						}
					})
				}else if (boardList[i].dataset.type == 'C7') {
					//투표
					$.ajax({
						url : '${pageContext.request.contextPath}/getVoteInfo',
						type : 'GET',
						data : {'prjBoardId' : boardList[i].dataset.id},
						success : function(voteData) {
							let endDate = $(boardList[i]).find('span[data-end]');
							let compnoVote = $(boardList[i]).find('.compnoVote');
							let anonyVote = $(boardList[i]).find('.anonyVote');
							let voteList = $(boardList[i]).find('.vote-lists ul');
							
							// 종료일
							endDate.text(voteData.voteInfo[0].endDate);
							// 복수 투표 여부
							if (voteData.voteInfo[0].compnoVote == 'A1') {
								compnoVote.text('복수 투표');
							} else if (voteData.voteInfo[0].compnoVote == 'A2') {
								compnoVote.text('');
							}
							// 익명 투표 여부
							if (voteData.voteInfo[0].anonyVote == 'A1') {
								anonyVote.text('익명 투표');
							} else if (voteData.voteInfo[0].anonyVote == 'A2') {
								anonyVote.text('');
							}
							// 투표 항목
							for (let j = 0; j < voteData.voteList.length; j++) {
								//li 태그 생성
								let li = $('<li class="vote-list">');
								let checkbox = $('<input>').attr('onchange', 'checkBtn(this)');
								let label = $('<label>');
								let img = $('<img src="${pageContext.request.contextPath }/resources/icon/check-solid.svg">');
								
								checkbox.attr('type', 'checkbox').attr('id', boardList[i].dataset.id + '-' + voteData.voteList[j].listId);
								label.attr('for', boardList[i].dataset.id + '-' + voteData.voteList[j].listId);
								
								label.append(img);
								li.append(checkbox);
								li.append(label);
								li.append(voteData.voteList[j].listContent);
								
								voteList.append(li);
							}
						}, error : function(reject) {
							console.log(reject);
						}
					});
				} else if (boardList[i].dataset.type == 'C8') {
					//업무
					$.ajax({
						url : '${pageContext.request.contextPath}/getTaskInfo',
						type : 'GET',
						data : {'prjBoardId' : boardList[i].dataset.id},
						success : function(taskData) {
							// 상위 업무 정보
							let highTaskId = $(boardList[i]).find('div[data-hightaskid]');
							let startDate = $(boardList[i]).find('span[data-start]');
			                let endDate = $(boardList[i]).find('span[data-end]');
			                let state = $(boardList[i]).find('div[data-state]');
			                let processivity = $(boardList[i]).find('div[data-processivity]');
			                let processivityValueDiv = $(boardList[i]).find('.processivity-value');
			                let prioriy = $(boardList[i]).find('div[data-prioriy]');
			                let taskManagers = $(boardList[i]).find('.task-manager');
			                let processivityValue = $(boardList[i]).find('span[data-processivityvalue]');
							let highTask = taskData.highTask[0];
							let highManagers = taskData.highManager;
							let subTasks = taskData.subTask;
	
					        // 업무 번호
					        highTaskId.text('업무 번호 ' + taskData.highTask[0].taskId);
					        // 기간
					        startDate.text(taskData.highTask[0].startDate);
			                endDate.text(taskData.highTask[0].endDate);
			                // 진행상태 버튼 활성화
			                state.children('button[value=' + highTask.state + ']' ).css('background-color', 'var(--color-dark-red)');
			                //진척도
			                processivityValueDiv.css('width', highTask.processivity + "%");
			                processivityValue.text(highTask.processivity + "%");		                
			             	// 우선 순위
					        prioriy.text('우선순위 : ' + highTask.priorityName);
					     	// 상위 업무 담당자
					     	if(highManagers.length >1) {
					     		taskManagers.append('<span>' + highManagers[0].memberName + ' 외 ' + (highManagers.length-1) + '명</span>');	
					     	} else if(highManagers.length == 0) {
					     		taskManagers.append('<span>없음</span>');
					     	} else {
					     		taskManagers.append('<span>' + highManagers[0].memberName + '</span>');
					     	} 
					     	
					     	// 하위 업무 리스트
					     	if(subTasks.length == 0) {
					     		$(boardList[i]).find('.sub-task-lists').empty();
					     		return;
					     	}
					     	
					     	let countSpan = $(boardList[i]).find('span[data-subtaskcount]');
					     	let subTaskList = $(boardList[i]).find(".sub-task-list");
							// 하위 업무 갯수 
					     	countSpan.text(subTasks.length);
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
					    }, error : function(reject) {
							console.log(reject);
						}
					});
				}
			}
		});
	</script>
	<!-- 게시글 출력 종료 -->
	
	<!-- 게시글 작성 HTML -->
	<div class="modal modalBoard" tabindex="-1" id="boardInsertModal">
	<div class="insert-board-modal">
		<!-- 공통 양식 -->
	    <div class="insert-board-modal-header">
	    	<!-- 모달페이지 띄우기 위함 -->
	    	<input type="hidden" class="modal-dialog d-none">
			<input type="hidden" class="modal-content d-none">
	    	<div class="insert-board-modal-title">
	    		<div>게시물 작성</div>		
	    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	    	</div>
	    	<ul class="insert-board-list">
	    		<li class="insert-list-item">글</li>
	    		<li class="insert-list-item">업무</li>
	    		<li class="insert-list-item">일정</li>
	    		<li class="insert-list-item">투표</li>
	    	</ul>
	    	<input type="hidden" name="memberId" value="${memberInfo.memberId }" id="memberId">
			<input type="hidden" name="projectId" value="${projectInfo.projectId}" id="projectId">
		</div>
		<!-- 일반 게시글 작성 폼 -->
		<form action="${pageContext.request.contextPath }/boardInsert" method="post" class="dis-none d-b" id="board">
			<div class="insert-board-area">
				<div class="board-form" >
					<input type="text" class="board-form-title" name="prjBoardTitle" placeholder="제목을 입력하세요.">
					<textarea name="prjBoardSubject" placeholder="내용을 입력하세요." id="editor1"></textarea>
				</div>
	        </div>
	        <div class="modal-footer">
				<select name="inspYn" class="modal-footer-select">
					<option value="E2">전체 공개</option>
					<option value="E1">프로젝트 관리자만</option>
				</select>
				<input type="hidden" name="boardType" value="C5">
         		<input type="hidden" name="projectId" value="${projectInfo.projectId}">
              	<button type="reset" class="modal-footer-btn">임시저장</button>
              	<button type="submit" class="modal-footer-btn" data-bs-dismiss="modal">등록</button>
              	<div><a href="#">임시저장 게시글 보기</a></div>
			</div>
		</form>
        <!-- 게시글 작성 폼 끝!!! -->
		
		<!-- 상위 업무 작성 폼!!! -->
		<form action="${pageContext.request.contextPath }/boardInsert" method="post" class="dis-none" id="task">
			<div class="insert-board-area">
				<div class="board-form" >
					<input type="text" class="board-form-title" name="prjBoardTitle" placeholder="제목을 입력하세요.">
					<div class="board-state">
						<input type="radio" class="btn-check" name="state" value="G1" id="option1" autocomplete="off" checked>
						<label for="option1">요청</label>
						
						<input type="radio" class="btn-check" name="state" value="G2" id="option2" autocomplete="off">
						<label for="option2">진행</label>
						
						<input type="radio" class="btn-check" name="state" value="G3" id="option3" autocomplete="off">
						<label for="option3">피드백</label>
						
						<input type="radio" class="btn-check" name="state" value="G4" id="option4" autocomplete="off">
						<label for="option4">완료</label>
						
						<input type="radio" class="btn-check" name="state" value="G5" id="option5" autocomplete="off">
						<label for="option5">보류</label>
					</div>
					<div>
						<label for="startDate">시작일 : </label>
						<input type="text" name="startDate" class="date-input startDate" data-date>
						
						<label for="endDate">마감일 : </label>
						<input type="text" name="endDate" class="date-input endDate" disabled>
					</div>
					
					<!-- 진척도 -->
					<div class="js-progress create-content-cell">
						<!-- 우선 순위 -->
						<div class="select-priority">
							<div>우선 순위 : </div>
							<select name="priority">
								<option value="">=======</option>
								<option value="F3">낮음</option>
								<option value="F2">보통</option>
								<option value="F1">긴급</option>
							</select>
						</div>
						<!-- 진행율 -->
						<div class="board-progress">
							<div>진행율 : </div>
							<div class="progress-bar">
					       		<div class="progress-bar-size"></div>
							</div>
							<div class="progress-value">0%</div>
							<input type="hidden" name="processivity" value="0">
						</div>
					</div>
					
					<!-- 업무 담당자 -->
					<div class="board-taskManager">
						<span class="add-manager-btn">담당자 추가</span>
						<div class="highManagerList"></div>
					</div>
					<!-- 업무 담당자 끝 -->
					
					<textarea name="prjBoardSubject" placeholder="내용을 입력하세요." id="editor2"></textarea>
				</div>
				
				<!-- 하위업무 등록 -->
				<div class="board-sub-task">
					<div class="board-sub-task-title">하위 업무</div>
					<div class="sub-task-manager"></div>
					<span class="add-sub-task-btn">하위 업무 추가</span>
				</div>
	        </div>
	        
	        <div class="modal-footer">
				<select name="inspYn" class="modal-footer-select">
					<option value="E2">전체 공개</option>
					<option value="E1">프로젝트 관리자만</option>
				</select>
				<input type="hidden" name="boardType" value="C5">
	        		<input type="hidden" name="projectId" value="${projectInfo.projectId}">
	             	<button type="reset" class="modal-footer-btn">임시저장</button>
	             	<button type="button" class="modal-footer-btn" id="btnAddTask" data-bs-dismiss="modal">등록</button>
	             	<div><a href="#">임시저장 게시글 보기</a></div>
			</div>
		</form>
	
		<!-- 일정 작성 폼!!! -->
		<div class="modal-body dis-none" id="sche">
			<form action="boardInsert" method="post">
				<div>
					<label>일정일정</label>
					<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요." required>
				</div>
				<div>
					<label for="startDate">시작일</label>
					<input type="text" name="startDate" class="date-input startDate" data-date>
					<label for="endDate">종료일</label>
					<input type="text" name="endDate" class="date-input endDate" disabled>
				</div>
				<!-- 알람 추가 -->
				<div>
					<textarea class="form__textarea" name="prjBoardSubject" placeholder="내용을 입력하세요." required></textarea>
				</div>
	
				<div>
					<label>공개 범위</label> 
						<select class="form__select" name="inspYn">
							<option value="E2">전체 공개</option>
							<option value="E1">프로젝트 관리자만</option>
						</select>
				</div>
	         	<div class="modal-footer form__button">
		         	<input type="hidden" name="boardType" value="C6">
		         	<input type="hidden" name="projectId" value="${projectInfo.projectId}">
	              	<button type="submit" class="btn btn-primary">등록</button>
	              	<button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	          	</div>
			</form>
       	</div>
	        
	        
		<!-- 투표 작성 폼!!! -->
		<div class="modal-body dis-none" id="vote">
			<form action="boardInsert" method="post">
				<div>
					<label>투표투표</label>
					<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요." required>
				</div>
				<div>
					<textarea class="form__textarea" name="prjBoardSubject" placeholder="내용을 입력하세요." required></textarea>
				</div>
				<div class="vote-add-buttons">            
			   		<input type="text" name="listContent"> <input type="button" class="btnAdd" value="항목 추가"><br>        
			    </div>
				<div>
					<label for="endDate" >투표 종료일</label>
					<input type="text" name="endDate" class="date-input endDate" data-date>
				</div>
				<div class="form-check form-switch">
					<input name="anonyVote" value="A1" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
					<label class="form-check-label" for="flexSwitchCheckDefault">익명 투표</label>
				</div>
				<div class="form-check form-switch">
					<input name="compnoVote" value="A1" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
					<label class="form-check-label" for="flexSwitchCheckDefault">복수 투표</label>
				</div>
				<div class="form-check form-switch">
					<input name="resultYn" value="A1" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
					<label class="form-check-label" for="flexSwitchCheckDefault">결과 나만 보기</label>
				</div>
				<div>
					<label>공개 범위</label> 
					<select class="form__select" name="inspYn">
						<option value="E2">전체 공개</option>
						<option value="E1">프로젝트 관리자만</option>
					</select>
				</div>
				<div class="modal-footer form__button">
					<input type="hidden" name="boardType" value="C7">
					<input type="hidden" name="projectId" value="${projectInfo.projectId}">
				    <button type="submit" class="btn btn-primary">등록</button>
				    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</form>
       	</div>
    </div>
</div>
	
	<!-- ckeditor -->
	<script>
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
	   	});	
	};
	</script>
	<!-- ckeditor 종료 -->
	
	<!-- 게시글 작성 SCRIPT -->
	<script>
		// 게시글 유형 폼 선택
		$('ul.insert-board-list li').click(function(e){
			let target = e.currentTarget.textContent;
			let visibleDiv = $('.d-b');
			if(target == '글') {
				visibleDiv.removeClass('d-b');
				$('#board').addClass('d-b');
			}else if(target == '업무') {
				visibleDiv.removeClass('d-b');
				$('#task').addClass('d-b');
			}else if(target == '일정') {
				visibleDiv.removeClass('d-b');
				$('#sche').addClass('d-b');
			}else if(target == '투표') {
				visibleDiv.removeClass('d-b');
				$('#vote').addClass('d-b');
			}	
		});
		
		// 업무 등록 시작
		//담당자 추가 클릭 시 구성원 불러오고 셀렉트 박스
		$(document).on('click', '.add-manager-btn', function(e) {
			let boardTaskManager = $(e.currentTarget).closest('.board-taskManager');
			let addManagerBtn = $(e.currentTarget);
			let selectBox = $('<select class="add-taskManager-select" onchage="addManager(this)")><option value="" selected disabled>담당자 추가</option></select>');
			
			addManagerBtn.remove();
			
			$.ajax({
		    	url : '${pageContext.request.contextPath}/particirList',
		        type: 'GET',
		        data: {'projectId': "${projectInfo.projectId}"},
		        success: function(particir){
		        	for(let i=0; i<particir.length; i++) {
						let option = $('<option>');
						
						option.val(particir[i].prjParticirId);
						option.text(particir[i].memberName);
						
						selectBox.append(option);
					}
		        },
		        error: function(reject){
		            console.log(reject);
		        }
		    });	
			
			boardTaskManager.prepend(selectBox);
			boardTaskManager.prepend('<span>담당자 : </span>');
		});
		
		//담당자 선택시 스팬 추가
		$(document).on('change', '.add-taskManager-select', function(e) {
			let managerSpan = $('<span>');
			let memberId = `<input type="hidden" name="taskManager">`;
			let selectBox = $(e.currentTarget);
			let checkedOption = selectBox.find('option:checked');
			
			if(selectBox.find('option:disabled').length == 4) {
				managerSpan.text('외 1명');
				selectBox.before(managerSpan);
			}else if (selectBox.find('option:disabled').length > 4) {
				selectBox.prev().remove();
				managerSpan.text('외' + (selectBox.find('option:disabled').length-3) + '명');
				selectBox.before(managerSpan);
			} else {
				managerSpan.text(checkedOption.text());
				selectBox.before(managerSpan);
			}
			//담당자 아이디 저장
			memberId = $(memberId).val(checkedOption.val());
			selectBox.next().append(memberId);
			
			checkedOption.prop('disabled', true);
		});
		
		// 시작일자, 마감일자 범위 선택하기
		$(document).on('click', 'input[data-date]', function(e) {
			//startDate 클릭 시
			if($(e.currentTarget).hasClass('startDate')) {
				let startDate = $(e.currentTarget);
				let endDate = startDate.siblings('.endDate');
				
				// 시작일
				startDate.datetimepicker({
					dateFormat: "yy-MM-dd h:m:s",
					onSelectDate:function() {
						endDate.prop('disabled', false);
					}
				});
				
				// 마감일
				endDate.datetimepicker({
					dateFormat: "yy-MM-dd h:m:s",
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
					dateFormat: "yy-MM-dd h:m:s",
					// 오늘 이후로 선택 가능하게 설정
					minDate: 0
				});
			}
		});
			
		//진척도!!
		const progressBar = document.querySelector(".progress-bar");
		const progressBarInner = document.querySelector(".progress-bar-size");
	
		progressBar.addEventListener("click", (event) => {
			// 클릭 위치
			// 창 왼쪽부터 클릭한 위치까지 거리 - 프로그레스바 왼쪽 좌표 = 클릭 위치
			const clickedPosition = event.clientX - progressBar.getBoundingClientRect().left;
			
			// 프로그레스 전체 길이
			const totalWidth = progressBar.offsetWidth;
			
			// 진척도 값 계산
			const selectedProgress = Math.round((clickedPosition / totalWidth) * 100 / 10) * 10;
	
			// 클릭한 진척도 값으로 프로그레스 채우기
			progressBarInner.style.width = selectedProgress + "%";
			
			// input에 선택 한 값 넣기
		    const hiddenInput = document.querySelector("input[name='processivity']");
			
			if (hiddenInput) {
				hiddenInput.value = selectedProgress;
	
				// 선택된 값 표시
				const progressValue = document.querySelector(".progress-value");
				progressValue.textContent = selectedProgress + "%";
			}
		});
		
		// 하위 업무 추가하기
	    $('.add-sub-task-btn').on('click', function() {
	        var subtaskForm = `
	            <div class="task-add">
	        		<div class="d-flex m-bt">
	        			<div>
	        				<span>업무 제목 : </span>
	        				<input type="text" name="prjBoardTitle" placeholder="제목을 입력하세요.">
	        			</div>
		                <div class="select-state">
		                	<span>진행 상태 : </span>
						    <select name="state" class="task-select">
						        <option value="G1">요청</option>
						        <option value="G2">진행</option>
						        <option value="G3">피드백</option>
						        <option value="G4">완료</option>
						        <option value="G5">보류</option>
						    </select>
						</div>
	        		</div>
	                <div class="d-flex m-bt">
		        		<div class="select-priority">
		        			<span>우선 순위 : </span>
		                    <select name="priority">
		                        <option value="">=======</option>
		                        <option value="F3">낮음</option>
		                        <option value="F2">보통</option>
		                        <option value="F1">긴급</option>
		                    </select>
		                </div>
		                <div>
		                    <label for="endDate">마감일 : </label>
		                    <input type="text" name="endDate" class="date-input endDate" data-date>
		                </div>
	                </div>
	                <div class="board-taskManager">
						<span class="add-manager-btn">담당자 추가</span>
						<div class="subManagerList"></div>
					</div>
	            </div>`;
	        
	            $('.sub-task-manager').append(subtaskForm);
	    	});
		
		// 업무 등록하기
		$('#btnAddTask').on('click', function(){
			let editor2 = CKEDITOR.replace('editor2');
			let data={}
			let prjBoardTitle = $('#task').find('[name=prjBoardTitle]').val();
			let prjBoardSubject = CKEDITOR.instances.editor2.getData();
			let state = $('#task').find('[name=state]:checked').val();
			let inspYn = $('#task').find('[name=inspYn]').val();
			let startDate = $('#task').find('[name=startDate]').val();
			let endDate = $('#task').find('[name=endDate]').val();
			let priority = $('#task').find('[name=priority]').val();
			let processivity = $('#task').find('[name=processivity]').val();
			let boardType = 'C8';
			let memberId = $('#memberId').val();
			let projectId = $('#projectId').val();
			
			
			let boardVO = {prjBoardTitle, prjBoardSubject, inspYn, projectId, boardType, memberId}
			let taskVO = {state, startDate, endDate, priority, processivity}
			
			// 상위 업무 담당자 리스트
			let prjManager =[];
			$('.highManagerList input[name="taskManager"]').each(function(index, item){
		        let prjParticirId = $(item).val();
		        prjManager.push({prjParticirId});
		    });
			
			// 하위 업무
			let subTask = [];
			let subManager = [];
			$('.task-add').each(function(index,item){
				let prjBoardTitle = $(item).find('[name=prjBoardTitle]').val();
				// 하위 업무 리스트
				if (prjBoardTitle !== "") {
	                let state = $(item).find('[name=state]:checked').val();
	                let endDate = $(item).find('[name=endDate]').val();
	                let priority = $(item).find('[name=priority]').val();
	                let managerList = $(item).find('input[name="taskManager"]');
	                
	                subTask.push({ prjBoardTitle, state, endDate, priority });
	            	
	            // 하위 업무 담당자
					$(managerList).each(function(idx, manager) {
						let prjParticirId = $(manager).val();
						let prjBoardId = index;
						console.log()
						subManager.push({prjBoardId, prjParticirId});
					});               
	            }
			});
			
			// 빈객체 지우기
			/* if (subTask.length > 0 && !subTask[subTask.length - 1].prjBoardTitle) {
	        	subTask.pop();
	   		} */
			
			console.log(JSON.stringify({boardVO, taskVO, subTask, prjManager, subManager}));
			$.ajax({
				url:'${pageContext.request.contextPath}/taskInsert',
				type:'post',
				data:JSON.stringify({boardVO, taskVO, subTask, prjManager, subManager}),
				contentType:'application/json',
				success:function(data){
					location.href='${pageContext.request.contextPath}/projectFeed?projectId=' + data;
				},error: function(reject) {
					console.log(reject);
				}
			});
		})
		// 업무 등록 종료
		
		
		// 투표 항목 추가하기           
        $('.btnAdd').click (function () {                                        
            $('.vote-add-buttons').append (                        
                '<input type="text" name="listContent"> <input type="button" class="btnRemove" value="X"><br>'                    
            ); // end append                            
            $('.btnRemove').on('click', function () { 
                $(this).prev().remove (); // text 지우기
                $(this).next ().remove (); // <br> 지우기
                $(this).remove (); // 버튼 지우기
            });
        });                                           
	</script>
	<!-- 게시글 작성 종료 -->
</body>
</html>