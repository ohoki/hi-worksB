<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.notice-insert-box {
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
	
	.notice-icon {
		width: 20px;
		height: 20px;
	}
	
	#noticeTitle {
		width: 95%;
		padding: 0 20px;
		margin-bottom: 15px;
		border-bottom: 1px solid var(--color-dark-beigie);
		height: 40px;
		color: var(--color-dark-grey);
	}
	
	.notice-footer {
		text-align: right;
		margin: 20px 0;
	}
	
	.notice-footer button{
		margin-left: 20px;
		width: 50px;
		height: 30px;
		border: 1px solid var(--color-dark-red);
		color: var(--color-dark-red);
		border-radius: 5px;
		transition: all 0.5s;
	}
	
	.notice-footer button:hover {
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
	<div class="notice-insert-box">
		<div class="insert">
			<h2>
				<img class="notice-icon" src="${pageContext.request.contextPath }/resources/icon/clipboard-regular.svg" alt="게시글 아이콘">
			공지사항 등록
			</h2>
		</div>
		<!-- 에디터 사용 -->
		<form action="${pageContext.request.contextPath}/admin/noticeInsert" method="POST" onsubmit="return noticeCheck();">
			<input type="text" id="noticeTitle" name="noticeTitle" placeholder="제목을 입력해주세요.">
			<textarea name="noticeContent" id="editor"></textarea>
			
		    <!-- hidden -->
		    <input type="hidden" name="memberId" value="${memberInfo.memberId }">
			<input type="hidden" name="companyId" value="${memberInfo.companyId}">
			<div class="notice-footer">
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/noticeList'">목록</button>
		    	<button type="submit">등록</button>			
			</div>
    	</form>
	</div>
	
	<script>
	function noticeCheck(){
		var noticeTitle = document.getElementById("noticeTitle").value;
		var editorData = editor.getData();
		
		console.log(noticeTitle);
		console.log(editorData);
		
	    if (noticeTitle.trim() === "") {
	        alert("제목을 입력해주세요.");
	        return false;
	        }
	    
	    if (editorData.trim() === "") {
	        alert("내용을 입력해주세요.");
	        return false;
	        }
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