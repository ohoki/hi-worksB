<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <div class="register-form-box">
		<h1 class="register-form-box__title">회사정보</h1>
		<form action="${pageContext.request.contextPath }/admin/updateCompany" method="post" enctype="multipart/form-data" class="register-form">
			<label for="companyName">회사명
				<input type="text" value="${companyInfo.companyName }" name="companyName" required >
			</label>
			<p class="logo-text">로고 설정</p>
			<div class="flex-box">
				<img src="${pageContext.request.contextPath }/resources/img/no-image.jpg" class="image-box" />
				<label for="logoPath" class="upload-btn">
	      			<input type="file" accept=".png" name="logoPath" id="logoPath" data-width="400" data-height="100"/>
	      			<span>Upload Image</span>
      			</label>
			</div>
    		<p class="logo-notice">PNG만 허용(사이즈: 400*100px, 크기: 500KB까지)</p>
			<label for="companyAddr">회사주소
				<input type="text" placeholder="회사주소" value="${companyInfo.companyAddr }" name="companyAddr" required>
			</label>
			<label for="companyUrl"><p>회사URL</p>
				<span>htttps://</span><input type="text" placeholder="회사 URL" id="companyUrl" name="companyUrl" value="${companyInfo.companyUrl }" required><span>worksB.com</span>
			</label>
			
			<button type="button" id="updatebutton">수정하기</button>
			<input type="hidden" name="companyId" value="${companyInfo.companyId }">
		</form>
	</div> --%>
	
	<!-- 
	<div class="update-form">
		<div class="company-img">
			<c:if test="${companyInfo.realLogoPath eq null }">
				<img src="${pageContext.request.contextPath }/resources/img/no-image.jpg" alt="회사이미지" class="image-box">
			</c:if>
			<c:if test="${companyInfo.realLogoPath ne null }">
				<img src="${pageContext.request.contextPath }/images/${companyInfo.realLogoPath}" alt="회사이미지" class="image-box">
			</c:if>
			<label for="logo" class="upload-btn">
      			<input type="file" accept=".png" name="logo" id="logo"/>
      			<span>Upload Image</span>
			</label>
		</div>
		<form class="company-contents" id="updateCompany">
			<div class="">
				<div>
					<span>회사명</span>
					<label for="companyName">
						<input type="text" name="companyName" id="companyName" value="${companyInfo.companyName }">
					</label>
				</div>
				<div>
					<span>회사 URL</span>
					<label for="companyUrl">
						<span>htttps://</span><input type="text" id="companyUrl" name="companyUrl" value="${companyInfo.companyUrl }"><span>worksB.com</span>
					</label>
				</div>
				<div>
					<span>회사 주소</span>
					<label for="companyAddr">
						<input type="text" name="companyAddr" id="companyAddr" value="${companyInfo.companyAddr }">
					</label>
				</div>
			</div>
			<input type="hidden" id="companyId" name="companyId" value="${companyInfo.companyId }">
			<button type="submit">수정하기</button>
		</form>
	</div>
	-->
	
	<script>
	//=======================================================컨트롤러 수정
		// 수정 버튼 눌렀을때
		/* $('#updatebutton').on('click', function(e){
			let objData = serializeObject();
			
			$.post("company/updateCompany", objData, function (response) {
	            if (response) {
	                alert("수정 성공!");
	            } else {
	                alert("수정 실패!");
	            }
	        });
	    }); */
	    
	    $('#updateCompany').on('submit', function(e) {
			let objData = serializeObject();

			$.ajax({
				url : '${pageContext.request.contextPath}/company/updateCompany',
				method : 'POST',
				data : objData,
				success : function(data) {
					if(data) {
						alert('정상적으로 수정되었습니다.');
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
			console.log()
			return formObject;
		}
		
		//const fileDOM = document.querySelector('#logoPath');
	</script>
</body>
</html>