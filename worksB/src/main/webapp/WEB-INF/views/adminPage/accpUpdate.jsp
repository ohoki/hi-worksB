<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>구성원 관리</h2>
	<ul>
		<li><a href="${pageContext.request.contextPath}/admin/memberManagement">구성원</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/memberAccpList">가입대기</a></li>
	</ul>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>등급</th>
				<th>회사 번호</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody class="taskList">
		</tbody>
	</table>
	
	
	<script>
		
	</script>
</body>
</html>