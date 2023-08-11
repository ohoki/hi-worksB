<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>접속 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<!--header-->
	<header class="index-header">
		<a href="home"><img src="${pageContext.request.contextPath }/resources/img/company_logo.png" alt="worksB 로고"></a>
		<div>
			<span>w</span> <span>o</span> <span>r</span> <span>k</span> <span>s</span>
			<span>B</span>
		</div>
	</header>
	<!--main-->
	<main class="index-main">
		<div>
			<img
				src="${pageContext.request.contextPath }/resources/img/main_img.png"
				alt="메인 이미지">
		</div>
		<div class="index-main__right-main">
			<h1>
				사내 활동과 협업툴을 한 곳에서<br> All In One Tool !!
			</h1>
			<h1 class="worksB">
				<span>w</span> <span>o</span> <span>r</span> <span>k</span> <span>s</span>
				<span><a href="home">B</a></span>
			</h1>
			<c:if test="${memberId ne null }">
			<button type="button" onclick="location.href='loginForm?memberId='+'${memberId }'+'&companyId='+'${companyId}'">시작하기</button>
			</c:if>
			<c:if test="${memberId eq null }">
			<button type="button" onclick="location.href='loginForm?memberId='+'${cookie.memberId.value}'+'&companyId='+'${cookie.companyId.value}'">시작하기</button>
			</c:if>
		</div>
	</main>
	<!--footer-->
	<footer class="index-footer">
		<div class="index-footer__box">
			<div>
				<span class="strong">상호</span> <span> : worksB</span> <span
					class="strong">대표자</span> <span> : 최영호</span>
			</div>
			<div>
				<span class="strong">사업자등록번호</span> <span> : 000-00-00000</span> <span
					class="strong">통신판매업신고번호</span> <span> : 제0000-대구-0000호</span>
			</div>
			<div>
				<span class="strong">연락처</span> <span> : 000-000-0000</span> <span
					class="strong">팩스</span> <span> : 000-0000-0000</span> <span
					class="strong">이메일</span> <span> : support@worksB.team</span>
			</div>
			<div>
				<span class="strong">주소</span> <span>대구광역시 중구 중앙대로 403 5층</span>
			</div>
		</div>
		<div>2023 worksB - All rights reserved</div>
	</footer>
</body>
</html>