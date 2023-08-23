<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	font-size: small;
}

.insert {
	width: 800px;
	height: 72px;
	margin: 0 auto;
	margin-bottom: 10px;
	margin-top: 50px;
	text-align: center;
}

.insert__button {
	width: 80px;
	height: 30px;
	float: right;
	background-color: rgb(174, 213, 245);
	border-radius: 5px;
	color: white;
	font-weight: bold;
}

.table {
	width: 800px;
	margin: 0 auto;
}

table, td, th {
	border: 0.5px solid rgb(211, 211, 211);
	border-collapse: collapse;
	border-left: none;
	border-right: none;
	text-align: center;
}

th, td {
	padding: 10px;
}

td {
	height: 40px;
}

.table__title {
	height: 20px;
	margin-top: 0;
	margin-bottom: 0;
}

table :first-child {
	padding: 0px;
	width: 60px;
	height: 40px;
}

table :nth-child(2) {
	padding: 0px;
	width: 500px;
}

table :nth-child(3) {
	padding: 0px;
}

table :nth-child(4) {
	padding: 0px;
}

table :nth-child(5) {
	padding: 0px;
}

table :nth-child(6) {
	padding: 0px;
}

table :nth-child(2) :nth-child(2) {
	text-align: left;
}

.table__ftr {
	background-color: rgba(225, 239, 251);
}

/* search */
form {
	margin: 0 auto;
	width: 300px;
}

.search {
	height: 110px;
	background-color: rgba(225, 239, 251);
	width: 800px;
	margin: 0 auto;
}

.search__search {
	margin: 0 auto;
	margin-top: 20px;
	width: 315px;
	height: 0px;
	display: flex;
	justify-content: center;
}

.search__select {
	height: 28px;
}

.search__input {
	padding: 0px;
	height: 26px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.search__submit {
	margin: 0px;
	height: 28px;
	width: 48px;
	border: 1px solid black;
	color: black;
	border-radius: 2px;
}

.paging{
	padding-top: 15px;
}

</style>
<body>
	<div class="insert">
		<h2>같이 타요</h2>
		<button type="button" class="insert__button"
			onclick="location.href='carpoolInsert'">게시물 작성</button>
	</div>

	<table class="table">
		<thead>
			<tr class="table__ftr">
				<th>번호</th>
				<th>내용</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>좋아요</th>
				<th>조회</th>
			</tr>
		<tbody>
			<c:forEach items="${carpoolList}" var="carpool">
				<tr onclick="location.href='carpoolInfo?boardId=${carpool.boardId}'">
					
					<td>${carpool.boardId }</td>
					<td>
						<p class="table__title">
						<c:choose>
							<c:when test="${carpool.category eq 'B1' }">
								[태워드립니다] 
							</c:when>
							<c:otherwise>
								[태워주세요] 
							</c:otherwise>
						</c:choose>
					${carpool.boardTitle }</p><br>
						<P class="table__title">${carpool.departure } &#10142; ${carpool.arrival }</p>
					</td>
					<td>${carpool.memberName} </td>
					<td><fmt:formatDate value="${carpool.boardRegdate }"
							pattern="yyyy/MM/dd" /></td>
					<td>
						<!-- 좋아요 -->0
					</td>
					<td>${carpool.boardHit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- search -->
	<div class="search">
		<!-- 페이징 -->
		<div class="paging" style="text-align: center">
			<!-- 이전 -->
			<c:if test="${paging.startPage != 1 }">
				<a
					href="javascript:search(${paging.startPage - 1 })">&lt
					이전</a>
			</c:if>
			<!-- View 안에 보여지는 페이지들 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p eq paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:otherwise>
						<a href="javascript:search(${p})">${p }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${paging.endPage != paging.lastPage }">
				<a href="javascript:search(${paging.endPage + 1 })">다음&gt</a>
			</c:if>
			<!-- 페이징 끝 -->

		</div>
		<form action="carpoolList" name="searchform">
			<div class="search__search">
			<input type="hidden" name="nowPage" value="1">
				<select name="searchtype" class="search__select">
					<option value="1" <c:if test="${searchVO.searchtype==1}"> selected   </c:if>>제목</option>
					<option value="2" <c:if test="${searchVO.searchtype==2}"> selected   </c:if>>내용</option>
					<option value="3" <c:if test="${searchVO.searchtype==3}"> selected   </c:if>>작성자</option>
					<option value="4" <c:if test="${searchVO.searchtype==4}"> selected   </c:if>>제목+내용</option>
				</select> <input type="text" name="searchkeyword" class="search__input" value="${searchVO.searchkeyword}">
				<button type="submit" class="search__submit">검색</button>
			</div>
		</form>
	</div>
	<script>
		function search(p){
			searchform.nowPage.value=p;
			searchform.submit();
		}
	</script>
</body>
</html>