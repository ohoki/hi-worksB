<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 폼</title>
<style>
	.update-form {
		width: 70%;
		margin: 50px auto;
		text-align: center;
		
	}
	
	.profile-form {
		border: 1px solid var(--color-dark-beigie);
		border-radius: 5px;
		margin-bottom: 30px; 
	}
	
	.profile-contents {
		display: flex;
		align-items: center;
		padding: 20px;
	}
	
	.user-information {
		border: 1px solid var(--color-dark-beigie);
		border-radius: 5px;
		padding-bottom: 20px;
	}
	
	.title-font {
		font-weight: var(--weight-bold);
		font-size: var(--font-regular);
		margin: 0;
		padding: 20px;
		text-align: left;
	}
  	
  	.image-box {
  		width: 200px;
  		height: 200px;
  	}
  	
  	input[type=file] {
	      display: none;
	}
	
	.profile-content__img {
		margin-right: 50px;
	}
	
	.profile-content {
		font-size: 18px;
		text-align: left;
	}
	
	.profile-content span, .user-information span {
		width: 200px;
		display: inline-block;
		font-weight: var(--weight-bold);
		font-size: 17px;
		color: var(--color-dark-red);
	}
	
	.user-information__title {
		display: flex;
		align-items: center;
		justify-content: space-between;
		border: 1px solid var(--color-dark-beigie);
	}
	
	.user-information__content {
		text-align: left;
		padding: 0 30px;
		
	}
	
	#oldPw, #newPw, #pwCheck {
		width: 200px;
		height: 30px;
		border-radius: 2px;
		border: 1px solid var(--color-dark-beigie);
		padding-left: 10px;
		box-sizing: border-box;
	}
	
	#checkPwBtn, #updatePwBtn {
		width: 100px;
		height: 40px;
		margin-left: 20px;
		background-color: rgb(22, 66, 91, 0.8);
		border-radius: 5px;
		color: var(--color-white);
		font-weight: var(--weight-bold);
	}
	
	#updatePwBtn {
		display: block;
		margin: 0 auto;
	}
	
	.b_bt {
		border: 1px solid var(--color-dark-beigie);
	}
</style>
</head>
<body>
	<div class="update-form">
		<div class="profile-form">
			<h1 class="title-font b_bt">프로필</h1>
			<div class="profile-contents">
				<div class="profile-content__img">
					<c:if test="${memberInfo.realProfilePath eq null }">
						<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="image-box">
					</c:if>
					<c:if test="${memberInfo.realProfilePath ne null }">
						<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="image-box" onerror="this.src='${pageContext.request.contextPath}/resources/img/user.png'">
					</c:if>
				</div>	      			
				<div class="profile-content">
					<p><span>회사</span>${companyInfo.companyName }</p>
					<p><span>등급</span>${memberInfo.memberGradeLiteral }</p>
					<p><span>아이디</span>${memberInfo.memberId }</p>					
				</div>
			</div>
		</div>
		<form>
			<div class="user-information">
				<div class="user-information__title">
					<h1 class="title-font">비밀번호 변경</h1>
				</div>
				<div class="user-information__content">
					<p>
						<span>현재 비밀번호</span>
						<label for="oldPw">
							<input type="password" name="oldPw" id="oldPw">
						</label>
						<button type="button" id="checkPwBtn">확인하기</button>
					</p>
					<p>
						<span>새 비밀번호</span>
						<label for="newPw">
							<input type="password" name="memberPw" id="newPw" disabled>
						</label>
					</p>
					<p>
						<span>새 비밀번호 확인</span>
						<label for="pwCheck">
							<input type="password" name="pwCheck" id="pwCheck" disabled>
						</label>
					</p>
					<button type="button" id="updatePwBtn">변경하기</button>
				</div>	
			</div>	
		</form>
	</div>
</body>
<script>
	//비밀번호 확인
	$('#checkPwBtn').on('click', function() {
		let pw = $('#oldPw').val();
		let newPw = $('#newPw').val();
		let pwCheck = $('#pwCheck').val();
		
		if(pw.length == 0) {
			alert('현재 비밀번호를 입력해주세요.');
			return false;
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/member/pwCheck',
			type : 'POST',
			data : {'memberPw' : pw},
			success : function(data) {
				if(data) {
					alert('확인되었습니다.');
					$('#oldPw').attr('disabled', true);
					$('#newPw').attr('disabled', false);
					$('#pwCheck').attr('disabled', false);
					$('#newPw').focus();
				} else {
					alert('비밀번호가 일치하지 않습니다.');
					$('#oldPw').val('');
					$('#oldPw').focus();
				}
			},
			error : function(reject) {
				console.log(reject);
			}
		});
	})
	
	//비밀번호 변경
	$('#updatePwBtn').on('click', function() {
		let special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		let newPw = $('#newPw').val();
		let pwCheck = $('#pwCheck').val();
		
		//현재 비밀번호 확인 여부
		if($('#oldPw').attr('disabled') != 'disabled') {
			alert('현재 비밀번호를 확인해주세요.');
			$('#oldPw').focus();
			return false;
		}
		//비밀번호 길이 확인
		if(newPw.length < 6 || newPw.length > 12) {
			alert('비밀번호는 6~12자 사이로 입력해주세요.');
			$('#newPw').val('');
			$('#pwCheck').val('');
			$('#newPw').focus();
			return false;
		}
		
		//특수 문자 확인
		if(special_pattern.test(newPw) != true){
		    alert('비밀번호에 특수문자를 넣어주세요.');
		    $('#newPw').val('');
			$('#pwCheck').val('');
			$('#newPw').focus();
			return false;
		}
		
		//새 비밀번호 일치 여부
		if(newPw != pwCheck) {
			alert('비밀번호가 일치하지 않습니다.');
			$('#newPw').val('');
			$('#pwCheck').val('');
			$('#newPw').focus();
			return false;
		}
		//비밀번호 변경
		$.ajax({
			url : '${pageContext.request.contextPath}/updateMember',
			type : 'POST',
			data : {'memberId' : '${memberInfo.memberId}', 'memberPw' : newPw},
			success : function(data) {
				if(data) {
					alert('비밀번호가 정상적으로 변경되었습니다.');
				} else {
					alert('비밀번호가 변경되지않았습니다. 다시 시도해주세요.');
				}
				$('#oldPw').val('');
				$('#newPw').val('');
				$('#pwCheck').val('');
				$('#oldPw').attr('disabled', false);
				$('#newPw').attr('disabled', true);
				$('#pwCheck').attr('disabled', true);
			},
			error : function(reject) {
				console.log(reject);
			}
		});
	});
</script>
</html>