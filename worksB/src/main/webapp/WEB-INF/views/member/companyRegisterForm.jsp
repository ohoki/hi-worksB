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
</style>
</head>
<body>
	<div class="register-form-box">
		<h1 class="register-form-box__title">회사정보</h1>
		<form action="${pageContext.request.contextPath }/member/insertCompany" method="post" enctype="multipart/form-data" class="register-form" id="companyRegisterForm">
			<label for="companyName">회사명
				<input type="text" placeholder="회사명" name="companyName" required >
			</label>
			<p class="logo-text">로고 설정</p>
			<div class="flex-box">
				<img src="${pageContext.request.contextPath }/resources/img/no-image.jpg" class="image-box" />
				<label for="logo" class="upload-btn">
	      			<input type="file" accept=".png" name="logo" id="logo" data-width="400" data-height="100"/>
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
	$(window).on('load',function() {
		let message = '${message}';
		
		if(message != ''){
			alert(message);
		}
	});

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
	
	//로고 없으면 알림창
	$('#companyRegisterForm').on('submit', function(e) {
		e.preventDefault();
		
		if(fileDOM.value == '') {
			alert("로고를 등록해주세요.");
		}else {
			$('form').unbind('submit');
		}
	});
</script>
</html>