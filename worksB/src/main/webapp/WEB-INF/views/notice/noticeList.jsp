<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<style>
body {
    font-size: small;
}

.insert {
    width: 800px;
    height: 72px;
    margin: 0 auto;
    margin-bottom: 10px;
    margin-top: 50px;
    text-align: center;
}

.insert__button {
    width: 80px;
    height: 30px;
    float: right;
    border: 1px solid;
    border-radius: 4px;
    color: black;
}

.table {
    width: 800px;
    margin: 0 auto;
}

table, td, th{
    border : 0.5px solid rgb(211, 211, 211);
    border-collapse : collapse;
    border-left: none;
    border-right: none;
    text-align: center;
}

th, td {
    padding: 10px;
}

table :first-child{
    padding: 0px;
    width: 60px;
    height: 40px;
}

table :nth-child(2) {
    padding: 0px;
    width: 500px;
}

table :nth-child(3) {
    padding: 0px;
}

table :nth-child(4) {
    padding: 0px;
}

table :nth-child(5) {
    padding: 0px;
}

table :nth-child(6) {
    padding: 0px;
}

table :nth-child(2) :nth-child(2) {
    text-align: left;
}


/* search */

 form {
    margin: 0 auto;
    padding-top: 20px;
    width: 300px;
 }

.search {
    height: 110px;
    background-color: rgb(249, 247, 249);
    width: 800px;
    margin: 0 auto;
}

.search__search {
    margin: 0 auto;
    margin-top: 20px;
    width: 315px;
    height: 0px;
    display: flex;
    justify-content: center;
}

.search__select {
    height: 28px;
}

.search__input {
    padding: 0px;
    height: 26px;
    border-top: 1px solid black;
    border-bottom: 1px solid black;
    
}

.search__submit {
    margin: 0px;
    height: 28px;
    width: 48px;
    border: 1px solid black;
    color: black;
    border-radius: 2px;
    
}
</style>
<body>
	<div class="insert">
		<h2>공지사항</h2>
		<button type="button" class="insert__button">공지 작성</button>
	</div>

	<table class="table">
		<thead>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>좋아요</th>
				<th>조회</th>
			</tr>
		<tbody>
			<c:forEach items="${notice}" var="notice">
				<tr onclick="location.href='noticeInfo?noticeId=${notice.noticeId}'">
					<td>${notice.noticeId }</td>
					<td>${notice.noticeTitle }</td>
					<td><!-- member_name 넣는자리 -->관리자</td>
					<td><fmt:formatDate value="${notice.boardRegdate }" pattern="yyyy/MM/dd" /></td>
					<td><!-- 좋아요 -->2</td>
					<td>${notice.boardHit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- search -->
	<div class="search">
		<form action="" method="">
			<div class="search__search">
				<select name="검색" class="search__select">
					<option value="">제목</option>
					<option value="">내용</option>
					<option value="">작성자</option>
					<option value="">제목+내용</option>
				</select> <input type="text" class="search__input">
				<button type="submit" class="search__submit">검색</button>
			</div>
		</form>
	</div>
</body>
</html>