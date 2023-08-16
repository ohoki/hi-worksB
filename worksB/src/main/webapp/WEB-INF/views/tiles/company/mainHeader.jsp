<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- header -->
	<header class="header">
		<!-- 회사 로고 -->
		<div>
			<a href="start"><img src="${pageContext.request.contextPath}/images/${companyInfo.realLogoPath }" alt="회사 로고"
				class="header__logo"></a>
		</div>
		<!-- 검색창 -->
		<input type="text" placeholder="검색" class="header__search">
		<!-- 상단 메뉴들 -->
		<div class="header__icon">
			<!-- 구성원 -->
			<a href="#" data-type="employees"> 
				<i class="fa-brands fa-weixin" style="color: #c5c5c5;"></i>
			</a>
			<!-- 알림 -->
			<a href="#" data-type="alarm"> <i class="fa-solid fa-bell" style="color: #bcc4d2;"></i>
			</a>
			<!-- 프로필 -->
			<a href="#" data-type="profile"> <img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진"
				class="header__profile">
			</a>
			<div id="profile-modal" class="modal">
				<div class="profile-modal__title">
					<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="modal-logo">
					<div>${memberInfo.memberName }</div>
				</div>
				<p>
					<a href="#">프로필 수정</a>
				</p>
				<p>
					<a href="#">상태변경</a>
				</p>
				<p>
					<a href="#">로그아웃</a>
				</p>
			</div>
		</div>
	</header>
<script>
	$('a').on('click', function(e) {
		let type = e.currentTarget.dataset.type;
		
		if(type == 'profile') {
			$('#profile-modal').toggleClass('modal-visible');
		}
	});
</script>
</html>