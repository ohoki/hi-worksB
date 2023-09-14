<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#search-result {
	    margin: 0;
	    color: var(--color-dark-grey);
	    font-size: var(--font-regular);
	    padding: 0 30px;
	    margin: 30px 0;
	}
	
	.search-main-box {
		width: 70%;
		margin: 0 auto;
		color: var(--color-dark-grey);
		font-size: 18px;
		margin-bottom: 50px;
	}
	
	.search-filter a {
		cursor: pointer;
		margin-right: 20px;
		font-weight: var(--weight-bold);
	}
	
	.search-filter a:hover, .search-filter a.active {
		color: var(--color-dark-red);
	}
	
	.d-flex {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	#pick-date {
		font-weight: var(--weight-bold);
		font-size: var(--font-micro);
	}
	
	#pick-date input {
		margin-left: 10px;
		border: 1px solid var(--color-dark-beigie);
		width: 150px;
		height: 25px;
	}
	
	#prj-list, #board-list {
		margin: 20px 0;
		padding-bottom: 10px;
		border-bottom: 1px solid var(--color-dark-beigie);
		font-size: 18px;
	}
	
	.search-prj-lists li {
		margin: 10px 0;
		border: 1px solid var(--color-dark-beigie);
		cursor: pointer;
		padding: 20px;
		border-radius: 10px;
	}
	
	.search-prj-lists li:hover {
		border: 1px solid var(--color-dark-red);
	}
	
	.search-prj-lists li span{
		font-weight: var(--weight-bold);
	}
	
	.search-prj-list-title {
		color: var(--color-blue);
	}
	
	.search-notice-list-title {
		color: var(--color-green);
	}
	
</style>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<h1 id="search-result">" ${searchkeyword } "의 검색결과</h1>
	<div class="search-main-box">
		<form id="sform" name="searchcategories" method="post" action="${pageContext.request.contextPath}/searchByDate">
			<input type="hidden" name="searchkeyword" value="${searchkeyword }">
	    	<input type="hidden" name="searchBoardType" id="b-type" value="${boardType }">
	    	<input type="hidden" name="startDate" id="start-date">
	    	<input type="hidden" name="endDate" id="end-date">
		</form>

		<div class="search-filter d-flex">
			<div>
				<a onclick="searchType('${searchkeyword }', 3)">전체</a>
				<a onclick="searchType('${searchkeyword }', 1)">프로젝트</a>
				<a onclick="searchType('${searchkeyword }', 2)">사내게시판</a>
			</div>
			<!-- 날짜 검색 -->
			<div id="pick-date">
				<span>기간 검색</span>
				<input type="text" id="start-datepicker">
				<span style="margin-left: 10px;">~</span>
				<input type="text" id="end-datepicker">
			</div>
		</div>
		
		<h2 id="prj-list"></h2>
		<div>
			<ul class="search-prj-lists">
				<c:forEach items="${prjList }" var="list">
					<li onclick="moveToPrj(${list.projectId},'${list.boardType }',${list.prjBoardId })" class="d-flex">
						<div>
							<c:choose>
								<c:when test="${list.boardType eq 'C5'}">
									<span class="search-prj-list-title">[게시글]</span>
								</c:when>
								<c:when test="${list.boardType eq 'C6'}">
									<span class="search-prj-list-title">[일정]</span>
								</c:when>					
								<c:when test="${list.boardType eq 'C7'}">
									<span class="search-prj-list-title">[투표]</span>
								</c:when>					
								<c:when test="${list.boardType eq 'C8'}">
									<span class="search-prj-list-title">[업무]</span>
								</c:when>
							</c:choose>
							<div><span>프로젝트명 :</span> ${list.projectName }</div>
							<div><span>제목 :</span> ${list.prjBoardTitle }</div>
						</div>
						<div style="text-align: right;">
							<div>
								작성자 : ${list.memberName }
							</div>
							<div>
							 	<fmt:formatDate value="${list.prjBoardRegdate }" pattern="YY/MM/dd" type="date"/>
							</div>
						</div>
					</li>
				</c:forEach>	
			</ul>
		</div>
		
		<h2 id="board-list"></h2>
		<div>
			<ul class="search-prj-lists">
				<c:forEach items="${noticeList }" var="list">
					<li onclick="moveToNotice(${list.noticeId})" class="d-flex">
						<div>
							<span class="search-notice-list-title">[사내공지]</span>
							<div><span>제목 :</span> ${list.noticeTitle }</div>
						</div>
						<div style="text-align: right;">
							<div>
								작성자 : ${list.memberName }
							</div>
							<div>
							 	<fmt:formatDate value="${list.boardRegdate }" pattern="YY/MM/dd" type="date"/>
							</div>
						</div>
					</li>
				</c:forEach>
				<c:forEach items="${carpoolList }" var="list">
					<li onclick="moveToCarpool(${list.boardId})" class="d-flex">
						<div>
							<span class="search-notice-list-title">[같이타요]</span>
							<div><span>제목 :</span> ${list.boardTitle }</div>
							<div><span>시간 :</span> ${list.departure } ~ <span>${list.arrival }</span></div>
						</div>
						<div style="text-align: right;">
							<div>
								작성자 : ${list.memberName }
							</div>
							<div>
							 	<fmt:formatDate value="${list.boardRegdate }" pattern="YY/MM/dd" type="date"/>
							</div>
						</div>
					</li>
				</c:forEach>	
			</ul>
		</div>
	</div>
</body>
<script>
	$(window).on('load', function() {
		if('${boardType}' == 1) {
			$('.search-filter a').eq(1).addClass('active');
		} else if('${boardType}' == 2) {
			$('.search-filter a').eq(2).addClass('active');
		} else {
			$('.search-filter a').eq(0).addClass('active');
		}
	});

//mapper에서 빈 값이 넘어와도 null조건을 충족시키지 않기 때문에 특정 컬럼에 대한 검수가 필요
	if(${prjList[0].projectId ne null}){
		$('#prj-list').text('프로젝트')
	}
	if(${noticeList[0].noticeId ne null}){
		$('#board-list').text('사내게시판')
	}
	if(${carpoolList[0].boardId ne null}){
		$('#board-list').text('사내게시판')
	}
	//클릭 시 개별 프로젝트로 이동
	function moveToPrj(prjId,boardType,boardId){
		location.href="${pageContext.request.contextPath}"+"/projectFeed?projectId="+prjId+"#"+boardType+boardId;
		console.log(boardType)
		console.log(boardId)
	}
	//클릭 시 개별 공지로 이동
	function moveToNotice(noticeId){
		location.href="${pageContext.request.contextPath}"+"/member/noticeInfo?noticeId="+noticeId
	}
	//클릭시 개별 카풀게시판으로 이동
	function moveToCarpool(boardId){
		location.href="${pageContext.request.contextPath}"+"/member/carpoolInfo?boardId="+boardId
	}
	
	
	//결과에 대한 재검색
	function searchType(searchkeyword,boardtype, tag){
		location.href="${pageContext.request.contextPath}"+"/searchboard?searchkeyword="+searchkeyword+"&searchBoardType="+boardtype
	}
	
	//datepicker시작일
	 $( function() {
	    $('#start-datepicker').datepicker({
	    	dateFormat: 'yy-mm-dd' //달력 날짜 형태
	            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	            ,changeYear: true //option값 년 선택 가능
	            ,changeMonth: true //option값  월 선택 가능                
	            ,buttonText: "선택" //버튼 호버 텍스트              
	            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	    		,onSelect:function(d){
	                $('#start-datepicker').val(d)
	    		}
	    });
		  } );
	 $('#start-datepicker').datepicker('setDate', 'today')
	 
	 
	 //종료일
	  $( function() {
	    $('#end-datepicker').datepicker({
	    	dateFormat: 'yy-mm-dd' //달력 날짜 형태
	            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	            ,changeYear: true //option값 년 선택 가능
	            ,changeMonth: true //option값  월 선택 가능                
	            ,buttonText: "선택" //버튼 호버 텍스트              
	            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
				,onSelect:function(d){
		                $('#end-datepicker').val(d)
		                let start=$('#start-datepicker').val()
		                let end=$('#end-datepicker').val()
		                if(start==0){
		                	alert('시작일을 먼저 선택해 주세요')
		                	
		                }else if(start>end){
		                	alert('시작일을 잘못 입력하였습니다')
		                }else{
			                $('#end-date').val(end)
			                $('#start-date').val(start)
			                $('#sform').submit();     	
		                }
						
				}
	    });
		  } );
	 $('#end-datepicker').datepicker('setDate', 'today')

	 
	 sessionStorage.removeItem('startDate'); // 시작일 데이터 삭제
	sessionStorage.removeItem('endDate'); // 시작일 데이터 삭제

</script>
</html>