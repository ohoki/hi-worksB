<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
<!-- 	검색과 다운로드 -->
		<div>
			<form action="${pageContext.request.contextPath }/filetab">
				<input  name="fileName">
				<button type="button" onclick="submit()">검색</button>
			</form>
			<button>다운로드</button>
		</div>
		<table>
			<thead>
				<tr>
					<td>파일명</td>
					<td>용량</td>
					<td>등록자</td>
					<td>등록일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${fileList}" var="list" >
					<tr>
						<td>${list.fileName }</td>
						<td>${list.fileSize }</td>
						<td>${memberInfo.memberName }</td>
						<td>${list.fileRegdate }</td>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div>
</body>
</html>