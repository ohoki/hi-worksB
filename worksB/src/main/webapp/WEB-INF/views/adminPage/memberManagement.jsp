<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구성원 관리</title>
<style>
	body {
		font-size:medium;
	}
	table {
		border: 1px solid;
		border-collapse: collapse;
	}
	table td, th {
		border: 1px solid;
	}
</style>
</head>
<body>
	<ul>
		<li>현재 구성원</li>
		<li>가입 대기</li>
	</ul>
	<table>
		<tr>
			<td><input type="checkbox"></td>
			<td>아이디</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>등급</td>
			<td>접속 ip</td>
			<td>직급번호</td>
			<td>부서번호</td>
			<td>근무 상태</td>
			<td>접속 여부</td>
			<td>관리</td>
		</tr>
		<c:forEach items="${memberList}" var="member">
			<tr data-id="${member.memberId }" class="memberTr">
				<th><input type="checkbox"></th>
				<th>${member.memberId }</th>
				<th>${member.memberName }</th>
				<th>${member.memberPhone }</th>
				<th>${member.memberGrade }</th>
				<th>${member.conIp }</th>
				<th>${member.jobName }</th>
				<th>${member.deptName }</th>
				<th>${member.empStatus }</th>
				<th>${member.conStatus }</th>
				<th><input type="button" value="관리"></th>
			</tr>
		</c:forEach>
	</table>
	<div  id="memberInserModal">
		<form>
			<div>
				<span>구성원 정보 수정</span>
				<label>이메일</label>
				<input data-memberId type="text" readonly="readonly">
				<label>회사 번호</label>
				<input data-companyId type="text"readonly="readonly">
				<label>이름</label>
				<input data-memberName type="text">
				<label>부서명</label>
				<input data-deptName type="text">
				<label>직책</label>
				<input data-jobName type="text">
				<label>휴대폰 번호</label>
				<input data-memberPhone type="text">
				<label>등급</label>
				<input data-memberGrade type="text">
			</div>
		</form>
	</div>
	<script>
		$(document).on("click", ".memberTr", function(e){
			// 버블링 제거
			e.stopPropagation();
			
			let highTask = $(this);
			let trMemberId = highTask.data('id');
			console.log(trMemberId);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/memberManagements',
				type : 'GET',
				data : {'memberId' : trMemberId },
				success : function(memberData){
					console.log(memberData);
					let memberInfo = $('#memberInserModal');
					
					memberInfo.find('input[data-memberId]').val(memberData.memberId);
					memberInfo.find('input[data-companyId]').val(memberData.companyId);
					memberInfo.find('input[data-memberName]').val(memberData.memberName);
					memberInfo.find('input[data-deptName]').val(memberData.deptName);
					memberInfo.find('input[data-jobName]').val(memberData.jobName);
					memberInfo.find('input[data-memberPhone]').val(memberData.memberPhone);
					memberInfo.find('input[data-memberGrade]').val(memberData.gradeName);
					console.log(memberInfo.find('input[data-memberId]').val(memberData.memberId));
				}
			});
			
			
			
			
			
			
			
			
			
			
			
			
			/* $.get("memberManagements",{ 'memberId' : trMemberId}, function(list){
				if(list.success){
					let memberInfo = $('#memberInserModal');
					
					memberInfo.find('input[data-email]').text(highTask)
					memberInfo.find('input[data-memberId]')
					memberInfo.find('input[data-name]')
					memberInfo.find('input[data-dept]')
					memberInfo.find('input[data-job]')
					memberInfo.find('input[data-phon]')
					memberInfo.find('input[data-grade]')
					
				}
			}) */
		});
		
			
		
		
			
		
		
		
	</script>
</body>
</html>