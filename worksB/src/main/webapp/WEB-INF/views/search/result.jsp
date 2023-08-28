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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script></style>
</head>
<body>
	
	<p>" ${searchkeyword } "의 검색결과</p>
	<div>
	<a>전체</a>
	<a>프로젝트</a>
	<a>사내게시판</a>
	</div>
	<p class="prjList"></p>
	<div>
		<c:forEach items="${prjList }" var="list">
			<ul>
				<li>${list.boardType } ${list.prjBoardTitle }</li>
				<li>${list.memberName } <fmt:formatDate value="${list.prjBoardRegdate }" pattern="YY/MM/dd" type="date"/> ${list.projectName }</li>
			</ul>
		</c:forEach>
	</div>
	<p class="boardList"></p>
	<div>
	
	</div>
</body>
<script>
	if(${prjList.size()}!=0){
		$('.prjList').text('프로젝트')
	}
</script>
</html>