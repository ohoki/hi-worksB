<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<c:if test="${memberInfo.realProfilePath eq null }">
			<a href="#" data-type="profile"> <img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진"
				class="header__profile">
			</a>
			</c:if>
			<c:if test="${memberInfo.realProfilePath ne null }">
			<a href="#" data-type="profile"> <img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진"
				class="header__profile">
			</a>
			</c:if>
			
			<div id="profile-modal">
				<div class="profile-modal__content">
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
						<a href="logout">로그아웃</a>
					</p>
				</div>			
			</div>
		</div>
	</header>
<script>
	//모달페이지 출력
	$('a').on('click', function(e) {
		let type = e.currentTarget.dataset.type;
		
		if(type == 'profile') {
			$('#profile-modal').addClass('modal-visible');
			$('body').css('overflow', 'hidden');
		}
	});
	
	//여백 누르면 모달페이지 종료
	$('[id*=modal]').on('click', function() {
		$('.modal-visible').removeClass('modal-visible');
		$('body').css('overflow', 'visible');
	})
</script>
</html>