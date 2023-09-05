<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.d-b {
		display: block !important;
	}
	
	#invite-member-modal{
		position: absolute;
		width: 100%;
		height: 110%;
		background-color: rgba(0,0,0,0.1);
		font-size: 12px;
		display: none;
		left: 0;
		top: 0;
		z-index: 4;
	}
	
	.invite-member-modal-content {
		position: absolute;
		background-color: white;
		width: 40%;
		height: 30%;
		top:40%;
		left: 50%;
		transform: translate(-50%, -50%);
		border-radius: 10px;
		text-align: center;
		padding: 30px 0 15px 0;
		color: var(--color-dark-grey);
		border: 1px solid var(--color-dark-beigie);
	}
</style>
</head>
<body>
	<!-- side -->
	<aside class="side">
		<!-- 프로젝트 관리 -->
		<p class="side__menu__cate"><img alt="프로젝트 아이콘" src="${pageContext.request.contextPath }/resources/icon/folder-solid.svg">프로젝트 관리</p>
		<div class="side__menu">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/projectList">내 프로젝트</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/SelectFromCompany">전체 프로젝트</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/">미확인 업무</a></li>
			</ul>
		</div>
		<!-- 게시판 -->
		<p class="side__menu__cate"><img alt="프로젝트 아이콘" src="${pageContext.request.contextPath }/resources/icon/users-solid.svg">사내 게시판</p>
		<div class="side__menu">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/noticeList">사내 공지</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/carpoolList">같이타요</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/">동호회</a></li>
			</ul>
		</div>
		<!-- 마이 공간 -->
		<p class="side__menu__cate"><img alt="프로젝트 아이콘" src="${pageContext.request.contextPath }/resources/icon/face-laugh-wink-solid.svg">${memberInfo.memberName }님의 공간</p>
		<div class="side__menu">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="privateSche">마이 캘린더</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/naverNews">네이버 뉴스</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/lunch">점.메.추</a></li>
			</ul>
		</div>
		<!-- 하단 메뉴 -->
		<div class="side__menu__bottom">
			<ul class="side__menu__items">
				<li class="side__menu__item" data-iviteMember><a href="#">구성원 초대</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath}/admin/companyInfo">관리자 설정</a></li>
			</ul>
		</div>
	</aside>
	
	<!-- 구성원 초대 모달 -->
	<div id="invite-member-modal">
		<div class="invite-member-modal-content">
			<div class="sinvite-member-modal-title">
				<span>비밀번호 찾기</span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor" name="removeModal">
			</div>
			<div style="padding: 10px 30px; padding-left: 100px;">
				<div class="invite-member-modal-info">
					<label for="searchMemberId">아아디</label>
					<input id="searchMemberId" name="searchMemberId" type="email">
					<button>인증번호 발송</button>
				</div>
				<div class="CertificationNumber">
					<label for="CertificationNumber">인증번호</label>
					<input id="CertificationNumber" name="CertificationNumber" disabled type="text">
				</div>
			</div>
			<div>
				<button type="reset">취소</button>
				<button type="button">인증하기</button>
			</div>			
		</div>			
	</div>
	
	<script>
		function addModal(modal) {
			modal.addClass('d-b');
		}
		
		function removeModal(modal) {
			modal.removeClass('d-b');
		}
		//모달창 켜고 끄기
		$('li[data-iviteMember]').on('click', function() {
			addModal($('#invite-member-modal'));
		});
		
		$('div[id$="-modal"]').on('click', function(e) {
			removeModal($(e.currentTarget));
		});
		
		$('div[class$="-modal-content"]').on('click', function(e) {
			e.stopPropagation();
		});
		
		$('img[name="removeModal"]').on('click', function(e) {
			let modalBox = $(e.currentTarget).closest('div[id$="modal"]');
			removeModal(modalBox);
		});
	</script>
</body>
</html>