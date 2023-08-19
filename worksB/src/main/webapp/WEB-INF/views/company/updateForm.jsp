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
	
	button[type=button], button[type=submit] {
		width: 100px;
		height: 40px;
		margin-left: 20px;
		background-color: rgb(174, 213, 245);
		border-radius: 5px;
		color: var(--color-white);
		font-weight: var(--weight-bold);
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
					<label for="logo" class="upload-btn">
		      			<input type="file" accept=".png" name="logo" id="logo"/>
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
		<form id="updateForm">
			<div class="user-information">
				<div class="user-information__title">
					<h1 class="title-font">회원 정보</h1>
					<button type="button">비밀번호 변경</button>
				</div>
				<div class="user-information__content">
					<p>
						<span>이름</span>
						<label for="memberName">
							<input type="text" name="memberName" id="memberName" value="${memberInfo.memberName }">
						</label>
					</p>
					<p>
					<span>연락처</span>
					<label for="memberPhone">
						<input type="text" name="memberPhone" id="memberPhone" value="${memberInfo.memberPhone }">
					</label>
					</p>
					<p>
						<span>부서</span>
						<label for="deptId">
							<select name="deptId" id="deptId">
								<c:forEach items="${deptList }" var="dept">
									<option value="${dept.deptId }">${dept.deptName }</option>
								</c:forEach>
							</select>
						</label>
					</p>
					<p>
					<span>직책</span>
						<label for="deptId">
							<select name="jobId" id="jobId">
								<c:forEach items="${jobList }" var="job">
									<option value="${job.jobId }">${job.jobName }</option>
								</c:forEach>
							</select>
						</label>
					</p>
				</div>
				<input type="hidden" id="memberId" name="memberId" value="${memberInfo.memberId }">
				<button type="submit">수정하기</button>
			</div>
		</form>
	</div>
</body>
<script>
	//정보 수정
	$('#updateForm').on('submit', function(e) {
		let objData = serializeObject();

		$.ajax({
			url : '${pageContext.request.contextPath}/member/updateMember',
			method : 'POST',
			data : objData,
			success : function(data) {
				if(data) {
					alert('회원 정보가 정상적으로 수정되었습니다.');
				} else {
					alert('다시 시도해주세요.');
				}
			},
			error : function(reject) {
				console.log(reject);
			}
		})
		return false;
	});
	
	//form데이터 객체로 변환
	function serializeObject() {
		let formData = $('form').serializeArray();
		let formObject = {};
		
		$.each(formData, function(idx, obj) {
			let field = obj.name;
			let val = obj.value;
			
			formObject[field] = val;
		})
		return formObject;
	}
	
	//비동기 방식으로 이미지 파일 미리보기 + 이미지 저장
	const fileDOM = document.querySelector('#logo');
	const preview = document.querySelector('.image-box');
	
	fileDOM.addEventListener('change', function() {
		let memberId = $('#memberId').val();
		let image = fileDOM.files[0];
		let formData = new FormData();
		
		formData.append("memberId", memberId);
		formData.append("image", image);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/member/updateProfile',
			type : 'POST',
			processData : false,
			contentType : false,
			data : formData,
			success : function(result) {
				if(result) {
					//미리보기 이미지 출력
					preview.src = URL.createObjectURL(image);
				}else {
					alert('이미지 업로드에 실패했습니다.');
				}
			},
			error : function(reject) {
				console.log(reject);
			}
		});
	});
	
</script>
</html>