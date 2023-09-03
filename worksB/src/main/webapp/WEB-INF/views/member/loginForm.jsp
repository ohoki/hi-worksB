<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
		<form action="${pageContext.request.contextPath }/login" method="post" class="login-form">
			<c:if test="${not empty errorMessage}">
				<p class="error-message">${errorMessage }</p>            
		    </c:if>
			<input type="text" placeholder="아이디" name="memberId" required>
			<input type="password" placeholder="비밀번호" name="memberPw" required>
			<a href="#" class="searchPw">비밀번호찾기</a>
			<button type="submit">로그인</button>
			<div class="auto">
				<label for="remember-me"><input type="checkbox" id="remember-me" name="remember-me">자동로그인</label>
			</div>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		</form>
	</div>
	
	<!-- 비밀번호 찾기 모달 -->
	<div id="searchPw-modal">
		<div class="searchPw-modal-content">
			<div class="taskManager-modal-title">
				<span>비밀번호 찾기</span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
			</div>
			<div>
				<div>
					<label></label>
					<input>
					<button></button>
				</div>
				<div>
					<label></label>
					<input>
				</div>
			</div>
			<div>
				<button></button>
				<button></button>
			</div>			
		</div>			
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