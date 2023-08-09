<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 점심 뭐먹지</title>
<style>
	.ojc {
	    margin: 0 auto;
	    align-content: center;
	
	}
	.ojc__header {
	    text-align: center;
	}
	.ojc__button {
	    margin-right: 20%;
	    text-align: right;
	    color : black;
	}
	.mandalart {
	    margin: 0 auto;
	    width: 40%;
	}
	.mandalart-top {
	    display: inline-block;
	    margin-left: 20%;
	}
	#manda1 {
	    float: left;
	}
	#manda2 {
	    float: left;
	}
	.mandalart-mid {
	    display: inline-block;
	}
	#manda4 {
	    float: left;
	}
	#manda {
	    float: left;
	}
	.mandalart-bot {
	    display: inline-block;
	}
	#manda6 {
	    float: left;
	}
	#manda7 {
	    float: left;
	}
	.cover-black{
	    background-color : black;
	}
	.reveal-gray{
	    background-color: gray;
	}
	.mandalart{
	    background-color: gray;
	}
	.mandalart td {
	    width: 75px;
	    height: 75px;
	    text-align: center;
	    font-size: small;
	    border: 1px solid white;
	}
	
	.map_wrap, .map_wrap * {padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
        <div class="ojc__button">
            <button class="ojc__button-random" onclick="allRandomMenu()">랜덤 메뉴</button>
            <button class="ojc__button-ranAll" onclick="allRandomCategory()">전체 랜덤</button>
        </div>
        <div class="mandalart">
            <div class="madalart-top">
                <div id="manda1">
                </div>
                <div id="manda2">
                </div>
                <div id="manda3">
                </div>
            </div>
            <div class="madalart-mid">
                <div id="manda4">
                </div>
                <div id="manda">
                </div>
                <div id="manda5">
                </div>
            </div>
            <div class="madalart-bot">
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

    var menuCategory = ['한식', '중식', '일식', '아시안', '분식', '양식', '고기', '치킨', '햄버거'];

    var exam = [{
            "name": "한식",
            "menu": [
                "비빔밥", "백반", "냉면", "제육", "보쌈", "닭갈비", "삼계탕", "찜닭", "국밥"
            ]
        },
        {
            "name": "중식",
            "menu": [
                "짜장면", "짬뽕", "볶음밥", "딤섬", "멘보샤", "유린기", "팔보채", "중화비빔밥", "탕수육"
            ]
        },
        {
            "name": "아시안",
            "menu": [
                "베트남 쌀국수", "팟타이", "분짜", "반미", "짜조", "쏨땀", "푸팟퐁", "똠얌꿍", "나시고랭"
            ]
        },
        {
            "name": "분식",
            "menu": [
                "토스트", "라면", "우동", "막국수", "칼국수", "떡볶이", "만두", "김밥", "쫄면"
            ]
        },
        {
            "name": "양식",
            "menu": [
                "파스타", "피자", "햄버거", "스테이크", "타코", "오믈렛", "포케", "리소토", "샐러드"
            ]
        },
        {
            "name": "고기",
            "menu": [
                "갈비", "떡갈비", "불고기", "곱창", "육회", "막창", "족발", "삼겹살", "소고기"
            ]
        },
        {
            "name": "일식",
            "menu": [
                "초밥", "돈부리", "소바", "야키니쿠", "나베", "라멘", "텐동", "규동", "오니기리"
            ]
        },
        {
            "name": "햄버거",
            "menu": [
                "버거킹", "NBB", "맥도날드", "맘스터치", "오일리버거", "KFC", "롯데리아", "쉑쉑버거", "수제버거"
            ]
        },
        {
            "name": "치킨",
            "menu": [
                "bbq", "bhc", "네네치킨", "굽네치킨", "파파이스", "교촌치킨", "kfc", "60계", "지코바"
            ]
        }
    ];

    var koreanFood = ['비빔밥', '백반', '냉면', '제육', '보쌈', '닭갈비', '삼계탕', '찜닭', '국밥'];
    var chineseFood = ['짜장면', '짬뽕', '볶음밥', '딤섬', '멘보샤', '유린기', '팔보채', '중화비빔밥', '탕수육'];
    var japaneseFood = ['초밥', '돈부리', '소바', '야키니쿠', '나베', '라멘', '텐동', '규동', '오니기리'];
    var asianFood = ['베트남 쌀국수', '팟타이', '분짜', '반미', '짜조', '쏨땀', '푸팟퐁', '똠얌꿍', '나시고랭'];
    var boonsik = ['순대', '라면', '우동', '막국수', '칼국수', '떡볶이', '만두', '김밥', '쫄면'];
    var westernFood = ['파스타', '피자', '햄버거', '스테이크', '타코', '오믈렛', '포케', '리소토', ''];
    var meat = ['갈비', '떡갈비', '불고기', '곱창', '육회', '막창', '족발', '삼겹살', '소고기'];
    var chicken = ['bbq', 'bhc', '네네치킨', '굽네치킨', '파파이스', '교촌치킨', 'kfc', '60계', '지코바'];
    var hamburger = ["버거킹", "NBB", "맥도날드", "맘스터치", "오일리버거", "KFC", "롯데리아", "쉑쉑버거", "수제버거"]

    var dessert = ['크림빵', '케이크', '빙수', '푸딩', '쿠키', '도넛', '타르트', '휘낭시에', '마카롱'];


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
                document.getElementById('manda').querySelectorAll('td')[i].innerText = exam[random[i]].name
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
                            tdTag.innerText = exam[random[i - 1]].menu[random[k]];
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
                            document.getElementById('manda' + i).querySelectorAll('td')[k].innerText = exam[random[i]].menu[k]
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
                            if (exam[k].name === document.getElementById('manda' + i).querySelectorAll('td')[4].innerText) {
                                for (let j = 0; j < 9; j++) {
                                    document.getElementById('manda' + i)
                                    .querySelectorAll('td')[j].innerText = exam[k].menu[random[j]]

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
                            if (exam[k].name === document.getElementById('manda' + i).querySelectorAll('td')[4]
                                .innerText) {
                                for (let j = 0; j < 9; j++) {
                                    document.getElementById('manda' + i)
                                    .querySelectorAll('td')[j].innerText = exam[k].menu[random[j]]

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