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
		<form action="loginMember" method="post" class="login-form">
			<input type="text" placeholder="아이디" name="memberId" required>
			<input type="password" placeholder="비밀번호" name="memberPw" required>
			<a href="#" class="searchPw">비밀번호찾기</a>
			<button type="submit">로그인</button>
			<div class="auto">
				<label for="autoLogin"><input type="checkbox" id="autoLogin" name="autoLogin">자동로그인</label>
			</div>
		</form>
	</div>
</body>
<script>
	$(window).on('load',function() {
		let message = '${message}';
		
		if(message != ''){
			alert(message);
		}
	});
</script>
</html>