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

.board-header,
.subTask-content{
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

.insert-board-modal {
	border: 1px solid var(--color-dark-beigie);
    border-radius: 20px;
    width : 33%;
    height: 850px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    margin: 5px auto;
    background-color: white;
    padding: 30px;
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

.board-form {
	margin-top: 10px;
	color: var(--color-dark-grey);
}

.board-form-title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid var(--color-dark-beigie);
	padding: 0 10px;
}

.form__textarea{
	width: 100%;
	height: 300px;
	resize: none; /*textarea 길이 고정*/
	border: none;
	margin: 10px 0;
}











.modal-title {
    list-style: none;
    height: 100%;
    display: flex;
    align-items: center;
    margin-left: 20px;
}

.modal-title li {
    font-size: 20px;
    height: 100%;
    display: flex;
    align-items: center;
    margin-right: 20px;
}

.modalBoard{
    top:0;
    left:0;
}

.modal-header{
	height: 80px;
}

.form-check{
	margin-bottom: 10px;
}

.ui-datepicker {
	width: auto;
}

.progress-bar {
	background-color: #eeeeee;
	height: 20px;
}
.progress-bar-size {
	background-color: #90ddfc;
	height: 100%;
	width: 0;
	transition: width 0.3s ease-in-out;
}

.date-input,
.vote-add-buttons input,
.task-add input {
	border: 1px solid var(--color-light-white);
    border-radius: var(--size-border-radius);
    margin: 5px;
}

.vote-sub,
.task_sub{
	height:120px;
}

.voteEndDate{
	color: var(--color-dark-white);
	font-size: 18px;
	margin-bottom: 10px;
}
.voteList,
.subTask-content{
	border-radius: var(--size-border-radius);
	background-color: #f7fafd;
	height: 30px;
	margin-bottom: 10px;
	padding-left: 15px;
}
.task-detail,
.prjParticir_title span{
	font-size: 15px;
}

.prjParticir {
	width: 200px;
	align-items: center;
	justify-content: space-between;
	border-bottom: 1px solid var(--color-dark-white);
	padding: 0 20px 0 5px;
	cursor: pointer;
}

.prjParticir:nth-child(1) {
	border-top: 1px solid var(--color-dark-white);
}

.prjParticir-img {
	width: 40px;
	height: 40px;
}

.btn-add-taskManager{
	width: 100px;
	height: 30px;
	background-color : #c0e6f5;
	color: var(--color-grey);
}
</style>
</head>
<body>
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
	    <div class="dis-none d-b board-form" id="board">
       		<form action="boardInsert" method="post">
				<input type="text" class="board-form-title" name="prjBoardTitle" placeholder="제목을 입력하세요.">
				<textarea class="form__textarea" name="prjBoardSubject" placeholder="내용을 입력하세요."></textarea>
			
				
				<div>
					<label>공개 범위</label> <select class="form__select" name="inspYn">
						<option value="E2">전체 공개</option>
						<option value="E1">프로젝트 관리자만</option>
					</select>
				</div>
	         	<div class="modal-footer form__button">
	         		<input type="hidden" name="boardType" value="C5">
	         		<input type="hidden" name="projectId" value="${projectInfo.projectId}">
	              	<button type="submit" class="btn btn-primary">등록</button>
	              	<button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	          	</div>
			</form>
        </div>
        <!-- 게시글 작성 폼 끝!!! -->
	
	
		<!-- 상위 업무 작성 폼!!! -->
		<div class="modal-body dis-none" id="task">
		   <form id="boardInsert" method="post">
		       <!-- 시작일자 마감일자 우선순위 진척도 추가!!!! 하위업무-->
				<div>
					<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요." required>
				</div>
				<div class="form-check">
					<input type="radio" class="btn-check" name="state" value="G1" id="option1" autocomplete="off" checked>
					<label class="btn btn-outline-info" for="option1">요청</label>
					
					<input type="radio" class="btn-check" name="state" value="G2" id="option2" autocomplete="off">
					<label class="btn btn-outline-success" for="option2">진행</label>
					
					<input type="radio" class="btn-check" name="state" value="G3" id="option3" autocomplete="off">
					<label class="btn btn-outline-warning" for="option3">피드백</label>
					
					<input type="radio" class="btn-check" name="state" value="G4" id="option4" autocomplete="off">
					<label class="btn btn-outline-primary" for="option4">완료</label>
					
					<input type="radio" class="btn-check" name="state" value="G5" id="option5" autocomplete="off">
					<label class="btn btn-outline-danger" for="option5">보류</label>
				</div>
				<!-- 업무 담당자 -->
				<div>
					<button type="button" class="btn-add-taskManager" data-bs-toggle="modal" data-bs-target="#add-taskManager">담당자 추가</button>
					<div id="add-taskManager" class="modal" tabindex="-1">
					 	<div class="modal-dialog">
					 		<div class="modal-content prjParticir">
						 		<div class="modal-body">
									<div class="prjParticir_title">
										<span>프로젝트 참여자</span>
									</div>
									<div class="particir"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="taskManager"></div>
				</div>
				<!-- 업무 담당자 끝 -->
				<div>
					<textarea class="form__textarea" name="prjBoardSubject" placeholder="내용을 입력하세요." required></textarea>
				</div>
				<div>
					<label for="startDate">시작일 추가</label>
					<input type="text" name="startDate" class="date-input startDate">
				</div>
				<div>
					<label for="endDate">마감일 추가</label>
					<input type="text" name="endDate" class="date-input endDate">
				</div>
				<!-- 우선 순위 -->
				<div class="select-priority">
					<select name="priority">
						<option value="">우선 순위</option>
						<option value="F3">낮음</option>
						<option value="F2">보통</option>
						<option value="F1">긴급</option>
					</select>
				</div>
				<!-- 진척도 -->
				<!-- 진척도 전체 프로그레스-->
				<div class="js-progress create-content-cell">
					<div class="progress-bar">
				        <!-- 프로그레스 채우기-->
			       		<div class="progress-bar-size" style="width: 0%;"></div>
					</div>
					<!-- 프로그레스 버튼-->
				    <div class="progress-graph">
						<span class="progress-button" data-progress-value="0"></span>
						<span class="progress-button" data-progress-value="10"></span>
						<span class="progress-button" data-progress-value="20"></span>
						<span class="progress-button" data-progress-value="30"></span>
						<span class="progress-button" data-progress-value="40"></span>
						<span class="progress-button" data-progress-value="50"></span>
						<span class="progress-button" data-progress-value="60"></span>
						<span class="progress-button" data-progress-value="70"></span>
						<span class="progress-button" data-progress-value="80"></span>
						<span class="progress-button" data-progress-value="90"></span>
						<span class="progress-button" data-progress-value="100"></span>
				    </div>
				</div>
				<!-- 진척도 값 표시하기 -->
				<div class="progress-value">0%</div>
				<!-- 진척도 값 넘길때 -->
				<input type="hidden" name="processivity" value="0">
			</form>
		
			<!-- 하위 업무 -->	
			<div class="task-add">
			    <button type="button" class="btn btn-secondary btn-add-subtask">하위업무 추가</button>
			</div>
			<!-- 하위 업무 끝 -->
	
			<div class="task-inspYn">
				<label>공개 범위</label>
				<select class="form__select" name="inspYn">
					<option value="E2">전체 공개</option>
					<option value="E1">프로젝트 관리자만</option>
				</select>
			</div>
	        <div class="modal-footer form__button">
	         	<input type="hidden" name="boardType" value="C8">
	         	<input type="hidden" name="projectId" value="${projectInfo.projectId}">
				<button type="button" class="btn btn-primary" id="btnAddTask" data-bs-dismiss="modal">등록</button>
				<button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	  		</div>
		</div>
	
	
		<!-- 일정 작성 폼!!! -->
		<div class="modal-body dis-none" id="sche">
			<form action="boardInsert" method="post">
				<div>
					<label>일정일정</label>
					<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요." required>
				</div>
				<div>
					<label for="startDate">시작일</label>
					<input type="text" name="startDate" class="date-input startDate">
				</div>
				<div>
					<label for="endDate">종료일</label>
					<input type="text" name="endDate" class="date-input endDate">
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
					<input type="text" name="endDate" class="date-input endDate">
					<label for="endDate">투표 종료일</label>
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
</body>
<!-- 게시글 작성 SCRIPT -->
<script>
	// 이진
	// 게시글 유형 폼 선택
	
	$('ul.modal-title li').click(function(e){
		let target = e.currentTarget.textContent;
		let visibleDiv = $('.visible');
		if(target == '글') {
			visibleDiv.removeClass('visible');
			$('#board').addClass('visible');
			
		}else if(target == '업무') {
			visibleDiv.removeClass('visible');
			$('#task').addClass('visible');
			
		}else if(target == '일정') {
			visibleDiv.removeClass('visible');
			$('#sche').addClass('visible');
			
		}else if(target == '투표') {
			visibleDiv.removeClass('visible');
			$('#vote').addClass('visible');
		}	
	})
	
	// 업무, 투표, 일정
	// 시작일자, 마감일자 범위 선택하기
	$(function () {
		$(".startDate").datetimepicker({
			dateFormat: "yy-mm-dd h:m:s",
			// 오늘 이후로 선택 가능하게 설정
			minDate: 0,
			onSelect: function(selectedDate) {
				// 시작일 선택 -> selectedDate
				// 최소 선택 일자를 minDate -> selectedDate로 설정
				$(".endDate").datetimepicker("option", "minDate", selectedDate);
			}
		});
		
		// 마감 일자 설정
		$(".endDate").datetimepicker({
			dateFormat: "yy-mm-dd h:m:s",
			// 오늘 이후로 선택 가능하게 설정
			minDate: 0
		});
		
		// 폼 리셋 버튼을 클릭할 때 날짜 전부 초기화
		$("button[type='reset']").on("click", function() {
			$(".startDate").datetimepicker("setDate", null);
			$(".endDate").datetimepicker("setDate", null);
			$(".endDate").datetimepicker("option", "minDate", 0);
		});
	});
	
	
	//진척도!!
	const progressBar = document.querySelector(".progress-bar");
	const progressBarInner = document.querySelector(".progress-bar-size");
	const progressButtons = document.querySelectorAll(".progress-button");

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

		progressButtons.forEach(button => {
			const buttonProgress = parseInt(button.getAttribute("data-progress-value"));
			if (buttonProgress <= selectedProgress) {
				// 프로그레스바를 클릭한 값보다 작거나 같은 값만 나타내기
				button.style.display = "inline-block";
			} else {
				button.style.display = "none";
			}
		});
		
		// input에 선택 한 값 넣기
	    const hiddenInput = document.querySelector("input[name='processivity']");
		
		if (hiddenInput) {
			hiddenInput.value = selectedProgress;

			// 선택된 값 표시
			const progressValue = document.querySelector(".progress-value");
			progressValue.textContent = selectedProgress + "%";
		}
	});
	
	// 투표 항목 추가하기
	$(document).ready (function () {                
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
    });
	/*
	// 하위 업무 추가하기
	$(document).ready(function () {
    $('.btn-add-subtask').click(function (event) {
        event.stopPropagation();
        var subtaskForm = `
            <div class="task-add">
                <input type="text" name="prjBoardTitle">
                <div>
                    <label for="endDate">마감일 추가</label>
                    <input type="text" name="endDate" class="date-input endDate">
                </div>
                <div class="select-priority">
                    <select name="priority">
                        <option value="">우선 순위</option>
                        <option value="F3">낮음</option>
                        <option value="F2">보통</option>
                        <option value="F1">긴급</option>
                    </select>
                </div>
                <div class="select-state">
                    <select name="state" class="task-select">
                        <option value="G1">요청</option>
                        <option value="G2">진행</option>
                        <option value="G3">피드백</option>
                        <option value="G4">완료</option>
                        <option value="G5">보류</option>
                    </select>
                </div>
            </div>`;
        
        $('.task-add:last').prev().after(subtaskForm);
    	});
	});
	*/

	// 업무 등록하기
	$('#btnAddTask').on('click', function(){
		let data={}
		let prjBoardTitle = $('#task #boardInsert').find('[name=prjBoardTitle]').val();
		let prjBoardSubject = $('#task #boardInsert').find('[name=prjBoardSubject]').val();
		let state = $('#task #boardInsert').find('[name=state]:checked').val();
		let inspYn = $('.task-inspYn').find('[name=inspYn]').val();
		let startDate = $('#task #boardInsert').find('[name=startDate]').val();
		let endDate = $('#task #boardInsert').find('[name=endDate]').val();
		let priority = $('#task #boardInsert').find('[name=priority]').val();
		let processivity = $('#task #boardInsert').find('[name=processivity]').val();
		let boardType = 'C8';
		let memberId = $('#memberId').val();
		let projectId = $('#projectId').val();
		
		
		let boardVO = {prjBoardTitle, prjBoardSubject, inspYn, projectId, boardType, memberId}
		let taskVO = {state, startDate, endDate, priority, processivity}
		
		// 상위 업무 담당자 리스트
		let prjManager =[];
		$('.taskManager input[name="prjParticirId"]').each(function(index, item){
	        let prjParticirId = $(item).val();
	        prjManager.push({prjParticirId});
	    });
		
		// 하위 업무 리스트
		let subTask = [];
		$('.task-add').each(function(index,item){
			console.log(item)
			let prjBoardTitle = $(item).find('[name=prjBoardTitle]').val();
			if (prjBoardTitle !== "") {
                let state = $(item).find('[name=state]:checked').val();
                let endDate = $(item).find('[name=endDate]').val();
                let priority = $(item).find('[name=priority]').val();
                subTask.push({ prjBoardTitle, state, endDate, priority });
            }
		})
		
		// 빈객체 지우기
		if (subTask.length > 0 && !subTask[subTask.length - 1].prjBoardTitle) {
        	subTask.pop();
   		}
		
		console.log(JSON.stringify({boardVO, taskVO, subTask, prjManager}));
		$.ajax({
			url:'taskInsert',
			type:'post',
			data:JSON.stringify({boardVO, taskVO, subTask, prjManager}),
			contentType:'application/json',
			success:function(data){
				console.log(data);
			},error: function(reject) {
				console.log(reject);
			}
		});
	})
	/*
	// 프로젝트 참여자 조회
	$('.btn-add-taskManager').click(function(e){
	    let particirDiv = $('#particir');
	    $.ajax({
	    	url : '${pageContext.request.contextPath}/particirList',
	        type: 'GET',
	        data: {'projectId': "${projectInfo.projectId}"},
	        success: function(particir){
	            console.log(particir)
	            let particirList = $('#particir');
	            particirList.empty();
	            
	            for(let i=0; i<particir.length; i++) {
					//div태그
					let particirInfo = document.createElement('div');
					particirInfo.classList.add('flex');
					particirInfo.classList.add('prjParticir');
					//이미지 태그
					let employeeProfile = document.createElement('img');
					employeeProfile.setAttribute('alt', '회원사진');
					employeeProfile.classList.add('employee-img');
					if(particir[i].realProfilePath != null) {
						employeeProfile.src = "${pageContext.request.contextPath}/images/"+particir[i].realProfilePath;
					}else {
						employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
					}
					//스팬 태그
					let span = document.createElement('span');
					span.innerText = particir[i].memberName;
					//히든 인풋 태그 (프로젝트 참여자 id값)
					let input = document.createElement('input');
					input.setAttribute('type', 'hidden');
					input.setAttribute('name', 'particirId');
					input.value = particir[i].prjParticirId;
					//태그 삽입
					particirInfo.append(employeeProfile);
					particirInfo.append(span);
					particirInfo.append(input);
					
					particirList.append(particirInfo);
					
				}
	            
	            // 참여자 선택하여 업무 담당자 추가하기
	            $(document).on("click", ".prjParticir", function (e) {
	                e.stopPropagation();

	                let memberName = $(this).find("span").text();
	                let AddParticir = '<input type="text" name="memberName" value="' + memberName + '">';
	                $('.taskManager').append(AddParticir);
	                
	                
	                //prj_particir_id
	                let prjParticirId = $(this).find("input[name='particirId']").val();
	                let AddParticirId = '<input type="hidden" id="prjParticirId" name="prjParticirId" value="' + prjParticirId + '">';
	                $('.taskManager').append(AddParticirId);
	                 
	                
	                console.log(prjParticirId);
	            });
	            
	        },
	        error: function(reject){
	            console.log(reject);
	        }
	    });
	});
	*/

	$(document).ready(function () {
	    function particirList(prjpt) {
	        $.ajax({
	            url: '${pageContext.request.contextPath}/particirList',
	            type: 'GET',
	            data: { 'projectId': "${projectInfo.projectId}" },
	            success: function (particir) {
	            	console.log(particir)
		            let particirList = $('.particir');
		            particirList.empty();
		            
		            for(let i=0; i<particir.length; i++) {
						//div태그
						let particirInfo = document.createElement('div');
						particirInfo.classList.add('flex');
						particirInfo.classList.add('prjParticir');
						//이미지 태그
						let employeeProfile = document.createElement('img');
						employeeProfile.setAttribute('alt', '회원사진');
						employeeProfile.classList.add('employee-img');
						if(particir[i].realProfilePath != null) {
							employeeProfile.src = "${pageContext.request.contextPath}/images/"+particir[i].realProfilePath;
						}else {
							employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
						}
						//스팬 태그
						let span = document.createElement('span');
						span.innerText = particir[i].memberName;
						//히든 인풋 태그 (프로젝트 참여자 id값)
						let input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.setAttribute('name', 'particirId');
						input.value = particir[i].prjParticirId;
						//태그 삽입
						particirInfo.append(employeeProfile);
						particirInfo.append(span);
						particirInfo.append(input);
						
						particirList.append(particirInfo);
						
					}

	                // 참여자 선택하여 업무 담당자 추가하기
	                $(document).on("click", ".prjParticir", function (e) {
	                    e.stopPropagation();

	                    let memberName = $(this).find("span").text();
	                    let AddParticir = '<input type="text" name="memberName" value="' + memberName + '">';
	                    prjpt.append(AddParticir);

	                    let prjParticirId = $(this).find("input[name='particirId']").val();
	                    let AddParticirId = '<input type="hidden" name="prjParticirId" value="' + prjParticirId + '">';
	                    prjpt.append(AddParticirId);

	                    console.log(prjParticirId);
	                });
	            },
	            error: function (reject) {
	                console.log(reject);
	            }
	        });
	    }

	    $('.btn-add-taskManager').click(function (e) {
	        e.stopPropagation();
	        particirList($('.taskManager'));
	    });

	    $('.btn-add-subtask').click(function (event) {
	        event.stopPropagation();
	        var subtaskForm = `
	            <div class="task-add">
	                <input type="text" name="prjBoardTitle">
	                <div>
	                    <label for="endDate">마감일 추가</label>
	                    <input type="text" name="endDate" class="date-input endDate">
	                </div>
	                <div class="select-priority">
	                    <select name="priority">
	                        <option value="">우선 순위</option>
	                        <option value="F3">낮음</option>
	                        <option value="F2">보통</option>
	                        <option value="F1">긴급</option>
	                    </select>
	                </div>
	                <div class="select-state">
	                    <select name="state" class="task-select">
	                        <option value="G1">요청</option>
	                        <option value="G2">진행</option>
	                        <option value="G3">피드백</option>
	                        <option value="G4">완료</option>
	                        <option value="G5">보류</option>
	                    </select>
	                </div>
	                <!-- 하위 업무 참여자 추가 -->
	                <div>
					<button type="button" class="btn-add-subManager" data-bs-toggle="modal" data-bs-target="#add-taskManager">담당자 추가</button>
					<div id="add-taskManager" class="modal" tabindex="-1">
					 	<div class="modal-dialog">
					 		<div class="modal-content prjParticir">
						 		<div class="modal-body">
									<div class="prjParticir_title">
										<span>프로젝트 참여자</span>
									</div>
									<div class="particir">	
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="subManager">
						
					</div>
				</div>
	                
	            </div>`;
	        
	        $('.task-add:last').prev().after(subtaskForm);
	    });
	    $('.btn-add-subManager').click(function (e) {
	        e.stopPropagation();
	        particirList($('.subManager'));
	    });

	});
	// 하위업무 선택시 이름추가 수정해야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



</script>
<!-- 게시글 작성 종료 -->
</html>