<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/headers/">
<link href="${pageContext.request.contextPath }/resources/headers.css"
	rel="stylesheet">

<main>
	<nav class="py-2 bg-body-tertiary border-bottom">
		<div class="container d-flex flex-wrap">
			<ul class="nav me-auto">
				<li class="nav-item"><a
					href="${pageContext.request.contextPath }/"
					class="nav-link link-body-emphasis px-2 active" aria-current="page">Home</a></li>
				<li class="nav-item"><a href="boardList"
					class="nav-link link-body-emphasis px-2">Board List</a></li>
				<li class="nav-item"><a href="boardInsert"
					class="nav-link link-body-emphasis px-2">Board Insert</a></li>
				<li class="nav-item"><a href="mandalart"
					class="nav-link link-body-emphasis px-2">점심 뭐먹지</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link link-body-emphasis px-2">About</a></li>
			</ul>
			<ul class="nav">
				<li class="nav-item"><a href="#"
					class="nav-link link-body-emphasis px-2">Login</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link link-body-emphasis px-2">Sign up</a></li>
			</ul>
		</div>
	</nav>

	<header class="py-3 mb-4 border-bottom">
		<div class="container d-flex flex-wrap justify-content-center">
			<a href="${pageContext.request.contextPath }"
				class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto link-body-emphasis text-decoration-none">
				<span><span class="glyphicon glyphicon-home" aria-hidden="true">
				</span></span> <span class="fs-4">나는 헤드야</span>
			</a>
			<form class="col-12 col-lg-auto mb-3 mb-lg-0" role="search">
				<input type="search" class="form-control" placeholder="검색아직안됨..."
					aria-label="Search">
			</form>
		</div>
	</header>
</main>