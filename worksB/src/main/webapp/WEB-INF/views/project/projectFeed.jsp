<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.form__select,
.form__input-title,
.form__textarea {
	width: 100%;
	padding: 10px;
	border-radius: var(--size-border-radius);
	border: 1px solid var(--color-dark-white);
	font-size: var(--font-small);
	margin-bottom: 15px;
}

.form__textarea{
	height: 400px;
}
</style>
</head>
<body>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#boardInsertModal">게시글 작성</button>
<div class="modal" tabindex="-1" id="boardInsertModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">게시글 작성</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="boardInsert" method="post">
                    <!-- 게시글 작성 폼!!! -->
					<div>
						<input type="text" class="form__input-title" name="prjBoardTitle" placeholder="제목을 입력하세요." required>
					</div>

					<div>
						<textarea class="form__textarea" name="prjBoardSubject" placeholder="내용을 입력하세요." required></textarea>
					</div>
					
						<div>
							<label>공개 범위</label> <select class="form__select" name="inspYn">
								<option value="E2">전체 공개</option>
								<option value="E1">프로젝트 관리자만</option>
							</select>
						</div>
				</form>
            </div>
            <div class="modal-footer form__button">
                <button type="submit" class="btn btn-primary">등록</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
		
</body>
<script>

</script>
</html>