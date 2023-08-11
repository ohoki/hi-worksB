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
                <i class="fa-solid fa-ellipsis-vertical open-modal" style="color: #4d4d4d;"></i>
                <span>프로젝트이름</span>
                <div class="modal">
                <div class="modal_body" >
                    <ul>
                        <li><a href="#">알림설정</a></li>
                        <li><a href="#">프로젝트 나가기</a></li>
                        <li><a href="#">프로젝트 수정</a></li>
                        <li class="open-modal">프로젝트 삭제</li>
                    </ul>
                </div>
                </div>
                <!-- 
                <div class="modal">
			        <div class="modal_body">
			            <p>모달창 내용 </p>
			        </div>
			    </div>
				 -->
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
    /*
        function openSetting(){
            if(document.getElementById('setting').style.display==='block'){
                document.getElementById('setting').style.display='none';
            }else{
                document.getElementById('setting').style.display='block';
            }
        }
     */
        //모달창 열기
        const modal = document.querySelector('.modal');
        const btnOpenModal=document.querySelector('.open-modal');

        btnOpenModal.addEventListener("click", ()=>{
            modal.style.display="flex";
        });

        // 바깥영역 클릭 시 모달창 닫기
        modal.addEventListener("click", e => {
            const evTarget = e.target
            if(evTarget.classList.contains("modal")) {
                modal.style.display = "none"
            }
        });

    </script>
</body>
</html>