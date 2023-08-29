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
		<form action="carpoolInfo" method="post">
			<table class="table">
				<thead>
					<tr class="main__p">
						<th class="table__title">
						<c:choose>
							<c:when test="${carpoolInfo.category eq 'B1' }">
								[태워드립니다] 
							</c:when>
							<c:otherwise>
								[태워주세요] 
							</c:otherwise>
						</c:choose>
							${carpoolInfo.boardTitle }
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="contents">
								<div class="writer">
									<p class="writer__p">${carpoolInfo.memberName}</p>
								</div>
								<div class="date">
									<p class="date__date">조회수 ${carpoolInfo.boardHit } | <fmt:formatDate value="${carpoolInfo.boardRegdate}" pattern="yyyy/MM/dd HH:mm:ss"/></p>
								</div>
								<div class="date">
									<p class="date__date"><fmt:formatDate value="${carpoolInfo.boardUpddate }" pattern="yyyy/MM/dd" /></p>
								</div>
							</div>
							<div class="content">
								<p class="content__text">
									${carpoolInfo.boardContent }
								</p>
								<p>
									출발 : ${carpoolInfo.departure } 
								</p>
								<p>
									도착 : ${carpoolInfo.arrival } 
								</p>
								<p>탑승 인원 수 : ${carpoolInfo.passenger }</p>
								<p>출발 시간 : <fmt:formatDate value="${carpoolInfo.departureDate }" pattern="yyyy/MM/dd HH:mm"/></p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="buttonss">
			<div class="button1">
				<button type="button" class="buttonss__button" onclick="location.href='carpoolList'">목록</button>
			</div>
			<div class="buttons">
				<c:if test="${memberInfo.memberId eq carpoolInfo.memberId}">
				<button type="button" class="buttonss__button" onclick="location.href='carpoolUpdate?boardId=${carpoolInfo.boardId}'">수정</button>
				<button type="button" class="buttonss__button" onclick="location.href='carpoolDelete?boardId=${carpoolInfo.boardId}'">삭제</button>
				</c:if>
			</div>
		</div>
		
		<!-- 아래부터 댓글 공간 -->
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
</body>
</html>