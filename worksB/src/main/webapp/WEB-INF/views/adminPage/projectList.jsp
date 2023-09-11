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
	#prj-list-title {
		margin: 0;
	    color: var(--color-dark-grey);
	    font-size: var(--font-regular);
	    padding: 0 30px;
	    margin: 30px 0;
	}
	
	button[id=managerBtn] {
		/* display:none; */
		background-color: var(--color-green);
	    padding: 6px 12px;
	    cursor: pointer;
	    width: 60px;
	    height: 20px;
	    border-radius: 5px;
	    font-weight: var(--weight-bold);
	    color: white;
	    line-height: 20px;
	    font-size: 12px;
	    margin-left: 30px;
	}
	button[class=change-name] {
		background-color: white;
		border: 1px solid var(--color-dark-red);
	    padding: 6px 12px;
	    cursor: pointer;
	    width: 60px;
	    height: 20px;
	    border-radius: 5px;
	    font-weight: var(--weight-bold);
	    color: var(--color-dark-red);
	    line-height: 20px;
	    font-size: 12px;
	    margin: 5px 0;
	}
	div p{
		text-align:center;
	}
	table{
		width: 85%;
		color : var(--color-dark-grey);
		margin: 20px auto;
		text-align: center;
		font-size:18px;
		border-collapse: collapse;
	}
	thead{
		background-color: #FEEDD6;
	}
	th, td {
		border: 1px solid var(--color-dark-beigie);
		text-align: center;
		width : 140px;
		max-height:20px;
	}
	
	th {
		height: 40px;
		font-weight: var(--weight-bold);
		text-align: center;
		background-color: rgb(249, 166, 52, 0.2);
		color: var(--color-dark-grey);
	}
	
	td[data-pjid] {
		text-align: center;
		width: 25%;
	}
	td[data-list] {
		text-align: center;
		width: 5%;
	}
	tr{
		border: 1px solid var(--color-dark-beigie);
	}
	
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
	#change-info-modal{
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height:100%;
		background-color: rgba(0,0,0,0.1);
		display:none;
		z-index:1;
	}
	
	.change-info-modal-content {
		position: absolute;
		width: 20%;
		height: 130px;
		background-color: white;
		border-radius: 20px;
		padding: 30px 20px;
		font-size: var(--font-micro);
	}

	#edit-prj-name{
		float:right;
		z-index:200;
	}
	#edit-prj-name button{
		background-color: #8c8484;
	    padding: 6px 12px;
	    cursor: pointer;
	    width: 60px;
	    height: 20px;
	    border-radius: 5px;
	    font-weight: var(--weight-bold);
	    color: white;
	    line-height: 20px;
	    font-size: 12px;
	    margin-right: 30px;
	    margin-top:10px;
   		z-index:200;
	}
	
	.modal-visible {
		display: block !important;
	}
</style>
</head>
<body>
	<h1 id="prj-list-title">프로젝트 목록</h1>
	<div id="prj-list">
		<table style="width: 80%; margin: 70px auto 30px;">
			<thead>
				<tr>
					<td>프로젝트명</td>
					<td>관리자</td>
					<td>참여자수</td>
					<td>게시글 수 </td>
					<td></td>
				</tr>
			</thead>
			<tbody>
					<c:forEach items="${list }" var="list">
						<tr>
							<td data-pjid="${list.projectId }">
								<a href="${pageContext.request.contextPath}/projectFeed?projectId=${list.projectId}"  onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">${list.projectName}</a>
							</td>
							<td class="manager" data-pjid="${list.projectId }">${list.memberId }</td>
							<td class="participants" data-pjid="${list.projectId }"><a href="#" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">${list.mnumber } 명</a></td>
							<td>${list.boardcount }</td>
							<td><button data-pjid="${list.projectId }" data-pjname="${list.projectName }" data-manager="${list.fileAccess }" data-deptid="${list.deptId }"class="change-name">수정</button></td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="paging" style="text-align: center; font-size: var(--font-micro);">
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
	
<!-- 	정보수정모달 -->
	<div id="change-info-modal" >
		<div class="change-info-modal-content">
			<div>
				<span style="font-weight: var(--weight-bold); margin-right: 20px;">프로젝트이름</span>
				<span><input value="" placeholder="수정할 이름" id="edited-name" size="20" style="width:300px"></span>
			</div>
			<div style="display: flex; align-items: center; margin: 20px 0;">
				<span style="font-weight: var(--weight-bold); margin-right: 20px;">파일접근권한</span>
				<span>
					<input type="radio" id="file-access2" class="file-access" name="file-access" value="J1"><label for="file-access2" style="cursor: pointer;">프로젝트구성원</label>
				</span>
				<span>
					<input type="radio" id="file-access1" class="file-access" name="file-access" value="J3"><label for="file-access1" style="cursor: pointer;">관리자+작성자</label>
				</span>
			</div>
			<div id="edit-prj-name">
				<button onclick="editFileAccess(${list.size()})">수정하기</button>
			</div>		
		</div>
	</div>
</body>
<script type="text/javascript">

	function search(p){
		location.href="${pageContext.request.contextPath }/admin/projectlist?nowPage="+p
	}
	
	//중복체크 방지
	$(document).on('click', "input[type='checkbox']", function(){
	    if(this.checked) {
	        const checkboxes = $("input[type='checkbox']");
	        for(let ind = 0; ind < checkboxes.length; ind++){
	            checkboxes[ind].checked = false;
	        }
	        this.checked = true;
	    } else {
	        this.checked = false;
	    }
	});
	
	$('#prj-list .change-name').on("click",function(event){
		$('#change-info-modal').css('display','block');
		
		let x = event.clientX - 450;
		let y = event.clientY;
		
		$('.change-info-modal-content').css('left', x + 'px');
		$('.change-info-modal-content').css('top', y + 'px');
		
		let projectName=$(this).data('pjname')
		let projectId=$(this).data('pjid');
		let oldFileAccess=$(this).data('manager');
		let deptId=$(this).data('deptid')
		
		$('#edit-prj-name button').data('pjname',projectName);
		$('#edit-prj-name button').data('pjid',projectId);
		$('#edit-prj-name button').data('manager',oldFileAccess);
		$('#edit-prj-name button').data('deptid',deptId);
		
		
		$('#change-info-modal input').eq(0).val(projectName);
		
		if(oldFileAccess=='J1'){
			$('#file-access2').prop('checked',true);
		}else{
			$('#file-access1').prop('checked',true);
		}
		
		let fileAccess = document.querySelectorAll('input[class="file-access"]:checked')[0].value;
	});
	
	$('#change-info-modal').on('click', function(e) {
		$(e.currentTarget).css('display', 'none');
	});
	
	$('.change-info-modal-content').on('click', function(e) {
		e.stopPropagation();
	});
	
	function editFileAccess(datasize){
		//데이터속성으로 컨트롤러에서 필요한 값 불러오기
		let projectName=$('#change-info-modal input').eq(0).val();
		let projectId=$('#edit-prj-name button').data('pjid');
		let fileAccess=$("#change-info-modal").find('input:checked').val();
		let deptId=$('#edit-prj-name button').data('deptid');	

		$.ajax({
    			url:"${pageContext.request.contextPath }/admin/updatePrjName",
    			method:'POST',
    			data:JSON.stringify(
    					{"projectName":projectName,
    					"projectId":projectId,
    					"deptId":deptId,
    					"fileAccess":fileAccess}),
    			contentType:'application/json'
    	})
    	.done(data=>{
				if(data!=0||data!=null){
					//데이터속성 삭제하기
					$('#edit-prj-name button').removeData('prjname')
					$('#edit-prj-name button').removeData('pjid')
					$('#edit-prj-name button').removeData('manager')
					$('#edit-prj-name button').removeData('deptid')
					alert('업데이트에 성공하였습니다')
					//모달창닫기
					$('#change-info-modal').css('display','none')
					$('#change-info-modal').removeClass('modal-visible');

					for(let i=0;i<datasize;i++){
						if($('#prj-list tbody tr').eq(i).find('td').data('pjid')==projectId){
							$('#prj-list tbody tr').eq(i).find('td').eq(0).text(projectName)
							break;
						}
					}
				}
			})
			.fail(reject=>{
				console.log(reject)
			})
	}
	
	//모달 닫기
	$('[id*=modal]').on('click', function() {
		$('.modal-visible').removeClass('modal-visible');
	});
	
	// 프로젝트 참여자 리스트
	$('#prj-list .participants').on('click', function(e){
		let projectId=$(this).data('pjid');
		let clicked=$(this);
		
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
					employeeProfile.onerror=function(){
						employeeProfile.src = "${pageContext.request.contextPath }/resources/img/user.png";
					}
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
						mBtn.setAttribute('id', 'managerBtn');
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
		sessionStorage.removeItem('startDate'); // 시작일 데이터 삭제
		sessionStorage.removeItem('endDate'); // 시작일 데이터 삭제

</script>
</html>