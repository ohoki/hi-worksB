<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사별 메인페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/companyMain.css">
</head>
<body>
	<div class="main-box">
		<div  class="main-box-title d-flex">
			<h1 class="memberName d-flex" style="font-size: var(--font-regular);">${memberInfo.memberName }님</h1>
			<div>
				<div class="title-date"></div>
				<div class="title-time"></div>					
			</div>
		</div>
		<div class="main-box-content d-flex">
			<div class="main-box-content-left">
				<ul>
					<li class="content-left-item">
						<h2>즐겨찾기 프로젝트</h2>		
						<div class="project-list">
							<ul>
								<c:forEach items="${projectList}" var="project" begin="0" end="9">
									<li class="d-flex project-list-item" data-prjid="${project.projectId}">
										<div class="d-flex">
											<img class="icon" src="${pageContext.request.contextPath }/resources/icon/star-solid.svg" data-bookmark="yes">	
											<a href="${pageContext.request.contextPath}/projectFeed?projectId=${project.projectId}">${project.projectName}</a>
										</div>
										<div class="d-flex">
											${project.particirNumber }
											<img class="icon particir-icon" name="prjParticirList" data-id="${project.projectId }" alt="참가인원" title="참가인원" src="${pageContext.request.contextPath }/resources/icon/user-solid.svg" >
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</li>
					<li class="content-left-item">
						<h2>메모장</h2>
						<div>
							<textarea id="memoContent" spellcheck="false" placeholder="메모를 입력하세요.">${memo.memoContent}</textarea>
						</div>
					</li>
				</ul>
			</div>
			<div class="main-box-content-right">
				<ul>
					<li class="content-right-item">
		            	<h2>현재 날씨</h2>
			            <div class="today-weather">
				            <div class="d-flex">
				            	<div class="weather-head">
				            		<div class="today-icon"></div>
					            	<div class="city"></div>
					            </div>
								<div>
					                <div style="font-weight: var(--weight-bold); font-size:30px;"><span class="temp"></span>&#8451</div>
					                <div>체감온도 <span class="feel-like"></span>&#8451</div>
					                <div>바람 <span class="wind"></span>km/h</div>
					                <div>습도 <span class="humidity"></span>%</div>
								</div>	
				            </div>
			        	</div>
					</li>
					<li class="content-right-item">
						<h2>공지사항</h2>
						<div class="notice-list">
							<ul>
								<c:forEach items="${noticeList}" var="notice" varStatus="loop" begin="0" end="9">
									<li class="d-flex notice-list-item">
										<div class="d-flex">
											<img class="icon" alt="즐겨찾기 별" src="${pageContext.request.contextPath }/resources/icon/clipboard-check-solid.svg"> 
											<a href="${pageContext.request.contextPath}/member/noticeInfo?noticeId=${notice.noticeId}"><span>[공지사항]</span> ${notice.noticeTitle}</a>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 프로젝트 참여자 모달 -->
	<div id="prjParticir-modal">
		<div class="prjParticir-modal-content">
			<div class="prjParticir-modal-title">
				<span>프로젝트 참여자</span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
			</div>
			<div id="prjParticir"></div>
		</div>			
	</div>
<script>
	//시간 및 날씨
 	setInterval(myTimer, 1000); // 1초마다 호출되게 한다.

    function myTimer() {
        let today = new Date(); //데이트객체생성
        let t_time = today.toLocaleTimeString();
       
        $('.title-time').text(t_time);
    }
	
 	// 현재 위치 가져오기
    navigator.geolocation.getCurrentPosition(getSuccess, getError);

    function getSuccess(position) {
      const lat = position.coords.latitude;
      const lng = position.coords.longitude;
      
      $.getJSON(`http://api.openweathermap.org/data/2.5/weather?lat=\${lat}&lon=\${lng}&appid=e145b6dbc8292ff00959430e13dedb7d`, function (result) {
      	  
    	  //이미지 변경 예정
    	  var weatherIcon = {
    			    '01' : 'fas fa-sun',
    			    '02' : 'fas fa-cloud-sun',
    			    '03' : 'fas fa-cloud',
    			    '04' : 'fas fa-cloud-meatball',
    			    '09' : 'fas fa-cloud-sun-rain',
    			    '10' : 'fas fa-cloud-showers-heavy',
    			    '11' : 'fas fa-poo-storm',
    			    '13' : 'far fa-snowflake',
    			    '50' : 'fas fa-smog'
    			};
    	  
    	  console.log(result);
          // 현재온도
          $(".temp").append(Math.floor(result.main.temp - 273.15)); //현재온도
          $(".feel-like").append(Math.floor(result.main.feels_like - 273.15)); //체감
          $(".wind").append(result.wind.speed); //바람
          $(".humidity").append(result.main.humidity); //습도
          $(".city").append(result.name); //도시이름
          var $Icon = (result.weather[0].icon).substr(0,2);	
          
          // 현재온도 아이콘
          $('.today-icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x"></i>');
  	    });
    }

    function getError() {
      alert('Geolocation Error');
    }
	
//----------인사 메세지
	
    let currentTime = new Date();
    let currentHour = currentTime.getHours();
    let timeMessage = "";
    
    if (currentHour >= 12) {
        timeMessage = " 행복한 오후되세요.";
    } else {
        timeMessage = " 좋은 아침입니다.";
    }
    
    let message = $('.memberName');
    let image = `<img alt="프로젝트 아이콘" src="${pageContext.request.contextPath }/resources/icon/smile.png" class="icon">`;
    message.append('<span class="title-greeting">' + timeMessage + '</span>');
    message.append(image);
    
    let year = currentTime.getFullYear();
    let month = currentTime.getMonth() + 1;
    let day = currentTime.getDate();
    let dayOfWeek = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"][currentTime.getDay()];
    
    let currentDate = year + '년 ' + month + '월 ' + day + '일 ' + dayOfWeek
    $('.title-date').text(currentDate);
    
//----------인사 메세지   
    
//----------메모장
    let memo = $('#memoContent');
    let saveTimeout;

	// 메모 변경 시 자동 저장
	memo.on('keyup', function() {
		// 이전 타이머 제거
		clearTimeout(saveTimeout);
		// 1초 후 자동 저장
		saveTimeout = setTimeout(saveMemo, 1000);
    });

	// 메모 저장
	function saveMemo() {
		let memoContent = memo.val();
        
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/saveMemo',
			data: { memoContent: memoContent }
		});
	}
//----------메모장

//즐겨찾기
$(document).on('click', 'img[data-bookmark]', function(e) {
	let projectId = $(e.currentTarget).closest('.project-list-item').data('prjid');
	let data = { 'projectMarkup': 'A2', 'projectId': projectId, 'memberId' : '${memberInfo.memberId}' };
	
		$.ajax({
			url:'${pageContext.request.contextPath }/updateStar',
			type:'POST',
			data:JSON.stringify(data),
			contentType:'application/json',
			success : function(result) {
				$.ajax({
					url : '${pageContext.request.contextPath }/getStarProject',
					type : 'POST',
					data : {'memberId' : '${memberInfo.memberId}'},
					success : function(prjLists) {
						console.log(prjLists);
						let projectLists = $('.project-list ul');
						
						projectLists.empty();
						
						for(let i =0; i<prjLists.length; i++) {
							let projectList = `
								<li class="d-flex project-list-item" data-prjid="\${prjLists[i].projectId}">
									<div class="d-flex">
										<img class="icon" alt="즐겨찾기 별" src="${pageContext.request.contextPath }/resources/icon/star-solid.svg" data-bookmark> 
										<a href="${pageContext.request.contextPath}/projectFeed?projectId=\${prjLists[i].projectId}">\${prjLists[i].projectName}</a>
									</div>
									<div class="d-flex">
										\${prjLists[i].particirNumber}
										<img class="icon" name="prjParticirList" data-id="\${prjLists[i].projectId }" alt="참가인원" title="참가인원" src="${pageContext.request.contextPath }/resources/icon/user-solid.svg">
									</div>
								</li>`;
								
							projectLists.append(projectList);	
						}
					},
					error : function(reject) {
						console.log(reject);
					}
				})	
			},
			error : function(reject) {
				console.log(reject);
			}
		});	

});
	
	//즐겨찾기 관련 정보를 DB에 연동
	function updateStar(markup, projectId){
		let data = { 'projectMarkup': markup, 'projectId': projectId };
		let result = $.ajax({
			url:'${pageContext.request.contextPath }/updateStar',
			type:'post', 
			async: false,
			data:JSON.stringify(data),
			contentType:'application/json'
		}).responseText;
		
		return result;
	};

	
	// 프로젝트 참여자 리스트
	$('img[name="prjParticirList"]').on('click', function(e){
		let projectId = $(this).data('id');
		
		let x = e.clientX - 280;
		let y = e.clientY;
		
		$('.prjParticir-modal-content').css('left', x + 'px');
		$('.prjParticir-modal-content').css('top', y + 'px');
		
		$.ajax({
			url : '${pageContext.request.contextPath }/particirList',
			type : 'GET',
			data : {'projectId': projectId},
			success : function(particir){
				let particirDiv = $('#prjParticir');
				particirDiv.empty();
				
				for(let i=0; i<particir.length; i++) {
					//div태그
					let employeeDiv = document.createElement('div');
					employeeDiv.classList.add('flex');
					employeeDiv.classList.add('employee');
					//이미지 태그
					let employeeProfile = document.createElement('img');
					employeeProfile.setAttribute('alt', particir[i].memberName);
					employeeProfile.classList.add('employee-img');
					if(particir[i].realProfilePath != null) {
						employeeProfile.src = "${pageContext.request.contextPath}/images/"+particir[i].realProfilePath;
					}else {
						employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
					}
					$(employeeProfile).attr('onerror', 'this.src="${pageContext.request.contextPath}/resources/img/user.png"');
					
					//스팬 태그
					let span = document.createElement('span');
					span.innerText = particir[i].memberName;
					//히든 인풋 태그 (멤버id값)
					let input = document.createElement('input');
					input.setAttribute('type', 'hidden');
					input.value = particir[i].memberId;
					//태그 삽입
					employeeDiv.append(employeeProfile);
					employeeDiv.append(span);
					employeeDiv.append(input);
					
					particirDiv.append(employeeDiv);
				}
			},
			error : function(reject){
				console.log(reject);
			}
		})
		$('#prjParticir-modal').addClass('modal-visible');
	})
		sessionStorage.removeItem('startDate'); // 시작일 데이터 삭제
		sessionStorage.removeItem('endDate'); // 시작일 데이터 삭제
</script>
</body>
</html>