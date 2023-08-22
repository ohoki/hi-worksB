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
body {
	margin: 0 auto;
	font-size: small;
}

.body {
	width: 800px;
	margin: 0 auto;
}

.top {
	margin-bottom: 80px;
}

.table {
	width: 800px;
}

.table__title{
	font-size: small;
	text-align: left;
	height: 40px;
}

.main__p {
	font-size: larger;
	font-weight: bolder;
}

div h2 {
	margin-top: 51px;
	text-align: center;
}

.content {
	float: left;
	width: 800px;
	padding: 2px;
	border-bottom: 1px solid rgb(174, 213, 245);
	border-top: 1px solid rgb(174, 213, 245);
	
}

.buttonss {
	width: 800px;
	height: 50px;
	border-bottom: 1px solid rgb(174, 213, 245);
}

.button1 {
	float: left;
	margin-top: 5px;
	color: black;
}

.buttons {
	float: right;
	width: 103px;
	margin-top: 5px;
}

.buttons :first-child {
	float: left;
	margin-right: 3px;
}

.buttonss__button {
	background-color: rgb(174, 213, 245);
    border-radius: 5px;
    color: white;
    width: 50px;
    height: 30px;
    font-weight: bold;
}

.table__title :first-child {
	display: inline-block;
	line-height: 26px;
	width: 40px;
	height: 25px;
	text-align: center;
	background: rgb(174, 213, 245);
	border: 1px solid rgb(174, 213, 245);
	border-radius: 5px;
	
}

.table__title :last-child {
	border: 1px solid rgb(174, 213, 245);
	border-radius: 3px;
	width: 757px;
	height: 25px;
}

	.ck.ck-editor {
    	width: 817px;
    	margin: 0 auto;
    	board: 0;
	}
	.ck-editor__editable {
		margin: 0 auto;
	    min-height: 300px;
	    width: 800px;
	}


</style>
</head>
<body>
	<div class="top">
		<h2>공지사항 작성</h2>
	</div>
		<!-- 에디터 사용 -->
		<form action="noticeInsert" method="POST">
			<label id="noticeTitle">제목 </label>
			<input type="text" name="noticeTitle">
			<textarea name="noticeContent" id="editor"></textarea>
			
		    <!-- hidden -->
		    <input type="hidden" name="memberId" value="${memberInfo.memberId }">
			<input type="hidden" name="companyId" value="${memberInfo.companyId}">
			
			<button type="button" onclick="location.href='noticeList'">목록</button>
		    <input type="submit" value="작성">
    	</form>
    		<!-- api -->
			<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
			<!-- 한글 적용 -->
			<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
		<script>
		  ClassicEditor
		    .create( document.querySelector( '#editor' )
		    		
		    		
		    		
		    		
		    		
		    		
		    		
		    		
		    		
		    		/* , {
		    	language: 'ko' ,
		    	toolbar:{
		    		items:[
		    			'heading'
		    			'|'
		    			'fontSize',
		    			'fontFamily',
		    			'fontColor',
		    			'fontBackgroundColor'
		    		]
		    	},
		    	fontFamily: {
		    		option:[
		    			'default',
		    			'궁서체',
		    			'바탕',
		    			'돋움'
		    		]
		    		
		    	}
		    }) */
		    /* 플러그 작동이 안됨... 나중에 추가 */
/* 		    .catch( error => {
		      console.error( error );
		    } ); */

/* 		 , {
			 ckfinder: {
					uploadUrl: '/ajax/image.do'
				},
				toolbar:{
					items:[
						'heading',
						'|',
						'fontSize',
						'fontColor',
						'fontFamily',
						'fontBackgroundColor'
					]
				
				}
		 }; */
		</script>
</body>
</html>