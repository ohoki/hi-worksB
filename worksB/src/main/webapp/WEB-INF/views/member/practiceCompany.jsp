<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기존 회사 참여</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/practiceCompany.css">
</head>
<body>
<div class="form-box">
	<h1 class="form-box__title">기존 회사 참여</h1>
	<p class="form-box__sub">이미 회사에서 사용하고 있다면 회사 URL을 입력하여 함께하세요.</p>
	<form action="#" method="post" class="form">
		<div class="form__input-box">
			<label for="companyUrl"><p>회사URL</p>
				<span>htttps://</span><input type="text" placeholder="회사 URL" name="companyUrl" id="companyUrl"><span>worksB.com</span>
			</label>
		</div>	
		<p class="form-box__sub">회사 URL 주소는 관리자를 통해 확인할 수 있습니다.</p>
		<button type="submit" class="form__btn">참여하기</button>
		<p class="form-box__sub link red">
			<a href="${pageContext.request.contextPath }/companyRegisterForm">신규 회사 URL을 등록하시겠습니까?</a>
		</p>
	</form>
	<script>
		$(window).on('load',function() {
			let message = '${message}';
			
			if(message != ''){
				alert(message);
			}
		});
	</script>
</div>
</body>
</html>