<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		a{
			text-decoration: none;
		}
	</style>
</head>
<body>
	<!-- header -->
	<header class="company-header">
		<!-- 회사 로고 -->
		<div>
			<a href="${pageContext.request.contextPath}/start"><img src="${pageContext.request.contextPath}/images/${companyInfo.realLogoPath }" alt="회사 로고"
				class="header__logo"></a>
		</div>
		<!-- 검색창 -->
		<form action="${pageContext.request.contextPath }/searchboard" name="boardSearchform">
			<input type="text" placeholder="검색" value="${searchVO.searchkeyword}" name="searchkeyword" class="header__search">
			<select name="searchBoardType">
				<option value="1" <c:if test="${searchVO.searchtype==1}"> selected   </c:if>>프로젝트</option>
				<option value="2" <c:if test="${searchVO.searchtype==2}"> selected   </c:if>>사내게시판</option>
				<option value="3" <c:if test="${searchVO.searchtype==3}"> selected   </c:if>>전체</option>
			</select>
			<button type="submit" >검색</button>
		</form>
		<!-- 상단 메뉴들 -->
		<div class="header__icon">
			<!-- 구성원 -->
			<a href="#" data-type="employees"> 
			<img alt="구성원 정보 보기" src="${pageContext.request.contextPath}/resources/icon/comments-solid.svg" class="header__profile">
			</a>
			<!-- 알림 -->
			<a href="#" data-type="alarm"> 
				<img alt="알림 보기" src="${pageContext.request.contextPath}/resources/icon/bell-solid.svg" class="header__profile">
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
			<div class="status"></div>
			<!-- 프로필 모달 -->
			<div id="profile-modal">
				<div class="profile-modal__content">
					<div class="profile-modal__title">
						<c:if test="${memberInfo.realProfilePath eq null }">
							<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="modal-logo">
						</c:if>
						<c:if test="${memberInfo.realProfilePath ne null }">
							<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="modal-logo">
						</c:if>
						<div>${memberInfo.memberName }</div>
					</div>
					<p>
						<a href="#" data-type="my-profile">내 프로필</a>
					</p>
					<p>
						<a href="#" data-type="status">상태변경</a>
					</p>
					<p>
						<a href="#" data-type="logout">로그아웃</a>
					</p>
					<form action="${pageContext.request.contextPath }/logout" method="post" id="logout">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					</form>
				</div>			
			</div>
			<!-- 개인정보 모달 -->
			<div id="my-profile-modal">
				<div class="my-profile-modal__content">
					<div>
						<c:if test="${memberInfo.realProfilePath eq null }">
							<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="my-profile-logo">
						</c:if>
						<c:if test="${memberInfo.realProfilePath ne null }">
							<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="my-profile-logo">
						</c:if>	
						<div class="my-profile-modal__name">${memberInfo.memberName }</div>
						<ul>
							<li class="my-profile-item"><img alt="소속 회사" src="${pageContext.request.contextPath}/resources/icon/building-solid.svg" class="item-icon"><span>${companyInfo.companyName }</span></li>
							<li class="my-profile-item"><img alt="이메일" src="${pageContext.request.contextPath}/resources/icon/envelope-solid.svg" class="item-icon"><span>${memberInfo.memberId }</span></li>
							<li class="my-profile-item"><img alt="이메일" src="${pageContext.request.contextPath}/resources/icon/mobile-screen-button-solid.svg" class="item-icon"><span>${memberInfo.memberPhone }</span></li>
							<li class="my-profile-item">
								<img alt="이메일" src="${pageContext.request.contextPath}/resources/icon/circle-info-solid.svg" class="item-icon">
								<span>
									<c:if test="${memberInfo.deptId eq 0}">-</c:if>
									<c:if test="${memberInfo.deptId ne 0}">${memberInfo.deptName }</c:if>
								</span></li>
						</ul>
						<button type="button" class="my-profile__btn">정보 수정</button>
					</div>	
				</div>			
			</div>
			<!-- 상태변경 모달 -->
			<div id="status-modal">
				<div class="status-modal__content">
					<ul>
						<li><span class="status-green"></span>접속 중</li>
						<li><span class="status-yellow"></span>자리 비움</li>
						<li><span class="status-red"></span>접속 종료</li>
					</ul>
				</div>			
			</div>
			<!-- 알림 모달 -->
			<div id="alarm-modal">
				<div class="alarm-modal__content">
					<div class="flex alarm__title">
						<span>알림</span>
						<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
					</div>
					<div class="flex alarm__subtitle">
						<div >
							<span class="alarm__subtitle__item cursor">미확인</span>
							<span class="alarm__subtitle__item cursor">전체</span>
						</div>
						<div class="alarm__subtitle__item cursor">모두읽음</div>
					</div>
					<input type="text" class="alarm_search-input" placeholder="검색">
					<ul class="flex alarm-category">
						<li class="category-list cursor">전체</li>
						<li class="category-list cursor">프로젝트</li>
						<li class="category-list cursor">사내게시판</li>
						<li class="category-list cursor">개인일정</li>
					</ul>
					<div class="flex">
						알림내역
					</div>
				</div>			
			</div>
			<!-- 구성원 모달 -->
			<div id="employees-modal">
				<div class="employees-modal__content">
					<div class="flex employees__title">
						<span>구성원</span>
						<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
					</div>
					<input type="text" class="employees_search-input" placeholder="검색">
					<div id="employees">	
					</div>
				</div>			
			</div>
			<!-- 구성원 정보 모달 -->
			<div id="employee-modal">
				<div class="employee__content">
					<div>
						<img src="" alt="기본 프로필 사진" class="my-profile-logo" id="e-img">	
						<div class="employee-modal__name"></div>
						<ul>
							<li class="my-profile-item"><img alt="소속 회사" src="${pageContext.request.contextPath}/resources/icon/building-solid.svg" class="item-icon"><span id="e-company">${companyInfo.companyName }</span></li>
							<li class="my-profile-item"><img alt="이메일" src="${pageContext.request.contextPath}/resources/icon/envelope-solid.svg" class="item-icon"><span id="e-id"></span></li>
							<li class="my-profile-item"><img alt="이메일" src="${pageContext.request.contextPath}/resources/icon/mobile-screen-button-solid.svg" class="item-icon"><span id="e-phone"></span></li>
							<li class="my-profile-item">
								<img alt="이메일" src="${pageContext.request.contextPath}/resources/icon/circle-info-solid.svg" class="item-icon">
								<span id="e-dept"></span></li>
						</ul>
						<button type="button" class="chat__btn">채팅하기</button>
					</div>	
				</div>			
			</div>
		</div>
	</header>
<script>
	//접속상태 표시
	$(window).on('load', function() {
		let status = '${memberInfo.empStatus}';
		let statusDiv = $('.status');
		
		if(status == 'S1') {
			statusDiv.addClass('status-green');
		}else if(status == 'S2') {
			statusDiv.addClass('status-yellow');
		}else if(status == 'S3') {
			statusDiv.addClass('status-red');
		}
	});
	
	//모달페이지 출력
	$('a').on('click', function(e) {
		e.stopPropagation();
		let type = e.currentTarget.dataset.type;
		
		if(type == 'profile') {
			$('#profile-modal').addClass('modal-visible');
		}else if(type == 'logout') {
			$('#logout').submit();
		}else if(type == 'my-profile') {
			$('.modal-visible').removeClass('modal-visible');
			$('#my-profile-modal').addClass('modal-visible');
		}else if(type == 'alarm') {
			$('#alarm-modal').addClass('modal-visible');
		}else if(type == 'employees') {
			$('#employees-modal').addClass('modal-visible');
			//구성원 리스트 출력
			let employeesDiv = $('#employees');
			employeesDiv.empty();
			$.ajax({
				url : '${pageContext.request.contextPath}/member/memberList',
				type : 'GET',
				data : {'companyId' : "${memberInfo.companyId}"},
				success : function(members) {
					let employeesDiv = $('#employees');
					//멤버 리스트 태그 만들기
					for(let i=0; i<members.length; i++) {
						//div태그
						let employeeDiv = document.createElement('div');
						employeeDiv.classList.add('flex');
						employeeDiv.classList.add('employee');
						/* employeeDiv.setAttribute('onclick', 'abc(this)'); */
						//이미지 태그
						let employeeProfile = document.createElement('img');
						employeeProfile.setAttribute('alt', '회원사진');
						employeeProfile.classList.add('employee-img');
						if(members[i].realProfilePath != null) {
							employeeProfile.src = "${pageContext.request.contextPath}/images/"+members[i].realProfilePath;
						}else {
							employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
						}
						//스팬 태그
						let span = document.createElement('span');
						span.innerText = members[i].memberName;
						//히든 인풋 태그 (멤버id값)
						let input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.value = members[i].memberId;
						//태그 삽입
						employeeDiv.append(employeeProfile);
						employeeDiv.append(span);
						employeeDiv.append(input);
						
						employeesDiv.append(employeeDiv);
					}
				},
				error : function(reject) {
					console.log(reject);
				}
			});
		}else if(type == 'status') {
			$('#status-modal').addClass('modal-visible');
		}
	});
	
	//여백 누르면 모달페이지 종료
	$('[id*=modal]').on('click', function() {
		$('.modal-visible').removeClass('modal-visible');
	})
	
	$('.my-profile__btn').on('click', function() {
		location.href='${pageContext.request.contextPath}/member/updateForm';
	})
	
	//접속상태 변경
	$('.status-modal__content li').on('click', function(e) {
		e.stopPropagation();
		let value = e.currentTarget.innerText;
		let statusDiv = $('.status');

		if(value == '접속 중') {
			value = 'S1';
			statusDiv.removeClass('status-green status-yellow status-red');
			statusDiv.addClass('status-green');
			$('.modal-visible').removeClass('modal-visible');
		}else if(value == '자리 비움') {
			value = 'S2';
			statusDiv.removeClass('status-green status-yellow status-red');
			statusDiv.addClass('status-yellow');
			$('.modal-visible').removeClass('modal-visible');
		}else if(value == '접속 종료') {
			value = 'S3';
			statusDiv.removeClass('status-green status-yellow status-red');
			statusDiv.addClass('status-red');
			$('.modal-visible').removeClass('modal-visible');
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/member/updateMember',
			type : 'get',
			data : {'memberId' : '${memberInfo.memberId}', 'empStatus' : value},
			error : function(reject) {
				console.log(reject);
			}	
		});
		
	});
	
	//구성원 정보 출력
	$(document).on("click",".employee",function(e){
		e.stopPropagation();
		let memberId = $(e.currentTarget).children('input').val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/member/getMember',
			type : 'GET',
			data : {'memberId' : memberId},
			success : function(member) {
				//이미지
				let img = $('#e-img');
				if(member.realProfilePath != null) {
					img.attr('src', '${pageContext.request.contextPath}/images/' + member.realProfilePath);
				}else {
					img.attr('src', '${pageContext.request.contextPath }/resources/img/user.png');
				}
				//정보
				$('.employee-modal__name').text(member.memberName);
				$('#e-id').text(member.memberId);
				$('#e-phone').text(member.memberPhone);
				
				//부서
				let dept = $('#e-dept');
				if(member.deptId != null) {
					dept.text(member.deptName);
				}else {
					dept.text('-');
				}
			},
			error : function(reject) {
				
			}
		});
		
		
		
		
		$('#employee-modal').addClass('modal-visible');
	});
	
	
	
	//검색
	function sendDataToController() {
	    // 선택된 옵션의 값
	    let selectedOption = document.getElementById("selectOption").value;	
	    // 검색어
	    let searchKeyword = document.getElementById("searchInput").value;
	    location.href = "/searchboard?selectedOption="+selectedOption+"&searchKeyword="+searchKeyword;

	}
</script>
</html>