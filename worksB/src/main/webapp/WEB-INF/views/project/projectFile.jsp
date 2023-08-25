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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</style>
</head>
<body>
	<div>
		<div>
<!-- <!-- 		검색 --> -->
<!-- 			<form action="filetab" name="searchform"> -->
<!-- 				<div class="search__search"> -->
<!-- 				<input type="hidden" name="nowPage" value="1"> -->
<!-- 					<select name="searchtype" class="search__select"> -->
<%-- 						<option value="1" <c:if test="${searchVO.searchtype==1}"> selected   </c:if>>파일명</option> --%>
<%-- 						<option value="2" <c:if test="${searchVO.searchtype==2}"> selected   </c:if>>작성자</option> --%>
<%-- 					</select> <input type="text" name="searchkeyword" class="search__input" value="${searchVO.searchkeyword}"> --%>
<!-- 					<button type="submit" class="search__submit">검색</button> -->
<!-- 				</div> -->
<!-- 			</form> -->
<!-- <!-- 			다운로드 --> -->
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
						<tr onclick="check(${list.fileId})">
								<td>${list.fileName }</td>
								<td>${list.fileSize }</td>
								<td>${list.memberName }</td>
								<td><fmt:formatDate value="${list.fileRegdate }" pattern="YY/MM/dd" type="date"/></td>
								<td hidden><input type="checkbox" id="${list.fileId }"></td>
						</tr>
				</c:forEach>	
			</tbody>
		</table>
				<!-- search -->
<!-- 	<div class="search"> -->
<!-- 		<!-- 페이징 --> -->
<!-- 		<div class="paging" style="text-align: center"> -->
<!-- 			<!-- 이전 --> -->
<%-- 			<c:if test="${paging.startPage != 1 }"> --%>
<%-- 				<a href="javascript:search(${paging.startPage - 1 })">&lt이전</a> --%>
<%-- 			</c:if> --%>
<!-- 			<!-- View 안에 보여지는 페이지들 --> -->
<%-- 			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${p eq paging.nowPage }"> --%>
<%-- 						<b>${p }</b> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<a href="search(${p})">${p }</a> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<%-- 			</c:forEach> --%>

<!-- 			<!-- 다음 --> -->
<%-- 			<c:if test="${paging.endPage != paging.lastPage }"> --%>
<%-- 				<a href="javascript:search(${paging.endPage + 1 })">다음</a> --%>
<%-- 			</c:if> --%>
<!-- 			<!-- 페이징 끝 --> -->

<!-- 		</div> -->
<!-- 	</div> -->
</body>
	<script>
		function search(p){
			searchform.nowPage.value=p;
			searchform.submit();
		}
		function check(fileId){
			if($('#'+fileId).is(':checked')){
				$('#'+fileId).prop('checked',false)
				$('#'+fileId).closest('tr').css({"background-color":"white"})
			}else{
				$('#'+fileId).prop('checked',true)
				console.log($('#'+fileId).closest('tr'))
				$('#'+fileId).closest('tr').css({"background-color":"green"})
			}
		}
	</script>
</html>