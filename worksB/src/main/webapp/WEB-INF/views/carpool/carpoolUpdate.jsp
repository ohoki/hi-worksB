<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
}

.main__p {
	font-size: larger;
	font-weight: bolder;
}

div h2 {
	margin-top: 51px;
	text-align: center;
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

.table__title :first-child {
	display: inline-block;
	line-height: 26px;
	width: 40px;
	height: 25px;
	text-align: center;
	background: rgb(174, 213, 245);
	border: 1px solid rgb(174, 213, 245);
	border-radius: 5px;
	
}

.table__title :last-child {
	border: 1px solid rgb(174, 213, 245);
	border-radius: 3px;
	width: 757px;
	height: 25px;
}

</style>
</head>
<body>
	<div class="top">
		<h2>카풀 수정</h2>
	</div>
	<div class="body">
		<form action="carpoolUpdate" method="post">
			<table class="table">
				<thead>
					<tr class="main__p">
						<th class="table__title">
							<input type="text" name="boardTitle" value="${carpoolInfo.carpoolTitle }">
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="content">
								<input type="text" name="boardContent" value="${carpoolInfo.carpoolContent }">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<label>출발</label>
							<input type="text" name="departure" value="${carpoolInfo.departure }">
							<label>도착</label>
							<input type="text" name="arrival" value="${carpoolInfo.arrival }">
							<label>날짜</label>
							<input type="text" name="departureDate" value="${carpoolInfo.departureDate }">
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="category" value="B1" ><!-- 나중에 바꿔야됨 -->
							<input type="hidden" name="boardId" value="${carpoolInfo.boardId }">
						</td>
					</tr>
				</tbody>
			</table>
			<button type="button" onclick="location.href='carpoolList'">목록</button>
			<button type="submit">수정</button>
		</form>
	</div>
</body>
</html>