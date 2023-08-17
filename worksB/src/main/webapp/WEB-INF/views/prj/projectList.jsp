<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://kit.fontawesome.com/f322160cc3.js"
	crossorigin="anonymous"></script>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/projectList.css"> --%>
<style>
.icon{
	width: 30px;
	height: 30px;
}

.tiled, .list {
	float: right;
	margin-left: 20px;
	margin-right: 20px;
}
.tiled {
	margin-right: 70px;
}
.block {
	margin-left: 50px;
}
</style>
</head>
<body>
	<div class="block">
		<h3>내프로젝트</h3>
		<br> 
		<img class="tiled icon" alt="타일형으로 보기" src="${pageContext.request.contextPath }/resources/icon/microsoft.svg">
		<img class="list icon" alt="리스트로 보기" src="${pageContext.request.contextPath }/resources/icon/list.svg">
		<h4 class="star-list">즐겨찾기</h4>
		<c:forEach items="projectList" var="list">
			<div class="container">
				<ul class="draggable" draggable="true">
					<li><img class="colored-star" alt="즐겨찾기 별" src="${pageContext.request.contextPath }/resources/icon/star.svg">
<!-- 					<i class="fa-solid fa-star colored-star"></i> -->
<!-- 					<div class="colored-icon"></div> -->
					<p onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</p> 
					<img class="icon" alter="참여자수 아이콘" src="${PageContext.request.contextPath }/resources/icon/user.svg">${list.particirNum }
<!-- 					<i class="fa-solid fa-user">6</i> -->
					<div class="unread-project">1</div>
					</li>
			</ul>
		</div>
		</c:forEach>
		<hr>

		<br>
		<div class="none-star">
			<select>
				<option>참여중</option>
				<option>만료</option>
			</select>
		</div>
		<div class="container">
			<c:forEach items="projectList" var="list"></c:forEach>
			<ul class="draggable" draggable="true">
				<li><i class="fa-regular fa-star empty-star"></i> <!--<i class="fa-solid fa-star" style="color: #e5ff66;"></i>-->
					<div class="colored-icon"></div>
					<h4></h4> <i class="fa-solid fa-user">6</i> <i class="fa-solid fa-globe"></i>
				</li>
			</ul>

		</div>
	</div>

	<div class="create-project-list-view">새 프로젝트 생성</div>

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