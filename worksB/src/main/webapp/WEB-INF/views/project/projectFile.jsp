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
	table{
		width: 95%;
		color : var(--color-dark-grey);
		margin: 20px auto;
	}
	
	th, td {
		border: 1px solid var(--color-dark-beigie);
		text-align: right;
		width : 140px;
		text-align: right;
	}
	
	th {
		height: 40px;
		font-weight: var(--weight-bold);
		text-align: center;
		background-color: rgb(249, 166, 52, 0.2);
		color: var(--color-dark-grey);
	}
	
	td {
		padding: 10px;	
	}
	
	td[data-filename] {
		text-align: center;
		width: 45%;
	}
	
	td[data-count] {
		width: 15%;
	}
	
	td[data-filesize] {
		width: 15%;
	}
	
	td[data-member] {
		width: 15%;
	}
	
	td[data-regdate] {
		width: 15%;
	}
	  
	tr{
		border: 1px solid var(--color-dark-beigie);
		cursor: pointer;
	}

	a {
   		color: black;
    	text-decoration: none;
	}
	
	.search__search {
		text-align: center;
		margin-top: 20px;
	}
	
	select[name=searchtype] {
		width : 70px;
		height : 30px;
		border : 1px solid var(--color-dark-beigie);
		color: var(--color-dark-grey);
	}
	
	input[name=searchkeyword] {
		width : 200px;
		height : 30px;
		border : 1px solid var(--color-dark-beigie);
		color: var(--color-dark-grey);
	}
	
	button.search__submit {
		width : 50px;
		height : 30px;
		background-color: var(--color-dark-red);
		color: white;
		border-radius: 5px;
	}
	
	.paging a, .paging b {
		color: var(--color-dark-grey);
	}
	
	.file-header {
		padding: 0 50px;
		margin-top: 30px;
	}
	
	.upload-btn {
	    background-color: var(--color-orange);
	    padding: 6px 12px;
	    display: block;
	    cursor: pointer;
	    width: 80%;
	    height: 20px;
	    border-radius: 5px;
	    font-weight: var(--weight-bold);
	    color: white;
  	}
  	
  	.upload-btn span {
  		font-size: 12px;
  		display: block;
  		text-align: center;
  	}
  
  	input[type=file] {
	      display: none;
	}
	
	button[name=download] {
		/* display:none; */
		background-color: var(--color-green);
	    padding: 6px 12px;
	    cursor: pointer;
	    width: 80px;
	    height: 20px;
	    border-radius: 5px;
	    font-weight: var(--weight-bold);
	    color: white;
	    line-height: 20px;
	    font-size: 12px;
	    margin-right: 30px;
	}
	
	.d-flex {
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
</style>
</head>
<body>
<c:set var="size" value="${fileList.size() }" />
	<div class="file-main-box">
		<div class="d-flex file-header" style="justify-content: flex-end;">
			<!-- 업로드와 다운로드 --> 
			<button type="button" onclick="download()" name="download">download</button>
			<form  action="${pageContext.request.contextPath }/uploadFiles" method="post" enctype="multipart/form-data" id="uploadForm">
				<label for="upload" class="upload-btn">
	      			<input type="file" name="file" id="upload">
	      			<span>Upload File</span>
				</label>
				<input type="hidden" name="prjId" value="${projectInfo.projectId }" >
			</form>
		</div>

		<table>
			<thead>
				<tr>
					<th>파일명</th>
					<th>용량</th>
					<th>등록자</th>
					<th>등록일</th>
					<th>다운로드수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${fileList}" var="list" >							
						<tr onclick="check(${list.fileId})">
							<td id="${list.fileName }" data-filename>${list.fileName }</td>
							<td id="${list.convertedSize }" data-filesize>${list.convertedSize }</td>
							<td data-member>${list.memberName }</td>
							<td data-regdate><fmt:formatDate value="${list.fileRegdate }" pattern="YY/MM/dd" type="date"/></td>
							<td data-count>${list.count }</td>
							<td hidden><input type="checkbox" id="${list.fileId }"></td>
							<td hidden>${list.fileSize }</td>
							<td hidden>${list.realFilePath }</td>
							<td hidden>${list.memberId }</td>
							<td hidden>${list.fileType }</td>
						</tr>
				</c:forEach>	
			</tbody>
		</table>
					
		<div class="search">
			<div class="paging" style="text-align: center">
					<!-- 이전 --> 
				<c:if test="${paging.startPage != 1 }">
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
			<div>
				<!-- 		검색 --> 
				<form action="${pageContext.request.contextPath }/searchfiles" method="post" name="searchform">
					<div class="search__search">
						<input type="hidden" name="nowPage" value="1">
						<input type="hidden" name="access" value="${projectInfo.fileAccess }">
						<input type="hidden" name="prjId" value="${projectInfo.projectId }" >
						<select name="searchtype" class="search__select">
							<option value="1" <c:if test="${searchVO.searchtype==1}"> selected   </c:if>>파일명</option>
							<option value="2" <c:if test="${searchVO.searchtype==2}"> selected   </c:if>>등록자</option>
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
	let fileSizeAndnotEmpty=document.querySelector('#upload');
	let maxSize = 512000;
	
	function search(p){
		searchform.nowPage.value=p;
		searchform.submit();
	}
	
	//파일 업로드
	$('#upload').on('change', function(e) {
		let fileDOM = document.querySelector('#upload');
		
		if(fileDOM.files[0] != null) {
			$('#uploadForm').submit();
		}
	});
	
	//엔터로검색
	$('.search__input').on('keyup', (e)=>{
		if(e.keyCode===13){
			searchform.nowPage.value=p;
			searchform.submit();
		}
	});

	function check(fileId){
	    let checkbox=$('#' + fileId);
	    let isChecked=checkbox.prop('checked');

	    //체크안된경우만 실행됨
	    if (!isChecked) {
	    	checkbox.prop('checked', true);
	        checkbox.closest('tr').css({"background-color":"rgb(0, 180, 216, 0.03)"});
	        checkbox.closest('tr').css({"font-weight":"var(--weight-bold)"});
	        checkbox.prop('checked',!isChecked);
	    } else {
	    	checkbox.prop('checked', false);
	    	checkbox.closest('tr').css({"background-color":"white"});
	    	checkbox.closest('tr').css({"font-weight":"var(--weight-semi-bold)"});	
	    }
	};

	fileSizeAndnotEmpty.addEventListener('change',function(){
		if(fileSizeAndnotEmpty.files[0].size > maxSize) {
				alert('파일의 용량이 너무 큽니다');
				fileSizeAndnotEmpty.value = '';
				return false;		
			}
	})
	
	
	function download(){
		let checkedFile = $('input[type="checkbox"]:checked');
		
		if(checkedFile.length != 0){
			checkedFile.each(function(index, item) {
				let checkedFileId = $(item).attr('id');
				
				// 다운로드 링크 생성
		        let downloadLink = document.createElement('a');
		        //다운로드링크주소만들기
		        downloadLink.href = "${pageContext.request.contextPath}/downloadFile/" + checkedFileId;
		        //새창에서열기
		        downloadLink.target = '_blank'; 
				//파일명설정
		        downloadLink.download = $('#' + checkedFileId).closest('tr').find('td:first-child').text(); 
		        // 링크를 클릭하여 할당된 링크로 파일 다운로드 시작
		        downloadLink.click();
				
				let row=$('#'+checkedFileId).closest('tr')
				let fileName=row.find('td:eq(0)').text()
				let fileSize=row.find('td:eq(1)').text()
				let memberName=row.find('td:eq(2)').text()
				let fileRegdate=row.find('td:eq(3)').text()
				
				let hidden=row.find('td[hidden]')
				let memberId=hidden[3].textContent
				let fileType=hidden[4].textContent
				
				$.ajax({
					url:'${pageContext.request.contextPath}/updateDownloadFile',
					method:'POST',
					contentType:'application/json',
					data:JSON.stringify({
						'fileId':checkedFileId,
						'fileName':fileName,
						'fileRegdate':fileRegdate,
						'convertedSize':fileSize,
						'fileType':fileType
						})
					})
					.done(data=>{
						if(data<1){
							alert('파일을 다시 다운로드해 주세요');
						} else {
							$(item).prop('checked', false);
							$(item).closest('tr').css({"background-color":"white"});
							$(item).closest('tr').css({"font-weight":"var(--weight-semi-bold)"});	
						}
					})
					.fail(reject=>{
							console.log(reject);
							alert('파일을 다시 다운로드해 주세요');
				})
			});
	    } else {
	        alert('파일을 선택해주세요.');
	        return false;
	    }
	}
</script>
</html>