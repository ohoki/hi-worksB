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
				<td>프로젝트명</td>
				<td>관리자</td>
				<td>참여자</td>
				<td>글 수 </td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:forEach items="${list }" var="list">
					<td>${list.projectName }</td>
					<td></td>
					<td></td>
					<td></td>
				</c:forEach>
			</tr>
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
		location.href="${pageContext.request.contextPath }/admin/projectlist?nowPage="+p
}
</script>
</html>