<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
	background-color: rgba(225, 239, 251);
	padding-left: 15px;
	border-radius: 3px;
}

.contents {
	width: 800px;
	height: 30px;
}

.main {
	padding-bottom: 20px;
}

.main__p {
	font-size: larger;
	font-weight: bolder;
}

.writer {
	width: 90px;
	float: left;
	height: 70px;
	display: flex;
	align-items: center;
}

.writer__p {
	
}

div h2 {
	text-align: center;
}

.date {
	width: 700px;
	float: right;
	height: 20px;
}

.date__date {
	text-align: right;
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
/* #employee-modal{ */
/* 	display:hidden; */
/* } */
</style>
</head>
<body>
	<div class="top">
		<h2>카풀게시판</h2>
	</div>
	<div class="body">
		<form action="carpoolInfo" method="post">
			<table class="table">
				<thead>
					<tr class="main__p">
						<th class="table__title">
						<c:choose>
							<c:when test="${carpoolInfo.category eq 'B1' }">
								[태워드립니다] 
							</c:when>
							<c:otherwise>
								[태워주세요] 
							</c:otherwise>
						</c:choose>
							${carpoolInfo.boardTitle }
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="contents">
								<div class="writer">
									<p class="writer__p">${carpoolInfo.memberName}</p>
								</div>
								<div class="date">
									<p class="date__date">조회수 ${carpoolInfo.boardHit } | <fmt:formatDate value="${carpoolInfo.boardRegdate}" pattern="yyyy/MM/dd HH:mm:ss"/></p>
								</div>
								<div class="date">
									<p class="date__date"><fmt:formatDate value="${carpoolInfo.boardUpddate }" pattern="yyyy/MM/dd" /></p>
								</div>
							</div>
							<div class="content">
								<p class="content__text">
									${carpoolInfo.boardContent }
								</p>
								<p>
									출발 : ${carpoolInfo.departure } 
								</p>
								<p>
									도착 : ${carpoolInfo.arrival } 
								</p>
								<p>탑승 인원 수 : ${carpoolInfo.passenger }</p>
								<p>출발 시간 : <fmt:formatDate value="${carpoolInfo.departureDate }" pattern="yyyy/MM/dd HH:mm"/></p>
							</div>							
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div>
			<button onclick="participate('${carpoolInfo.boardId}',${carpoolInfo.passenger },${ participantsCounting},'${carpoolInfo.memberId }','${memberId }')">참여하기</button>
			<button onclick="cancel('${carpoolInfo.boardId}','${memberId}')">취소하기</button>
			<div id="participants">
				<c:forEach items="${ participantList}" var="list">
					<p class="m-info" data-id="${list.memberId }">${list.memberName }</p>
				</c:forEach>
			</div>
		</div>
		<div class="buttonss">
			<div class="button1">
				<button type="button" class="buttonss__button" onclick="location.href='carpoolList'">목록</button>
			</div>
			<div class="buttons">
				<c:if test="${memberInfo.memberId eq carpoolInfo.memberId}">
				<button type="button" class="buttonss__button" onclick="location.href='carpoolUpdate?boardId=${carpoolInfo.boardId}'">수정</button>
				<button type="button" class="buttonss__button" onclick="location.href='carpoolDelete?boardId=${carpoolInfo.boardId}'">삭제</button>
				</c:if>
			</div>
		</div>
		

		
		<!-- 아래부터 댓글 공간 -->
		<div>
			<form>
				<table>
					<thead>
						<tr>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tr>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
	function participate(boardId,available,counted,writer,memberId){
		if(writer==memberId){
			alert('작성자는 신청하지 못합니다')
			return;
		}

		let requestList=[];
		let countChildren=$('#participants').children()
		requestList.length=countChildren.length
		if(requestList.length==0){
			
		}
		for(let i=0;i<requestList.length;i++){
			if(memberId==$('.m-info').data('id')){
				alert('이미 신청하였습니다.')
				return;
			}
		}

		if(available<=counted){
			alert('마감되었습니다.')
			return;
		}
		$.ajax({
			url:"${pageContext.request.contextPath }/applyCarpool",
			data:{'boardId':boardId},
			method:'GET'
		})
		.done(data=>{
			let pTag=$('<p>').text(data.memberName);
			pTag.addClass('m-info');
			pTag.attr('data-id', data.memberId);
			$('#participants').append(pTag)
		})
		.fail(reject=>{
			console.log(reject)
		})
	}
	$('.m-info').click(function(){
		
	})
	
	function cancel(boardId,memberId){
		let pList=[];
		pList.length=$('[data-id]').length;
		let count=pList.length;
		//참여자인원수만큼포문돌리기
		for(let i=0;i<pList.length;i++){
			let cancelData=$('[data-id]')[i];		
			console.log($('.m-info').data('id'))
			//로그인한 아이디와 일치하는지 확인
			if($('.m-info').data('id')==memberId){
				$.ajax({
					url:'${pageContext.request.contextPath }/cancelCarpool',
					data:{'boardId':boardId},
					method:'GET'
				})
				.done(data=>{
					if(data==null){
						alert('취소를 실패했습니다.다시 시도해 주세요');
						count--;
					}
					cancelData.remove();	
				})
				.fail(reject=>{
					console.log(reject)
				})
				return;
			}
		}
		if(count==pList.length){
			alert('참여신청을 하지 않았습니다')		
		}

		
	}
</script>
</html>