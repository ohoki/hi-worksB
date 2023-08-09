<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기존 회사 참여</title>
</head>
<body>
<div>
	<h1>기존 회사 참여</h1>
	<p>이미 회사에서 사용하고 있다면 회사 URL을 입력하여 함께하세요.</p>
	<form action="#" method="post">
		<label for="companyUrl">
			<span>htttps://</span><input type="text" placeholder="회사 URL" name="companyUrl"><span>worksB.com</span>
		</label>	
		<p>회사 URL 주소는 관리자를 통해 확인할 수 있습니다.</p>
		<button type="submit">참여하기</button>
		<p>
			<a href="${pageContext.request.contextPath }/companyRegisterForm">신규 회사 URL을 등록하시겠습니까?</a>
		</p>
	</form>
</div>
</body>
</html>