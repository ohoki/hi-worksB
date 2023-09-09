<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.notice-board-box {
		width: 60%;
		margin: 60px auto; 
		color: var(--color-dark-grey);
		font-size: var(--font-micro);
	}
	
	.insert {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 20px 20px;
	}
	
	.insert h2 {
		margin: 0;
		font-size: var(--font-regular);
		font-weight: var(--weight-bold);
		color: var(--color-green);
	}
	
	
	table {
		width: 100%;
		border-collapse: collapse;
	}
	
	th,td {
		border: 1px solid var(--color-dark-beigie);
	}
	
	th {
		height: 40px;
	}
	
	.table-title ,.table-writer, .table-hit, .table-reg {
		width: 15%;
		text-align: center;
		background-color: var(--color-dark-beigie);
	}
	
	.title-content, .hit-content, .writer-content, .reg-content {
		width: 35%;
		text-align: left;
		padding: 0 20px;
		font-weight: var(--weight-semi-bold);
	}
					
	.table-content {
		height: 500px;
		overflow: auto;
		overflow-x : hidden;
		padding: 10px 20px;
		vertical-align: top;
	}
	
	.table-content::-webkit-scrollbar {
		width: 10px;
	}
	
	.table-content::-webkit-scrollbar-thumb {
		background-color: #2f3542;
		border-radius: 10px;
		background-clip: padding-box;
		border: 2px solid transparent;
		background-color: var(--color-dark-beigie);
	}
	
	.table-content::-webkit-scrollbar-track {
		background-color: grey;
		border-radius: 10px;
		box-shadow: inset 0px 0px 5px white;
		background-color: var(--color-dark-beigie);
	}

 	.table-footer {
 		display: flex;
 		justify-content: flex-start;
 		margin: 10px 0;
 	}

	#likeButton {
		background-color: transparent;
	}	
	
	.like-btn {
		width: 20px;
		height: 20px;
		margin-right: 10px;
	}
	
	#likeCount {
		font-weight: var(--weight-bold);
	}
	
	.buttons button[type=button] {
		background-color: transparent;
		color: var(--color-dark-red);
		margin: 0 10px;
		font-weight: var(--weight-bold);
	}
	
	#commentContent {
		width: 97%;
		resize: none;
		height: 99px;
		border-color: var(--color-dark-white);
		overflow: scroll;
		overflow-x: hidden;
		color: var(--color-dark-grey);
		padding: 15px;
	}
	
	.cmtList {
		display: flex;
		justify-content: space-between;
		align-items:center;
		font-weight: var(--weight-bold);
		text-align: left;
	}
	
	.cmtList-item {
		padding: 10px 20px;
		border: 1px solid var(--color-dark-beigie);
	}
	
	#insertButton {
		width: 70px;
		height: 30px;
		color: var(--color-dark-grey);
		background-color: var(--color-dark-beigie);
		border-radius: 5px;
		font-weight: var(--weight-bold);
	}
	
	.profile {
		width: 50px;
		height: 50px;
		border-radius: 5px;
		margin-right: 20px;
	}
	
	.boardCmtList {
		margin: 30px 0;
	}
	
	.boardCmtList h2 {
		margin: 20px 0;
		font-size: var(--font-micro);
	}
	
	.cmt-title {
		font-weight: var(--weight-bold);
		margin-bottom: 10px;
	}
	
	.cmt-content {
		width: 100%;
		display: block;
		word-break:break-all;
		resize: none;
		border: none;
		outline: none;
		background-color: white;
	}
	
	.cmt-update span:hover, .reply-update span:hover {
		color: black;
	}
	
	.cmt-plus-arrow {
		width: 15px; 
		height:15px;
		margin-right: 20px;
	}
	
	.reply {
		margin-top: 30px; 
		text-align: right; 
		padding-right: 10px;
		cursor: pointer;
	}
	
	.reply:hover {
		color: black;
	}
	
	.d-flex {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.cursor {
		cursor: pointer;
	}
</style>
</head>
<body>
	<!-- api -->
	<!-- ckeditor -->
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
	<!-- 사진 업로드를 위한 ckfinder -->
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
	<!-- ckeditor 끝 -->
	<div class="notice-board-box">
		<div class="insert">
			<h2>
				<img class="notice-icon" src="${pageContext.request.contextPath }/resources/icon/clipboard-regular.svg" alt="게시글 아이콘">
			공지사항
			</h2>
		</div>
		<form action="noticeInfo" method="post">
			<table class="table">
				<thead>
					<tr class="main__p">
						<th class="table-title">
							제목
						</th>
						<th class="title-content">
							${noticeInfo.noticeTitle }
						</th>
						<th class="table-hit">
							조회수
						</th>
						<th class="hit-content">
							${noticeInfo.boardHit }
						</th>
					</tr>
					<tr>
						<th class="table-writer">
							작성자
						</th>
						<th class="writer-content">
							${noticeInfo.memberName}
						</th>
						<th class="table-reg">
							작성시간
						</th>
						<th class="reg-content">
							<fmt:formatDate value="${noticeInfo.boardRegdate}" pattern="yyyy-MM-dd hh:mm"/>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="table-content" colspan="4">
							${noticeInfo.noticeContent }
						</td>
					</tr>
				</tbody>
			</table>
			<div class="table-footer d-flex">
				<div class="d-flex">
					 <!-- 좋아요 버튼 -->
				    <button id="likeButton" type="button" onclick="toggleLike('${noticeInfo.noticeId}', '${memberInfo.memberId}')">
				    	<img class="like-btn" src="${pageContext.request.contextPath }/resources/icon/heart-solid.svg">
				    </button>
			    	<!-- 좋아요 수 표시 -->
			    	<span id="like">
				    	<span id="likeCount">
				    		${likeCount}
				    	</span>
				    	<c:if test="${checkLike eq true }">
				    		좋아요 취소
				    	</c:if>
						<c:if test="${checkLike eq false}">
				    		좋아요
				    	</c:if>				    	
				    </span>
				</div>
				<div class="buttons">
					<c:if test="${memberInfo.memberId eq noticeInfo.memberId}">
						<button type="button" class="buttonss__button" onclick="location.href='noticeUpdate?noticeId=${noticeInfo.noticeId}'">수정</button>
						<button type="button" class="buttonss__button" onclick="location.href='noticeDelete?noticeId=${noticeInfo.noticeId}'">삭제</button>
					</c:if>
					<button type="button" class="buttonss__button" onclick="location.href='noticeList'">목록</button>
				</div>
			</div>
		</form>
		<!-- ajax로 댓글 생성하는 공간 -->
		<div class="boardCmtList">
			<h2>댓글</h2>
			<ul>
			</ul>
		</div>
		
		<!-- 댓글 작성 폼 -->
		<form id="cmtInsert" method="post">
			<div class="cmtList">
				<p class="cmtList__cmtInsert">댓글 작성 | ${memberInfo.memberName }</p>
				<button type="button" id="insertButton">작성</button>
			</div>	
			<div id="cmtInsert__text">
				<textarea id="commentContent" name="commentContent" placeholder="댓글을 입력하세요"></textarea>
			</div>
		</form>
	</div>

	<script>
		$(document).ready(function(){
			// 댓글 리스트 출력
			getcmtList();
			
		});
		
		// 댓글 수정 / 성공은 했는데 한 페이지에서 새로고침 없이 또 수정하면 중복수정됨 / 시간남을때 수정 필수
		$(document).on('click', '.cmt-update .update', function(e){
			e.stopPropagation();
			let updateBtn = $(e.currentTarget);
			let commentId = $(this).closest(".cmtList-item").find(".commentId").val();
			let boardType = $(this).closest(".cmtList-item").find(".boardType").val();
			let boardId = $(this).closest(".cmtList-item").find(".boardId").val();
			let cmtContentBox = $(this).closest(".cmtList-item").find(".cmt-content");
			let cmtContent = $(this).closest(".cmtList-item").find(".cmt-content").val();
			
			if(updateBtn.text() == '수정') {
				cmtContentBox.prop('disabled', false);
				cmtContentBox.focus();
				updateBtn.text('수정완료');
			} else if(updateBtn.text() == '수정완료') {
				let newCommentContent = cmtContent;
				
				$.post("boardCmtUpdate", {commentId : commentId ,
					  boardType : 'C2' ,
					  boardId : '${noticeInfo.noticeId}' ,
					  commentContent : newCommentContent}
				, function(response){
					if(response == 1){
						alert("댓글 수정이 완료되었습니다.");
						getcmtList();
					} else {
						alert("댓글을 수정에 실패했습니다.");
						getcmtList();
					};
				});
			}
		});
		/* 댓글 수정 끝 */
		
		// 댓글 리스트를 출력하는 함수
		function getcmtList(){
			let cmt = $(".boardCmtList ul");
			//초기화
			cmt.children().remove();				
			$.get("boardCmtList",{boardId : ${noticeInfo.noticeId}, boardType : 'C2'},function(list) {
				for(let i = 0 , len = list.length || 0; i < len; i++ ){
					let cmtListItem;
					
					/* 부모/자식 댓글 구분 */
					if(list[i].deleted == 'Y'){
						cmtListItem = `
							<li>
								<div class="d-flex cmtList-item">
									<input type='hidden' class='commentId' value='\${list[i].commentId}'>
									<input type='hidden' class='boardType' value='\${list[i].boardType}'>
							        <input type='hidden' class='boardId' value='\${list[i].boardId}'>
							        <input type='hidden' class='commentParent' value='\${list[i].parentId}'>
									<div class="d-flex" style="flex-grow:1;">
										<img src="${pageContext.request.contextPath}/images/\${list[i].realProfilePath} }" alt="\${list[i].memberName}" class="profile" onerror="this.src='${pageContext.request.contextPath}/resources/img/user.png'">
										<div style="flex-grow:1;">
											<div class="cmt-title">
												<span>\${list[i].memberName}</span>
												<span>\${list[i].commentRegdate}</span>
											</div>
											<textarea class="cmt-content" rows='2'>삭제 된 댓글입니다.</textarea>
										</div>								
									</div>
									<div>
				                    	<div class="reply">
											답글
										</div>
									</div>
								</div>
							</li>`;
					} else if(list[i].parentId == 0){
						cmtListItem = `
									<li>
										<div class="d-flex cmtList-item">
											<input type='hidden' class='commentId' value='\${list[i].commentId}'>
											<input type='hidden' class='boardType' value='\${list[i].boardType}'>
									        <input type='hidden' class='boardId' value='\${list[i].boardId}'>
									        <input type='hidden' class='commentParent' value='\${list[i].parentId}'>
											<div class="d-flex" style="flex-grow:1;">
												<img src="${pageContext.request.contextPath}/images/\${list[i].realProfilePath} }" alt="\${list[i].memberName}" class="profile" onerror="this.src='${pageContext.request.contextPath}/resources/img/user.png'">
												<div style="flex-grow:1;">
													<div class="cmt-title">
														<span>\${list[i].memberName}</span>
														<span>\${list[i].commentRegdate}</span>
													</div>
													<textarea class="cmt-content" rows='2'>\${list[i].commentContent}</textarea>
												</div>								
											</div>
											<div>
												<div class="cmt-update">
						                       		<span class="cursor update" style="margin-right: 10px;">수정</span>
						                       		<span class="cursor delete">삭제</span>
						                    	</div>
						                    	<div class="reply">
													답글
												</div>
											</div>
										</div>
									</li>`;
					} else {
						cmtListItem = `		
									<li>
										<div class="d-flex cmtList-item">
											<input type='hidden' class='commentId' value='\${list[i].commentId}'>
											<input type='hidden' class='boardType' value='\${list[i].boardType}'>
									        <input type='hidden' class='boardId' value='\${list[i].boardId}'>
									        <input type='hidden' class='commentParent' value='\${list[i].parentId}'>
											<div class="d-flex" style="flex-grow:1;">
												<img src="${pageContext.request.contextPath}/resources/icon/arrow-list.PNG" class="cmt-plus-arrow">
												<img src="${pageContext.request.contextPath}/images/\${list[i].realProfilePath} }" alt="\${list[i].memberName}" class="profile" onerror="this.src='${pageContext.request.contextPath}/resources/img/user.png'">
												<div style="flex-grow:1;">
													<div class="cmt-title">
														<span>\${list[i].memberName}</span>
														<span>\${list[i].commentRegdate}</span>
													</div>
													<textarea class="cmt-content" rows='2'>\${list[i].commentContent}</textarea>
												</div>								
											</div>
											<div>
												<div class="cmt-update">
						                       		<span class="cursor update" style="margin-right: 10px;">수정</span>
						                       		<span class="cursor delete">삭제</span>
						                    	</div>
											</div>
										</div>
									</li>`;
					}
					cmt.append(cmtListItem);
					// 본인 여부 확인
					if(list[i].memberId != "${memberInfo.memberId}") {
						$('.cmt-update').remove();
					}
					// 댓글창 잠금
					$('.cmt-content').prop('disabled', true);
				}
			})
		};
		
		
		
		// 댓글 등록 ajax
		document.getElementById('insertButton').addEventListener('click', function(e){
			e.stopPropagation();
			
			let commentContent = $("textarea[name='commentContent']");
			
	    	$.post("boardCmtInsert", {boardId : ${noticeInfo.noticeId} , 
	    							  boardType : 'C2', 
	    							  memberId : '${memberInfo.memberId}' ,
	    							  commentContent : commentContent.val() ,
	    							  parentId : 0 
	    	}, function (response) {
	    		commentContent.val('');
			    	
		    	getcmtList();
			});
		});
		
	
		 // 좋아요 버튼 클릭 시 호출되는 함수
	    function toggleLike(boardId, memberId) {
	        // 서버로 비동기 요청을 보냄
	        $.get("like", { boardType: 'C2', boardId: boardId, memberId: memberId }, function (response) {
	            // 서버로부터 받은 값에 따라 동작을 결정함
	            $('#likeCount').remove();
	            $('#like').empty();
	            
	            let likeCount = `<span id="likeCount"> \${response.count} </span>`;
	            
	            if (response.result == 'liked') {
	                // 좋아요 상태일 경우 
	                $("#like").text("좋아요 취소");
	            } else if (response.result == "unliked") {
	                // 좋아요 해제 상태일 경우
	                $("#like").text("좋아요");
	            }
	            
	            $('#like').prepend(likeCount);
	        })
		 };
		 
		// 댓글 삭제 ajax
		$(document).on('click', '.cmt-update .delete', function(e){
			if(confirm('댓글을 삭제하시겠습니까?')) {
				let commentId = $(this).closest(".cmtList-item").find(".commentId").val();
				let boardType = $(this).closest(".cmtList-item").find(".boardType").val();
				let boardId = $(this).closest(".cmtList-item").find(".boardId").val();
				let cmtContent = $(this).closest(".cmtList-item").find(".cmtContent").text();
				let findParent = $(this).closest(".cmtList-item").parent().next().find(".commentParent").val();
				let myParent = $(this).closest(".cmtList-item").find(".commentParent").val();
				
				if ( myParent == 0 && findParent > 0 ){
					console.log("삭제하면 안되는 댓글")
					$.post("boardCmtDelete", {boardId : ${noticeInfo.noticeId} ,
										   boardType : '${noticeInfo.boardType}',
										   commentId : commentId }, 
						function(response){		  
							getcmtList();
					})
				} else {
					console.log("삭제해도 되는 댓글!");
					$.post("realCmtDelete", {boardId : ${noticeInfo.noticeId} ,
						   					 boardType : '${noticeInfo.boardType}',
						   					 commentId : commentId }, 
						function(response){
							getcmtList();
					})
				}
			}
		});
		/* 삭제 끝 */

		/* 대댓글 작성 */
		$(document).on('click', '.reply', function(e){
			let commentId = $(this).closest(".cmtList-item").find(".commentId").val();
			
			let replyForm = `		
				<li>
					<div class="d-flex cmtList-item">
						<input type='hidden' class='commentParent' value='\${commentId}'>
						<div class="d-flex" style="flex-grow:1;">
							<img src="${pageContext.request.contextPath}/resources/icon/arrow-list.PNG" class="cmt-plus-arrow">
							<img src="${pageContext.request.contextPath}/images/${meberInfo.realProfilePath}" alt="${memberInfo.memberName}" class="profile" onerror="this.src='${pageContext.request.contextPath}/resources/img/user.png'">
							<div style="flex-grow:1;">
								<div class="cmt-title">
									<span>${memberInfo.memberName}</span>
								</div>
								<textarea class="cmt-content" rows='2'></textarea>
							</div>								
						</div>
						<div>
							<div class="reply-update">
	                       		<span class="cursor reply-insert" style="margin-right: 10px;">등록</span>
	                       		<span class="cursor reply-cancel">취소</span>
	                    	</div>
						</div>
					</div>
				</li>`;
				
				$(this).closest(".cmtList-item").parent().after(replyForm);
				$(this).closest(".cmtList-item").parent().next().find('.cmt-content').focus();
		});
		
		$(document).on('click', '.reply-update span', function(e){
			if($(e.currentTarget).hasClass('reply-insert')) {
				let commentContent = $(this).closest(".cmtList-item").find('.cmt-content').val();
				let commentId = $(this).closest(".cmtList-item").find(".commentParent").val();
				
				$.post("boardCmtInsert", {boardId : '${noticeInfo.noticeId}',
										  boardType : '${noticeInfo.boardType}',
										  memberId : '${memberInfo.memberId}',
										  commentContent : commentContent,
										  parentId : commentId 
					},function(response){
						getcmtList();
				});
			} else {
				$(this).closest(".cmtList-item").parent().remove();
			}
		});
		/* 대댓글 작성 끝 */
		
	</script>
</body>
</html>