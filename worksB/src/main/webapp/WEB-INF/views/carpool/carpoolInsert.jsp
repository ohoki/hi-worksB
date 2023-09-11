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
.carpool-insert-box {
	width: 60%;
	margin: 60px auto; 
	color: var(--color-dark-grey);
	font-size: var(--font-micro);
}

.insert {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 20px;
}

.insert h2 {
	margin: 0;
	font-size: var(--font-regular);
	font-weight: var(--weight-bold);
	color: var(--color-green);
}

.carpool-icon {
	width: 20px;
	height: 20px;
}

#inputTitle {
	width: 95%;
	padding: 0 20px;
	margin-bottom: 15px;
	border-bottom: 1px solid var(--color-dark-beigie);
	height: 40px;
}

.carpool-footer {
	text-align: right;
	margin: 20px 0;
}

.carpool-footer button{
	margin-left: 20px;
	width: 50px;
	height: 30px;
	border: 1px solid var(--color-dark-red);
	background-color: white;
	color: var(--color-dark-red);
	border-radius: 5px;
	transition: all 0.5s;
}

.carpool-footer button:hover {
	color: var(--color-white);
	background-color: var(--color-dark-red);
}

.ck.ck-list__item .ck-button {
    width: 90% !important;
}

.ck-editor__editable {
    min-height: 400px;
}

input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
input:-webkit-autofill:active {
    transition: background-color 5000s ease-in-out 0s;
    -webkit-transition: background-color 9999s ease-out;
    -webkit-box-shadow: 0 0 0px 1000px white inset !important;
    -webkit-text-fill-color: var(--color-dark-grey) !important;
}

.carpool-table {
    width: 100%;
    margin-top: 20px;
}

.carpool-table th, .carpool-table td {
    padding: 10px;
}

th, tfoot td {
    height: 40px;
    color: var(--color-white);
    font-weight: var(--weight-semi-bold);
}

.label {
    font-weight: bold;
    margin: 10px;
}

.input-box {
    width: 100%;
    padding: 5px;
    margin-bottom: 10px;
    border: 1px solid var(--color-dark-beigie);
    border-radius: 5px;
}

.input-button {
    padding: 5px 15px;
    border: none;
    background-color: var(--color-dark-beigie);
    color: var(--color-dark-grey);
    border-radius: 5px;
    cursor: pointer;
    margin-bottom: 5px;
}

#departureDateInput, #passelect {
    width: 70%;
    padding: 5px;
    border: 1px solid var(--color-dark-beigie);
    border-radius: 5px;
    margin-top: 25px;
}

.radio {
    display: none;
}

.select input[type=radio]+label {
    display: inline-block;
    cursor: pointer;
    margin-right: 10px;
    padding: 5px 10px;
    text-align: center;
    width: 85px;
	height: 30px;
	background-color: var(--color-dark-beigie);
	border-radius: 5px;
	color: var(--color-dark-grey);
	font-weight: var(--weight-bold);
	transition: all 0.5s;
	line-height: 24px;
}

.select input[type=radio]:checked+label {
	background-color: var(--color-dark-red);
	color: white;
}

.type-content{
	text-align: center;
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
	<!-- api -->
	<!-- ckeditor -->
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
	<!-- 사진 업로드를 위한 ckfinder -->
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2a237b360646754fd5f20a66df56e27&libraries=services"></script>
	<div class="carpool-insert-box">
		<div class="insert">
			<h2>
				<img class="notice-icon" src="${pageContext.request.contextPath }/resources/icon/car-solid.svg" alt="카풀 아이콘">
				같이타요 등록
			</h2>
		</div>
		<form action="${pageContext.request.contextPath }/member/carpoolInsert" method="post" onsubmit="return check();">
			<input type="text" id="inputTitle" name="boardTitle" placeholder="제목을 입력해주세요.">
			<textarea name="boardContent" id="editor"></textarea>
			<table class="carpool-table">
				<tr>
					<td class="type-content" colspan="4">
						<div class="select">
   							<input type="radio" id="select" name="category" value="B1" class="radio">
   							<label for="select" class="radio-label">태워드립니다</label>
   							<input type="radio" id="select2" name="category" value="B2" class="radio">
   							<label for="select2" class="radio-label">태워주세요</label>
						</div>
					</td>
				</tr>
				<tr>
					<td class="p-0 d-xl-table-cell d-none">
					    <button type="button" id="departureButton" class="input-button">출발지 선택</button><br>
  						<input type="text" id="departureInput" name="departure" class="input-box" readonly="readonly"><br>
					</td>
					<td style="text-align: center;">
						<label id="passenger" class="label">인원</label>
						<select id="passelect" name="passenger">
							<option value="0">0명</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>	
					    <button type="button" id="arrivalButton" class="input-button">도착지 선택</button><br>
					    <input type="text" id="arrivalInput" name="arrival" class="input-box" readonly="readonly"><br>
					</td>
					<td style="text-align: center;">
						<label class="label">날짜</label>
						<input type="datetime-local" id="departureDateInput" class="input-box"><br>
						<input type="hidden" id="departureDate" name="departureDate">
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="memberId" value="${memberInfo.memberId }">
						<input type="hidden" name="companyId" value="${memberInfo.companyId }">
					</td>
				</tr>
			</table>
			<div class="carpool-footer">
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/carpoolList'">목록</button>
				<button type="submit">등록</button>
			</div>
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
	        
		// 날짜 가져오기
		let x = document.getElementById("departureDateInput").value;
	
		// datetime-local의 T 제거
		x = x.replace("T", " ");
		departureDate.value = x;
	
		return true;
	};

	/* ck에디터 */
	CKEDITOR.ClassicEditor.create(document.querySelector('#editor'), {
	    toolbar: {
	    	 items: [
				'alignment', '|',
				'heading', '|',
				'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
				'exportPDF', 'insertImage', 'mediaEmbed',
				'-',
				'specialCharacters', '|',
				'bold', 'italic', 'strikethrough', 'underline', 'subscript', 'superscript', '|',                     
				'findAndReplace', 'selectAll'
	         ],
	         shouldNotGroupWhenFull: true
	     },
	    // Changing the language of the interface requires loading the language file using the <script> tag.
	    language: 'ko',
	    // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
	    heading: {
	        options: [
	            { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
	            { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
	            { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
	            { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
	            { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
	            { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
	            { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
	        ]
	    },
	    // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
	    placeholder: '내용을 입력하세요.',
	    // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
	    fontFamily: {
	        options: [
	            'default',
	            '궁서체',
	    		'돋움',
	            'Arial, Helvetica, sans-serif',
	            'Courier New, Courier, monospace',
	            'Georgia, serif',
	            'Lucida Sans Unicode, Lucida Grande, sans-serif',
	            'Tahoma, Geneva, sans-serif',
	            'Times New Roman, Times, serif',
	            'Trebuchet MS, Helvetica, sans-serif',
	            'Verdana, Geneva, sans-serif',
	        ],
	        supportAllValues: true
	    },
	    // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
	    fontSize: {
	        options: [ 10, 12, 14, 16, 18, 20, 22 ],
	        supportAllValues: true
	    },
	    // The "super-build" contains more premium features that require additional configuration, disable them below.
	    // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
	    removePlugins: [
	        // These two are commercial, but you can try them out without registering to a trial.
	        // 'ExportPdf',
	        // 'ExportWord',
	        'CKBox',
	        'EasyImage',
	        // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
	        // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
	        // Storing images as Base64 is usually a very bad idea.
	        // Replace it on production website with other solutions:
	        // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
	        // 'Base64UploadAdapter',
	        'RealTimeCollaborativeComments',
	        'RealTimeCollaborativeTrackChanges',
	        'RealTimeCollaborativeRevisionHistory',
	        'PresenceList',
	        'Comments',
	        'TrackChanges',
	        'TrackChangesData',
	        'RevisionHistory',
	        'Pagination',
	        'WProofreader',
	        // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
	        // from a local file system (file://) - load this site via HTTP server if you enable MathType
	        'MathType'
	    ]
	});	
	
	
	
	
	/* 내 위치 */
	/* function askForLocation () {
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
	} */
	
	
	
	/* <!-- 지도 -->
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
		  			console.log(departureInput.value);
		  		
		  			if(departureInput.value == null || departureInput.value.trim() === "" ){
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
	

	let modal = document.getElementById("modal");
	let openModalBtn = document.getElementById("departureButton");
	let closeModalBtn = document.getElementById("close-modal");
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
	 */
		
</script>
</html>