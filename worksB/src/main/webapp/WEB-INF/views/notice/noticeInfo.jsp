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
							    좋아요 수: <span id="likeCount">${likeCount}</span>
							
							    <!-- 좋아요 버튼 -->
							    <button id="likeButton" onclick="toggleLike(${noticeInfo.noticeId}, '${memberInfo.memberId}')">좋아요</button>
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
				<button type="button" class="buttonss__button" onclick="location.href='noticeUpdate?noticeId=${noticeInfo.noticeId}'">수정</button>
				<button type="button" class="buttonss__button" onclick="location.href='noticeDelete?noticeId=${noticeInfo.noticeId}'">삭제</button>
			</div>
		</div>
		<div>
			<form>
				<table>
					<thead>
						<tr>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tr>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
	 // 좋아요 버튼 클릭 시 호출되는 함수
    function toggleLike(boardId, memberId) {
        // 서버로 비동기 요청을 보냄
        $.get("/like", { boardType: "NOTICE", boardId: boardId, memberId: memberId }, function (response) {
            // 서버로부터 받은 값에 따라 동작 결정
            if (response === "liked") {
                // 좋아요 상태일 경우 
                $("#likeButton").text("좋아요 해제");
            } else if (response === "unliked") {
                // 좋아요 해제 상태일 경우
                $("#likeButton").text("좋아요");
            }
        });

        // 좋아요 수 업데이트
        $.get("/countLikes", { boardType: "NOTICE", boardId: boardId }, function (count) {
            // 서버로부터 받은 좋아요 수(count)로 화면 업데이트
            $("#likeCount").text(count);
        });
    }
	</script>
</body>
</html>