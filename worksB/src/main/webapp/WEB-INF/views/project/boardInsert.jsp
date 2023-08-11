<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

button {
    width: 100px;
    background-color: var(--color-light-white);
    color: var(--color-grey);
    padding: 10px 20px;
    border-radius: 10px;
    font-size: 18px;
    margin-top: 15px;
}

button:hover {
    background-color: #c0e6f5;
    color: #ffffff;
}

.modal{
    position:absolute;
    display:none;
    justify-content: center;
    top:0;
    left:0;
    width:100%;
    height:100%;
}

.modal_body{
    position:absolute;
    top:20%;
    left:15%;
    width: 180px;
    height: 190px; 
    background-color: rgb(255,255,255);
    border-radius:10px;
    box-shadow:0 2px 3px 0 rgba(34,36,38,0.15);
    transform:translateY(-50%);
}

.modal li{
    font-size: 16px;
    color: var(--color-dark-grey);
    margin: 15px;
    padding: 2px;
}

.modal li:hover{
    background-color: var(--color-light-blue);
    color: #303030;
}

</style>
</head>
<body>
	<div>
		<button class="open-modal"></button>
	</div>

		<div class="modal">
			<div class="modal_body">
				<span class="closeBtn">&times;</span>
				<form class="" action="boardInsert" method="post">
					<table>
						<tr>
							<th>게시글 제목</th>
							<td><input type="text" placeholder="제목"
								name="prjBoardTitle"></td>
						</tr>
						<tr>
							<td><textarea placeholder="내용을 입력해주세요."
									name="prjBoardSubject"></textarea></td>
						</tr>
						<tr>
							<td><select name="inspYn">
									<option value="E1">전체</option>
									<option value="E2">관리자만</option>
							</select></td>
						</tr>
					</table>
				</form>
			</div>
		</div>


	
	<script>
		//모달창 열기
	    const modal = document.querySelector('.modal');
	    const btnOpenModal=document.querySelector('.open-modal');
	    const closeBtn = document.querySelector('closeBtn');
	
	    btnOpenModal.addEventListener("click", ()=>{
	        modal.style.display="flex";
	    });
	
	    // 바깥영역 클릭 시 모달창 닫기
	    modal.addEventListener("click", e => {
	        const evTarget = e.target
	        if(evTarget.classList.contains("modal")) {
	            modal.style.display = "none"
	        }
	    });
	    
	    //모달창 닫기 버튼
	    closeBtn.onclick = function() {
  			modal.style.display = 'none';
		}
	</script>
</body>
</html>