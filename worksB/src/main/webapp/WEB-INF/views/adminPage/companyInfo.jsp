<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/register.css">
<title>Insert title here</title>
<style>
	.register-form-box {
		margin: 50px;
	}

	.register-form {
		width: 40%;
	}

	.logo-notice {
		font-size: var(--font-micro);
		color: var(--color-red);
		margin-top: 0;
		margin-bottom: 20px;
		text-align: left;
	}
	
	#companyUrl {
		display:inline-block;
		width: 68%;
		height: 50px;
		border: 1px solid var(--color-light-white);
		border-radius: 5px;
		margin: 0 10px;
		margin-bottom: 40px;
	}
	
	#logo{
		margin-bottom: 5px;
	}
	
	.logo-text {
		text-align: left;
		font-size: var(--font-micro);
		margin: 0;
	}
	
	.image-box {
	    width: 400px;
	    height: 100px;
	    margin: 5px 0;
	    text-align: left;
	    margin-right: 20px;
	 }

 	.upload-btn {
	    border: 1px solid #ddd;
	    padding: 6px 12px;
	    display: inline-block;
	    cursor: pointer;
	    width: 20% !important;
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
	
	.flex-box {
		align-items: center;
		margin-bottom: 5px;
	}
	
	.active::placeholder {
		color : var(--color-dark-red);
	}
</style>
</head>
<body>
	<div class="register-form-box">
		<h1 class="register-form-box__title">회사정보</h1>
		<form action="${pageContext.request.contextPath }/admin/updateCompany" method="post" enctype="multipart/form-data" class="register-form">
			<label for="companyName">회사명
				<input type="text" value="${companyInfo.companyName }" name="companyName"  id="companyName" required >
			</label>
			<p class="logo-text">로고 설정</p>
			<div class="flex-box">
				<c:if test="${companyInfo.realLogoPath eq null }">
						<img src="${pageContext.request.contextPath }/resources/img/no-image.jpg" alt="기본 프로필 사진" class="image-box">
					</c:if>
					<c:if test="${companyInfo.realLogoPath ne null }">
						<img src="${pageContext.request.contextPath}/images/${companyInfo.realLogoPath }" alt="기본 프로필 사진" class="image-box" onerror="this.src='${pageContext.request.contextPath}/resources/img/no-image.jpg'">
					</c:if>
				<label for="logo" class="upload-btn">
	      			<input type="file" accept=".png" name="logo" id="logo" data-width="400" data-height="100"/>
	      			<span>Upload Image</span>
      			</label>
			</div>
    		<p class="logo-notice">PNG만 허용(사이즈: 400*100px, 크기: 500KB까지)</p>
			<label for="companyAddr">회사주소
				<input type="text" placeholder="회사주소" value="${companyInfo.companyAddr }" id="companyAddr" name="companyAddr" required>
			</label>
			<label for="companyUrl"><p>회사URL</p>
				<span>htttps://</span><input type="text" placeholder="회사 URL" id="companyUrl" name="companyUrl" value="${companyInfo.companyUrl }" required><span>worksB.com</span>
			</label>
			
			<button type="button" id="updatebutton">수정하기</button>
			<input type="hidden" name="companyId" value="${companyInfo.companyId }">
		</form>
	</div>
	<script>
		//비동기 방식으로 이미지 파일 미리보기 + 사이즈 및 용량제한
		const fileDOM = document.querySelector('#logo');
		const preview = document.querySelector('.image-box');
		
		let maxWidth = fileDOM.dataset.width;
		let maxHeigth = fileDOM.dataset.height;
		let maxSize = 512000;
		
		fileDOM.addEventListener('change', function() {
			//파일 용량 제한
			if(fileDOM.files[0].size > maxSize) {
				alert('500KB이하의 이미지만 등록할 수 있습니다.');
				fileDOM.value = '';
				return false;		
			}
		
			//이미지 사이즈 제한
			let img = new Image();
			img.src = URL.createObjectURL(fileDOM.files[0]);
			
			img.onload = function() {
				if(this.width > maxWidth || this.heigth > maxHeigth) {
					alert('400 * 100px 이미지만 등록할 수 있습니다.');
					fileDOM.value = '';
				} else {
					//미리보기 이미지 출력
					preview.src = URL.createObjectURL(fileDOM.files[0]);		
				}
			};
		});
	
		// 수정 버튼 눌렀을때
		$('#updatebutton').on('click', function(e){
			let formData = new FormData();
			let companyName = $('#companyName').val();
			let companyAddr = $('#companyAddr').val();
			let companyUrl = $('#companyUrl').val();
			let companyId = '${companyInfo.companyId}';
			let logo = fileDOM.files[0];
			
			formData.append("companyId", companyId);
			formData.append("companyName", companyName);
			formData.append("companyAddr", companyAddr);
			formData.append("companyUrl", companyUrl);
			formData.append("logo", logo);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/updateCompany',
				type : 'POST',
				processData : false,
				contentType : false,
				data : formData,
				success : function(message) {
					alert(message);
					location.reload();
				},
				error : function(reject) {
					console.log(reject);
				}
			})
    });

	</script>
</body>
</html>