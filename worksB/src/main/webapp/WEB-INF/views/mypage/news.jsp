<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.news-title {
	    margin: 0;
	    color: var(--color-dark-grey);
	    font-size: var(--font-regular);
	    padding: 0 30px;
	    margin: 30px 0;
	}
	
	.main-box {
		width: 85%;
		margin: 0 auto 50px;;
		color: var(--color-dark-grey);
		font-size: var(--font-regular);
	}
	
	.main-box h2 {
		margin: 10px 0;
		font-size: 30px;
		font-weight: var(--weight-bold);
		color: var(--color-orange);
	}
		
	.d-flex {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.main-box-content {
		margin: 0 20px;
	}
	
	.content-left-item, .content-right-item {
		border: 1px solid var(--color-dark-beigie);
		background-color: var(--color-light-beigie);
		border-radius: 10px;
		height: 450px;	
		padding: 0 15px;
		margin: 10px 20px;
	}
	
	.main-box-content a{
		font-size: var(--font-small);
		margin: 5px 0;
	}
	
	.newsTitle {
		padding: 10px 0;
	}
	
	.newsTitle:hover {
		background-color: var(--color-dark-beigie);
	}
</style>
</head>
<body>
	<h1 class="news-title">오늘의 뉴스</h1>
	<div class="main-box">
		<div class="main-box-content d-flex">
			<div class="main-box-content-left">
				<ul>
					<li class="content-left-item">
						<h2>속보</h2>		
						<div id="newsMain">
						</div>
					</li>
					<li class="content-left-item">
						<h2>경제</h2>
						<div id="economyNews">
						</div>
					</li>
				</ul>
			</div>
			<div class="main-box-content-right">
				<ul>
					<li class="content-right-item">
		            	<h2>사회</h2>
			            <div id="socialNews">
						</div>
					</li>
					<li class="content-right-item">
						<h2>정치</h2>
						<div id="politicNews">
						</div>
					</li>
				</ul>
			</div>
		</div>
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