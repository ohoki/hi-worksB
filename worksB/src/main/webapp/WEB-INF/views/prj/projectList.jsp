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
.icons{
	
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
.create-project-list-view{
    width: 230px;
    background-color: #9fdbf5;
    height: 82px;
    border-radius: 30px;
    text-align: center;
    position: absolute;
    bottom: 81%;
    left: 70%;
    line-height: 80px;
}
.unread-project{
    border-radius: 50px;
    display: inline-block;
    background-color: red;
    width: 30px;
    height: 30px;
    line-height:30px;
    text-align: center;
    color: white;
    margin-left: 30px;
}
.selected-status{
	display: inline-block;
}
</style>
</head>
<body>
	<div class="block">
		<h3>내프로젝트</h3>
		<br> 
		<div class="icons">
			<a href="projectTiled"><img class="tiled icon" alt="타일형으로 보기" src="${pageContext.request.contextPath }/resources/icon/microsoft.svg"></a>
			<a href="projectList"><img class="list icon" alt="리스트로 보기" src="${pageContext.request.contextPath }/resources/icon/list.svg"></a>
		</div>
		<h4 class="star-list">즐겨찾기</h4>
		
		<ul>
			<c:forEach items="${projectList }" var="list">
				<c:if test="${list.projectMarkup eq 'YES' }">
					<div class="like-container">
						<li>
							<img class="icon colored-star draggable" alt="즐겨찾기 별" draggable="true" src="${pageContext.request.contextPath }/resources/icon/fullStar.svg" data-id="${list.projectId }">
		
							<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span> 
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }
							<c:if test="${list.projectAccess eq 'YES'}">
									<img class="icon" alt="전체공개이미지"  src="${pageContext.request.contextPath }/resources/icon/globe.svg">
							</c:if>
<!-- 	unreadproject있으면 db로부터 받아와서 첨부하기!! -->
							<span class="unread-project">1</span>
						</li>
					</div>
				</c:if>
			</c:forEach>
		</ul>
		<hr>

		<br>

		<div class="disLike-container">
			<ul>
				<c:forEach items="${projectList }" var="list">
					<c:if test="${list.projectMarkup eq 'NO'}">
						<div class="none-star">
							<h4 class="selected-status">참여중&nbsp;</h4>
							<select class="select-list">
								<option value="status1">참여중</option>
								<option value="status2">만료</option>
							</select>
						</div>
							<li>
								<p class="project-id draggable" hidden draggable="true">${list.projectId }</p>
								<img class="icon empty-star" alt="즐겨찾기 별해제" src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg">
			
								<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span> 
								<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }
								<c:if test="${list.projectAccess eq 'YES'}">
									<img class="icon" alt="전체공개이미지"  src="${pageContext.request.contextPath }/resources/icon/globe.svg">
								</c:if>
							</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	

	<div class="create-project-list-view"><a href="projectInsert">새 프로젝트 생성</a></div>


</body>
	<script>
		//프로젝트 상태 불러오기
	$(document).ready(function(){
		let status=document.querySelector('.selected-status')
		$("select[class=select-list]").change(function(){
			status.text()
		})
		
	})
	
	
   
//즐찾해제
    document.addEventListener("click",(e)=>{     
       
        if(e.target.className.includes('colored-star')){
            e.preventDefault()  
                    
            let stared=e.target;
            let markup='A2'
            let prjId=$(empty).data("id");
            updateStar(markup,prjId)
            
            stared.src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg"
            

            let none=document.querySelector('.like-container')
            
            let pn=stared.parentNode;

            none.appendChild(pn)
   
//즐찾추가
        } 
        else if(e.target.className.includes('empty-star')){
            e.preventDefault()

            let empty=e.target
            
            let markup='A1'
            let prjId=$(empty).data("id");
            updateStar(markup,prjId)
            
            //let title;
            
            empty.src="${pageContext.request.contextPath }/resources/icon/star.svg"

           	let none=document.querySelector('.like-container')
			let pn=empty.parentNode;
            console.log(pn)

            none.appendChild(pn)
            }
        
    })
    //즐겨찾기 관련 정보를 DB에 연동
    function updateStar(markup,projectId){
    	var data = {
    	        projectMarkup: markup,
    	        projectId: projectId
    	    }
		$.ajax({
			url:'updateStar',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(data)
		})
		.done(data=>{
			console.log(data)
		})
		.fail(reject=>{
			console.log(reject)
			alert('즐겨찾기 갱신에 실패하였습니다')
			//window.location.reload()	
		})
}

    

    //drag event
    
    </script>

</html>