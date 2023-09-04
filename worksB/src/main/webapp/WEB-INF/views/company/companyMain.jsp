<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사별 메인페이지</title>
<style>

.mainList {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
    list-style: none;
}

.mainList > li {
    border: 1px solid var(--color-dark-beigie);
    border-radius: var(--size-border-radius);
    padding: 10px;
    text-align: center;
    margin: 20px;
}

.mainContainer{
	width : 1300px;
	margin: 0 auto;
}
#memoContent{
	width: 600px;
	height: 200px;
	font-size: 15px;
	border: 1px solid var(--color-dark-beigie);
	padding: 10px;
	resize: none;
}


</style>
</head>
<body>
	<div>
		<ul>
			<li class="memberName">${memberInfo.memberName }</li>
		</ul>
		<div class="mainContainer">
			<ul class="mainList">
				<li class="myProjectList">
					<span>내프로젝트</span>
					<ul>
						<c:forEach items="${projectList}" var="project" varStatus="loop" begin="0" end="4">
							<li>
								<a href="${pageContext.request.contextPath}/projectFeed?projectId=${project.projectId}">${project.projectName}</a>
							</li>
						</c:forEach>
					</ul>
				</li>
				<li class="noticeList">
					<span>공지사항</span>
					<ul>
						<c:forEach items="${noticeList}" var="notice" varStatus="loop" begin="0" end="4">
							<li>
								<a href="${pageContext.request.contextPath}/noticeInfo?noticeId=${notice.noticeId}"><공지>${notice.noticeTitle}</a>
							</li>
						</c:forEach>
					</ul>
				</li>
				<li class="memo"><span>메모</span>
				<div>
					<textarea id="memoContent" spellcheck="false" placeholder="메모를 입력하세요.">${memo.memoContent}</textarea>
				</div>
				</li>
				<li class="weather"><span>날씨</span>
					<ul>
						
					</ul>
				</li>
			</ul>
		</div>
	</div>
 
<script>
/*
	//OpenWeatherMap API 키
	const apiKey = '2f238cd00e432238f8fedcfe8ee3553e';
	
	// 현재 위치 정보 가져오기
	function getCurrentPosition() {
	    if ('geolocation' in navigator) {
	        navigator.geolocation.getCurrentPosition(function(position) {
	            const latitude = position.coords.latitude;
	            const longitude = position.coords.longitude;
	            
	            getWeatherByCoordinates(latitude, longitude);
	            console.log(latitude, longitude)

	        }, function(error) {
	            console.error('Error getting current position:', error);
	        });
	    } else {
	        console.error('Geolocation is not available.');
	    }
	}
	
	// 페이지 로딩 시 현재 위치 정보 가져오기
	getCurrentPosition();
	
	// 날씨 정보 가져오기
	function getWeatherByCoordinates(latitude, longitude) {
		//const apiUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=2f238cd00e432238f8fedcfe8ee3553e`;
		const apiUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}`;
		console.log("========================="+apiUrl)
		$.ajax({
			url: apiUrl,
			method: 'GET',
			dataType: 'json',
			success: function(data) {
				console.log(data)
			},
			error: function(error) {
				console.error('Error fetching weather data:', error);
			}
		});
	}
*/

	//날씨정보 조회
	var xhr = new XMLHttpRequest();
	var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ErWxhzVYX3Ip%2Fwa2vZDtynnjnxxyIaxQ4nke2Z0WSCA%2BVDbQ4qBSO%2F2LDepC6c0S1uIuglh%2Fy8AMMrSDZydY5g%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
	queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
	queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20230904'); /**/
	queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0600'); /**/
	queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('35'); /**/
	queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('128'); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
	    }
	};
	
	xhr.send('');
	
	
//----------인사 메세지
	
    let currentTime = new Date();
    let currentHour = currentTime.getHours();
    let timeMessage = "";
    
    if (currentHour >= 12) {
        timeMessage = "님 즐거운 오후입니다.";
    } else {
        timeMessage = "님 즐거운 오전입니다.";
    }
    
    let message = $('.memberName');
    message.append('<span>' + timeMessage + '</span>');
    
    let year = currentTime.getFullYear();
    let month = currentTime.getMonth() + 1;
    let day = currentTime.getDate();
    let dayOfWeek = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"][currentTime.getDay()];
    
    let currentDate = year + '년 ' + month + '월 ' + day + '일 ' + dayOfWeek
    
    message.append('<span>' + currentDate + '</span>');
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
			data: { memoContent: memoContent },
			success: function(response) {
				console.log('메모 저장 완료');
			}
		});
	}
//----------메모장
	
	
	
</script>
</body>
</html>