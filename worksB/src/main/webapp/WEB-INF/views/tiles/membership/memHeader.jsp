<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>접속 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home.css">
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.7.0.min.js"></script>
</head>
<style>
.index-header{
	justify-content: space-between;
}
.index-header__logo{
	display: flex;
	margin-left: 0 !important;
	align-items: center;
}
.index-header_btns {
	margin-right: 50px !important;
}

.index-header_btn {
	width: 100px;
	height: 40px;
	margin-left: 20px;
	background-color: rgb(174, 213, 245);
	border-radius: 5px;
	color: var(--color-white);
	font-weight: var(--weight-bold);
}

.index-header_btn:hover, .active{
	background-color: var(--color-white);
	border-radius: 5px;
	color: rgb(174, 213, 245);
	font-weight: var(--weight-bold);
	border: 1px solid rgb(174, 213, 245);
}
</style>
<body>
	<!--header-->
	<header class="index-header">
		<div class="index-header__logo">
			<a href="${pageContext.request.contextPath }/home"><img src="${pageContext.request.contextPath }/resources/img/company_logo.png" alt="worksB 로고"></a>
			<div>
				<span>w</span> <span>o</span> <span>r</span> <span>k</span> <span>s</span>
				<span>B</span>
			</div>
		</div>
		<div class="index-header_btns">
			<c:if test="${memberId eq null}">
				<button type="button" class="index-header_btn active" id="loginBtn" value="로그인">로그인</button>
				<button type="button" class="index-header_btn" id="registerBtn" value="회원가입">회원가입</button>
			</c:if>
			<c:if test="${memberId ne null}">
			<form action="${pageContext.request.contextPath }/logout" method="post" id="logout">
				<button type="submit" class="index-header_btn active" id="logoutBtn" value="로그아웃">로그아웃</button>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			</form>
			</c:if>
		</div>
	</header>
	<script>
		$('.index-header_btn').on('click', function(e) {
			let loginBtn = $('#loginBtn');
			let registerBtn = $('#registerBtn');
			
			if(e.currentTarget.value == '로그인') {
				location.href='loginForm';
			}else if(e.currentTarget.value == '회원가입') {
				location.href='registerForm';
			}
		});
	</script>
</body>
</html>