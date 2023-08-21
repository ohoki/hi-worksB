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
		border: 1px solid var(--color-dark-white);
		border-radius: 5px;
		margin-bottom: 30px; 
	}
	
	.profile-contents {
		display: flex;
		align-items: center;
		padding: 20px;
	}
	
	.user-information {
		border: 1px solid var(--color-dark-white);
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
	
	.upload-btn {
	    border: 1px solid #ddd;
	    padding: 6px 12px;
	    display: block;
	    cursor: pointer;
	    width: 90%;
	    border-radius: 5px;
  	}
  	
  	.upload-btn span {
  		font-size: 12px;
  		display: block;
  		text-align: center;
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
	}
	
	.user-information__title {
		display: flex;
		align-items: center;
		justify-content: space-between;
		border-bottom: 1px solid var(--color-dark-white);
	}
	
	.user-information__content {
		text-align: left;
		padding: 0 30px;
		
	}
	
	#oldPw, #newPw, #pwCheck {
		width: 200px;
		height: 30px;
		border-radius: 2px;
		border:  1px solid var(--color-dark-white);
		padding-left: 10px;
		box-sizing: border-box;
	}
	
	#checkPwBtn, #updatePwBtn {
		width: 100px;
		height: 40px;
		margin-left: 20px;
		background-color: rgb(174, 213, 245);
		border-radius: 5px;
		color: var(--color-white);
		font-weight: var(--weight-bold);
	}
	
	#updatePwBtn {
		display: block;
		margin: 0 auto;
	}
	
	.b_bt {
		border-bottom: 1px solid var(--color-dark-white);
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
						<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="image-box">
					</c:if>
				</div>	      			
				<div class="profile-content">
					<p><span>회사</span>${companyInfo.companyName }</p>
					<c:if test="${memberInfo.memberGrade eq 'ROLE_H1'}">
						<p><span>등급</span>관리자</p>
					</c:if>
					<c:if test="${memberInfo.memberGrade eq 'ROLE_H2'}">
						<p><span>등급</span>사원</p>
					</c:if>
					<c:if test="${memberInfo.memberGrade eq 'ROLE_H3'}">
						<p><span>등급</span>게스트</p>
					</c:if>
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
		//현재 비밀번호 확인 여부
		if($('#oldPw').attr('disabled') != 'disabled') {
			alert('현재 비밀번호를 확인해주세요.');
			$('#oldPw').focus();
			return false;
		}
		//새 비밀번호 일치 여부
		let newPw = $('#newPw').val();
		let pwCheck = $('#pwCheck').val();
		
		if(newPw != pwCheck) {
			alert('비밀번호가 일치하지 않습니다.');
			$('#newPw').val('');
			$('#pwCheck').val('');
			$('#newPw').focus();
			return false;
		}
		//비밀번호 변경
		$.ajax({
			url : '${pageContext.request.contextPath}/member/updateMember',
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