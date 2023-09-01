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
	table, td{
		border:solid black 1px;
	}
</style>
</head>
<body>
	<div id="department">
		<p>부서설정</p>
		<button  onclick="addDepartment()">추가</button>
		<table>
			<thead>
				<tr>
					<td>부서명</td>
					<td>참여 수</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dlist }" var="list">
					<tr>
						<td hidden>${list.deptId }</td>
						<td>${list.deptName }</td>
						<td>${list.counting }</td>
						<td><button onclick="deleteDep(this)">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="role">
		<p>직급설정</p>
		<button onclick="addRole()">추가</button>
		<table>
			<thead>
				<tr>
					<td>직급명</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${jList }" var="list">
					<tr>
						<td hidden>${list.jobId }</td>
						<td>${list.jobName }</td>
						<td><button onclick="deleteRole(this)">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
			//부서추가
	function addDepartment(){
		let newData=`<tr>
						<td><input type="text" placeholder="부서명"></td>
						<td>0</td>
						<td><button onclick="updateDept(this)">완료</button></td>
					</tr>`
		$('#department tbody').append(newData);
	}
	function updateDept(data){
		let tr=$(data).parent().parent()
		let input=tr.find('input')
		let depName=input.eq(0).val()
		if(depName=='') {
			alert('부서명을 입력해 주세요')
			input.eq(0).focus()
		}else{
			 $.ajax({
				    type: "POST",
				    url: "${pageContext.request.contextPath}/admin/updateDept",
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
	//부서삭제
	function deleteDep(data){
		//삭제할 부서의 id
		let deptId=$(data).parent().parent().find('td').eq(0).text()
		let deptName=$(data).parent().parent().find('td').eq(1).text()
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
	
	
	
	
	//직급추가
	function addRole(){
		let newData=`<tr>
						<td><input type="text" placeholder="직급명"></td>
						<td><button onclick="updateRole(this)">완료</button></td>
					</tr>`
		$('#role tbody').append(newData);
	}
	function updateRole(data){
		let tr=$(data).parent().parent()
		let input=tr.find('input')
		let roleName=input.eq(0).val()
		if(roleName=='') {
			alert('직급명을 입력해 주세요')
			input.eq(0).focus()
		}else{
			 $.ajax({
				    type: "POST",
				    url: "${pageContext.request.contextPath}/admin/updateRole",
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
		//직급삭제
		function deleteRole(data){
			//삭제할 부서의 id
			let roleId=$(data).parent().parent().find('td').eq(0).text()
			let roleName=$(data).parent().parent().find('td').eq(1).text()
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
		
	}
</script>
</html>