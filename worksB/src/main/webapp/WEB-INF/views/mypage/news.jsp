<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="newsMain">

	</div>
</body>
<script>
	var news = ${news}
	console.log(news);
	function newsLoad(){
		var mainContainer = document.getElementById('news-Main')		
        for(let i=1;i<6;i++){
            let divTag = document.createElement('div')
            mainContainer.appendChild(divTag).setAttribute('id','news-Main__news-div'+i)
            for(let j=0;j<2;j++){
                let divTag = document.createElement('div')
                let newDiv = document.getElementById('news-Main__news-div'+i)
                let title = document.createElement('h3')
                newDiv.appendChild(divTag)
                //for(let k=0;k<)
            }
        }

	}
    newsLoad();
</script>
</html>