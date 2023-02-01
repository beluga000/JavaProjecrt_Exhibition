<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
let fileIndex=0
$(function(){
	$('#addBtn').click(function(){
		$('#fplus').append(
			'<tr id="fp'+fileIndex+'">'
			+'<th width=15%></th>'
			+'<td><input type=file name=upload size=20 class="input-sm"></td>'
			+'</tr>'
		)
		fileIndex++
	})
	$('#delBtn').click(function(){
		if(fileIndex>0){
			$('#fp'+(fileIndex-1)).remove()
			fileIndex--
		}
	})
})
</script>
</head>
<body>
	<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">고객센터</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a class="text-white" href="../main/main.do">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="../service/main.do">고객센터</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">문의 작성</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->
    
	<div class="container" style="width:700px">
	<div style="height: 5px"></div>
	<div class="row">
	  <form method=post action="../service/insert_ok.do" enctype="multipart/form-data">
		<table class="table">
<!-- 문의 전 f10 확인 추가? -->
		  <tr>
		  	<th width=15%>문의유형</th>
		  	<td width=85%>
		  		<input type=text name=type size=20 class="input-sm" required placeholder="회원/예매/결제/티켓/기타">
		  	</td>
		  </tr>
		  <tr>
		  	<th width=15%>제목</th>
		  	<td width=85%>
		  		<input type=text name=subject size=45 class="input-sm" required>
		  		<input type=hidden name=id size=45 value="${sessionScope.id }" required>
		  	</td>
		  </tr>
		  <tr>
		  	<th width=15%>내용</th>
		  	<td width=85%>
		  		<textarea rows=10 cols=50 name=content required></textarea>
		  	</td>
		  </tr>
		  <tr>
		  	<th width=15%>첨부파일</th>
		  	<td width=85%>
		  		<input type=file name=upload size=20 class="input-sm">
		  		<input type=button class="btn btn-sm btn-success" id=addBtn value="추가">
		  		<input type=button class="btn btn-sm btn-success" id=delBtn value="삭제">
		  	</td>
		  </tr>
		  <tbody id=fplus>
		  
		  </tbody>
		  <tr>
		  	<th width=15%>비밀번호</th>
		  	<td width=85%>
		  		<input type=password name=pwd size=10 class="input-sm" required>
		  	</td>
		  </tr>
		  <tr>
		  	<th width=15%>답변알림</th>
		  	<td width=85%>
		  		<input type=checkbox>이메일로 답변 받기&nbsp;&nbsp;
		  		<input type=checkbox>답변 시 SMS로 알림 받기
		  	</td>
		  </tr>
<!-- 추가하려면 컬럼도 추가해야 할 듯?.. 그건좀.. -->
		  <tr>
		  	<td colspan=2 class="text-center" style="border-color: white">
		  		<input type=submit value="글쓰기" class="btn btn-sm btn-primary">
		  		<input type=button value="취소" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
		  	</td>
		  </tr>
		</table>
	  </form>
	</div>
	</div>
</body>
</html>