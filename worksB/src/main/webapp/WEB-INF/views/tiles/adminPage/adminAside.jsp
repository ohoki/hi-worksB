<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- side -->
	<aside class="side">
		<!-- 프로젝트 관리 -->
		<p class="side__menu__cate">회사 관리</p>
		<div class="side__menu">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="${pageContext.request.contextPath}/admin/companyInfo">회사정보</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath}/admin/memberManagement">구성원</a></li>
				<li class="side__menu__item"><a>동호회</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath}/admin/editRole">부서 및 직급편집</a></li>
			</ul>
		</div>
		<!-- 게시판 -->
		<p class="side__menu__cate">프로젝트 관리</p>
		<div class="side__menu">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="${pageContext.request.contextPath}/admin/projectlist">전체 프로젝트</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath}/admin/downloadlist">파일 다운로드 이력</a></li>
			</ul>
		</div>
		<!-- 하단 메뉴 -->
		<div class="side__menu__bottom">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="${pageContext.request.contextPath}/start">홈으로</a></li>
				<li class="side__menu__item"><a>관리자 설정</a></li>
			</ul>
		</div>
	</aside>
</body>
</html>