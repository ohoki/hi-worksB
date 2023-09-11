<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 <link rel="stylesheet" href="/resources/demos/style.css">
 
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="sform" name="searchcategories" action="${pageContext.request.contextPath}/admin/searchByDate">
<%-- 		<input type="hidden" name="searchkeyword" value="${searchkeyword }"> --%>
<%--     	<input type="hidden" name="searchBoardType" id="b-type" value="${boardType }"> --%>
    	<input type="hidden" name="startDate" id="start-date">
    	<input type="hidden" name="endDate" id="end-date">
		<input type="hidden" name="nowPage" value="1">
	</form>

	<div>
		<p>파일 다운로드 이력</p>
	</div>
		<div id="pick-date">
<!-- 		날짜에 관한 것 -->
			<input type="text" id="start-datepicker">
			<input type="text" id="end-datepicker">
		</div>
	<table>
		<thead>
			<tr>
				<td>다운로드일시</td>
				<td>파일명</td>
				<td>용량</td>
				<td>이용자아이디</td>
				<td hidden>다운로드기기</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<td><fmt:formatDate value="${list.fileRegdate }" pattern="YY/MM/dd HH시mm분" type="date"/></td>
					<td>${list.fileName }</td>
					<td>${list.convertedSize }</td>
					<td>${list.memberId }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
		<div class="paging" style="text-align: center">
					<!-- 이전 --> 
				<c:if test="${paging.startPage!=1 } " >
					<a href="javascript:search(${paging.startPage - 1 })">&lt이전</a>
				</c:if>
					<!-- View 안에 보여지는 페이지들 --> 
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p eq paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:otherwise>
							<a href="javascript:search(${p })">${p }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
					<!-- 다음 --> 
				<c:if test="${paging.endPage != paging.lastPage }">
					<a href="javascript:search(${paging.endPage + 1 })">다음&gt</a>
				</c:if>
			</div>
</body>
<script type="text/javascript">
	function search(p){
		if($('#start-datepicker').val()==null){
			location.href="${pageContext.request.contextPath }/admin/downloadlist?nowPage="+p
		}
		searchcategories.nowPage.value=p;
		searchcategories.submit();
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
		                	saveDatesToSessionStorage();
			                $('#end-date').val(end)
			                $('#start-date').val(start)
			                $('#sform').submit();     	
		                }
						
				}
	    });
		  } );
	 $('#end-datepicker').datepicker('setDate', 'today')
	 
	 
	 // 시작일과 종료일을 세션에 저장
	function saveDatesToSessionStorage() {
	    const start = $('#start-datepicker').val();
	    const end = $('#end-datepicker').val();
	    sessionStorage.setItem('startDate', start);
	    sessionStorage.setItem('endDate', end);
	}
	
	// 페이지 로드 시 세션에서 시작일과 종료일을 가져와 input에넣기
	function loadDatesFromLocalStorage() {
	    const start = sessionStorage.getItem('startDate');
	    const end = sessionStorage.getItem('endDate');
	    if (start && end) {
	        $('#start-datepicker').val(start);
	        $('#end-datepicker').val(end);
	        $('#start-date').val(start);
	        $('#end-date').val(end);
	    }
	}


	// 페이지 로드 시 시작일과 종료일을 세션서 가져와 입력란에 채우기
	$(document).ready(function() {
		loadDatesFromLocalStorage();
	});
</script>
</html>