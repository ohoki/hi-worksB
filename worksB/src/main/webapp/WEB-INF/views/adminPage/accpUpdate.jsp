<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>구성원 관리</h2>
	<ul>
		<li>현재 구성원</li>
		
	</ul>
	<button type="button" onclick="location.href='noticeList'"></button>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>등급</th>
				<th>회사 번호</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody class="taskList">
		</tbody>
	</table>
	
	
	<script>
		$(document).ready(function() {
			 getmemberList();
 		 });
		
		function getmemberList(){
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/memberAccpLista' ,
				type : 'GET',
				data : {companyId : '{memberInfo.companyId}'},
				success : function(taskList){
					for(let i=0; i<taskList.length; i++){
						let hightaskList =`
							<tr data-id="\${taskList[i].memberId }" class="highmember memberTr">
								<td>\${taskList[i].memberId }</td>
								<td>\${taskList[i].memberName }</td>
								<td>\${taskList[i].memberPhone }</td>
								<td>\${taskList[i].gradeName }</td>
								<td>\${taskList[i].companyId }</td>
								<td><input type="button" value="수락"></td>
							</tr>`;
						$(".taskList").append(hightaskList);
					}
				}, 
				error : function(reject){
					console.log(reject);
				}
			})
		}
	</script>
</body>
</html>