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
	<div>
		<p>파일 다운로드 이력</p>
	</div>
	<table>
		<thead>
			<tr>
				<td>다운로드일시</td>
				<td>파일명</td>
				<td>용량</td>
				<td>이용자아이디</td>
				<td hidden>다운로드기기</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<td><fmt:formatDate value="${list.fileRegdate }" pattern="YY/MM/dd HH시mm분" type="date"/></td>
					<td>${list.fileName }</td>
					<td>${list.convertedSize }</td>
					<td>${list.memberId }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
		<div class="paging" style="text-align: center">
					<!-- 이전 --> 
				<c:if test="${paging.startPage!=1 } " >
					<a href="javascript:search(${paging.startPage - 1 })">&lt이전</a>
				</c:if>
					<!-- View 안에 보여지는 페이지들 --> 
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p eq paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:otherwise>
							<a href="javascript:search(${p })">${p }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
					<!-- 다음 --> 
				<c:if test="${paging.endPage != paging.lastPage }">
					<a href="javascript:search(${paging.endPage + 1 })">다음&gt</a>
				</c:if>
			</div>
</body>
<script type="text/javascript">
	function search(p){
		location.href="${pageContext.request.contextPath }/admin/downloadlist?nowPage="+p
}
</script>
</html>