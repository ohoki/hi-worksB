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
.notice-box {
	width: 60%;
	margin: 60px auto 0; 
	color: var(--color-dark-grey);
}

.insert {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 20px;
}

.insert__button {
	width: 70px;
	height: 30px;
	background-color: var(--color-dark-red);
	border-radius: 5px;
	color: var(--color-white);
	font-weight: var(--weight-bold);
	transition: all 0.5s;
}

.insert__button:hover {
	background-color: var(--color-white);;
	color: var(--color-dark-red);
	border: 1px solid var(--color-dark-red);
}

.insert h2 {
	margin: 0;
	font-size: var(--font-regular);
	font-weight: var(--weight-bold);
	color: var(--color-green);
}

table {
	width: 100%;
	border-collapse: collapse;
	font-size: var(--font-micro);
}

td, th {
	border: 1px solid var(--color-dark-beigie);
	height: 30px;
}

th {
	background-color: var(--color-dark-beigie);
	font-size: 16px;
	font-weight: var(--weight-bold);
}

.notice-icon {
	width: 20px;
	height: 20px;
}

td {
	text-align: center;
	cursor: pointer;
}

.paging{
	font-size: var(--font-micro);
	margin: 30px 0;
}

.search__search {
	display: flex;
	align-items: center;
	justify-content: center;
}

.search__select {
	width : 100px;
	height : 25px;
	border : 1px solid var(--color-dark-white);
}

.search__input {
	width : 200px;
	height : 25px;
	border : 1px solid var(--color-dark-white);
	margin: 0 10px;
}

.search__submit {
	width: 70px;
	height: 30px;
	background-color: var(--color-dark-red);
	border-radius: 5px;
	color: var(--color-white);
	font-weight: var(--weight-bold);
	transition: all 0.5s;
}

.table__ftr th:nth-child(1) {
	width: 6%
}



.table__ftr th:nth-child(3) {
	width: 12%
}

.table__ftr th:nth-child(4) {
	width: 12%
}

.table__ftr th:nth-child(5) {
	width: 6%
}

.table__ftr th:nth-child(6) {
	width: 6%
}

</style>
<body>
	<div class="notice-box">
		<div class="insert">
			<h2>
				<img class="notice-icon" src="${pageContext.request.contextPath }/resources/icon/clipboard-regular.svg" alt="게시글 아이콘">
			공지사항
			</h2>
			<button type="button" class="insert__button"
				onclick="location.href='noticeInsert'">공지 작성</button>
		</div>
		<div style="min-height: 500px;">
			<table class="table">
				<thead>
					<tr class="table__ftr">
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>좋아요</th>
						<th>조회</th>
					</tr>
				<tbody>
					<c:forEach items="${noticeList}" var="notice">
						<tr onclick="location.href='noticeInfo?noticeId=${notice.noticeId}'">
							<td>${notice.noticeId }</td>
							<td style="text-align: left; padding: 0 20px;">${notice.noticeTitle }</td>
							<td>${notice.memberName} </td>
							<td><fmt:formatDate value="${notice.boardRegdate }"
									pattern="yyyy/MM/dd" /></td>
							<td>
								<span id="likeCount-${notice.noticeId}">0</span>
							</td>
							<td>${notice.boardHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
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
			<form action="noticeList" name="searchform">
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
	</div>
	
	<script>
		function search(p){
			searchform.nowPage.value=p;
			searchform.submit();
		}
	</script>
</body>
</html>