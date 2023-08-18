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
		<c:forEach items="${projectList }" var="list">
			<c:if test="${list.projectMarkup eq 'Y' }">
				<div class="likeContainer">
					<ul class="draggable" draggable="true">
						<li>
					
							<img class="icon colored-star" alt="즐겨찾기 별" src="${pageContext.request.contextPath }/resources/icon/fullStar.svg" data-id="${list.projectId }">
		
							<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span> 
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }
							<c:if test="${list.projectAccess eq 'YES'}">
									<img class="icon" alt="전체공개이미지"  src="${pageContext.request.contextPath }/resources/icon/globe.svg">
							</c:if>
<!-- 	unreadproject있으면 db로부터 받아와서 첨부하기!! -->
							<span class="unread-project">1</span>
						</li>
					</ul>
				</div>
			</c:if>
		</c:forEach>
		<hr>

		<br>

		<div class="disLikeContainer">
			<c:forEach items="${projectList }" var="list">
				<c:if test="${list.projectMarkup eq 'N'}">
					<div class="none-star">
						<h4></h4>
						<select class="selectList">
							<option value="status1">참여중</option>
							<option value="status2">만료</option>
						</select>
					</div>
					<ul class="draggable" draggable="true">
						<li>
							<p class="project-id" hidden>${list.projectId }</p>
							<img class="icon empty-star" alt="즐겨찾기 별해제" src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg">
		
							<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span> 
							<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }
							<c:if test="${list.projectAccess eq 'YES'}">
								<img class="icon" alt="전체공개이미지"  src="${pageContext.request.contextPath }/resources/icon/globe.svg">
							</c:if>
						</li>
					</ul>
				</c:if>
			</c:forEach>
		</div>
	</div>
	

	<div class="create-project-list-view"><a href="projectInsert">새 프로젝트 생성</a></div>


</body>
	<script>
	//프로젝트 상태 불러오기
	//$('#testSelect').val('test2').prop("selected",true);
	
	
   
//즐찾해제
    document.addEventListener("click",(e)=>{     
       
        if(e.target.className.includes('colored-star')){
            e.preventDefault()  
                    
            let stared=e.target;
            let markup='N'
            let prjId=$(empty).data("id");
            updateStar(markup,prjId)
            
            stared.src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg"
            

            let none=document.querySelector('.likeContainer')
            
            let pn=stared.parentNode;

            none.appendChild(pn)
   
//즐찾추가
        } 
        else if(e.target.className.includes('empty-star')){
            e.preventDefault()

            let empty=e.target
            
            let markup='Y'
            let prjId=$(empty).data("id");
            updateStar(markup,prjId)
            
            //let title;
            
            empty.src="${pageContext.request.contextPath }/resources/icon/star.svg"

            let none=document.querySelector('.disLikeContainer')

            let pn=empty.parentNode;

            starList.appendChild(pn)
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