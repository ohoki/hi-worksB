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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script></style>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<form id="sform" name="searchcategories" method="post" action="${pageContext.request.contextPath}/searchByDate">
		<input type="hidden" name="searchkeyword" value="${searchkeyword }">
    	<input type="hidden" name="searchBoardType" id="b-type" value="${boardType }">
    	<input type="hidden" name="startDate" id="start-date">
    	<input type="hidden" name="endDate" id="end-date">
	</form>
	
	<p id="search-result">" ${searchkeyword } "의 검색결과</p>
	<div style="border:solid black 1px;">
	<a onclick="searchType('${searchkeyword }',3)">전체</a>
	<a onclick="searchType('${searchkeyword }',1)">프로젝트</a>
	<a onclick="searchType('${searchkeyword }',2)">사내게시판</a>
	</div>
	
	
	<p id="prj-list"></p>
	<div style="border:solid black 1px;">
		<c:forEach items="${prjList }" var="list">
			<ul style="border:dotted black 1px;" onclick="moveToPrj(${list.projectId})">
				<li>${list.boardType } 제목: ${list.prjBoardTitle }</li>
				<li>${list.memberName } <fmt:formatDate value="${list.prjBoardRegdate }" pattern="YY/MM/dd" type="date"/> 프로젝트이름:${list.projectName }</li>
			</ul>
		</c:forEach>
		<div id="pick-date">
<!-- 		날짜에 관한 것 -->
			<input type="text" id="start-datepicker">
			<input type="text" id="end-datepicker">
		</div>
	</div>
	
	
	<div style="border:solid black 1px;">
		<p id="board-list"></p>
		<div>
			<p id="club-list"></p>
			<c:forEach items="${clubList }" var="list">
				<ul style="border:dotted black 1px;">
					<li>제목 :${list.boardTitle }</li>
					<li>${list.memberId } <fmt:formatDate value="${list.boardRegdate }" pattern="YY/MM/dd" type="date"/></li>
				</ul>
			</c:forEach>
		</div>
		<div>
			<p id="notice-list"></p>
			<c:forEach items="${noticeList }" var="list">
				<ul style="border:dotted black 1px;" onclick="moveToNotice(${list.noticeId})">
					<li>제목 :${list.noticeTitle }</li>
					<li><fmt:formatDate value="${list.boardRegdate }" pattern="YY/MM/dd" type="date"/></li>
				</ul>
			</c:forEach>
		</div>
		<div>
			<p id="carpool-list"></p>
			<c:forEach items="${carpoolList }" var="list">
				<ul style="border:dotted black 1px;" onclick="moveToCarpool(${list.boardId})">
					<li>제목 :${list.boardTitle }</li>
					<li>${list.memberId } <fmt:formatDate value="${list.boardRegdate }" pattern="YY/MM/dd" type="date"/></li>
					<li>출발:${list.departure } 도착:${list.arrival }</li>
				</ul>
			</c:forEach>
		</div>
		<div id="pick-date">
<!-- 		날짜에 관한 것 -->
			<input type="text" id="start-datepicker">
			<input type="text" id="end-datepicker">
		</div>
	</div>
	
	

</body>
<script>
//mapper에서 빈 값이 넘어와도 null조건을 충족시키지 않기 때문에 특정 컬럼에 대한 검수가 필요
	if(${prjList[0].projectId ne null}){
		$('#prj-list').text('프로젝트')
	}

	if(${clubList[0].boardId ne null}){
		$('#board-list').text('사내게시판')
		$('#club-list').text('--동호회게시판')
	}
	if(${noticeList[0].noticeId ne null}){
		$('#board-list').text('사내게시판')
		$('#notice-list').text('--공지사항')
	}
	if(${carpoolList[0].boardId ne null}){
		$('#board-list').text('사내게시판')
		$('#carpool-list').text('--카풀게시판')
	}
	//클릭 시 개별 프로젝트로 이동
	function moveToPrj(prjId){
		location.href="${pageContext.request.contextPath}"+"/projectFeed?projectId="+prjId
	}
	//클릭 시 개별 공지로 이동
	function moveToNotice(noticeId){
		location.href="${pageContext.request.contextPath}"+"/noticeInfo?noticeId="+noticeId
	}
	//클릭시 개별 카풀게시판으로 이동
	function moveToCarpool(boardId){
		location.href="${pageContext.request.contextPath}"+"/carpoolInfo?boardId="+boardId
	}
	
	
	//결과에 대한 재검색
	function searchType(searchkeyword,boardtype){
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
	            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	            ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
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
	            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	            ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
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
</script>
</html>