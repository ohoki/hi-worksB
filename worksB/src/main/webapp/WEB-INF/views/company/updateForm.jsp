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
	}
	
	.title-font {
		font-weight: var(--weight-bold);
		font-size: var(--font-regular);
		border-bottom: 1px solid var(--color-dark-white);
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
	
	.profile-content span {
		width: 200px;
		display: inline-block;
		font-weight: var(--weight-bold);
	}
</style>
</head>
<body>
	<div class="update-form">
		<div class="profile-form">
			<h1 class="title-font">프로필</h1>
			<div class="profile-contents">
				<div class="profile-content__img">
					<c:if test="${memberInfo.realProfilePath eq null }">
						<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진">
					</c:if>
					<c:if test="${memberInfo.realProfilePath ne null }">
						<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진">
					</c:if>
					<label for="logo" class="upload-btn">
		      			<input type="file" accept=".png" name="logo" id="logo" data-width="400" data-height="100"/>
		      			<span>Upload Image</span>
					</label>
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
		<div class="user-information">
			<h1 class="title-font">회원 정보</h1>
			<div>
				<p>${memberInfo.memberName }</p>
				<p>${memberInfo.memberPhone }</p>
				<p>${memberInfo.deptId }</p>
				<p>${memberInfo.jobId }</p>
			</div>
		</div>
		<button>비밀번호 변경</button>
		<button>수정하기</button>
	</div>
</body>
</html>