<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="register-form-box">
		<h1 class="register-form-box__title">회사정보</h1>
		<form action="${pageContext.request.contextPath }/admin/updateCompany" method="post" enctype="multipart/form-data" class="register-form">
			<label for="companyName">회사명
				<input type="text" placeholder="회사명" name="companyName" required >
			</label>
			<p class="logo-text">로고 설정</p>
			<div class="flex-box">
				<img src="${pageContext.request.contextPath }/resources/img/no-image.jpg" class="image-box" />
				<label for="logo" class="upload-btn">
	      			<input type="file" accept=".png" name="logo" id="logo" data-width="400" data-height="100"/>
	      			<span>Upload Image</span>
      			</label>
			</div>
    		<p class="logo-notice">PNG만 허용(사이즈: 400*100px, 크기: 500KB까지)</p>
			<label for="companyAddr">회사주소
				<input type="text" placeholder="회사주소" name="companyAddr" required>
			</label>
			<label for="companyUrl"><p>회사URL</p>
				<span>htttps://</span><input type="text" placeholder="회사 URL" name="companyUrl" id="companyUrl" required><span>worksB.com</span>
			</label>
			<p>직원참여옵션</p>
			
			<button type="submit">수정하기</button>
		</form>
	</div>
</body>
</html>