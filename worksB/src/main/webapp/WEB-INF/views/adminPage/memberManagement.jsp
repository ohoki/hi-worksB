<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구성원 관리</title>
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
			<td>관리자 권한력 행세</td>
		</tr>
		<c:forEach items="${memberList}" var="member">
			<tr>
				<th>${memberList.memberId }</th>
				<th>${memberList.memberName }</th>
				<th>${memberList.memberPhone }</th>
				<th>${memberList.memberGrade }</th>
				<th>${memberList.conIp }</th>
				<th>${memberList.jobId }</th>
				<th>${memberList.deptId }</th>
				<th>${memberList.empStatus }</th>
				<th>${memberList.constatus }</th>
				<th></th>
			</tr>
		</c:forEach>
	</table>
</body>
</html>