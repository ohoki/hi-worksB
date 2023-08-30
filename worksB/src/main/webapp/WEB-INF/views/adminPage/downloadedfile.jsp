<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td>다운로드일시</td>
				<td>파일명</td>
				<td>용량</td>
				<td>이용자아이디</td>
				<td hidden>다운로드일시</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<td><fmt:formatDate value="${list.fileRegdate }" pattern="YY/MM/dd" type="date"/></td>
					<td>${list.fileName }</td>
					<td>${list.convertedSize }</td>
					<td>${list.memberId }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>