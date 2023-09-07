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
	body {
		margin: 0 auto;
		font-size: small;
	}
	
	.body {
		width: 800px;
		margin: 0 auto;
	}
	
	.top {
		margin-bottom: 80px;
	}
	
	.table {
		width: 800px;
	}
	
	.table__title{
		font-size: small;
		text-align: left;
		height: 40px;
		background-color: rgba(225, 239, 251);
		padding-left: 15px;
		border-radius: 3px;
	}
	
	.contents {
		width: 800px;
		height: 30px;
	}
	
	.main {
		padding-bottom: 20px;
	}
	
	.main__p {
		font-size: larger;
		font-weight: bolder;
	}
	
	.writer {
		width: 90px;
		float: left;
		height: 70px;
		display: flex;
		align-items: center;
	}
	
	.writer__p {
		
	}
	
	div h2 {
		text-align: center;
	}
	
	.date {
		width: 700px;
		float: right;
		height: 20px;
	}
	
	.date__date {
		text-align: right;
	}
	
	.content {
		float: left;
		width: 800px;
		padding: 2px;
		border-bottom: 1px solid rgb(174, 213, 245);
		border-top: 1px solid rgb(174, 213, 245);
		
	}
	
	.buttonss {
		width: 800px;
		height: 50px;
		border-bottom: 1px solid rgb(174, 213, 245);
		margin-bottom: 10px;
	}
	
	.button1 {
		float: left;
		margin-top: 5px;
		color: black;
	}
	
	.buttons {
		float: right;
		width: 103px;
		margin-top: 5px;
	}
	
	.buttons :first-child {
		float: left;
		margin-right: 3px;
	}
	
	.buttonss__button {
		background-color: rgb(174, 213, 245);
	    border-radius: 5px;
	    color: white;
	    width: 50px;
	    height: 30px;
	    font-weight: bold;
	}
	
	#likeButton {
		color: black;
	}
	
	/* 부모댓글 css */
	.cmtName {
		float: left;
		width: 400px
	}
	
	.cmtInsert {
		float:right;
		margin-left: 5px;
	}
	
	.cmtDate {
		float: right;
		
	}
	
	.cmtContent {
		width: 800px;
		height: 80px;
		float: left;
	}
	
	/* 자식댓글 css */
	.cmtNamec {
		float: left;
		width: 400px;
		margin-left: 50px;
	}
	
	.cmtInsertc {
		float:right;
		margin-left: 5px;
	}
	
	.cmtDatec {
		float: right;
		
	}
	
	.cmtContentc {
		width: 750px;
		height: 80px;
		float: left;
		margin-left: 50px;
	}
	
	button {
		color: black;
	}
	
	.cmtList__cmtInsert {
		float: left;
	}
	
	#commentContent {
		resize: none;
		width: 800px;
		height: 80px;
		margin-bottom: 20px;
	}
	/* 대댓글 Content */
	.commentId {
		margin-left: 80px;
	}
	
	
	/* 대댓글 작성폼 */
	#cmtList__cmtInsertc {
		
	}
	
	/* 댓글 수정 모달 */
	#UpdateFromModal {
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgba(0, 0, 0, 0.4);
	  display: none;
	}
	.UpdateContent {
	  background-color: #fefefe;
	  margin: 15% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%;
	}
	.closeUpdate {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	.closeUpdate:hover,
	.closeUpdate:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
	/* 댓글 모달 끝 */
	
	/* 대댓글 모달 */
	#replyInsert {
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgba(0, 0, 0, 0.4);
	  display: none;
	}
	.replyInsertForm {
	  background-color: #fefefe;
	  margin: 15% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%;
	}
	.closeReply {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	.closeReply:hover,
	.closeReply:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
	/* 대댓글 모달 끝 */
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
	<div class="top">
		<h2>공지사항</h2>
	</div>
	<div class="body">
		<form action="noticeInfo" method="post">
			<table class="table">
				<thead>
					<tr class="main__p">
						<th class="table__title">
							${noticeInfo.noticeTitle }
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="contents">
								<div class="writer">
									<p class="writer__p">${noticeInfo.memberName}<!-- 작성자 넣는칸 --></p>
								</div>
								<div class="date">
									<p class="date__date">조회수 ${noticeInfo.boardHit } | <fmt:formatDate value="${noticeInfo.boardRegdate}" pattern="yyyy/MM/dd HH:mm:ss"/></p>
								</div>
								<div class="date">
									<p class="date__date"><fmt:formatDate value="${notice.boardUpddate }" pattern="yyyy/MM/dd" /></p>
								</div>
							</div>
							<div class="content">
								<p class="content__text">
									${noticeInfo.noticeContent }
								</p>
							</div>
							<div>
							    <!-- 좋아요 수 표시 -->
							    좋아요 <span id="likeCount">${likeCount}</span>
							
							    <!-- 좋아요 버튼 -->
							    <button id="likeButton" type="button" onclick="toggleLike('${noticeInfo.noticeId}', '${memberInfo.memberId}')">좋아요</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="buttonss">
			<div class="button1">
				<button type="button" class="buttonss__button" onclick="location.href='noticeList'">목록</button>
			</div>
			<div class="buttons">
				<c:if test="${memberInfo.memberId eq noticeInfo.memberId}">
					<button type="button" class="buttonss__button" onclick="location.href='noticeUpdate?noticeId=${noticeInfo.noticeId}'">수정</button>
					<button type="button" class="buttonss__button" onclick="location.href='noticeDelete?noticeId=${noticeInfo.noticeId}'">삭제</button>
				</c:if>
			</div>
		</div>
		<!-- ajax로 댓글 생성하는 공간 -->
		<div class="boardCmtList">
			<!-- 댓글 생성되는 곳 -->
		</div>
		
		<!-- 댓글 작성 폼 -->
		<form id="cmtInsert" method="post">
			<div class="cmtList">
				<p class="cmtList__cmtInsert">댓글 작성 | ${memberInfo.memberName }</p>
				<div id="cmtInsert__text">
					<textarea id="commentContent" name="commentContent" placeholder="댓글을 입력하세요"></textarea>
					<button type="button" id="insertButton">작성</button>
				</div>
			</div>
		</form>
		<!-- 대댓글 작성 폼 -->
		<div id="replyInsert" class="replyInsert">
			<form id="replyInsertForm" class="replyInsertForm" method="post">
				<div class="cmtList">
	    			<p class="cmtList__cmtInsertc">댓글 작성 | ${memberInfo.memberName }</p>
	    			<div id="cmtInsert__textc">
	        			<textarea class="commentContentc" name="commentContentc" placeholder="댓글을 입력하세요"></textarea>
	        			<button type="button" id="insertButtonc">등록</button>
	        			<button type="button" id="closeReply">닫기</button>
	    			</div>
    			</div>
			</form>
		</div>
		
		<!-- 수정 폼 / 댓글 대댓글 공유-->
		<div id="UpdateFromModal">
			<form class="UpdateContent" method="post">
				<div>
    				<p>댓글 수정</p>
    				<textarea id="newCommentContent" name="newCommentContent"></textarea>
    				<button type="button" id="cmtUpdateButton">수정</button>
    				<button type="button" id="closeUpdate">닫기</button>
  				</div>
			</form>
		</div>
	</div>
	<script>
		
		$(document).ready(function(){
			// 댓글 리스트 출력
			getcmtList();
			
		});
		
		
		// 댓글 수정 / 성공은 했는데 한 페이지에서 새로고침 없이 또 수정하면 중복수정됨 / 시간남을때 수정 필수
		$(document).on('click', '.cmtUpdate', function(e){
			let commentId = $(this).closest("ul").find(".commentId").val();
			let boardType = $(this).closest("ul").find(".boardType").val();
			let boardId = $(this).closest("ul").find(".boardId").val();
			let cmtContent = $(this).closest("ul").find(".cmtContent").text();
			console.log('댓글 아이디');
			console.log(commentId);
			console.log('보드 타입');
			console.log(boardType);
			console.log('게시글id');
			console.log(boardId);
			console.log('댓글 내용');
			console.log(cmtContent);
			
			newCommentContent.value = cmtContent;
			
			let UpdateFromModal = document.getElementById("UpdateFromModal");
			let UpdateContent = document.getElementsByClassName("UpdateContent");
			let closeUpdate = document.getElementById("closeUpdate");
			
			// 모달창 열기
			UpdateFromModal.style.display = "block";
			document.body.style.overflow = "hidden"; // 스크롤바 제거
			
			// 모달창 닫기
			closeUpdate.addEventListener("click", () => {
			UpdateFromModal.style.display = "none";
			document.body.style.overflow = "auto"; // 스크롤바 보이기
			});
			
			$('#cmtUpdateButton').click(function(){
				let newCommentContent = $("textarea[name='newCommentContent']").val();
				console.log('작성된댓글내용');
				console.log(newCommentContent);
				$.post("boardCmtUpdate", {commentId : commentId ,
										  boardType : 'C2' ,
										  boardId : ${noticeInfo.noticeId} ,
										  commentContent : newCommentContent
			}, function(response){
				if(response.success){
					$('newCommentContent').val("");
					alert("댓글 수정이 완료되었습니다.");
					UpdateFromModal.style.display = "none";
					document.body.style.overflow = "auto";
					console.log("성공했을때 나오는 텍스트")
					console.log(newCommentContent);
					getcmtList();
					
				} else {
					$('newCommentContent').val(' ');
					alert("댓글을 수정했습니다.")
					UpdateFromModal.style.display = "none";
					document.body.style.overflow = "auto";
					console.log("실패했을때 나오는 텍스트!")
					console.log(newCommentContent);
					getcmtList();
				};
			})
			})
		});
		/* 댓글 수정 끝 */
		
		// 댓글 리스트를 출력하는 함수
		function getcmtList(){
			let cmt = $(".boardCmtList");
			let str = "";
			$.get("boardCmtList",{boardId : ${noticeInfo.noticeId}, boardType : 'C2'},function(list) {
				for(let i = 0 , len = list.length || 0; i < len; i++ ){
					/* 부모/자식 댓글 구분 */
					
					if(list[i].deleted == 'Y'){
						str += "<ul>" + "<li class='cmtName'>" + list[i].memberName + "</li>";
						str += "<li class='cmtInsert'>" + "<button type='button' id='cmtInsertFormButton' class='cmtInsertFormButton'>" + "답글작성" + "</button>" + "</li>";
						str += "<li class='cmtContent'>" + '삭제된 댓글 입니다.' + "</li>"
						/* 밑으론 hidden */
						str += "<li>" + "<input type='hidden' class='commentId' value='" + list[i].commentId +" '>" + "</li>";
						str += "<li>" + "<input type='hidden' class='boardType' value='" + list[i].boardType +" '>" + "</li>";
						str += "<li>" + "<input type='hidden' class='boardId' value='" + list[i].boardId +" '>" + "</li>" + "</ul>";
					} else if(list[i].parentId == 0){
						/* 부모 댓글일 경우 */
						str += "<ul>" + "<li class='cmtName'>" + list[i].memberName + "</li>";
					 	str += "<li class='cmtInsert'>" + "<button type='button' id='cmtInsertFormButton' class='cmtInsertFormButton'>" + "답글작성" + "</button>" + "</li>";
					 	/* 내가 쓴 글일경우 */
					 	if(list[i].memberId == "${memberInfo.memberId}"){
					 		str += "<li class='cmtInsert'>" + "<button type='button' class='cmtUpdate'>" + "수정" + "</button>" + "</li>";
					 		str += "<li class='cmtInsert'>" + "<button type='button' class='cmtDelete'>" + "삭제" + "</button>" + "</li>";
					 	}
						str += "<li class='cmtDate'>" + list[i].commentRegdate + " |" + "</li>";
						str += "<li class='cmtContent'>" + list[i].commentContent + "</li>";
						/* 밑으론 히든 */
						str += "<li>" + "<input type='hidden' class='commentId' value='" + list[i].commentId +" '>" + "</li>";
						str += "<li>" + "<input type='hidden' class='boardType' value='" + list[i].boardType +" '>" + "</li>";
						str += "<li>" + "<input type='hidden' class='boardId' value='" + list[i].boardId +" '>" + "</li>";
						str += "<li>" + "<input type='hidden' class='commentParent' value='" + list[i].parentId + " '>" + "</li>" + "</ul>";
					} else {
						/* 자식 댓글일 경우 */
						str +=  "<ul class = 'cmts'>" + "<li class='cmtNamec'>" + list[i].memberName + "</li>";
					 	/* 내가 쓴 글일경우 */
					 	if(list[i].memberId == "${memberInfo.memberId}"){
					 		str += "<li class='cmtInsert'>" + "<button type='button' class='cmtUpdate' >" + "수정" + "</button>" + "</li>";
					 		str += "<li class='cmtInsert'>" + "<button type='button' class='cmtDelete'>" + "삭제" + "</button>" + "</li>";
					 	}
						str += "<li class='cmtDatec'>" + list[i].commentRegdate + " |" + "</li>";
						str += "<li class='cmtContent' style='margin-left: 50px'>" + list[i].commentContent + "</li>";
						/* 밑으론 히든 */
						str += "<li>" + "<input type='hidden' class='commentId' value='" + list[i].commentId +" '>" + "</li>";
						str += "<li>" + "<input type='hidden' class='boardType' value='" + list[i].boardType +" '>" + "</li>";
						str += "<li>" + "<input type='hidden' class='boardId' value='" + list[i].boardId +" '>" + "</li>";
						str += "<li>" + "<input type='hidden' class='commentParent' value='" + list[i].parentId + " '>" + "</li>" + "</ul>";
					}
					
				}
				cmt.html(str);
			})
		};
		
		
		
		// 댓글 등록 ajax
		document.getElementById('insertButton').addEventListener('click', function(){
			let commentContent = $("textarea[name='commentContent']");
			
			console.log(commentContent);
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
	            if (response.result == 'liked') {
	                // 좋아요 상태일 경우 
	                $("#likeButton").text("좋아요 취소");
	            } else if (response.result == "unliked") {
	                // 좋아요 해제 상태일 경우
	                $("#likeButton").text("좋아요");
	            }
	            $("#likeCount").text(response.count);
	        })
		 };

		// 댓글 삭제 ajax
		$(document).on('click', '.cmtDelete', function(e){
			
			let commentId = $(this).closest("ul").find(".commentId").val();
			let boardType = $(this).closest("ul").find(".boardType").val();
			let boardId = $(this).closest("ul").find(".boardId").val();
			let cmtContent = $(this).closest("ul").find(".cmtContent").text();
			let findParent = $(this).closest("ul").next().find(".commentParent").val();
			let myParent = $(this).closest("ul").find(".commentParent").val();
			
			console.log('댓글 아이디');
			console.log(commentId);
			console.log('보드 타입');
			console.log(boardType);
			console.log('게시글id');
			console.log(boardId);
			console.log('댓글 내용');
			console.log(cmtContent);
			console.log('내 댓글이 0이면 부모 1이상이면 자식')
			console.log(myParent);
			console.log('다음글의 부모')
			console.log(findParent);
			
			/*  */
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
			
		});
		/* 삭제 끝 */

		/* 대댓글 작성 */
		$(document).on('click', '.cmtInsertFormButton', function(e){
			let commentId = $(this).closest("ul").find(".commentId").val();
			let boardType = $(this).closest("ul").find(".boardType").val();
			let boardId = $(this).closest("ul").find(".boardId").val();
			console.log(commentId);
			console.log(boardType);
			console.log(boardId);
			
			let replyInsert = document.getElementById("replyInsert");
			let replyInsertForm = document.getElementsByClassName("replyInsertForm");
			let closeReply = document.getElementById("closeReply");
			let myParent = $(this).closest("ul").find(".commentParent").val();
			
			// 모달창 열기
			replyInsert.style.display = "block";
			document.body.style.overflow = "hidden"; // 스크롤바 제거
			
			// 모달창 닫기
			closeReply.addEventListener("click", () => {
			replyInsert.style.display = "none";
			document.body.style.overflow = "auto"; // 스크롤바 보이기
			});
			
			$(document).on('click', '#insertButtonc', function(e){
				
				let commentContentc = $("textarea[name='commentContentc']").val();
				$.post("boardCmtInsert", {boardId : ${noticeInfo.noticeId},
										  boardType : '${noticeInfo.boardType}',
										  memberId : '${memberInfo.memberId}',
										  commentContent : commentContentc,
										  parentId : commentId 
					},function(response){
						$('.commentContentc').text('');
						console.log("댓글 등록 성공!");
						getcmtList();
						
						replyInsert.style.display = "none";
						document.body.style.overflow = "auto"; // 스크롤바 보이기
						
					});
			});
			
		});
		/* 대댓글 작성 끝 */
		
	</script>
</body>
</html>