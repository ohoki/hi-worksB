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
속보
	<div id="newsMain">

	</div>
	<br>
	경제
	<div id="economyNews">
	</div>
	<br>
	사회
	<div id="socialNews">
	</div>
	<br>
	정치
	<div id="politicNews">
	</div>
</body>
<script>
	let news = ${news}
    let economic = ${economicNews}
    let socialNews = ${socialNews}
    let politicNews = ${politicNews}
    
	function NewsLoad(news, newsItem){
		let mainContainer = $(news)		
        for(let i=1;i<6;i++){
        	let title = newsItem.items[i].title
        	let link = newsItem.items[i].link
        	let sub = newsItem.items[i].description
        	
        	//뉴스 구획
        	let divTag = $('<div></div>')
        	divTag.attr('id','news-'+i)
        	let aTag = $('<a target="_black"></a>')
        	aTag.attr('href',link)
        	
        	//뉴스 제목
        	let divTitle = $('<div></div>')
        	divTitle.attr('class','newsTitle').append(title)
        	divTag.append(divTitle)
        	aTag.append(divTag)
            mainContainer.append(aTag)
            
        }
	}

    NewsLoad('#newsMain', news);
    NewsLoad('#economyNews', economic);
    NewsLoad('#socialNews', socialNews);
    NewsLoad('#politicNews', politicNews);
</script>
</html>