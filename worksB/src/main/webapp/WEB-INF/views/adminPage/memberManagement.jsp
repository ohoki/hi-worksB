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
	
	.menuButtons{
		margin-left: 40px;
		margin-top: 20px;
	}
	
	.adminManagementMenu {
		margin-left: 300px;
		display: flex;
		margin-left: 300px;
	}
	
	.adminManagementMenu li{
		padding: 5px 10px 0 10px;
		border-bottom: 3px solid transparent;
		height: 30px;
	}
	
	.adminManagementMenu li:hover, .adminManagementMenu li.active{
		color: var(--color-dark-red);
		border-bottom: 3px solid var(--color-dark-red);
		cursor: pointer;
		transition: all 0.5s;
	}
	
	.adminManagementMenu button:hover{
		color: var(--color-dark-red);
		transition: all 0.5s;	
	}
	
	.menuButton {
		color: var(--color-dark-grey);
		background-color: white;
		text-decoration: none;
		font-weight: var(--weight-bold);
		font-size: 16px;
	}
	
	body {
		font-size: medium;
	}
	
	table{
		width: 95%;
		color : var(--color-dark-grey);
		margin: 0 auto;
		border-collapse: collapse;
		margin-top: 10px;
	}
	
	th, td {
		border: 1px solid var(--color-dark-beigie);
		text-align: right;
		width : 140px;
		text-align: center;
	}
	
	th {
		height: 40px;
		background-color: var(--color-dark-beigie);
	}
	
	 tr:hover {
		background-color: var(--color-beigie);
	}
	
	td {
		padding: 10px;	
	}
	  
	tr{
		cursor: pointer;
		border: 1px solid var(--color-dark-beigie);
	}
	
	/* 구성원 수정 폼 모달 */
	#memberUpdateModal {
	  position: absolute;
	  z-index: 1;
	  width: 100%;
	  height: 1000px;
	  background-color: rgba(0, 0, 0, 0.1);
	  display: none;
	  top: 0;
	  left: 0;
	}
	.updateMember {
	  position: absolute;
	  background-color: white;
	  border-radius:10px;
	  margin: 15% auto;
	  padding: 20px;
	  border: 1px solid var(--color-dark-beigie);
	  width: 400px;
	  height: 600px;
	  transform : translate(-50%, -100%);
	  left: 50%;
	  top: 50%;
	}
	.closeUpdateForm {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	  color: black;
	  float:right;
	  text-align: right;
	}
	.closeUpdateForm:hover,
	.closeUpdateForm:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
	/* 모달끝 */
	
	.topH1 {
		display: block;
	    font-size: var(--font-regular);
	    margin-block-start: 0.67em;
	    margin-block-end: 0.67em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    font-weight: bold;
	    margin-top: 30px;
	    margin-left: 35px;
	    color: var(--color-dark-grey);
	}
	
	.tableH2 {
		text-align: center;
		color: var(--color-dark-grey);
	}
	
	.cursor {
		float: right;
		width: 20px;
	}
	
	.form__label{
		width: 100px;
		display:inline-block;
		margin-top: 15px;
		padding-left: 20px;
	}
	.form__input{
		width: 200px;
    	height: 30px;
		border-radius: 2px;
    	border: 1px solid var(--color-dark-beigie);
    	padding-left: 10px;
	}
	
	.form__select {
		display:inline-block;
		border-radius: 2px;
    	border: 1px solid var(--color-dark-beigie);
	}
	
	.form__guide {
		display:inline-block;
		margin-top: 15px;
		padding-left: 20px;
		color: red;
		font-size: medium;
		font-weight: bold;
	}
	
	.form__guidee {
		width: 300px;
		margin-right: 150px;
		font-size: small;
	}
	
	.updateTop{
		display:inline-block;
		margin-bottom: 20px;
		margin-right: 10px;
		margin-top: 2px;
		width: 300px;
	}
	
	/* 셀렉트 박스 스타일 */
	select {
	  	padding: 8px;
	  	border: 1px solid #ccc;
	  	border-radius: 4px;
	  	font-size: 14px;
	  	background-color: white;
	  	width: 50;
	  	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
		transition: border-color 0.2s, box-shadow 0.2s;
	}
	
	/* 셀렉트 박스 포커스 스타일 */
	select:focus {
	  	border-color: #007bff;
	  	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
	}
	
	/* 셀렉트 박스 확장 아이콘 스타일 (선택 사항) */
	select::-ms-expand {
	  	display: none;
	}
	
	/* 레이블 스타일 */
	label {
	  	margin-bottom: 10px;
	  	font-weight: bold;
	}
	
	/* 선택 옵션 스타일 (선택 사항) */
	select option {
	 	padding: 8px;
	}
	
	/* 선택 옵션 호버 스타일 (선택 사항) */
	select option:hover {
		background-color: var(--color-beigie);
	}
	
	.updateButton {
		width: 100px;
	    height: 40px;
	    margin-left: 20px;
	    background-color: rgb(22, 66, 91, 0.8);
    	border-radius: 5px;
   		color: var(--color-white);
    	font-weight: var(--weight-bold);
	    float: right;
	}
	
	.update__form {
		width: 60px;
	    height: 25px;
	    background-color: rgb(22, 66, 91, 0.8);
    	border-radius: 5px;
   		color: var(--color-white);
    	font-weight: var(--weight-bold);
    	cursor: pointer;
	}
	.acceptButton {
		width: 60px;
	    height: 25px;
	    background-color: rgb(22, 66, 91, 0.8);
    	border-radius: 5px;
   		color: var(--color-white);
    	font-weight: var(--weight-bold);
    	cursor: pointer;
	}
</style>
</head>
<body>
	<h1 class="topH1">구성원 관리</h1>
	<div class="menuButtons">
		<ul class="adminManagementMenu">
			<li class="active"><button class="menuButton" type="button" id="memberManagement">구성원 관리</button></li>
			<li><button class="menuButton" type="button" id="welcomeCompany">회사 가입 승인</button></li>
		</ul>
	</div>
	<table>
		<thead id="tableHead">
			<tr class="memberMenuOne">
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>등급</th>
				<th>부서명</th>
				<th>직급</th>
				<th>근무 상태</th>
				<th>관리</th>
			</tr>
			<tr class="memberMenuTwo">
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>회사명</th>
				<th>관리</th>
			</tr>
		</thead>
		<!-- 구성원 목록이 출력되는 페이지 -->
		<tbody class="taskList taskLists">
		</tbody>
	</table>
	<!-- 데이터 없을때 출력하는 텍스트의 공간 -->
	<div class="noData">
		<!-- 데이터 없을때 출력되는 공간 -->
	</div>
	<div  id="memberUpdateModal">
		<form class="updateMember" method="post">
			<div>
				<h2 class="updateTop">구성원 정보 수정</h2>
				<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg" class="cursor" id="closeUpdateForm">
				<span class="form__guide">필수 정보</span>
				<span class="form__guidee">(수정 불가)</span>
				<label class="form__label">이메일</label>
				<input data-memberId type="text" readonly="readonly" class="form__input"><br>
				<label class="form__label">회사명</label>
				<input data-companyName type="text"readonly="readonly" class="form__input"><br>
				<br>
				<span class="form__guide">추가 정보</span>
				<span class="form__guidee">(수정 가능)</span>
				<label class="form__label">이름 </label>
				<input data-memberName type="text" name="memberName" class="form__input"><br>

				<label class="form__label">휴대폰 번호 </label>
				<input data-memberPhone type="text" name="memberphone" class="form__input"><br>
				<input data-companyId type="hidden" name="companyId" readonly="readonly">
				<p>
					<label class="form__label">부서 </label>
					<label for="deptId">
					<select id="deptId" name="deptId" data-deptId class="form__select">
						<option value="" >선택해주세요</option>
							<c:forEach items="${deptList }" var="dept">
								<option value="${dept.deptId }" >${dept.deptName }</option>
							</c:forEach>
					</select>
					</label>
				</p>
				<p>
					<label class="form__label">직책 </label>
					<label for="jobId">
					<select id="jobId" name="jobId" data-jobId class="form__select">
						<option value="" >선택해주세요</option>
							<c:forEach items="${jobList }" var="job">
								<option value="${job.jobId }"> ${job.jobName }</option>
							</c:forEach>
					</select>
					</label>
				</p>
				<p>
					<label class="form__label">회원 등급 </label>
					<label for="memberGrade" >
						<select id="memberGrade" name="memberGrade" class="form__select" data-memberGrade >
							<option value="">선택</option>
							<option value="H3" >게스트</option>
							<option value="H2" >일반 회원</option>
							<option value="H1" >관리자</option>
						</select>
					</label>
				</p>
				<button type="button" class="updateButton">수정</button>
			</div>
		</form>
	</div>
	<script>
		$('.adminManagementMenu li').on('click', function(e) {
			$('.adminManagementMenu .active').removeClass('active');
			$(e.currentTarget).addClass('active');
		});
	
	
		 $(document).ready(function() {
			 getmemberList();
			 $('.memberMenuTwo').empty();
	  	 });
		 /* 구성원 리스트 가져오기 */
		function getmemberList(){
			$.ajax({
				url:'${pageContext.request.contextPath}/admin/memberManagementss',
				type : 'GET',
				data : {companyId : '${memberInfo.companyId}' },
				success : function(taskList){
					for(let i=0; i<taskList.length; i++){
						
						if(taskList[i].empStatus == "S1") {
							taskList[i].empStatus == '접속중';
						} else if(taskList[i].empStatus == "S2") {
							taskList[i].empStatus == '자리비움';
						} else if(taskList[i].empStatus == "S3") {
							taskList[i].empStatus == '접속종료';
						}
						
						console.log( ${taskList[i].memberId.val });
						
						let hightaskList =`
							<tr data-id="\${taskList[i].memberId }" class="highmember memberTr">
								<td>\${taskList[i].memberId }</td>
								<td>\${taskList[i].memberName }</td>
								<td>\${taskList[i].memberPhone }</td>
								<td>\${taskList[i].gradeName }</td>
								<td>\${taskList[i].deptName }</td>
								<td>\${taskList[i].jobName }</td>
								<td>\${taskList[i].empStatus }</td>
								<td><input type="button" value="관리" class="update__form"></td>
							</tr>`;
							$(".taskList").append(hightaskList);
							
						} 
					},
					error : function(reject){
						console.log(reject);
					}
			})
		};
		
	
		/* 클릭했을때 해당 id 정보를 가져오고, 모달 띄우기 */
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
					memberInfo.find('input[data-companyName]').val(memberData.companyName);
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
		
		$('#memberUpdateModal').on('click', function(e) {
			$(e.currentTarget).css('display', 'none');
		});
		
		/* 회원 정보 수정 */
		$(document).on("click", ".updateButton", function(e){
			
			let memberInfo = $('#memberUpdateModal');
			let memberId = memberInfo.find('input[data-memberId]').val();
			let memberName = memberInfo.find('input[data-memberName]').val();
			let memberPhone = memberInfo.find('input[data-memberPhone]').val();
			let memberGrade = memberInfo.find('select[data-memberGrade]').val();
			let companyId = memberInfo.find('input[data-companyId]').val();
			let companyName = memberInfo.find('input[data-companyName]').val();
			let jobId = memberInfo.find('select[data-jobId]').val();
			let deptId = memberInfo.find('select[data-deptId]').val();
			console.log(memberName);
			console.log(memberPhone);
			console.log(memberGrade);
			console.log(jobId);
			console.log(deptId);
			console.log('회사id')
			console.log(companyId);
			console.log('회사 이름')
			console.log(companyName);
			
			$.post("${pageContext.request.contextPath}/admin/memberAdminUpdate", 
				{memberId : memberId,
				 companyId : companyId,
				 memberName : memberName,
				 memberPhone : memberPhone,
				 memberGrade : memberGrade,
				 jobId : jobId,
				 deptId : deptId}, 
			function(resonse) {
				alert("수정성공!");
				$('.taskList').empty(); // 기존 데이터 삭제
				getmemberList();		// 새 데이터 출력
				// 모달 닫기
				memberUpdateModal.style.display = "none";
				document.body.style.overflow = "auto"; // 스크롤바 보이기
			})
		});
			
		//셀렉트 박스 값 설정
	$(window).on('load', function() {
		let dept = $('#deptId option');
		let job = $('#jobId option');
		let grade = $('#grade.option');
		
		let memberInfo = $('#memberUpdateModal');
		let jobId = memberInfo.find('select[data-jobId]').val();
		let deptId = memberInfo.find('select[data-deptId]').val();
		let gradeId = memberInfo.find('select[data-memberGrade]').val();
		
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
		
		if(gradeId == 'H1'){
			grade[0].removeAttribute('selected');
			grade[0].setAttribute('selected', '');
		}
	});

		/* 버튼누르면 table교체 */
		$(document).on("click" ,"#memberManagement", function(e){
			
			let firstMenu = `
				<tr class="memberMenuOne">
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>부서명</th>
					<th>직급</th>
					<th>근무 상태</th>
					<th>관리</th>
				</tr>`;
							
			$('.memberMenuOne').empty(); // 첫번째 thead 삭제
			$('.memberMenuTwo').empty(); // 두번째 thead 삭제
			$('.taskList').empty(); // 구성원 목록 삭제
			$('.taskLists').empty(); // 승인대기 목록 삭제
			$('.noData').empty();
			
			$('#tableHead').append(firstMenu);	// 첫번째 thead등록
			getmemberList(); // 구성원 목록 가져오기
		});
		
		$(document).on("click" ,"#welcomeCompany", function(e){
			let secondMenu =`
				<tr class="memberMenuTwo">
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>회사명</th>
					<th>관리</th>
				</tr>`;
			
			$('.memberMenuOne').empty(); // 첫번째 thead 삭제
			$('.memberMenuTwo').empty(); // 두번째 thead 삭제
			$('.taskList').empty(); // 구성원 목록 삭제
			$('.taskLists').empty(); // 승인대기 목록 삭제
			$('.noData').empty();
			
			$('#tableHead').append(secondMenu);// 두번째 thead 넣기
			acceptMemberForm();		// 승인대기 목록 넣기
		});
		/* 교체 끝 */
		
		/* 회사 가입 승인 페이지 */
		function acceptMemberForm(){
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/memberAccpLista' ,
				type : 'GET',
				data : {companyId : '${memberInfo.companyId}'},
				success : function(taskLists){
					if(taskLists.length == 0){
						let hightaskList =`
									<h2 class="tableH2">가입 대기중인 인원이 없습니다.</h2>`;
							$('.memberMenuTwo').empty();
							$(".noData").append(hightaskList);
						
					} else {
						for(let i=0; i<taskLists.length; i++){
							let hightaskList =`
								<tr data-id="\${taskLists[i].memberId }" class="highmember memberTrs">
									<td>\${taskLists[i].memberId }</td>
									<td>\${taskLists[i].memberName }</td>
									<td>\${taskLists[i].memberPhone }</td>
									<td>\${taskLists[i].companyName }</td>
									<td><input type="button" class="acceptButton" value="수락"></td>
								</tr>`;
							$(".taskLists").append(hightaskList);
						}
					}
					
				}, 
				error : function(reject){
					console.log(reject);
				}
			})
		}
		
		/* 가입 신청 승인 ajax */
		$(document).on("click", ".acceptButton", function(e){
			e.stopPropagation();
			
			if(confirm("신청을 수락하시겠습니까?") == true){
				let trData = $(this).closest("tr");
				let memberIdData = trData.data('id');
				console.log(memberIdData);
				
				$.get("memberAccpUpdate", {memberId : memberIdData, companyAccp : "A1"}, 
					function(data){
						console.log("승인 성공")
						let secondMenu =`
				<tr class="memberMenuTwo">
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>회사명</th>
					<th>관리</th>
				</tr>`;
			
				$('.memberMenuOne').empty(); // 첫번째 thead 삭제
				$('.memberMenuTwo').empty(); // 두번째 thead 삭제
				$('.taskList').empty(); // 구성원 목록 삭제
				$('.taskLists').empty(); // 승인대기 목록 삭제
				
				$('#tableHead').append(secondMenu);// 두번째 thead 넣기
				acceptMemberForm();		// 승인대기 목록 넣기
						
				})
			}else {
				console.log("취소")
			}
			
		});
		sessionStorage.removeItem('startDate'); // 시작일 데이터 삭제
		sessionStorage.removeItem('endDate'); // 시작일 데이터 삭제
	</script>
</body>
</html>