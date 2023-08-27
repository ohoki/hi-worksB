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
<c:set var="size" value="${fileList.size() }" />


	<div>
<!-- <!-- 	업로드와		다운로드 --> 
		<form  action="${pageContext.request.contextPath }/uploadFiles" method="post" enctype="multipart/form-data" >
			<input type="file" name="file" id="upload">
			<input type="hidden" name="prjId" value="${projectInfo.projectId }" >
<!-- 			<input type="text" name="title" "> -->
			<button type="submit">업로드</button>
		</form>
			<button type="button" onclick="download()">다운로드</button>
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
								<td>${list.convertedSize }</td>
								<td>${list.memberName }</td>
								<td><fmt:formatDate value="${list.fileRegdate }" pattern="YY/MM/dd" type="date"/></td>
								<td hidden><input type="checkbox" id="${list.fileId }"></td>
								<td hidden>${list.fileSize }</td>
								<td hidden>${list.realFilePath }</td>
						</tr>
				</c:forEach>	
			</tbody>
		</table>
		

		
					
		<div class="search">
			<div class="paging" style="text-align: center">
					<!-- 이전 --> 
				<c:if test="${paging.startPage != 1 }">
					<a href="search(${paging.startPage - 1 })">&lt이전</a>
				</c:if>
					<!-- View 안에 보여지는 페이지들 --> 
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p eq paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:otherwise>
							<a href="search(${p})">${p }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
					<!-- 다음 --> 
				<c:if test="${paging.endPage != paging.lastPage }">
					<a href="search(${paging.endPage + 1 })">다음&gt</a>
				</c:if>
			</div>
			<div>
				<!-- 		검색 --> 
				<form action="${pageContext.request.contextPath }/searchfiles" method="post" name="searchform">
					<div class="search__search">
						<input type="hidden" name="nowPage" value="1">
						<input type="hidden" name="access" value="${projectInfo.fileAccess }">
						<input type="hidden" name="prjId" value="${projectInfo.projectId }" >
						<select name="searchtype" class="search__select">
							<option value="1" <c:if test="${searchVO.searchtype==1}"> selected   </c:if>>파일명</option>
							<option value="2" <c:if test="${searchVO.searchtype==2}"> selected   </c:if>>작성자</option>
						</select> 
						<input type="text" name="searchkeyword" class="search__input" value="${searchVO.searchkeyword}">
						<button type="submit" class="search__submit">검색</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
	<script>
		
		let fileSize=document.querySelector('#upload');
		let maxSize = 512000;
		let countfile=<c:out value="${size}" />;
		
	
	
		function search(p){
			searchform.nowPage.value=p;
			searchform.submit();
		}
		function check(fileId){
		 	let checkbox = $('#' + fileId);


		    if(checkbox.prop('checked')) {
		        checkbox.prop('checked', false);
		        checkbox.closest('tr').css({"background-color":"white"});
		    }else{
		        checkbox.prop('checked', true);
		        checkbox.closest('tr').css({"background-color":"green"});
		    }
		}

		fileSize.addEventListener('change',function(){
			if(fileSize.files[0].size > maxSize) {
				alert('파일의 용량이 너무 큽니다');
				fileSize.value = '';
				return false;		
			}
		})
		function download(){
			let checkedFileId=$('input[type="checkbox"]:checked').attr('id')
			if(checkedFileId!=null){
				 // 다운로드 링크 생성
		        let downloadLink = document.createElement('a');
		        downloadLink.href = "${pageContext.request.contextPath}/downloadFile/" + checkedFileId;
		        downloadLink.target = '_blank'; 
		        downloadLink.download = $('#'+checkedFileId).closest('tr').find('td:first-child').text(); 

		        // 링크를 클릭하여 파일 다운로드 시작
		        downloadLink.click();
		    } else {
		        alert('파일을 선택해주세요.');
		    }
		}
		

	</script>
</html>