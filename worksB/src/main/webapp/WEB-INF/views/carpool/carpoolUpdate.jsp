<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.carpool-insert-box {
	width: 60%;
	margin: 60px auto; 
	color: var(--color-dark-grey);
	font-size: var(--font-micro);
}

.insert {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 20px;
}

.insert h2 {
	margin: 0;
	font-size: var(--font-regular);
	font-weight: var(--weight-bold);
	color: var(--color-green);
}

.carpool-icon {
	width: 20px;
	height: 20px;
}

#inputTitle {
	width: 95%;
	padding: 0 20px;
	margin-bottom: 15px;
	border-bottom: 1px solid var(--color-dark-beigie);
	height: 40px;
}

.carpool-footer {
	text-align: right;
	margin: 20px 0;
}

.carpool-footer button{
	margin-left: 20px;
	width: 50px;
	height: 30px;
	border: 1px solid var(--color-dark-red);
	background-color: white;
	color: var(--color-dark-red);
	border-radius: 5px;
	transition: all 0.5s;
}

.carpool-footer button:hover {
	color: var(--color-white);
	background-color: var(--color-dark-red);
}

.ck.ck-list__item .ck-button {
    width: 90% !important;
}

.ck-editor__editable {
    min-height: 400px;
}

input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
input:-webkit-autofill:active {
    transition: background-color 5000s ease-in-out 0s;
    -webkit-transition: background-color 9999s ease-out;
    -webkit-box-shadow: 0 0 0px 1000px white inset !important;
    -webkit-text-fill-color: var(--color-dark-grey) !important;
}

.carpool-table {
    width: 100%;
    margin-top: 20px;
}

.carpool-table th, .carpool-table td {
    padding: 10px;
}

th, tfoot td {
    height: 40px;
    color: var(--color-white);
    font-weight: var(--weight-semi-bold);
}

.label {
    font-weight: bold;
    margin: 10px;
}

.input-box {
    width: 100%;
    padding: 5px;
    margin-bottom: 10px;
    border: 1px solid var(--color-dark-beigie);
    border-radius: 5px;
}

.input-button {
    padding: 5px 15px;
    border: none;
    background-color: var(--color-dark-beigie);
    color: var(--color-dark-grey);
    border-radius: 5px;
    cursor: pointer;
    margin-bottom: 5px;
}

#departureDateInput, #passelect {
    width: 70%;
    padding: 5px;
    border: 1px solid var(--color-dark-beigie);
    border-radius: 5px;
    margin-top: 25px;
}

.radio {
    display: none;
}

.select input[type=radio]+label {
    display: inline-block;
    cursor: pointer;
    margin-right: 10px;
    padding: 5px 10px;
    text-align: center;
    width: 85px;
	height: 30px;
	background-color: var(--color-dark-beigie);
	border-radius: 5px;
	color: var(--color-dark-grey);
	font-weight: var(--weight-bold);
	transition: all 0.5s;
	line-height: 24px;
}

.select input[type=radio]:checked+label {
	background-color: var(--color-dark-red);
	color: white;
}

.type-content{
	text-align: center;
}
</style>
</head>
<body>
	<!-- api -->
	<!-- ckeditor -->
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
	<!-- 사진 업로드를 위한 ckfinder -->
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
	<!-- ckeditor 끝 -->

	<div class="carpool-insert-box">
		<div class="insert">
			<h2>
				<img class="notice-icon" src="${pageContext.request.contextPath }/resources/icon/car-solid.svg" alt="카풀 아이콘">
				같이타요 수정
			</h2>
		</div>
			<form action="${pageContext.request.contextPath }/member/carpoolUpdate" method="post" onsubmit="return check();">
				<input type="text" id="inputTitle" name="boardTitle" value="${carpoolInfo.boardTitle }">
			<textarea name="boardContent" id="editor">${carpoolInfo.boardContent }</textarea>
				<table class="carpool-table">
						<tr>
							<td class="type-content" colspan="4">
								<div class="select">
	    							<input type="radio" id="select" name="category" value="B1" class="radio">
	    							<label for="select" class="radio-label">태워드립니다</label>
	    							<input type="radio" id="select2" name="category" value="B2" class="radio">
	    							<label for="select2" class="radio-label">태워주세요</label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="p-0 d-xl-table-cell d-none">
							    <button type="button" id="departureButton" class="input-button">출발지 선택</button><br>
		  						<input type="text" id="departureInput" name="departure" class="input-box" value="${carpoolInfo.departure }"><br>
							</td>
							<td style="text-align: center;">
								<label id="passenger" class="label">인원</label>
								<select id="passelect" name="passenger">
									<option value="0">0명</option>
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>
									<option value="5">5명</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>	
							    <button type="button" id="arrivalButton" class="input-button">도착지 선택</button><br>
							    <input type="text" id="arrivalInput" name="arrival" class="input-box" value="${carpoolInfo.arrival }"><br>
							</td>
							<td style="text-align: center;">
								<label class="label">날짜</label>
								<input type="datetime-local" id="departureDateInput" class="input-box"><br>
								<input type="hidden" id="departureDate" name="departureDate">
							</td>
						</tr>
						<tr>
							<td>
								<input type="hidden" name="category" value="B1" ><!-- 나중에 바꿔야됨 -->
								<input type="hidden" name="boardId" value="${carpoolInfo.boardId }">
							</td>
						</tr>
				</table>
				<div class="carpool-footer">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/carpoolList'">목록</button>
					<button type="submit">수정</button>
				</div>
			</form>
	</div>
	<script>
	
		function check(){
			/* datetime-local T 지우기 */
			// 날짜 가져오기
			let x = document.getElementById("departureDateInput").value;
			// 거지같은 T 바꾸기
			x = x.replace("T", " ");
			departureDate.value = x;
		}
		
	
	
		/* ck에디터 */
		CKEDITOR.ClassicEditor.create(document.querySelector('#editor'), {
	        toolbar: {
	        	 items: [
					'alignment', '|',
					'heading', '|',
					'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
					'exportPDF', 'insertImage', 'mediaEmbed',
					'-',
					'specialCharacters', '|',
					'bold', 'italic', 'strikethrough', 'underline', 'subscript', 'superscript', '|',                     
					'findAndReplace', 'selectAll'
	             ],
	             shouldNotGroupWhenFull: true
	         },
	        // Changing the language of the interface requires loading the language file using the <script> tag.
	        language: 'ko',
	        // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
	        heading: {
	            options: [
	                { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
	                { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
	                { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
	                { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
	                { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
	                { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
	                { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
	            ]
	        },
	        // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
	        placeholder: '내용을 입력하세요.',
	        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
	        fontFamily: {
	            options: [
	                'default',
	                '궁서체',
		    		'돋움',
	                'Arial, Helvetica, sans-serif',
	                'Courier New, Courier, monospace',
	                'Georgia, serif',
	                'Lucida Sans Unicode, Lucida Grande, sans-serif',
	                'Tahoma, Geneva, sans-serif',
	                'Times New Roman, Times, serif',
	                'Trebuchet MS, Helvetica, sans-serif',
	                'Verdana, Geneva, sans-serif',
	            ],
	            supportAllValues: true
	        },
	        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
	        fontSize: {
	            options: [ 10, 12, 14, 16, 18, 20, 22 ],
	            supportAllValues: true
	        },
	        // The "super-build" contains more premium features that require additional configuration, disable them below.
	        // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
	        removePlugins: [
	            // These two are commercial, but you can try them out without registering to a trial.
	            // 'ExportPdf',
	            // 'ExportWord',
	            'CKBox',
	            'EasyImage',
	            // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
	            // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
	            // Storing images as Base64 is usually a very bad idea.
	            // Replace it on production website with other solutions:
	            // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
	            // 'Base64UploadAdapter',
	            'RealTimeCollaborativeComments',
	            'RealTimeCollaborativeTrackChanges',
	            'RealTimeCollaborativeRevisionHistory',
	            'PresenceList',
	            'Comments',
	            'TrackChanges',
	            'TrackChangesData',
	            'RevisionHistory',
	            'Pagination',
	            'WProofreader',
	            // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
	            // from a local file system (file://) - load this site via HTTP server if you enable MathType
	            'MathType'
	        ]
	    });	
	</script>
</body>
</html>