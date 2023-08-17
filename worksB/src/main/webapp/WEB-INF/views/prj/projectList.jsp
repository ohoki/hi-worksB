<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
		<a href="projectTiled"><img class="tiled icon" alt="타일형으로 보기" src="${pageContext.request.contextPath }/resources/icon/microsoft.svg"></a>
		<a href="projectList"><img class="list icon" alt="리스트로 보기" src="${pageContext.request.contextPath }/resources/icon/list.svg"></a>
		<h4 class="star-list">즐겨찾기</h4>
		<c:forEach items="${projectList }" var="list">
			<c:if test="${list.markup eq 'Y' }">
				<div class="container">
					<ul class="draggable" draggable="true">
						<li>
							<p hidden>${list.projectId }</p>
							<img class="icon colored-star" alt="즐겨찾기 별" src="${pageContext.request.contextPath }/resources/icon/star.svg">
		
							<p onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</p> 
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticir }
							<c:if test="${list.projectAccess eq 'YES'}">
									<img class="icon" alt="전체공개이미지"  src="${pageContext.request.contextPath }/resources/icon/globe.svg">
							</c:if>
	
							<div class="unread-project">1</div>
						</li>
					</ul>
				</div>
			</c:if>
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
			<c:forEach items="${projectList }" var="list">
				<c:if test="${list.markup eq 'N' }">
					<ul class="draggable" draggable="true">
						<li>
							<p hidden>${list.projectId }</p>
							<img class="icon empty-star" alt="즐겨찾기 별해제" src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg">
		
							<p onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</p> 
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticir }
							<c:if test="${list.projectAccess eq 'YES'}">
								<img class="icon" alt="전체공개이미지"  src="${pageContext.request.contextPath }/resources/icon/globe.svg">
							</c:if>
		
						</li>
					</ul>
				</c:if>
			</c:forEach>
		</div>
	</div>
	

	<div class="create-project-list-view">새 프로젝트 생성</div>

	<script>
    
//즐찾해제
    document.addEventListener("click",(e)=>{     
        if(e.target.className.includes('colored-star')){
            e.preventDefault()
            let remove=document.getElementsByClassName('colored-star')
            for(let i=0;i<remove.length;i++){
                remove[i].addEventListener("click",
                function(e){
                    e.preventDefault();
                    let stared=this;
                    stared.src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg"
                    let none=document.getElementsByClassName('none-star')[0].nextSibling.nextSibling
                    
                    let pn=this.parentNode;
					
                    none.appendChild(pn)
                    
                    let starInfo='full'
                    updateStar(starInfo)
                })
            }
//즐찾추가
        }else if(e.target.className.includes('empty-star'))
            e.preventDefault()
            let add=document.getElementsByClassName('empty-star');
            for(let i=0;i<add.length;i++){
                add[i].addEventListener("click",
                    function(event){
                        event.preventDefault();
                        let empty=this;

                        //let title;
                        
                        empty.src="${pageContext.request.contextPath }/resources/icon/star.svg"
                        //empty.classList.replace('fa-regular fa-star empty-star','fa-regular fa-star colored-star')
                        let starList=document.getElementsByClassName('star-list')[0].nextSibling.nextSibling

                        let pn=this.parentNode;

                        starList.appendChild(pn)
                })
            }
        
    })
    //즐겨찾기 관련 정보를 DB에 연동
    function updateStar(starInfo){
	console.log(starInfo)
		$.ajax({
			url:'updateStar',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(starInfo)
		})
		.done(data=>{
			console.log(data)
		})
		.fail(reject=>{
			alert('즐겨찾기 갱신에 실패하였습니다')
			window.location.reload()	
		})
}

    

    //drag event
    
    </script>

</body>
</html>