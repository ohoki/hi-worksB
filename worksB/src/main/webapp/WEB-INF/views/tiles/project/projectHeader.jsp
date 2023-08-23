<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.7.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>
.header{
	height: 60px;
}

.modal{
    position:absolute;
    display:none;
    justify-content: center;
    top:0;
    left:-30%;
    width:100%;
    height:100%;
}

.secondModal{
	top:0;
    left:0;
}

.modal_body{
    position:absolute;
    top:20%;
    left:15%;
    width: 200px;
    height: 200px; 
    background-color: rgb(255,255,255);
    border-radius:10px;
    box-shadow:0 2px 3px 0 rgba(34,36,38,0.15);
    transform:translateY(-50%);
}

.modal li{
    font-size: 16px;
    color: var(--color-dark-grey);
    margin: 15px;
    padding: 2px;
}

.modal li:hover{
    background-color: var(--color-light-blue);
    color: #303030;
}

.project__header {
    margin: 0 auto;
    width: 100%;
    background-color: aliceblue;
}

.project__nav {
    list-style: none;
    height: 100%;
    display: flex;
    align-items: center;
    margin-left: 50px;
}

.project__nav a {
    text-decoration: none;
    outline: none;
    font-weight: var(--weight-bold);
    color: var(--color-light-grey);
    font-size: 16px;
}

.project__nav li {
    font-size: 20px;
    height: 100%;
    display: flex;
    align-items: center;
    margin-right: 20px;
}

.project__nav a:hover {
    color: #303030;
}

.project__title{
	font-size: 25px;
	margin-left: 20px;
}

.project__setting{
	margin-left: 30px;
	margin-bottom: 10px;
}

ol, ul {
    padding-left: 0;
}

.icon{
	width: 20px;
	color: #4d4d4d;
	margin-right: 10px;
}
</style>
</head>
<body>
<div class="project__header">
	<div class="project__setting">
		<img class="icon" src="${pageContext.request.contextPath }/resources/icon/emptyStar.svg">
		<img class="icon" src="${pageContext.request.contextPath }/resources/icon/bars-solid.svg" data-bs-toggle="modal" data-bs-target="#firstModal">
    	<span class="project__title">${projectInfo.projectName}</span>
    </div>
		<div class="modal" tabindex="-1" id="firstModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">
						<ul id="menuList">
							<li data-toggle="modal" data-target="#subMenuModal11">알림설정</li>
							<li data-toggle="modal" data-target="#subMenuModal12">프로젝트 나가기</li>
							<li onclick="location.href='projectUpdate?projectId=${projectInfo.projectId}'">프로젝트 수정</li>
							<li data-toggle="modal" data-target="#subMenuModal14">프로젝트 삭제</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" tabindex="-1" id="subMenuModal11">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">알림설정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>알림설정</p>
					</div>
				</div>
			</div>
		</div>

		<div class="modal" tabindex="-1" id="subMenuModal12">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">프로젝트 나가기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>프로젝트 나가기</p>
					</div>
				</div>
			</div>
		</div>

		<div class="modal" tabindex="-1" id="subMenuModal13">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">프로젝트 수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>프로젝트 수정</p>
					</div>
				</div>
			</div>
		</div>

		<div class="modal secondModal" tabindex="-1" id="subMenuModal14">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">프로젝트 삭제</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>프로젝트 삭제</p>
					</div>
					<div class="modal-footer">
					    <button type="button" class="btn btn-primary" onclick="location.href='projectDelete?projectId=${projectInfo.projectId}'">삭제</button>
					    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</div>
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
<script>
	$(document).ready(function() {
		$('#menuList li').click(function() {
			var targetModal = $(this).data('target');
			$(targetModal).modal('show');
		});
	});
</script>
</html>