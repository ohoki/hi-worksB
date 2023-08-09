<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 등록 폼</title>
</head>
<body>
	<div>
		<h1 >회사정보</h1>
		<form action="#" method="post" enctype="multipart/form-data">
			<label for="companyName">회사명
				<input type="text" placeholder="회사명" name="companyName" required>
			</label>
			<label for="profilePath">로고 설정
			<input type="file" name="profilePath" required>
			<p>로고 사이즈 : max 400*100px / PNG만 가능</p> 
			</label>
			<label for="companyAddr">회사주소
			<input type="text" placeholder="회사주소" name="companyAddr" required>
			</label>
			<label for="companyUrl">회사URL
				<span>htttps://</span><input type="text" placeholder="회사 URL" name="companyUrl" readonly><span>worksB.com</span>
			</label>
			<button type="submit">등록하기</button>
		</form>
	</div>
</body>
</html>