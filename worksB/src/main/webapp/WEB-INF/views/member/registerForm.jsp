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
					<input type="email" placeholder="example@gmail.com" id="memberId" name="memberId" required>
					<button type="button" class="check-id" onclick="checkId()" value="0">중복확인</button>
				</div>
			</label>
			<label for="memberName">이름
			<input type="text" placeholder="이름" id="memberName" name="memberName" required>
			</label>
			<label for="memberPw">비밀번호
			<input type="password" placeholder="비밀번호는 특수문자(!, @, #, $, %)포함 6~12자만 가능합니다." id="memberPw" name="memberPw" required>
			</label>
			<label for="pwChek">비밀번호 확인
			<input type="password" placeholder="비밀번호 재입력" id="pwCheck" required>
			</label>
			<label for="memberPhone">전화번호
				<input type="text" placeholder="전화번호" id="memberPhone" name="memberPhone" required>
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
	<script>
		let checkIdBtn = $('.check-id');
		
		//checkId() -> 아이디 중복 체크
		function checkId() {
			let id = $('#memberId').val();
			
			if(id.length == 0) {
				alert('아이디를 입력해주세요.');
				return false;
			}
			
			$.ajax({
				url: 'selectMember?memberId='+id,
				type: 'get',
				success : function(data) {
					if(data == 1) {
						alert('사용가능한 아이디 입니다.');
						checkIdBtn.val(1);
					} else {
						alert('중복된 아이디 입니다.');
						checkIdBtn.val(0);
					}
				},
				error : function(reject) {
					console.log(reject);
				}
			});
		} //checkId() -> 아이디 중복 체크
		
		//회원가입 form 제출 전 정보 확인
		$('form').on('submit', function(e) {
			let memberPw = $('#memberPw').val();
			let pwCheck = $('#pwCheck').val();
			let consent = $('#consent');
			let special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			
			//아이디 중복체크 확인
			if(checkIdBtn.val() == 0) {
				alert('아이디 중복체크를 확인해 주세요.');
				$('#memberId').focus();
				return false;
			}
			//비밀번호 길이 확인
			if(memberPw.length < 6 || memberPw.length > 12) {
				alert('비밀번호는 6~12자 사이로 입력해주세요.');
				$('#memberPw').val('');
				$('#pwCheck').val('');
				$('#memberPw').focus();
				return false;
			}
			//특수 문자 확인
			if(special_pattern.test(memberPw) != true){
			    alert('비밀번호에 특수문자를 넣어주세요.');
			    $('#memberPw').val('');
				$('#pwCheck').val('');
				$('#memberPw').focus();
				return false;
			}
			
			if(memberPw != pwCheck) { //비밀번호가 같지 않으면
				alert('비밀번호를 확인해 주세요.');
				$('#memberPw').focus();
				return false;
			}
			if(!consent.is(':checked')) { //개인정보 동의 체크 안되면
				alert('개인정보 수집에 동의해주세요.');
				return false;	
			}
		}); //회원가입 form 제출 전 정보 확인
		
	</script>
</body>
</html>