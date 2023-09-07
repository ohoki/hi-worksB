<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.list-option button{
	width: 100px;
	height: 40px;
	margin-left: 20px;
	background-color: var(--color-beigie);
	border-radius: 5px;
	color: var(--color-dark);
	font-weight: var(--weight-bold);
	border : 1px solid var(--color-dark-beigie);
}
.list-option button:hover {
	background-color: var(--color-dark-red);
	color: var(--color-white);
	border : 1px solid var(--color-dark-red);
	transition: all 0.5s;
}
.list-title {
	font-size: var(--font-regular);
	padding: 0 30px;
	margin-bottom: 15px;
	color: var(--color-dark-grey);
	margin-top: 30px;
}
.list-box {
	width: 70%;
	margin: 0 auto;	
	font-size: 18px; 
	font-weight: var(--weight-semi-bold);
}
.list {
	padding: 10px 40px;
	margin: 5px 0;
	border-radius: 5px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: rgb(253, 252, 220, 0.2);
}
.list-option {
	display: flex;
	align-items: center;
	margin: 20px 0 30px;
	justify-content: space-between;
}
.list-option select {
	width: 100px;
	height: 30px;
	border-radius: 4px;
  	border: 1px solid var(--color-dark-beigie);
  	outline: none;
}
.list-option select:focus{
	outline: none;
}
.project-name {
	margin-right: 50px;
	height: 30px;
	line-height: 30px;
	display: flex;
	align-items: center;
}

.project-name span {
	cursor: pointer;
}
.project-info {
	display: flex;
	align-items: center;
	margin-right: 80px;
}
.dept-list {
	display: flex;
	justify-content: flex-start;
	font-size: 16px; 
	color: var(--color-light-grey);
}
.list-count {
	font-size: var(--font-small); 
	font-weight: var(--weight-bold);
}
.list-count span {
	color: var(--color-red);
	margin-left: 5px;
}
.dept-list li {
	padding: 7px 10px;
	border-radius: 10px;
	margin-right: 10px;
	cursor: pointer;
	border: 1px solid rgba(174, 213, 245, 0);
}
.dept-list li:hover {
	border: 1px solid var(--color-dark-beigie);
	background-color: var(--color-dark-beigie);
	color: var(--color-dark-red);	
	transition: all 0.5s;
}
.prj-icon {
	margin: 0 10px;
	display: inline-block;
	cursor: pointer;
}
.list-btn {
	width: 70px;
	height: 34px;
	border-radius: 17px;
	color: white;
	cursor: default;
}
.point {
	cursor: pointer;
}
.green {
	background-color: #29bf12;
}
.yellow {
	background-color: var(--color-orange);
}
.red {
	background-color: var(--color-red);
}


#prjParticir-modal{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.1);
	font-size: 12px;
	display: none;
	left: 0;
	top: 0;
}

.prjParticir-modal-title{
	font-size: 15px;
	justify-content: space-between;
	font-weight: var(--weight-bold);
	padding: 5px 10px;
}

.prjParticir-modal-content{
	position: absolute;
	width: 15%;
	height: 30%;
	background-color: white;
	font-size: 12px;
	padding: 20px 15px;
	z-index: 10;
	overflow: auto;
	overflow-x: hidden;
	border-radius: 5px;
}

.modal-visible {
	display: block !important;
}
</style>
</head>
<body>

	<div>
		<p>프로젝트 목록</p>
	</div>
	<div id="prj-list">
		<table>
			<thead>
				<tr>
					<td>프로젝트명</td>
					<td>관리자</td>
					<td>참여자수</td>
					<td>글 수 </td>
					<td>프로젝트로 이동</td>
				</tr>
			</thead>
			<tbody>
					<c:forEach items="${list }" var="list">
						<tr>
							<td><input value="${list.projectName }" class="input" data-pjid="${list.projectId }" data-dpid="${list.deptId }"><button id="changeName">변경하기</button></td>
							<td class="manager" data-pjid="${list.projectId }">${list.memberId }</td>
							<td class="participants" data-pjid="${list.projectId }">${list.mnumber }</td>
							<td>${list.boardcount }</td>
							<td><button onclick="location.href='${pageContext.request.contextPath }/projectFeed?projectId='+'${list.projectId }'">GO</button></td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="paging" style="text-align: center">
					<!-- 이전 --> 
				<c:if test="${paging.startPage!=1 } " >
					<a href="javascript:search(${paging.startPage - 1 })">&lt이전</a>
				</c:if>
					<!-- View 안에 보여지는 페이지들 --> 
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p eq paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:otherwise>
							<a href="javascript:search(${p })">${p }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
					<!-- 다음 --> 
				<c:if test="${paging.endPage != paging.lastPage }">
					<a href="javascript:search(${paging.endPage + 1 })">다음&gt</a>
				</c:if>
			</div>
			
			<!-- 프로젝트 참여자 모달 -->
	<div id="prjParticir-modal">
		<div class="prjParticir-modal-content">
			<div class="prjParticir-modal-title">
				<span>프로젝트 참여자</span>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor">
			</div>
			<div id="prjParticir"></div>
		</div>			
	</div>
</body>
<script type="text/javascript">

	function search(p){
		location.href="${pageContext.request.contextPath }/admin/projectlist?nowPage="+p
	}
	
	$('#changeName').on("click",function(event){
		let projectName=$('#prj-list .input').val()//인풋박스의 값
		let projectId=$('#prj-list .input').data('pjid');
		let deptId=$('#prj-list .input').data('dpid')
		
    	$.ajax({
    			url:"${pageContext.request.contextPath }/admin/updatePrjName",
    			method:'POST',
    			data:JSON.stringify(
    					{"projectName":projectName,
    					"projectId":projectId,
    					"deptId":deptId}),
    			contentType:'application/json'
    	})
    	.done(data=>{
				if(data!=0||data!=null){
					alert('업데이트에 성공하였습니다')
				}
			})
			.fail(reject=>{
				console.log(reject)
			})

	})
	
	//모달 닫기
	$('[id*=modal]').on('click', function() {
		$('.modal-visible').removeClass('modal-visible');
	});
	
	// 프로젝트 참여자 리스트
	$('#prj-list .participants').on('click', function(e){
		let projectId=$(this).data('pjid');
		let clicked=$(this);
		console.log(clicked)
		
		let x = e.clientX - 320;
		let y = e.clientY;
		
		$('.prjParticir-modal-content').css('left', x + 'px');
		$('.prjParticir-modal-content').css('top', y + 'px');
		
		$.ajax({
			url : '${pageContext.request.contextPath }/admin/getParticirList',
			type : 'GET',
			data : {'projectId': projectId},
			success : function(particir){
				let particirDiv = $('#prjParticir');
				particirDiv.empty();
				
				for(let i=0; i<particir.length; i++) {
					//div태그
					let employeeDiv = document.createElement('div');
					employeeDiv.classList.add('flex');
					employeeDiv.classList.add('employee');
					//이미지 태그
					let employeeProfile = document.createElement('img');
					employeeProfile.setAttribute('alt', '회원사진');
					employeeProfile.classList.add('employee-img');
					if(particir[i].realProfilePath != null) {
						employeeProfile.src = "${pageContext.request.contextPath}/images/"+particir[i].realProfilePath;
					}else {
						employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
					}
					//스팬 태그
					let span = document.createElement('span');
					if(particir[i].manager=='A2'){
						span.innerText = particir[i].memberName;						
					}else{
						span.innerText = particir[i].memberName+'(관리자)';
					}
					//매니저버튼태그
					let mBtn=document.createElement('button');
					if(particir[i].manager=='A2'){
						let mBtnText=document.createTextNode('관리자변경');
						mBtn.appendChild(mBtnText);
					}
					//히든 인풋 태그 (멤버id값)
					let input = document.createElement('input');
					input.setAttribute('type', 'hidden');
					input.value = particir[i].memberId;
					//태그 삽입
					employeeDiv.append(employeeProfile);
					employeeDiv.append(span);
					employeeDiv.append(mBtn)
					employeeDiv.append(input);
					
					particirDiv.append(employeeDiv);
					
					//관리자변경을 누르면 관리자변경
					$(mBtn).on('click',function(e){
						if(confirm('관리자를 변경하시겠습니까?')){
							let mBtn=$(this);
							let memberId=mBtn.next().val();
							console.log(memberId)

							//관리자변경
							$.ajax({
								url:'${pageContext.request.contextPath }/admin/updateManager',
								type:'POST',
								contentType:'application/json',
								data:JSON.stringify({'memberId':memberId,
										'projectId':projectId}),
								success:function(response){
									if(response>0){
										alert('관리자가 변경되었습니다')
										clicked.prev().text(memberId);
										$('#prjParticir-modal').removeClass('modal-visible');
									}else{
										alert('실패하였습니다')
									}
								},
								error:function(error){
									console.log(error);
								}
							})
						}
						e.stopPropagation()
					})
				}
			},
			error : function(reject){
				console.log(reject);
			}
		})
		$('#prjParticir-modal').addClass('modal-visible');
	})
	

</script>
</html>