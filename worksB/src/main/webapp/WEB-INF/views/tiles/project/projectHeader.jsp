<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/f322160cc3.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <div class="project__header">
            <div class="project__menu">
                <i class="fa-regular fa-star empty-star" style="color: #4d4d4d;"></i>
                <a href="#"><i class="fa-solid fa-ellipsis-vertical" style="color: #4d4d4d;" onclick="openSetting()"></i></a>
                <span>프로젝트이름</span>
                <div class="project__setting" id="setting">
                    <ul>
                        <li><a href="#">알림설정</a></li>
                        <li><a href="#">프로젝트 나가기</a></li>
                        <li><a href="#">프로젝트 수정</a></li>
                        <li><a href="#">프로젝트 삭제</a></li>
                    </ul>

                </div>
            </div>

            <div>
                <ul class="project__nav">
                    <li><a href="#">피드</a></li>
                    <li><a href="#">업무</a></li>
                    <li><a href="#">캘린더</a></li>
                    <li><a href="#">파일</a></li>
                </ul>
            </div>
        </div>
    </header>
    <script>
        function openSetting(){
            if(document.getElementById('setting').style.display==='block'){
                document.getElementById('setting').style.display='none';
            }else{
                document.getElementById('setting').style.display='block';
            }
        }
    </script>
</body>
</html>