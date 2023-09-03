<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0 auto;
	font-size: small;
}

.body {
	width: 800px;
	margin: 0 auto;
}

.top {
	margin-bottom: 80px;
}

.table {
	width: 800px;
}

.table__title{
	font-size: small;
	text-align: left;
	height: 40px;
}

.main__p {
	font-size: larger;
	font-weight: bolder;
}

div h2 {
	margin-top: 51px;
	text-align: center;
}

.content {
	float: left;
	width: 800px;
	padding: 2px;
	border-bottom: 1px solid rgb(174, 213, 245);
	border-top: 1px solid rgb(174, 213, 245);
	
}

.buttonss {
	width: 800px;
	height: 50px;
	border-bottom: 1px solid rgb(174, 213, 245);
}

.button1 {
	float: left;
	margin-top: 5px;
	color: black;
}

.buttons {
	float: right;
	width: 103px;
	margin-top: 5px;
}

.buttons :first-child {
	float: left;
	margin-right: 3px;
}

.buttonss__button {
	background-color: rgb(174, 213, 245);
    border-radius: 5px;
    color: white;
    width: 50px;
    height: 30px;
    font-weight: bold;
}

.table__title :first-child {
	display: inline-block;
	line-height: 26px;
	width: 40px;
	height: 25px;
	text-align: center;
	background: rgb(174, 213, 245);
	border: 1px solid rgb(174, 213, 245);
	border-radius: 5px;
	
}

.table__title :last-child {
	border: 1px solid rgb(174, 213, 245);
	border-radius: 3px;
	width: 757px;
	height: 25px;
}

	.ck.ck-editor {
    	width: 817px;
    	margin: 0 auto;
    	board: 0;
	}
	.ck-editor__editable {
		margin: 0 auto;
	    min-height: 300px;
	    width: 800px;
	}
	/* 맵 */
	.map_wrap {position:relative;width:900px;height:700px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	
	/* 카테고리 css */
.select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
	
	/* modal */
#modal {
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
  display: none;
}
.map_wrap {
  background-color: #fefefe;
  margin: 15% auto;

  border: 1px solid #888;
  width: 80%;
}
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}
.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
</head>
<body>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>		
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2a237b360646754fd5f20a66df56e27&libraries=services"></script>
	<div class="top">
		<h2>카풀 게시판 작성</h2>
	</div>
	<div class="body">
		<form action="carpoolInsert" method="post" onsubmit="return check();">
			<table class="table">
				<thead>
					<tr class="main__p">
						<th class="table__title">
							<label id="boardTitle">제목 </label>
							<input type="text" id ="inputTitle" name="boardTitle">
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="content">
								<textarea name="boardContent" id="editor"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td class="p-0 d-xl-table-cell d-none">
    						<label id="departure">출발</label>
    							<input type="text" id="departureInput" name="departure" readonly="readonly"><br>
							    <button type="button" id="departureButton">출발지 선택</button><br>
								
							    <label id="arrival">도착</label>
							    <input type="text" id="arrivalInput" name="arrival" readonly="readonly"><br>
							    <button type="button" id="arrivalButton">도착지 선택</button><br>
							<label>날짜</label>
							<input type="datetime-local" id="departureDateInput"><br>
							<input type="hidden" id="departureDate" name="departureDate">
							
							<label id="passenger">인원</label>
							<select id="passelect" name="passenger">
								<option value="0">0명</option>
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
							</select>

							<div class="select">
     							<input type="radio" id="select" name="category" value="B1"><label for="select">태워드립니다</label>
     							<input type="radio" id="select2" name="category" value="B2"><label for="select2">태워주세요</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="memberId" value="${memberInfo.memberId }">
							<input type="hidden" name="companyId" value="${memberInfo.companyId }">
						</td>
					</tr>
					
				</tbody>
			</table>
			<button type="button" onclick="location.href='carpoolList'">목록</button>
			<button type="submit">작성</button>
		</form>
	</div>
	
	<!-- 지도  -->
	<div id="modal">
		<div class="map_wrap">
    		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
   			<div class="hAddr">
       			<span class="title">현재 위치</span>
       			<span id="centerAddr"></span>
       			<button id="close-modal">닫기</button>
   			</div>
		</div>
	</div>
</body>
<script>

	function check(){
		// 입력값 체크
		let inputTitle = document.getElementById("inputTitle").value;

		let departureInput = document.getElementById("departureInput").value;
        let arrivalInput = document.getElementById("arrivalInput").value;
        let passenger = document.getElementById("passenger").value;
        
            
            
       /*  if (inputTitle.length == 0) {
            alert("제목을 입력해주세요.");
            return false;
            }
            
        if (departureInput.length == 0) {
            alert("도착지를 입력해주세요.");
            return false;
            }
            
        if (arrivalInput.length == 0) {
            alert("인원수를 설정해주세요");
            return false;
            }
        
        if (passelect == 0) {
            alert("인원수를 설정해주세요");
            return false;
            } */

        
			
			
		
		// 날짜 가져오기
		let x = document.getElementById("departureDateInput").value;

		// 거지같은 T 바꾸기
		x = x.replace("T", " ");
		departureDate.value = x;

		return true;
	};

	
	<!-- 에디터 -->
	ClassicEditor.create( document.querySelector( '#editor' ), {
	    ckfinder:{
	    	uploadUrl: '${pageContext.request.contextPath}/ckuploadsAjax'
	    },
	 
	    /* 폰트 설정 안됨. 죽이고싶음 */
	    fontFamily:{
	    	items:[
	    		'default',
	    		'Arial',
	    		'궁서체',
	    		'바탕',
	    		'돋움'
	    	],
	    	supportAllValues: true
	    }
	  }
	  
	);
	
	/* 내 위치 */
	function askForLocation () {
	    navigator.geolocation.getCurrentPosition(accessToGeo)
	}
	askForLocation();
	
	function accessToGeo (position) {
		
	       let latitude = position.coords.latitude;
	    
	    	let longitude = position.coords.longitude;
	    
	    	
	   	console.log(latitude);
	   	console.log(longitude);
	    // 맵의 좌표이동
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	
	
	
	<!-- 지도 -->
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.8700317, 128.6005225), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

	var departureInput = document.getElementById("departureInput"); // departureInput 필드를 가져옴
	var arrivalInput = document.getElementById("arrivalInput"); // arrivalInput 필드를 가져옴
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">법정동 주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';
				console.log(result[0].address.address_name);
				
		
					// 모달 빠져나오기
		  		modal.style.display = "none";
		  		document.body.style.overflow = "auto"; // 스크롤바 보이기
		  		
		  			// 값 넣기
		  			if(departureInput.value == null || departureInput.value == " " ){
		  				departureInput.value = result[0].address.address_name;
		  				console.log(departureInput.value);
		  			} else if(departureInput.value != null){
		  				arrivalInput.value = result[0].address.address_name;
		  			}
		  				
	            	// 마커를 클릭한 위치에 표시합니다 
	            	marker.setPosition(mouseEvent.latLng);
	            	marker.setMap(map);
	
		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
	            
	
	        }   
	    });
	});


	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});
	
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');
	
	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }    
	}
	

		const modal = document.getElementById("modal");
		const openModalBtn = document.getElementById("departureButton");
		const closeModalBtn = document.getElementById("close-modal");
		// 모달창 열기
		openModalBtn.addEventListener("click", () => {
		  modal.style.display = "block";
		  document.body.style.overflow = "hidden"; // 스크롤바 제거
		});
		// 모달창 닫기
		closeModalBtn.addEventListener("click", () => {
		  modal.style.display = "none";
		  document.body.style.overflow = "auto"; // 스크롤바 보이기
		});
		
		
		const openModalBtnn = document.getElementById("arrivalButton");
		
		// 모달창 열기
		openModalBtnn.addEventListener("click", () => {
		  modal.style.display = "block";
		  document.body.style.overflow = "hidden"; // 스크롤바 제거
		});
		
		// 모달창 닫기
		closeModalBtn.addEventListener("click", () => {
		  modal.style.display = "none";
		  document.body.style.overflow = "auto"; // 스크롤바 보이기
		});
	
	
</script>
</html>