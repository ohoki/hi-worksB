<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
        }

        .ojc__manda-table {
            margin: 0 auto;
        }

        .ojc__manda-table td {
            width: 50px;
            height: 50px;
            background-color: gray;
            text-align: center;
        }

        .box {
            width: 50px;
            height: 50px;
            background-color: aqua;
            display: inline-block;
            align-items: center;
            justify-content: center;
        }
        .mandalart{
            margin: 0 auto;
            width: 40%;
        }
        .mandalart-top{
            display: inline-block;
            margin-left: 20%;
        }
        #manda1{
            float: left;
        }
        #manda2{
            float: left;
        }
        .mandalart-mid{
            display: inline-block;
        }
        #manda4{
            float: left;
        }
        #manda{
            float: left;
        }
        .mandalart-bot{
            display: inline-block;
        }
        #manda6{
            float: left;
        }
        #manda7{
            float: left;
        }
        .mandalart td {
            width: 75px;
            height: 75px;
            background-color: gray;
            text-align: center;
        }

    </style>
<script>
    document.addEventListener("DOMContentLoaded", function () {

    })
</script>
<body>
    <div class="ojc">
        <div class="ojc__header">
            <div class="ojc__header-title">
                <span>오.점.추</span>
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
    <script>
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
        // var exam1 = {"memu" : [
        //                         {"koreanFood" : "한식"}, {"chineseFood" : "중식"},{"japaneseFood" : "일식"},{"asianFood" : "아시안"},{"boonsik" : "분식"}
        //                         , {"westernFood" : "양식"},{"meat" : "고기"},{"chicken" : "치킨"},{"hamburger" : "햄버거"}
        //                     ]};

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

            for (let i = 0; i < 9; i++) {
                if (i != 4) {
                    document.getElementById('manda').querySelectorAll('td')[i].innerText = exam[random[i]].name
                } else if (i == 4) {
                    continue;
                }
            }

            //메뉴 랜덤하게 만드는 함수
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
                                    tdTag.innerText = document.getElementById('manda').querySelectorAll('td')[i - 1]
                                        .innerText
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
                                document.getElementById('manda' + i).querySelectorAll('td')[k].innerText = exam[random[
                                    i - 1]].menu[random[k]]
                            }
                        }
                    } else {
                        let tableTag = document.createElement('table')
                        document.getElementById('manda' + i).appendChild(tableTag).setAttribute('id', 'manda-table' +
                            i);
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
                                document.getElementById('manda' + i).querySelectorAll('td')[k].innerText = exam[random[
                                    i]].menu[k]
                            }
                        }
                    }
                }
            }
            randomMenu();
        }
        manda();

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
            manda();
        }

        function allRandomMenu() {
            for (let i = 1; i < 9; i++) {
                let child = document.getElementById('manda-table' + i);
                document.getElementById('manda' + i).removeChild(child);
            }

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
                                    tdTag.innerText = document.getElementById('manda').querySelectorAll('td')[i - 1]
                                        .innerText
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
                                if (exam[k].name === document.getElementById('manda' + i).querySelectorAll('td')[4]
                                    .innerText) {
                                    for (let j = 0; j < 9; j++) {
                                        document.getElementById('manda' + i).querySelectorAll('td')[j].innerText = exam[
                                            k].menu[random[j]]

                                    }
                                }
                            }
                        }
                    } else {
                        let tableTag = document.createElement('table')
                        document.getElementById('manda' + i).appendChild(tableTag).setAttribute('id', 'manda-table' +
                            i);
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
                                        document.getElementById('manda' + i).querySelectorAll('td')[j].innerText = exam[
                                            k].menu[random[j]]

                                    }
                                }
                            }
                        }
                    }
                }
            }
            randomMenu();
        }







        function ranMenu() {
            for (let i = 0; i < menuCategory.length; i++) {
                console.log(menuCategory[random[i]])
            }
        }
    </script>
</body>
</html>