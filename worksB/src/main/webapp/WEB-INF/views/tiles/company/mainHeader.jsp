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
				class="header__logo" onerror="this.src='${pageContext.request.contextPath}/resources/img/no-image.jpg'"></a>
		</div>
		<!-- 검색창 -->
		<div>
			<input type="text" id="searchInput" placeholder="검색" value="${searchVO.searchkeyword}" name="searchkeyword" class="header__search">
		</div>
		<!-- 상단 메뉴들 -->
		<div class="header__icon">
			<!-- 구성원 -->
			<a href="#" data-type="employees"> 
			<img alt="구성원 정보 보기" src="${pageContext.request.contextPath}/resources/icon/comments-solid.svg" class="header__profile">
			</a>
			<!-- 프로필 -->
			<c:if test="${memberInfo.realProfilePath eq null }">
			<a href="#" data-type="profile"> <img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진"
				class="header__profile">
			</a>
			</c:if>
			<c:if test="${memberInfo.realProfilePath ne null }">
			<a href="#" data-type="profile"> <img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진"
				class="header__profile" onerror="this.src='${pageContext.request.contextPath }/resources/img/user.png'">
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
							<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="modal-logo" onerror="this.src='${pageContext.request.contextPath}/resources/img/user.png'">
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
							<img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진" class="my-profile-logo" onerror="this.src='${pageContext.request.contextPath}/resources/img/user.png'">
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
			
			<!-- 구성원 모달 -->
			<div id="employees-modal">
				<div class="employees-modal__content">
					<div class="flex employees__title">
						<span>구성원</span>
						<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
					</div>
					<input type="text" class="employees_search-input" placeholder="검색" >
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
						<form name="chatForm" action="${pageContext.request.contextPath}/sendRequest" method="POST">
							<input type="hidden" name="roomName" id="roomNameField" value="">
							<button type="submit" class="chat__btn" onclick="sendRequest()">채팅하기</button>
						</form>
					</div>	
				</div>			
			</div>
		</div>
	</header>
<script>
	function sendRequest(){
		let roomName=$('.employee-modal__name').text()
		$('#roomNameField').val(roomName);
		$('#chatForm').submit()

	}
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
						//이미지 태그
						let employeeProfile = document.createElement('img');
						employeeProfile.setAttribute('alt', '회원사진');
						employeeProfile.classList.add('employee-img');
						if(members[i].realProfilePath != null) {
							employeeProfile.src = "${pageContext.request.contextPath}/images/"+members[i].realProfilePath;
						}else {
							employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
						}
						
						$(employeeProfile).attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
						//스팬 태그
						let span = document.createElement('span');
						span.innerText = members[i].memberName;
						
						let imgSpan = document.createElement('span');
							imgSpan.style.position = 'relative';	
						
						let stateDiv = document.createElement('div');
						
						if(members[i].empStatus == 'S1') {
							stateDiv.classList.add('state');
							stateDiv.classList.add('status-green');
						} else if (members[i].empStatus == 'S2') {
							stateDiv.classList.add('state');
							stateDiv.classList.add('status-yellow');
						} else if (members[i].empStatus == 'S3') {
							stateDiv.classList.add('state');
							stateDiv.classList.add('status-red');
						}
						
						//히든 인풋 태그 (멤버id값)
						let input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.value = members[i].memberId;
						
						//태그 삽입
						imgSpan.append(employeeProfile);
						imgSpan.append(stateDiv);
						employeeDiv.append(imgSpan);
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
	$('[id$=modal]').on('click', function(e) {
		$(e.currentTarget).removeClass('modal-visible');
	});
	
	$('.my-profile__btn').on('click', function() {
		location.href='${pageContext.request.contextPath}/member/updateForm';
	})
	
	//접속상태 변경
	$('.status-modal__content li').on('click', function(e) {
		e.stopPropagation();
		let value = e.currentTarget.innerText;
		let statusDiv = $('.status');
		console.log(value);
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
			url : '${pageContext.request.contextPath}/updateMember',
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
				
				img.attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
				
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
		$('#employees-modal').addClass('modal-visible');
 		$('#employee-modal').addClass('modal-visible');
	});
	
	//검색
	document.querySelector('#searchInput').addEventListener('keyup', (e)=>{
	    if (e.keyCode === 13) {
	    	let searchKeyword = document.getElementById("searchInput").value;
	 	    
	    	if(searchKeyword==""){
	 	    	alert('검색어를 입력하세요')
	 	    }else{
	 		   location.href="${pageContext.request.contextPath}/searchboard?searchkeyword="+searchKeyword+"&searchBoardType=3";
	 	    }
	  }  
	});
	

	//구성원검색창 버블링 막기
	$('.employees_search-input, .employee').on('click', function(e) {
		e.stopPropagation();
	});
		
	//구성원검색
	$('.employees_search-input').on('keyup', (e)=>{
		let search=$('.employees_search-input').val();
    	if (e.keyCode === 13) {
			$.ajax({
				url:'${pageContext.request.contextPath}/searchMember',
				type:'GET',
				data:{'name':search},
				success : function(members) {
					let employeesDiv = $('#employees');
					employeesDiv.empty();
					//멤버 리스트 태그 만들기
					for(let i=0; i<members.length; i++) {
						//div태그
						let employeeDiv = document.createElement('div');
						employeeDiv.classList.add('flex');
						employeeDiv.classList.add('employee');
						//이미지 태그
						let employeeProfile = document.createElement('img');
						employeeProfile.setAttribute('alt', '회원사진');
						employeeProfile.classList.add('employee-img');
						if(members[i].realProfilePath != null) {
							employeeProfile.src = "${pageContext.request.contextPath}/images/"+members[i].realProfilePath;
						}else {
							employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
						}
						$(employeeProfile).attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
						//스팬 태그
						let span = document.createElement('span');
						span.innerText = members[i].memberName;
						
						let imgSpan = document.createElement('span');
							imgSpan.style.position = 'relative';	
						
						let stateDiv = document.createElement('div');
						
						if(members[i].empStatus == 'S1') {
							stateDiv.classList.add('state');
							stateDiv.classList.add('status-green');
						} else if (members[i].empStatus == 'S2') {
							stateDiv.classList.add('state');
							stateDiv.classList.add('status-yellow');
						} else if (members[i].empStatus == 'S3') {
							stateDiv.classList.add('state');
							stateDiv.classList.add('status-red');
						}
						
						//히든 인풋 태그 (멤버id값)
						let input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.value = members[i].memberId;
						
						//태그 삽입
						imgSpan.append(employeeProfile);
						imgSpan.append(stateDiv);
						employeeDiv.append(imgSpan);
						employeeDiv.append(span);
						employeeDiv.append(input);
						
						employeesDiv.append(employeeDiv);
					}
				},
				error : function(reject) {
					console.log(reject)
				}
			});
    	}
		});

</script>
</html>