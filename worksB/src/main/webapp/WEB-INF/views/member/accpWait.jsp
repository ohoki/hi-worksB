<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인 대기 페이지</title>
<style>
.main-box {
	text-align: center;
	width: 70%;
	margin: 50px auto;
	height: 600px;
}

.wait-icon {
	width: 20%;
	margin-top: 50px;
}

.main-box button {
	width: 20%;
	height: 50px;
	border-radius: 5px;
	background-color: rgb(174, 213, 245);
	border-radius: 5px;
	color: var(--color-white);
	font-weight: var(--weight-bold);
	margin-top: 50px;
}
</style>
</head>
<body>
	<div class="main-box">
		<img alt="승인 대기중" src="${pageContext.request.contextPath }/resources/img/outstanding authorization.png" class="wait-icon">
		<div>
			<div>승인 대기중입니다.</div>
			<div>관리자의 승인을 기다려주세요.</div>
		</div>
		<button type="button" onclick="location.href='${pageContext.request.contextPath }/'">홈으로</button>
	</div>	
</body>
</html>