<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/f322160cc3.js" crossorigin="anonymous"></script>
<link  rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
    <style>
    </style>
</head>
<body>
    <h1>내프로젝트</h1>
    <br>
    <i class="fa-brands fa-microsoft fa-2xl"></i>
    <i class="fa-solid fa-bars fa-2xl"></i>
    <h2 class="star-list">즐겨찾기</h2>
    <div class="container">
        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-solid fa-star colored-star" ></i>
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">6</i>
                <div class="unread-project">1</div>
            </li>
        </ul>
    </div>
    <hr>
    
    <br>
    <h2 class="none-star">참여중</h2>
    <div class="container">

        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-regular fa-star empty-star"></i>
            <!--<i class="fa-solid fa-star" style="color: #e5ff66;"></i>-->
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">6</i>
                <i class="fa-solid fa-globe"></i>
            </li>
        </ul>

        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-regular fa-star empty-star" ></i>
            <!--<i class="fa-solid fa-star" style="color: #e5ff66;"></i>-->
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">6</i>
            </li>
        </ul>


  
        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-regular fa-star empty-star"></i>
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">6</i>
            </li>
        </ul>

        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-regular fa-star empty-star"></i>
            <!--<i class="fa-solid fa-star" style="color: #e5ff66;"></i>-->
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">50</i>
            </li>
        </ul>
 
        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-regular fa-star empty-star" ></i>
            <!--<i class="fa-solid fa-star" style="color: #e5ff66;"></i>-->
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">6</i>
                <i class="fa-solid fa-globe"></i>
            </li>
        </ul>

        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-regular fa-star empty-star"></i>
            <!--<i class="fa-solid fa-star" style="color: #e5ff66;"></i>-->
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">6</i>
                <i class="fa-solid fa-globe"></i>
            </li>
        </ul>

        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-regular fa-star empty-star" ></i>
            <!--<i class="fa-solid fa-star" style="color: #e5ff66;"></i>-->
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">6</i>
                <i class="fa-solid fa-globe"></i>
            </li>
        </ul>

        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-regular fa-star empty-star" ></i>
            <!--<i class="fa-solid fa-star" style="color: #e5ff66;"></i>-->
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">6</i>
                <i class="fa-solid fa-globe"></i>
            </li>
        </ul>

        <ul class="draggable" draggable="true">
            <li>
                <i class="fa-regular fa-star empty-star" ></i>
            <!--<i class="fa-solid fa-star" style="color: #e5ff66;"></i>-->
                <div class="colored-icon"></div>
                <h4><a href="https://www.naver.com">titletitle</a></h4>
                <i class="fa-solid fa-user">6</i>
                <i class="fa-solid fa-globe"></i>
            </li>
        </ul>
    </div>


    <div class="create-project-list-view">
        새 프로젝트 생성
    </div>

    <script>
    
//즐찾해제와 추가
    document.addEventListener("click",(e)=>{
        
        if(e.target.className.includes('colored-star')){
            e.preventDefault()
            let remove=document.getElementsByClassName('colored-star')
            for(let i=0;i<remove.length;i++){
                remove[i].addEventListener("click",
                function(e){
                    e.preventDefault();
                    let stared=this;
                    stared.classList.remove('colored-star','fa-solid')
                    stared.className+=' '+'empty-star'+' '+'fa-regular'
                    let none=document.getElementsByClassName('none-star')[0].nextSibling.nextSibling
                    console.log(none)
                    let pn=this.parentNode;
                    console.log(pn)
                    none.appendChild(pn)
                })
            }

        }else if(e.target.className.includes('empty-star'))
            e.preventDefault()
            let add=document.getElementsByClassName('empty-star');
            for(let i=0;i<add.length;i++){
                add[i].addEventListener("click",
                    function(event){
                        event.preventDefault();
                        let empty=this;
                        empty.classList.remove('empty-star','fa-regular')
                        empty.className+=' '+'colored-star'+' '+'fa-solid'
                        //empty.classList.replace('fa-regular fa-star empty-star','fa-regular fa-star colored-star')
                        let starList=document.getElementsByClassName('star-list')[0].nextSibling.nextSibling
                        let pn=this.parentNode;
                        starList.appendChild(pn)
                })
            }
        
    })

    

    //drag event
    
    </script>

</body>
</html>