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
	padding-left: 15px
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
	border-bottom: 1px solid rgba(0, 0, 0, 0.199);
	border-top: 1px solid rgba(0, 0, 0, 0.199);
	
}

.buttonss {
	width: 800px;
	height: 50px;
	border-bottom: solid 1px rgba(0, 0, 0, 0.199);
}

.button1 {
	float: left;
	margin-top: 5px;
}

.buttons {
	float: right;
	width: 90px;
	margin-top: 5px;
}

.buttons :first-child {
	float: left;
	margin-right: 3px;
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
									<p class="writer__p">${memberId} 회원 이름 나오는곳<!-- 작성자 넣는칸 -->
									</p>
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
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="buttonss">
			<div class="button1">
				<button type="button">목록</button>
			</div>
			<div class="buttons">
				<button type="button">수정</button>
				<button type="button">삭제</button>
			</div>
		</div>
	</div>
</body>
</html>