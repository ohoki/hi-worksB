<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/register.css">
</head>
<body>
	<div class="register-form-box">
		<h1 class="register-form-box__title">회원가입</h1>
		<form action="insertMember" method="post" class="register-form">
			<label for="memberId">이메일
				<div class="member-id-box">
					<input type="text" placeholder="example@gmail.com" id="memberId" name="memberId">
					<button type="button" class="check-id">인증하기</button>
				</div>
			</label>
			<label for="memberName">이름
			<input type="text" placeholder="이름" id="memberName" name="memberName">
			</label>
			<label for="memberPw">비밀번호
			<input type="password" placeholder="비밀번호" id="memberPw" name="memberPw">
			</label>
			<label for="pwChek">비밀번호 확인
			<input type="password" placeholder="비밀번호 재입력" id="pwCheck">
			</label>
			<label for="memberPhone">전화번호
				<input type="text" placeholder="전화번호" id="memberPhone" name="memberPhone">
			</label>
			<label for="consent" class="flex-box">
				<input type="checkbox" id="consent" name="consent">(필수)서비스 이용약관, 개인정보처리방침을 확인하였고, 이에 동의합니다.
			</label>
			<div class="register-form__btns">
				<button type="submit">가입</button>
				<button type="reset">취소</button>
			</div>
		</form>
	</div>
</body>
</html>