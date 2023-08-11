<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 성공 화면</title>
</head>
<body>
	<script>
		$(window).on('load', function() {
			alert('${message}');
			
			window.open('about:blank','_self').close();
		});
	</script>
</body>
</html>