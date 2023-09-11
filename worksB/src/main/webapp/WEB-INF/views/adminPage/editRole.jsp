<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#edit-title {
		margin: 0;
	    color: var(--color-dark-grey);
	    font-size: var(--font-regular);
	    padding: 0 30px;
	    margin: 30px 0;
	}
	
	.edit-main-box {
		width: 80%;
		margin: 70px auto;
	}
	
	table {
		border-collapse: collapse;
		width: 100%;
	}
	
	th,td {
		border: 1px solid var(--color-dark-beigie);
		text-align: center;
	}
	
	.d-flex {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
	}
	
	input {
		text-align: center;
		background-color: var(--color-dark-beigie);
		height: 30px;
		border-radius: 5px;
	}
	
	input:disabled {
		background-color: white;
	}
	
	.addBtn {
		background-color: transparent;
		color: var(--color-dark-red);
		font-weight: var(--weight-bold);
		font-size: 18px;
		text-decoration: underline;
		margin-bottom: 10px;
	}
	
	#department, #role {
		width: 46%;
		margin: 0 2%;
		font-size: 18px;	
		color: var(--color-dark-grey);
	}
	
	h2 {
		margin: 0;
		font-size: var(--font-regular);;
	}
	
	.department-btns button, .insertBtn, .role-btns button {
		width: 70px;
		height: 30px;
		border-radius: 5px;
		background-color: white;
		border: 1px solid var(--color-dark-red);
		color: var(--color-dark-red);
		transition: all 0.5s;
	}
	
	.department-btns button:hover, .insertBtn:hover, .role-btns button:hover {
		background-color: var(--color-dark-red);
		color: white;
	}
	
	.deleteBtn, .updateBtn {
		display: none;
	}
</style>
</head>
<body>
	<h1 id="edit-title">부서 및 직급 편집</h1>
	<div class="d-flex edit-main-box">
		<div id="department">
			<h2>부서설정</h2>
			<div style="text-align: right; padding-right: 20px;">
				<button onclick="addDepartment()" class="addBtn">부서 추가</button>
			</div>
			<table id="deptTable">
				<thead>
					<tr>
						<th style="width: 60%;">부서명</th>
						<th style="width: 10%;">인원</th>
						<th style="width: 30%;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dlist }" var="list">
						<tr>
							<td hidden>${list.deptId }</td>
							<td><input type="text" value="${list.deptName }" disabled></td>
							<td>${list.counting }</td>
							<td class="department-btns">
								<button class="createUpdateBtn">수정</button>
								<button onclick="updateDep(this)" class="updateBtn">수정완료</button>
								<button onclick="deleteDep(this)" class="deleteBtn">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="role">
			<h2>직급설정</h2>
			<div style="text-align: right; padding-right: 20px;">
				<button  onclick="addRole()" class="addBtn">직급 추가</button>			
			</div>
			<table id="jobTable">
				<thead>
					<tr>
						<th style="width: 60%;">직급명</th>
						<th style="width: 40%;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${jList }" var="list">
						<tr>
							<td hidden>${list.jobId }</td>
							<td><input type="text" value="${list.jobName }" disabled></td>
							<td class="role-btns">
								<button class="createUpdateBtn">수정</button>
								<button onclick="updateRole(this)" class="updateBtn">수정완료</button>
								<button onclick="deleteRole(this)" class="deleteBtn">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>

<script>
	sessionStorage.removeItem('startDate'); // 시작일 데이터 삭제
	sessionStorage.removeItem('endDate'); // 시작일 데이터 삭제
	let size=${dlist.size()}
	let oldDeptName=[];
	oldDeptName.length=size;
	
	for(let i=0;i<size;i++){
		oldDeptName[i]=$('#deptTable').find('input').eq(i).val()
	}
	for(let i=0;i<size;i++){
		console.log(oldDeptName[i])
	}
	
	//부서추가
	function addDepartment(){
		let newData=`<tr>
						<td><input type="text" placeholder="부서명"></td>
						<td>0</td>
						<td><button onclick="insertDept(this)" class="insertBtn">등록</button></td>
					</tr>`
		$('#department tbody').append(newData);
					
	}
	
	function insertDept(data){
		let tr=$(data).parent().parent()
		let input=tr.find('input')
		let depName=input.eq(0).val()
		if(depName=='') {
			alert('부서명을 입력해 주세요')
			input.eq(0).focus()
		}else{
			 $.ajax({
				    type: "POST",
				    url: "${pageContext.request.contextPath}/admin/insertDept",
				    data: { 'deptName': depName },
				    success:function(response){
				    	if(response!=1){alert('부서추가에 실패했습니다.')}
				    	location.reload(true)
				    },
				    error:function(error){
				    	console.error(error)
				    }
			 })
		}
		
	}
	
	//수정,삭제 버튼 활성화
	$('.createUpdateBtn').on('click', function(e) {
		$(e.currentTarget).css('display', 'none');
		$(e.currentTarget).next().css('display', 'inline-block');
		$(e.currentTarget).next().next().css('display', 'inline-block');
		$(e.currentTarget).closest('tr').find('input').prop('disabled', false);
		$(e.currentTarget).closest('tr').find('input').focus();
	});
	
	
	//부서삭제
	function deleteDep(data){
		
		let tr=$(data).parent().parent()
		let input=tr.find('input')

		let deptId=tr.find('td[hidden]').text()
		let deptName=input.eq(0).val()
		if(confirm(deptName+'부서를 삭제하시겠습니까?')){
			 $.ajax({
				    type: "POST",
				    url: "${pageContext.request.contextPath}/admin/deleteDept",
				    data: { 'deptId': deptId },
				    success:function(response){
				    	if(response!=1){
				    		alert('부서삭제에 실패했습니다.')
				    		}
				    	location.reload(true)
				    },
				    error:function(error){
				    	console.error(error)
				    }
					  })
		}else{
			alert('부서삭제를 취소합니다')
		}
	}
	
	//부서수정
	function updateDep(data){
		let tr=$(data).closest('tr')
		let trIdx=$('#deptTable tbody tr').index(tr)
		
		let input=tr.find('input')
		let oldName=oldDeptName[trIdx];	

		let deptId=tr.find('td[hidden]').text()
		let deptName=input.eq(0).val()
		
		if(confirm(deptName+'(으)로 수정하시겠습니까?')){
			 $.ajax({
				    type: "POST",
				    url: "${pageContext.request.contextPath}/admin/updateDept",
				    data: { 'deptId': deptId,
				    		'deptName':deptName
				    		},
				    success:function(response){
				    	if(response!=1){
				    		alert('부서수정에 실패했습니다.')
				    		}
				    	location.reload(true)
				    },
				    error:function(error){
				    	console.error(error)
				    }
					  })
		}else{
			alert('부서수정을 취소합니다')
		}
	}
	
	//직급추가
	function addRole(){
		let newData=`<tr>
						<td><input type="text" placeholder="직급명"></td>
						<td><button onclick="insertRole(this)" class="insertBtn">등록</button></td>
					</tr>`
		$('#role tbody').append(newData);
	}
	
	function insertRole(data){
		let tr=$(data).parent().parent()
		let input=tr.find('input')
		let roleName=input.eq(0).val()
		if(roleName=='') {
			alert('직급명을 입력해 주세요')
			input.eq(0).focus()
		}else{
			 $.ajax({
				    type: "POST",
				    url: "${pageContext.request.contextPath}/admin/insertRole",
				    data: { 'roleName': roleName },
				    success:function(response){
				    	if(response!=1){alert('직급추가에 실패했습니다.')}
				    	location.reload(true)
				    },
				    error:function(error){
				    	console.error(error)
				    }
			 })
		}
	}
	
	//직급삭제
	function deleteRole(data){
		let tr=$(data).parent().parent()
		let input=tr.find('input')

		let roleId=tr.find('td[hidden]').text()
		let roleName=input.eq(0).val()
		

		if(confirm(roleName+'을 삭제하시겠습니까?')){
			 $.ajax({
				    type: "POST",
				    url: "${pageContext.request.contextPath}/admin/deleteRole",
				    data: { 'roleId': roleId },
				    success:function(response){
				    	if(response!=1){
				    		alert('직급삭제에 실패했습니다.')
				    		}
				    	location.reload(true)
				    },
				    error:function(error){
				    	console.error(error)
				    }
					  })
		}else{
			alert('부서삭제를 취소합니다')
		}
	}

	//직급수정
	function updateRole(data){
		let tr=$(data).parent().parent()
		let input=tr.find('input')

		let roleId=tr.find('td[hidden]').text()
		let roleName=input.eq(0).val()
		if(confirm(roleName+'(으)로 수정하시겠습니까?')){
			 $.ajax({
				    type: "POST",
				    url: "${pageContext.request.contextPath}/admin/updateRole",
				    data: { 'roleId': roleId,
				    		'roleName':roleName},
				    success:function(response){
				    	if(response!=1){
				    		alert('직급수정에 실패했습니다.')
				    		}
				    	location.reload(true)
				    },
				    error:function(error){
				    	console.error(error)
				    }
					  })
		}else{
			alert('부서수정을 취소합니다')
		}
	}
</script>
</html>