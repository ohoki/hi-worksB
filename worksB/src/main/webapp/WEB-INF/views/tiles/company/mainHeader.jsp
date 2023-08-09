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
			<a href="home"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt="회사 로고"
				class="header__logo"></a>
		</div>
		<!-- 검색창 -->
		<input type="text" placeholder="검색" class="header__search">
		<!-- 상단 메뉴들 -->
		<div class="header__icon">
			<!-- 구성원 -->
			<a href="admin"> <i class="fa-solid fa-circle-user"
				style="color: #97a5bf;"></i>
			</a>
			<!-- 알림 -->
			<a href="#"> <i class="fa-solid fa-bell" style="color: #bcc4d2;"></i>
			</a>
			<!-- 프로필 -->
			<a href="#"> <img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진"
				class="header__profile">
			</a>
		</div>
	</header>
</body>
</html>