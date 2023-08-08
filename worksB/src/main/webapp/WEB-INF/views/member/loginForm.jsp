<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
</head>
<body>
	<div class="login-form-box">
		<h1 class="login-form-box__title">로그인</h1>
		<form action="#" method="post" class="login-form">
			<input type="text" placeholder="아이디">
			<input type="password" placeholder="비밀번호">
			<a href="#" class="searchPw">비밀번호찾기</a>
			<button type="button">로그인</button>
			<div class="auto">
				<label for="autoLogin"><input type="checkbox" id="autoLogin">자동로그인</label>
			</div>
		</form>
	</div>
</body>
</html>