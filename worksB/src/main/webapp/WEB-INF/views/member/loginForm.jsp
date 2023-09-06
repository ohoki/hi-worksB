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
			<div class="searchPw-modal-title">
				<span>비밀번호 찾기</span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor" name="removeModal">
			</div>
			<div style="padding: 10px 30px; padding-left: 100px;">
				<div class="searchPw-modal-info">
					<label for="searchMemberId">이메일</label>
					<input id="searchMemberId" name="searchMemberId" type="email">
					<button>인증번호 발송</button>
				</div>
				<div class="CertificationNumber">
					<label for="CertificationNumber">인증번호</label>
					<input id="CertificationNumber" name="CertificationNumber" disabled type="text">
				</div>
			</div>
			<div>
				<button type="reset">취소</button>
				<button type="button">인증하기</button>
			</div>			
		</div>			
	</div>
	
	<!-- 비밀번호 변경 -->
	<div id="updatePw-modal">
		<div class="updatePw-modal-content">
			<div class="updatePw-modal-title">
				<span>비밀번호 변경</span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor" name="removeModal">
			</div>
			<div style="padding: 10px 30px; padding-left: 100px;">
				<div class="updatePw-modal-info">
					<label for="newPw">새 비밀번호</label>
					<input id="newPw" name="newPw" type="password" style="width: 67%;" placeholder="비밀번호는 특수문자를 포함해서 6~12자만 가능합니다.">
				</div>
				<div class="updatePw-modal-check">
					<label for="newPwCheck">비밀번호 확인</label>
					<input id="newPwCheck" name="newPwCheck" type="password" style="width: 65%;" placeholder="비밀번호 재입력">
				</div>
			</div>
			<div>
				<button type="reset">취소</button>
				<button type="button">변경하기</button>
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
	

	function addModal(modal) {
		modal.addClass('d-b');
	}
	
	function removeModal(modal) {
		modal.removeClass('d-b');
	}
	//모달창 켜고 끄기
	$('.searchPw').on('click', function() {
		addModal($('#searchPw-modal'));
	});
	
	$('div[id$="-modal"]').on('click', function(e) {
		removeModal($(e.currentTarget));
	});
	
	$('div[class$="-modal-content"]').on('click', function(e) {
		e.stopPropagation();
	});
	
	$('img[name="removeModal"]').on('click', function(e) {
		let modalBox = $(e.currentTarget).closest('div[id$="modal"]');
		removeModal(modalBox);
	});
	
	//인증번호 발송
	$('.searchPw-modal-info button').on('click', function(e) {
		let memberIdInput = $(e.currentTarget).prev();
		let memberId = memberIdInput.val();
		
		if(memberId.length != 0) {
			$.ajax({
				url: 'selectMember?memberId='+memberId,
				type: 'GET',
				success : function(data) {
					if(data == 1) { //아이디 없음
						memberIdInput.val('');
						memberIdInput.focus();
						memberIdInput.attr('placeholder', '입력하신 아이디는 존재하지 않습니다.');
					} else {
						alert('인증번호 전송중입니다. 잠시만 기다려주세요.');
						$.ajax({
							url : '${pageContext.request.contextPath}/makeCertificationNumber',
							type : 'POST',
							data : {'memberId' : memberId},
							success : function(message) {
								memberIdInput.prop('disabled', true);
								$('#CertificationNumber').prop('disabled', false);
								$('#CertificationNumber').attr('placeholder', message);
							},
							error : function(reject) {
								console.log(reject);
							}
						});
					}
				},
				error : function(reject) {
					console.log(reject);
				}
			});
		} else {
			memberIdInput.attr('placeholder', '아이디를 입력해주세요!!');
		}
	});
	
	// 인증번호 인증하기
	$('#searchPw-modal button[type="button"]').on('click', function(e) {
		let CertificationNumber = $('#CertificationNumber').val();
		let memberId = $('#searchMemberId').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/confirmCertificationNumber',
			type : 'POST',
			data : {'memberId' : memberId, 'mailKey' : CertificationNumber},
			success : function(result) {
				if(result > 0) {
					let inputHidden = `<input type="hidden" value = \${memberId} name="memberId">`;
					
					alert('인증되었습니다.');
					$('#searchPw-modal').removeClass('d-b');
					$('#updatePw-modal').append(inputHidden);
					$('#updatePw-modal').addClass('d-b');
					$('#searchMemberId').val('');
					$('#CertificationNumber').val('');
				}else {
					alert('인증번호를 다시 입력해주세요.');
					$('#CertificationNumber').val('');
					$('#CertificationNumber').focus();
				}	
			},
			error : function(reject) {
				console.log(reject);
			}
		});
	});
	
	//비밀번호 변경
	$('#updatePw-modal button[type="button"]').on('click', function() {
		let newPw = $('#newPw').val();
		let newPwCheck = $('#newPwCheck').val();
		let memberId = $('#updatePw-modal input[name="memberId"]').val();
		let special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

		//비밀번호 길이 확인
		if(newPw.length < 6 || newPw.length > 12) {
			alert('비밀번호는 6~12자 사이로 입력해주세요.');
			$('#newPw').val('');
			$('#newPwCheck').val('');
			$('#newPw').focus();
			return false;
		}
		
		//특수 문자 확인
		if(special_pattern.test(newPw) != true){
		    alert('비밀번호에 특수문자를 넣어주세요.');
		    $('#newPw').val('');
			$('#newPwCheck').val('');
			$('#newPw').focus();
			return false;
		}
		
		//새 비밀번호 일치 여부
		if(newPw != newPwCheck) {
			alert('비밀번호가 일치하지 않습니다.');
			$('#newPw').val('');
			$('#newPwCheck').val('');
			$('#newPw').focus();
			return false;
		}
		//비밀번호 변경
		$.ajax({
			url : '${pageContext.request.contextPath}/updateMember',
			type : 'POST',
			data : {'memberId' : memberId, 'memberPw' : newPw},
			success : function(data) {
				if(data) {
					alert('비밀번호가 정상적으로 변경되었습니다.');
				} else {
					alert('비밀번호가 변경되지않았습니다. 다시 시도해주세요.');
				}
				$('#updatePw-modal').removeClass('d-b');
				$('#newPw').val('');
				$('#newPwCheck').val('');
			},
			error : function(reject) {
				console.log(reject);
			}
		});
	});
	
</script>
</html>