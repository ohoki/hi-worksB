<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/projectList.css">
<style>

</style>
</head>
<body>
<!-- !!!!!!!!!!!!!!!!!!!미확인알림 안해뜸!!!!!!!!!!!!!!!!!!!! -->
	<div class="block">
		<h1>내프로젝트</h1>
		
		</div>
		<div class="icons">
			<a href="${pageContext.request.contextPath }/projectGrid"><img class="tiled icon" alt="타일형으로 보기"
				src="${pageContext.request.contextPath }/resources/icon/microsoft.svg"></a>
			<a href="${pageContext.request.contextPath }/projectList"><img class="list icon" alt="리스트로 보기"
				src="${pageContext.request.contextPath }/resources/icon/list.svg"></a>
		</div>
		<!-- 좋아요를 누른 프로젝트 -->
		<h2 class="star-list">즐겨찾기</h2>
		<div class="like-container">
			<ul>
				<c:forEach items="${bookmarked }" var="list">
					<li>
						<img class="icon colored-star draggable" alt="즐겨찾기 별" draggable="true" src="${pageContext.request.contextPath }/resources/icon/fullStar.svg" data-id="${list.projectId }"> 
						<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span>
						<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }
							<c:if test="${list.projectAccess eq 'YES'}">
								<img class="icon" alt="전체공개이미지" src="${pageContext.request.contextPath }/resources/icon/globe.svg">
							</c:if> <!-- 	unreadproject있으면 db로부터 받아와서 첨부하기!! --> 
							<span class="unread-project">1</span>
					</li>
		</c:forEach>
		</ul>
		</div>

		<!-- 좋아요를 누르지 않은 프로젝트 -->
		<h2 class="none-star-list">프로젝트</h2>
		<div class="dislike-container">
			<ul>
				<c:forEach items="${noneBookmarked }" var="list">
					<li>
						<img class="icon empty-star" alt="즐겨찾기 별해제" src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg" data-id="${list.projectId }" data-end="NO"> 
						<span onclick="location.href='projectFeed?projectId=${list.projectId}'">${list.projectName}</span>
						<img class="icon" alt="참여자수 아이콘" src="${pageContext.request.contextPath }/resources/icon/user.svg">${list.prjParticirNum }
						<c:if test="${list.projectAccess eq 'YES'}">
							<img class="icon" alt="전체공개이미지" src="${pageContext.request.contextPath }/resources/icon/globe.svg">
						</c:if> 
						<!-- 	unreadproject있으면 db로부터 받아와서 첨부하기!! --> 
						<span class="unread-project">1</span>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>



</body>
<script>
//즐겨찾기
	//즐찾해제
    document.addEventListener("click",(e)=>{     
       
        if(e.target.className.includes('colored-star')){
        	let star = e.target;

    	    let markup = 'A2';
    	    let prjId = $('.colored-star').data("id");
    	    updateStar(markup, prjId);

    	    star.src = "${pageContext.request.contextPath }/resources/icon/emptyStar.svg"
    	    star.className='icon empty-star';

    	    let dislikeC = document.querySelector('.dislike-container');
    	    let parent = star.parentNode;
    	    console.log(parent);
    	    dislikeC.appendChild(parent);
   
	//즐찾추가
        } 
        else if(e.target.className.includes('empty-star')){
        	let empty = e.target;

       	    let markup = 'A1';
       	    let prjId = $('.empty-star').data("id");
       	    updateStar(markup, prjId);

       	    empty.src = "${pageContext.request.contextPath }/resources/icon/fullStar.svg"
       	    empty.className='icon colored-star';

       	    let none = document.querySelector('.like-container');
       	    let pn = empty.parentNode;
       	    console.log(pn);
       	    none.appendChild(pn);
   
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