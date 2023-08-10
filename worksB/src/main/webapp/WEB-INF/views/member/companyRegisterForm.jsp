<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 등록 폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/register.css">
<style>
	.logo-notice {
		font-size: var(--font-micro);
		color: var(--color-red);
		margin-top: 0;
		margin-bottom: 20px;
	}
	#companyUrl {
		display:inline-block;
		width: 68%;
		height: 50px;
		border: 1px solid var(--color-light-white);
		border-radius: 5px;
		margin: 0 10px;
		margin-bottom: 40px;
	}
	
	#profilePath{
		margin-bottom: 5px;
	}
</style>
</head>
<body>
	<div class="register-form-box">
		<h1 class="register-form-box__title">회사정보</h1>
		<form action="#" method="post" enctype="multipart/form-data" class="register-form">
			<label for="companyName">회사명
				<input type="text" placeholder="회사명" name="companyName" required>
			</label>
			<label for="profilePath">로고 설정
			<input type="file" name="profilePath" id="profilePath" required>
			<p class="logo-notice">PNG만 허용(사이즈: 400*100px, 크기: 500KB까지)</p> 
			</label>
			<label for="companyAddr">회사주소
			<input type="text" placeholder="회사주소" name="companyAddr" required>
			</label>
			<label for="companyUrl"><p class="companyUrl">회사URL</p>
				<span>htttps://</span><input type="text" placeholder="회사 URL" name="companyUrl" id="companyUrl"><span>worksB.com</span>
			</label>
			<button type="submit">등록하기</button>
		</form>
	</div>
</body>
</html>