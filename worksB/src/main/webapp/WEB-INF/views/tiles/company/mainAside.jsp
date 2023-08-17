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
		<p class="side__menu__cate">프로젝트 관리</p>
		<div class="side__menu">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="projectList">내 프로젝트</a></li>
				<li class="side__menu__item"><a>전체 프로젝트</a></li>
				<li class="side__menu__item"><a>미확인 업무</a></li>
			</ul>
		</div>
		<!-- 게시판 -->
		<p class="side__menu__cate">사내 게시판</p>
		<div class="side__menu">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="noticeList">사내 공지</a></li>
				<li class="side__menu__item"><a>같이타요</a></li>
				<li class="side__menu__item"><a>동호회</a></li>
			</ul>
		</div>
		<!-- 마이 공간 -->
		<p class="side__menu__cate">${memberInfo.memberName }님의 공간</p>
		<div class="side__menu">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="privateSche">마이 캘린더</a></li>
				<li class="side__menu__item"><a>네이버 뉴스</a></li>
				<li class="side__menu__item"><a href="lunch">점.메.추</a></li>
			</ul>
		</div>
		<!-- 하단 메뉴 -->
		<div class="side__menu__bottom">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a>구성원 초대</a></li>
				<li class="side__menu__item"><a>관리자 설정</a></li>
			</ul>
		</div>
	</aside>
</body>
</html>