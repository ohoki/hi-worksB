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
	.map_wrap {position:relative;width:800px;height:600px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	
/* modal */
/* 버튼을 감싸는 영역 */
#btnWrap {
  width: 500px;
  margin: 100px auto;
}

/* 버튼 디자인 */
#popupBtn {
  width: 150px;
  height: 50px;
  padding: 10px 5px;
}

/* 모달팝업을 감싸고 있는 최상위 부모 */
#modalWrap {
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* 모달 팝업창 */
#modalBody {
  width: 500px;
  height: 300px;
  padding: 30px 30px;
  margin: 0 auto;
  border: 1px solid #777;
  background-color: #fff;
  display: hidden;
}

/* 닫기 버튼 */
#closeBtn {
  float:right;
  font-weight: bold;
  color: #777;
  font-size:25px;
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
		<form action="carpoolInsert" method="post">
			<table class="table">
				<thead>
					<tr class="main__p">
						<th class="table__title">
							<label id="boardTitle">제목 </label>
							<input type="text" name="boardTitle">
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="content">
								<textarea name="noticeContent" id="editor"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<label id="departure">출발</label>
							<button type="button" id= "popupBtn" name="departure">버튼</button><br> <!-- 팝업 버튼 -->
							<label id="arrival">도착</label>
							<input type="text" name="arrival"><br>
							<label id="departureDate">날짜</label>
							<input type="text" name="departureDate"><br>
							<label id="passenger">인원</label>
							<input type="number" name="passenger">
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="memberId" value="${memberInfo.memberId }">
							<input type="hidden" name="companyId" value="${memberInfo.companyId}">
							<input type="hidden" name="category" value="B1">
						</td>
					</tr>
				</tbody>
			</table>
			<button type="button" onclick="location.href='carpoolList'">목록</button>
			<button type="submit">작성</button>
		</form>
	</div>
	
	<!-- 지도  -->
	<div id ="modalBody">
	<div class="map_wrap">
		
    		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    			<div class="hAddr">
        <span class="title">현재 위치</span>
        <span id="centerAddr"></span>
        <span id="closeBtn">&times;</span>
        	
    	</div>
	</div>
	</div>

</body>
<script>
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
	
	/* 모달 */
	const btn = document.getElementById('popupBtn');
	const modal = document.getElementById('map_wrap');
	const closeBtn = document.getElementById('closeBtn');
	let button = $('#popupBtn')
	button.on('click', ()=>{
		modal.style.display = 'block';
	})
	
	btn.onclick = function() {
	  modal.style.display = 'block';
	}
	closeBtn.onclick = function() {
	  modal.style.display = 'none';
	}

	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	
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
</script>
</html>