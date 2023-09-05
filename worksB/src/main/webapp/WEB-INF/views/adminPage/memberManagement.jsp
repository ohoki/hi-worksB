<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구성원 관리</title>
<style>
	body {
		font-size:medium;
	}
	table {
		border: 1px solid;
		border-collapse: collapse;
	}
	table td, th {
		border: 1px solid;
	}
	
	/* 구성원 수정 폼 모달 */
	#memberUpdateModal {
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgba(0, 0, 0, 0.4);
	  display: none;
	}
	.updateMember {
	  background-color: #fefefe;
	  margin: 15% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 400px;
	  height: 600px;
	}
	.closeUpdateForm {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	  color: black;
	}
	.closeUpdateForm:hover,
	.closeUpdateForm:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
</style>
</head>
<body>
	<ul>
		<li>현재 구성원</li>
		<li>가입 대기</li>
	</ul>
	<table>
		<thead>
			<tr>
				<td><input type="checkbox"></td>
				<td>아이디</td>
				<td>이름</td>
				<td>전화번호</td>
				<td>등급</td>
				<td>직급번호</td>
				<td>부서번호</td>
				<td>근무 상태</td>
				<td>접속 ip</td>
				<td>접속 여부</td>
				<td>관리</td>
			</tr>
		</thead>
		<tbody class="taskList">
			<c:forEach items="${memberList}" var="member">
			<tr data-id="${member.memberId }" class="highmember memberTr">
				<th><input type="checkbox"></th>
				<th>${member.memberId }</th>
				<th>${member.memberName }</th>
				<th>${member.memberPhone }</th>
				<th>${member.gradeName }</th>
				<th>${member.jobName }</th>
				<th>${member.deptName }</th>
				<c:choose>
					<c:when test="${member.empStatus eq 'S1'}">
					<th>접속중</th>
					</c:when>
					<c:when test="${member.empStatus eq 'S2'}">
					<th>자리비움</th>
					</c:when>
					<c:when test="${member.empStatus eq 'S3'}">
					<th>접속 종료</th>
					</c:when>
				</c:choose>
				<th>${member.conIp }</th>
				<th>${member.conStatus }</th>
				<th><input type="button" value="관리"></th>
			</tr>
		</c:forEach>
		</tbody>
		
		
	</table>
	<div  id="memberUpdateModal">
		<form class="updateMember" method="post">
			<div>
				<span>구성원 정보 수정</span>
				<button type="button" id="closeUpdateForm">창 닫기</button><br>
				<label>이메일</label>
				<input data-memberId type="text" readonly="readonly"><br>
				<label>회사 번호</label>
				<input data-companyId type="text"readonly="readonly"><br>
				<br>
				<label>이름 </label>
				<input data-memberName type="text" name="memberName"><br>
				<!-- <label>부서명 </label>
				<input data-deptName type="text" name="deptName"><br>
				<label>직책 </label>
				<input data-jobName type="text" name="jobName"><br> -->
				<label>휴대폰 번호 </label>
				<input data-memberPhone type="text" name="memberphone"><br>
<!-- 				<label>등급 </label>
				<input data-memberGrade type="text" name="memberGrade"> -->
				
				<p>
					<span>부서</span>
						<label for="deptId">
							<select id="deptId" name="deptId" data-deptId>
								<option value="" >선택해주세요</option>
								<c:forEach items="${deptList }" var="dept">
									<option value="${dept.deptId }" >${dept.deptName }</option>
								</c:forEach>
							</select>
						</label>
					</p>
					<p>
						<span>직책</span>
						<label for="jobId">
							<select id="jobId" name="jobId" data-jobId>
								<option value="" >선택해주세요</option>
								<c:forEach items="${jobList }" var="job">
									<option value="${job.jobId }"> ${job.jobName }</option>
								</c:forEach>
							</select>
						</label>
					</p>
					<p>
						<span>회원 등급</span>
						<label for="memberGrade" >
							<select id="memberGrade" name="memberGrade" data-memberGrade>
								<option value="">선택</option>
								<option value="H3" 
									<c:if test="${memberGrade eq 'H3' }">selected </c:if>>게스트</option>
								<option value="H2"
									<c:if test="${memberGrade eq 'H2' }">selected </c:if>>일반 회원</option>
								<option value="H1"
									<c:if test="${memberGrade eq 'H1' }">selected </c:if>>관리자</option>
							</select>
						</label>
					</p>
				<button type="button" class="updateButton">수정</button>
			</div>
		</form>
	</div>
	<script>
		 $(document).ready(function() {
			 getmemberList();
	  	 });

	
		function getmemberList(){
			$.ajax({
				url:'${pageContext.request.contextPath}/admin/memberManagements',
				type : 'GET',
				data : {'memberId' : ${memberList.memberId} },
				success : function(taskList){
					let membersList = $('.highmember');
					
					$(taskList).empty();
					
					for(let i=0; i<taskList.lenth; i++){
						
						let hightaskList =
							<tr data-id="${member.memberId }" class="highmember memberTr">
								<th><input type="checkbox"></th>
							<th>\${member.memberId }</th>
							<th>\${member.memberName }</th>
							<th>\${member.memberPhone }</th>
							<th>\${member.gradeName }</th>
							<th>\${member.jobName }</th>
							<th>\${member.deptName }</th>
							<c:choose>
								<c:when test="${member.empStatus eq 'S1'}">
									<th>접속중</th>
								</c:when>
								<c:when test="${member.empStatus eq 'S2'}">
								<th>자리비움</th>
								</c:when>
								<c:when test="${member.empStatus eq 'S3'}">
								<th>접속 종료</th>
								</c:when>
							</c:choose>
							<th>\${member.conIp }</th>
							<th>\${member.conStatus }</th>
							<th><input type="button" value="관리"></th>
						</tr>;
						
						$(".taskList").append(hightaskList);
					}
					
					},
					error : function(reject){
						console.log(reject);
					}
				}
			})
		}
		
	
	
		$(document).on("click", ".memberTr", function(e){
			// 버블링 제거
			e.stopPropagation();
			
			let highTask = $(this);
			let trMemberId = highTask.data('id');
			console.log(trMemberId);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/memberManagements',
				type : 'GET',
				data : {'memberId' : trMemberId },
				success : function(memberData){
					console.log(memberData);
					let memberInfo = $('#memberUpdateModal');
					
					memberInfo.find('input[data-memberId]').val(memberData.memberId);
					memberInfo.find('input[data-companyId]').val(memberData.companyId);
					memberInfo.find('input[data-memberName]').val(memberData.memberName);
					memberInfo.find('select[data-deptId]').val(memberData.deptId);
					memberInfo.find('select[data-jobId]').val(memberData.jobId);
					memberInfo.find('input[data-memberPhone]').val(memberData.memberPhone);
					memberInfo.find('select[data-memberGrade]').val(memberData.gradeId);
					
					// 모달창 열기
					memberUpdateModal.style.display = "block";
					document.body.style.overflow = "hidden"; // 스크롤바 제거
					
					// 모달창 닫기
					closeUpdateForm.addEventListener("click", () => {
					memberUpdateModal.style.display = "none";
					document.body.style.overflow = "auto"; // 스크롤바 보이기

					});
				}
			});

		});
		
		$(document).on("click", ".updateButton", function(e){
			
			let memberInfo = $('#memberUpdateModal');
			let memberId = memberInfo.find('input[data-memberId]').val();
			let memberName = memberInfo.find('input[data-memberName]').val();
			let memberPhone = memberInfo.find('input[data-memberPhone]').val();
			let memberGrade = memberInfo.find('select[data-memberGrade]').val();
			let jobId = memberInfo.find('select[data-jobId]').val();
			let deptId = memberInfo.find('select[data-deptId]').val();
			console.log(memberName);
			console.log(memberPhone);
			console.log(memberGrade);
			console.log(jobId);
			console.log(deptId);
			
			$.post("${pageContext.request.contextPath}/admin/memberAdminUpdate", 
										{memberId : memberId,
				 						 memberName : memberName,
				 						 memberPhone : memberPhone,
				 						 memberGrade : memberGrade,
				 						 jobId : jobId,
				 						 deptId : deptId}, 
				function(resonse) {
				
						alert("수정성공!");

						// 모달 닫기
						memberUpdateModal.style.display = "none";
						document.body.style.overflow = "auto"; // 스크롤바 보이기
						location.reload() 
					
			} )
			
		})
			
		
		//셀렉트 박스 값 설정
	$(window).on('load', function() {
		let dept = $('#deptId option');
		let job = $('#jobId option');
		
		let memberInfo = $('#memberUpdateModal');
		let jobId = memberInfo.find('select[data-jobId]').val();
		let deptId = memberInfo.find('select[data-deptId]').val();
		let memberGrade = memberInfo.find('select[data-memberGrade]').val();
		
		//부서
		for(let i = 0; dept.length; i++) {
			if(dept[i].value == deptId) {
				dept[0].removeAttribute('selected');
				dept[i].setAttribute('selected', '');
				break;
			}
		}
		
		//직급
		for(let i = 0; job.length; i++) {
			if(job[i].value == jobId) {
				job[0].removeAttribute('selected');
				job[i].setAttribute('selected', '');
				break;
			}
		}
		if(memberGrade == 'H1'){
			
		}
	});
			
		
		
		
	</script>
</body>
</html>