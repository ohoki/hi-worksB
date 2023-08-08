<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 생성하기</title>
<link  rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/projectInsert.css">
</head>
<body>
    <p class="form__title">프로젝트 만들기</p>
    <form class="project-create-form" action="projectInsert" method="post">
        <div>
            <input type="text" class="form__input-title" name="projectName" placeholder="제목을 입력하세요.">
        </div>

        <div class="form__divide">
            <div>
                <label>부서 선택</label>
                <select class="form__select" name="departmentId">
                    <option value="">부서부서부서</option>
                    <option value="부서1">부서1</option>
                    <option value="부서2">부서2</option>
                    <option value="부서3">부서3</option>
                </select>
            </div>

            <div>
                <label>회사 공개로 설정</label>
                <input type="checkbox" class="form__checkbox" name="projectAccess">
            </div>

            <div>
                <label>관리자 승인 후 참여 가능</label>
                <input type="checkbox" class="form__checkbox" name="managerAccp">
            </div>
        </div>

        <p class="form__category-title">권한 설정</p>
        <div class="permission">
            <p class="permission__title">게시글</p>
            <ul>
                <li>
                    <label>작성 권한</label>
                    <select class="form__select" name="writeAccess">
                        <option value="J1">전체</option>
                        <option value="J2">프로젝트 관리자만</option>
                    </select>
                </li>
                <li>
                    <label>수정 권한</label>
                    <select class="form__select" name="updateAccess">
                        <option value="J1">전체</option>
                        <option value="">프로젝트 관리자 + 작성자만</option>
                    </select>
                </li>
                <li>
                    <label>조회 권한</label>
                    <select class="form__select" name="boardAccess">
                        <option value="">아아아아아아아아</option>
                        <option value="">아아아아아아아아</option>
                    </select>
                </li>
            </ul>
        </div>

        <div class="permission">
            <p class="permission__title">댓글</p>
            <ul>
                <li>
                    <label>작성 권한</label>
                    <select class="form__select" name="commentAccess">
                        <option value="">아아아아아아아아</option>
                        <option value="">아아아아아아아아</option>
                    </select>
                </li>
            </ul>
        </div>

        <div class="form__divide">
            <div class="permission">
                <p class="permission__title">파일</p>
                <ul>
                    <li>
                        <label>접근 권한</label>
                        <select class="form__select" name="fileAccess">
                            <option value="">아아아아아아아아</option>
                            <option value="">아아아아아아아아</option>
                        </select>
                    </li>
                </ul>
            </div>
        </div>
        <div class="form__button">
            <button type="submit">프로젝트 만들기</button>
        </div>
    </form>
</body>
</html>