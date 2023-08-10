<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 등록 폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/register.css">
<style>
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
	
	#logoPath{
		margin-bottom: 5px;
	}
	
	.logo-text {
		text-align: left;
		font-size: var(--font-micro);
		margin: 0;
	}
	
	.image-box {
	    width: 200px;
	    height: 50px;
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
</style>
</head>
<body>
	<div class="register-form-box">
		<h1 class="register-form-box__title">회사정보</h1>
		<form action="insertCompany" method="post" enctype="multipart/form-data" class="register-form">
			<label for="companyName">회사명
				<input type="text" placeholder="회사명" name="companyName" required >
			</label>
			<p class="logo-text">로고 설정</p>
			<div class="flex-box">
				<img src="${pageContext.request.contextPath }/resources/img/no-image.jpg" class="image-box" />
				<label for="logoPath" class="upload-btn">
	      			<input type="file" accept=".png" name="logoPath" id="logoPath" required/>
	      			<span>Upload Image</span>
      			</label>
			</div>
    		<p class="logo-notice">PNG만 허용(사이즈: 400*100px, 크기: 500KB까지)</p>
			<label for="companyAddr">회사주소
				<input type="text" placeholder="회사주소" name="companyAddr" required>
			</label>
			<label for="companyUrl"><p>회사URL</p>
				<span>htttps://</span><input type="text" placeholder="회사 URL" name="companyUrl" id="companyUrl" required><span>worksB.com</span>
			</label>
			<button type="submit">등록하기</button>
		</form>
	</div>
</body>
<script>
	//비동기 방식으로 이미지 파일 미리보기
	const fileDOM = document.querySelector('#logoPath');
	const preview = document.querySelector('.image-box');
	
	fileDOM.addEventListener('change', function() {
		const reader = new FileReader();
		
		reader.onload = ({ target }) => {
			preview.src = target.result;
		};
		
		reader.readAsDataURL(fileDOM.files[0]);
	});
	
	//회사 등록
	$('form').addEventListener('submit', function(e) {
		let formData = new FormData();
		
		
		$.ajax({
			url:'',
			type:'POST',
			processData: false,
			contentType: false,
			data: formData,
			success: function(result) {
				console.log(result);
			},
			error: function(reject) {
				console.log(reject);
			}
		});
	});
</script>
</html>