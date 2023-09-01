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

.cmtComment {
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

.cmtCommentc {
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


/* 대댓글 작성폼 */
#cmtList__cmtInsertc {
	
}

</style>
</head>
<body>
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
		<!-- 댓글 -->
		<div class="boardCmtList">
		</div>
		<!-- 댓글 입력 폼 -->
		<form id="cmtInsert" method="post">
			<div class="cmtList">
				<p class="cmtList__cmtInsert">댓글 작성 | ${memberInfo.memberName }</p>
				<div id="cmtInsert__text">
					<textarea id="commentContent" name="commentContent" placeholder="댓글을 입력하세요"></textarea>
					<button type="button" id="insertButton">버튼</button>
				</div>
			</div>
		</form>
		<!-- 대댓글 작성 폼 -->
		<form class="cmtInsertForm" style="display: none;">
			<div class="cmtList">
	    	<p class="cmtList__cmtInsertc">댓글 작성 | ${memberInfo.memberName }</p>
	    	<div id="cmtInsert__textc">
	        	<textarea class="commentContentc" name="commentContentc" placeholder="댓글을 입력하세요"></textarea>
	        	<button type="button" id="insertButtonc">버튼</button>
	    	</div>
    	</div>
    
		</form>
	</div>
	<script>
		
		$(document).ready(function(){
			// 댓글 리스트 출력
			getcmtList();
		});
		
		$(document).on('click', '#cmtUpdate', function(e){
			console.log('버튼 누르기 성공')
			var saveUpdate = this.parentNode.parentNode.lastChild.previousElementSibling.children;
			console.log(saveUpdate);
		})
		
		
		
		// 댓글 리스트를 출력하는 함수
		function getcmtList(){
			var cmt = $(".boardCmtList");
			var str = "";
			$.get("boardCmtList",{boardId : ${noticeInfo.noticeId}, boardType : 'C2'},function(list) {
				for(var i = 0 , len = list.length || 0; i < len; i++ ){
					/* 부모/자식 댓글 구분 */
					if(list[i].parentId == 0){
						/* 부모 댓글일 경우 */
						str += "<ul>" + "<li class='cmtName'>" + list[i].memberName + "</li>";
					 	str +=	"<li class='cmtInsert'>" + "<button type='button' id='cmtInsertFormButton'>" + "대댓글작성" + "</button>" + "</li>";
					 	/* 내가 쓴 글일경우 */
					 	if(list[i].memberId == "${memberInfo.memberId}"){
					 		str += "<li class='cmtInsert'>" + "<button type='button' id='cmtUpdate''>" + "수정" + "</button>" + "</li>";
					 		str += "<li class='cmtInsert'>" + "<button type='button' '>" + "삭제" + "</button>" + "</li>";
					 	}
						str += "<li class='cmtDate'>" + list[i].commentRegdate + " |" + "</li>";
						str += "<li class='cmtComment'>" + list[i].commentContent + "</li>";
						str += "<li>" + "<input type='hidden' id='commentIdd' value='" + list[i].commentId +" '>" + "</li>" + "</ul>" /* 나중에 삭제해야됨 */
					}else {
						/* 자식 댓글일 경우 */
						str +=  "<ul class = 'cmts'>" + "<li class='cmtNamec'>" + list[i].memberName + "</li>";
					 	/* 내가 쓴 글일경우 */
					 	if(list[i].memberId == "${memberInfo.memberId}"){
					 		str += "<li class='cmtInsert'>" + "<button type='button'>" + "수정" + "</button>" + "</li>";
					 		str += "<li class='cmtInsert'>" + "<button type='button'>" + "삭제" + "</button>" + "</li>";
					 	}
						str += "<li class='cmtDatec'>" + list[i].commentRegdate + " |" + "</li>";
						str += "<li class='cmtCommentc'>" + list[i].commentContent + "</li>" + "</ul>" ;
					}
				}
				cmt.html(str);
			})
		};
		
		
		
		// 댓글 등록 ajax
		document.getElementById('insertButton').addEventListener('click', function(){
			var commentContent = $("textarea[name='commentContent']").val();
			console.log(commentContent);
	    	$.post("boardCmtInsert", {boardId: ${noticeInfo.noticeId}, boardType: 'C2',
	    							  memberId: '${memberInfo.memberId}',
	 								  commentContent: commentContent, 
	 								  parentId : 0
			    }, function (response) {
			    	$('#commentContent').val('');
			    	getcmtList();
			    });
		})
		
	
	 // 좋아요 버튼 클릭 시 호출되는 함수
    function toggleLike(boardId, memberId) {
        // 서버로 비동기 요청을 보냄
        $.get("like", { boardType: "C2", boardId: boardId, memberId: memberId }, function (response) {
            // 서버로부터 받은 값에 따라 동작을 결정함
            if (response.result == 'liked') {
                // 좋아요 상태일 경우 
                $("#likeButton").text("좋아요 취소");
            } else if (response.result == "unliked") {
                // 좋아요 해제 상태일 경우
                $("#likeButton").text("좋아요");
            }
            $("#likeCount").text(response.count);
        });
	 }

	</script>
</body>
</html>