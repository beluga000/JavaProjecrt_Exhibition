<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.qna_delBtn').hover(function(){
		$(this).css('cursor', 'pointer')
	})
	
	$('.qna_delBtn').click(function(){
		let gano = $(this).attr('data-gano')
		$.ajax({
			type:'post',
			url:'../mypage/mypage_myqna_delete.do',
			data:{"gano": gano},
			success:function(response){
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.myqna_page').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../mypage/mypage_myqna_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.myqna_page_pre').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../mypage/mypage_myqna_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	
	$('.myqna_page_next').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../mypage/mypage_myqna_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
})
</script>
<style type="text/css">
.mypage_home_title {
	margin: 0px;
	margin-bottom: 10px;
	padding-bottom: 15px;
	border-bottom: 2px solid #E2E2E2;
}
.mypage_home_content {
	margin: 0px;
}
.mypage_home_subtitle {
	color: #27375C;
}
.rst {
	width:70px;
	hiegh:30px;
	color: #fff;
	border-radius: 5px;
	font-size: 15px;
	padding: 5px 7px;;
}
.origin {
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}

#page_ul {
	list-style: none;
	display: block;
	text-align: center;
	margin-top: 35px;
}
.page_li {
  	display: inline-block;
}

.page_a {
    transition: all 100ms ease-in-out 0s;
    background-color: #dcdce0;
    border-radius: 5px 5px 5px 5px;
    color: #69696E;
    display: block;
    font: 12px/30px Arial, sans-serif;
    height: 30px;
    margin: 0px;
    overflow: hidden;
    text-align: center;
    text-decoration: none;
    width: 30px;
}

.page_a:hover {
    background-color: #27375C;
    color: #FFFFFF;
}
.page_li.active page_a {
    background-color: #27375C;
    color: #FFFFFF;
}
.page_li.active page_a:hover {
    color: #FFFFFF;
}
</style>
</head>
<body>
		<div class="col-11 mypage_home_title">
			<h4 class="mypage_home_subtitle">내가 쓴 게시글</h4>
		</div>
		<div class="col-11 mypage_home_content">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<th width="10%" class="text-center">no</th>
					<th width="40%" class="text-center">제목</th>
					<th width="15%" class="text-center">유형</th>
					<th width="15%" class="text-center">작성일</th>
					<th width="10%" class="text-center">답변상태</th>
					<th width="10%" class="text-center">삭제여부</th>
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr style="vertical-align: middle;">
					<td width="10%" class="text-center origin" >${vo.gano }</td>
					<td width="40%" class="text-center origin">${vo.subject }</td>
					<td width="15%" class="text-center origin">${vo.type }</td>
					<td width="15%" class="text-center origin">${vo.regdate }</td>
					<td width="10%" class="text-center origin">${vo.ans_state }</td>
					<td width="10%" class="text-center">
						<span data-gano="${vo.gano }" class="rst qna_delBtn" style="background-color: gray;">삭제</span>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
			<ul id="page_ul" style="padding-left: 0px; padding-right: 90px">
		    	<c:if test="${startPage>1 }">
		          <li class="page_li"><span class="myqna_page_pre page_a" data-page="${startPage-1 }" style="font-size: 10px; width: 20px">◀</span></li>
		        </c:if>
		        <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <li class="page_li" ${i==curpage?"class=active":"" }><span class="myqna_page page_a" data-page="${i }">${i }</span></li>          
		        </c:forEach>    
		        <c:if test="${endPage<totalpage }">
		          <li class="page_li"><span class="myqna_page_next page_a" data-page="${endPage+1 }" style="font-size: 10px; width: 20px">▶</span></li>
		        </c:if>
		    </ul>
</body>
</html>