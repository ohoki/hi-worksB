<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 점심 뭐먹지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/css/lunch.css" rel="stylesheet">
<style>
	a {
	    color: black;
	    text-decoration: none;
	}
	body{
		color: black;
	}
</style>
</head>
<!-- jquerry -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- kakaoMap api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dd09653c2da4802796272b266d7abc84&libraries=services"></script>
<body>
    <div class="ojc">
        <div class="ojc__header">
            <div class="ojc__header-title">
                <span>오.점.추 </span>
            </div>
            <div class="ojc__header-subject">
                <span>점심 메뉴가 고민인 당신! 점심 메뉴를 랜덤으로 골라보세요</span>
            </div>
        </div>
        <div class="ojc__btn-group">
	        <div class="btn-group btn-group-sm" role="group" aria-label="Small button group">
	            <button class="btn btn-primary" onclick="allRandomMenu()">랜덤 메뉴</button>
	            <button class="btn btn-primary" onclick="allRandomCategory()">전체 랜덤</button>
	        </div>
        </div>
        <div class="mandalart">
            <div class="mandalart-top">
                <div id="manda1">
                </div>
                <div id="manda2">
                </div>
                <div id="manda3">
                </div>
            </div>
            <div class="mandalart-mid">
                <div id="manda4">
                </div>
                <div id="manda">
                </div>
                <div id="manda5">
                </div>
            </div>
            <div class="mandalart-bot">
                <div id="manda6">
                </div>
                <div id="manda7">
                </div>
                <div id="manda8">
                </div>
            </div>
        </div>
        <div id="wrap" class="containerAll" spellcheck="false">
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">검색결과</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="map_wrap">
                        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                    
                        <div id="menu_wrap" class="bg_white">
                            <hr>
                            <ul id="placesList"></ul>
                            <div id="pagination"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    //모달창 띄우기
    var myModal = new bootstrap.Modal(document.getElementById('exampleModal'))
	
    let lunchList = ${lunchList}

    
   
    //만다라트 가운데항목 만드는 함수
    function manda() {

        //0~7까지 8개의 랜덤한 숫자 만드는 함수
        let random = [];
        function randomNum() {
            let i = 0;
            while (i < 9) {
                let n = Math.floor(Math.random() * 9);
                if (!sameNum(n)) {
                    random.push(n);
                    i++;
                }
            }

            function sameNum(n) {
                for (var i = 0; i < random.length; i++) {
                    if (n === random[i]) {
                        return true;
                    }
                }
                return false;
            }
            return random;
        }
        console.log(random)
        randomNum();

        //가운데 들어갈 table 생성
        let tableTag = document.createElement('table')
        document.getElementById('manda').appendChild(tableTag).setAttribute('id', 'manda-table');
        for (let index = 1; index < 4; index++) {
            let trTag = document.createElement('tr')
            tableTag.appendChild(trTag);
            for (let j = 1; j < 4; j++) {
                if (index == 2 && j == 2) {
                    let tdTag = document.createElement('td')
                    tdTag.innerText = "오점추"
                    trTag.appendChild(tdTag);
                } else {
                    let tdTag = document.createElement('td')
                    trTag.appendChild(tdTag);
                }
            }
        }
        //가운데 들어갈 메뉴 카테고리들 입력
        for (let i = 0; i < 9; i++) {
            if (i != 4) {
                document.getElementById('manda').querySelectorAll('td')[i].innerText = lunchList[random[i]].name
            } else if (i == 4) {
                continue;
            }
        }

        //카테고리별 메뉴를 랜덤하게 만드는 함수
        function randomMenu() {
            for (let i = 1; i < 9; i++) {
                if (i < 5) {
                    let tableTag = document.createElement('table')
                    document.getElementById('manda' + i).appendChild(tableTag).setAttribute('id', 'manda-table'+i);
                    for (let index = 1; index < 4; index++) {
                        let trTag = document.createElement('tr')
                        tableTag.appendChild(trTag);
                        for (let j = 1; j < 4; j++) {
                            if (index == 2 && j == 2) {
                                let tdTag = document.createElement('td')
                                tdTag.innerText = document.getElementById('manda').querySelectorAll('td')[i - 1].innerText
                                trTag.appendChild(tdTag);
                            } else {
                                let tdTag = document.createElement('td')
                                trTag.appendChild(tdTag);
                            }
                        }
                    }
                    if (document.getElementById('manda' + i).querySelectorAll('td')[4].innerText === 
                                document.getElementById('manda').querySelectorAll('td')[i - 1].innerText) {
                        for (let k = 0; k < 9; k++) {
                            let tdTag = document.getElementById('manda' + i).querySelectorAll('td')[k];
                            tdTag.innerText = lunchList[random[i - 1]].menu[random[k]];
                            tdTag.addEventListener("click", searchMenu);;
                        }
                    }
                } else {
                    let tableTag = document.createElement('table')
                    document.getElementById('manda' + i).appendChild(tableTag).setAttribute('id', 'manda-table'+i);
                    for (let index = 1; index < 4; index++) {
                        let trTag = document.createElement('tr')
                        tableTag.appendChild(trTag);
                        for (let j = 1; j < 4; j++) {
                            if (index == 2 && j == 2) {
                                let tdTag = document.createElement('td')
                                tdTag.innerText = document.getElementById('manda').querySelectorAll('td')[i].innerText
                                trTag.appendChild(tdTag);
                            } else {
                                let tdTag = document.createElement('td')
                                trTag.appendChild(tdTag);
                            }
                        }
                    }
                    if (document.getElementById('manda' + i).querySelectorAll('td')[4].innerText === 
                                document.getElementById('manda').querySelectorAll('td')[i].innerText) {
                        for (let k = 0; k < 9; k++) {
                            document.getElementById('manda' + i).querySelectorAll('td')[k].innerText = lunchList[random[i]].menu[k]
                        }
                    }
                }
            }
        }
        randomMenu();
    }
    //첫 페이지 불러올때 만다라트표 생성
    manda();

    //카테고리 랜덤 메뉴 생성 함수 
    function allRandomCategory() {
        for (let i = 1; i < 10; i++) {
            if (i == 9) {
                let child = document.getElementById('manda-table')
                document.getElementById('manda').removeChild(child);
            } else {
                let child = document.getElementById('manda-table' + i);
                document.getElementById('manda' + i).removeChild(child);
            }
        }
        //각 div별 table 삭제후 새로운 만다라트표 생성
        manda();
        //메뉴를 알수 없게 배경을 검은색으로 덮은후 td태그마다 온클릭 속성 부여 
        for(let i=1;i<9;i++){
            $('#manda-table'+i).find('td').attr('class', 'cover-black').on('click', searchMenu);
        }
        for(let i=0;i<9;i++){
            if(i!=4){
                $('#manda-table td')[i].setAttribute('class','cover-black');
                $('#manda-table td')[i].addEventListener("click", searchMenu);
            }else{
                $('#manda-table td')[i].addEventListener("click", searchMenu);
            }
        }
    }

    //메뉴만 랜덤으로 생성하는 함수
    function allRandomMenu() {
        for (let i = 1; i < 9; i++) {
            let child = document.getElementById('manda-table' + i);
            document.getElementById('manda' + i).removeChild(child);
        }
        $('#manda-table').find('td').attr('class', 'reveal-gray');
        //0~7까지 8개의 랜덤한 숫자 만드는 함수
        let random = [];

        function randomNum() {
            let i = 0;
            while (i < 9) {
                let n = Math.floor(Math.random() * 9);
                if (!sameNum(n)) {
                    random.push(n);
                    i++;
                }
            }

            function sameNum(n) {
                for (var i = 0; i < random.length; i++) {
                    if (n === random[i]) {
                        return true;
                    }
                }
                return false;
            }
            return random;
        }
        randomNum();

        function randomMenu() {
            for (let i = 1; i < 9; i++) {
                if (i < 5) {
                    let tableTag = document.createElement('table')
                    document.getElementById('manda' + i).appendChild(tableTag).setAttribute('id', 'manda-table' +
                        i);
                    for (let index = 1; index < 4; index++) {
                        let trTag = document.createElement('tr')
                        tableTag.appendChild(trTag);
                        for (let j = 1; j < 4; j++) {
                            if (index == 2 && j == 2) {
                                let tdTag = document.createElement('td')
                                tdTag.innerText = document.getElementById('manda').querySelectorAll('td')[i - 1].innerText
                                trTag.appendChild(tdTag);
                            } else {
                                let tdTag = document.createElement('td')
                                trTag.appendChild(tdTag);
                            }
                        }
                    }
                    if (document.getElementById('manda' + i).querySelectorAll('td')[4].innerText === document
                        .getElementById('manda').querySelectorAll('td')[i - 1].innerText) {
                        for (let k = 0; k < 9; k++) {
                            if (lunchList[k].name === document.getElementById('manda' + i).querySelectorAll('td')[4].innerText) {
                                for (let j = 0; j < 9; j++) {
                                    document.getElementById('manda' + i)
                                    .querySelectorAll('td')[j].innerText = lunchList[k].menu[random[j]]

                                }
                            }
                        }
                    }
                } else {
                    let tableTag = document.createElement('table')
                    document.getElementById('manda' + i).appendChild(tableTag).setAttribute('id', 'manda-table'+i);
                    for (let index = 1; index < 4; index++) {
                        let trTag = document.createElement('tr')
                        tableTag.appendChild(trTag);
                        for (let j = 1; j < 4; j++) {
                            if (index == 2 && j == 2) {
                                let tdTag = document.createElement('td')
                                tdTag.innerText = document.getElementById('manda').querySelectorAll('td')[i]
                                    .innerText
                                trTag.appendChild(tdTag);
                            } else {
                                let tdTag = document.createElement('td')
                                trTag.appendChild(tdTag);
                            }
                        }
                    }
                    if (document.getElementById('manda' + i).querySelectorAll('td')[4].innerText === document
                        .getElementById('manda').querySelectorAll('td')[i].innerText) {
                        for (let k = 0; k < 9; k++) {
                            if (lunchList[k].name === document.getElementById('manda' + i).querySelectorAll('td')[4]
                                .innerText) {
                                for (let j = 0; j < 9; j++) {
                                    document.getElementById('manda' + i)
                                    .querySelectorAll('td')[j].innerText = lunchList[k].menu[random[j]]

                                }
                            }
                        }
                    }
                }
            }
        }
        randomMenu();
        for(let i=1;i<9;i++){
            $('#manda-table'+i).find('td').attr('class', 'cover-black').on('click', searchMenu);
        }
    }

    // document.querySelectorAll('td').addEventListener('click', searchMenu(event))

    var coord;
    function searchMenu(){
        coord = "";
        let target = event.target
        target.setAttribute('class','reveal-gray')
        coord = target.innerText;
        // alert(target.innerText)
        searchPlaces(coord);
        myModal.show();
    }

    function ranMenu() {
        for (let i = 0; i < menuCategory.length; i++) {
            console.log(menuCategory[random[i]])
        }
    }
</script>
<script>
    // 마커를 담을 배열입니다
    var markers = [];
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
    
    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();  
    
    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
    
    //현재좌표확인
    function onGeoOk(position){
        const lat = position.coords.latitude;
        const lng = position.coords.longitude;
        console.log("You live in", lat, lng);
    }
    function onGeoError(){
        alert("Can't find you. No weather for you.");
    }
    navigator.geolocation.getCurrentPosition(onGeoOk,onGeoError);
    
    
    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces(coord) {
        var keyword = coord;
    
        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB); 
    }
    
    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
    
            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);
    
            // 페이지 번호를 표출합니다
            displayPagination(pagination);
    
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
    
            alert('검색 결과가 존재하지 않습니다.');
            return;
    
        } else if (status === kakao.maps.services.Status.ERROR) {
    
            alert('검색 결과 중 오류가 발생했습니다.');
            return;
    
        }
    }
    
    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {
    
        var listEl = document.getElementById('placesList'), 
        menuEl = document.getElementById('menu_wrap'),
        fragment = document.createDocumentFragment(), 
        bounds = new kakao.maps.LatLngBounds(), 
        listStr = '';
        
        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);
    
        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        
        for ( var i=0; i<places.length; i++ ) {
    
            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i), 
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
    
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);
    
            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });
    
                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });
    
                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };
    
                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);
    
            fragment.appendChild(itemEl);
        }
    
        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;
    
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }
    
    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {
    
        var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="info">' +
                       '<h5><a href="#" onClick="window.open(\'' + places.place_url + '\',\'' + places.place_name + '\',\'width=1000px,height=800px\')">' + places.place_name + '</a></h5>';
    
        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>'; 
        }
                     
          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                    '</div>';           
    
        el.innerHTML = itemStr;
        el.className = 'item';
    
        return el;
    }
    
    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage 
            });
    
        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    
        return marker;
    }
    
    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }
    
    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i; 
    
        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }
    
        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;
    
            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }
    
            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }
    
    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }
    
     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {   
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }
</script>
</html>