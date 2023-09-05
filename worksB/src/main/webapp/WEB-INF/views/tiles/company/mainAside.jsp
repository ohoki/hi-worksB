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
		width: 30%;
		height: 30%;
		top:40%;
		left: 50%;
		transform: translate(-50%, -50%);
		border-radius: 10px;
		text-align: center;
		padding: 30px 0 15px 0;
		color: var(--color-dark-grey);
		border: 1px solid var(--color-dark-beigie);
		background: #fff url(./resources/img/inviteMember.png) no-repeat center;
		background-size: 300px;
	}
	
	.invite-member-modal-title {
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 10px 30px;
	}
	
	.invite-member-modal-title span {
		font-weight: var(--weight-bold);
		font-size: var(--font-small);
	}
	
	.invite-member-modal-subject {
		display: flex;
		align-items: flex-start;
		flex-direction: column;
		justify-content: center;
		padding: 10px 30px;
	}
	
	.invite-email {
		display: flex;
		align-items: center;
		justify-content: center;
		margin: 30px auto;
	}
	
	.invite-email label {
		font-weight: var(--weight-bold);
		font-size: var(--font-micro);
		display: inline-block;
		width: 60px;
	}
	
	.invite-email input{
		width: 350px;
		height: 40px;
		margin: 10px 20px;
		border: 1px solid var(--color-dark-beigie);
		border-radius: 10px;
		display: inline-block;
		padding: 0 20px;
		color: var(--color-dark-grey);
	}
	
	button[name=invite] {
		margin-top:20px;
		background-color: var(--color-dark-red);
		width: 40%;
		height: 50px;
		text-align: center;
		color: white;
		font-weight: var(--weight-bold);
		font-size: var(--font-regular);
		border-radius: 5px;
	}
	
	button[name=invite]:hover {
		background-color: var(--color-white);
		color: var(--color-dark-red);
		border: 1px solid var(--color-dark-red);
		transition: all 0.5s;
	}
	
	#invitedId::placeholder {
		color: var(--color-dark-red);
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
			</ul>
		</div>
		<!-- 게시판 -->
		<p class="side__menu__cate"><img alt="프로젝트 아이콘" src="${pageContext.request.contextPath }/resources/icon/users-solid.svg">사내 게시판</p>
		<div class="side__menu">
			<ul class="side__menu__items">
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/noticeList">사내 공지</a></li>
				<li class="side__menu__item"><a href="${pageContext.request.contextPath }/carpoolList">같이타요</a></li>
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
			<div class="invite-member-modal-title">
				<span>구성원 초대</span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor" name="removeModal">
			</div>
			<div class="invite-member-modal-subject">
				<div>
					직원들과 협업을 시작해보세요.
				</div>
				<div class="invite-email">
					<label for="invitedId">이메일</label>
					<input id="invitedId" name="invitedId" type="email">
				</div>
			</div>
			<div>
				<button type="button" name="invite">초대하기</button>
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
		
		$('li[data-ivitemember]').on('click', function() {
			$('#invitedId').focus();
			$('#invitedId').attr('placeholder', '초대하실 이메일 주소를 입력해주세요.');
		});
	</script>
	<script>
		$('button[name="invite"]').on('click', function() {
			let invitedId = $('#invitedId').val();
			
			$('#invitedId').val('');
			$('#invitedId').attr('placeholder', '초대중입니다. 잠시만 기다려주세요.');
			
			
			$.ajax({
				url: '${pageContext.request.contextPath}/member/inviteMember',
				type: 'GET',
				data: {'invitedId' : invitedId},
				success : function(result) {
					if(result == 1) {
						alert('해당 이메일로 초대장이 발송되었습니다.');
						removeModal($('#invite-member-modal'));
					}		
				},
				error : function(reject) {
					console.log(reject);
				}
			});
		});
	</script>
</body>
</html>