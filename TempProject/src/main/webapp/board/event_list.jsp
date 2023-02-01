<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>


<!-- 게시판 start -->



  <div style="height: auto;">

	<!-- 이벤트 리스트 start -->
<div class="wrapper row3">
  <main class="container clear">
  <div style="height: 120px;">
  
  
  </div>

  <div>
  <h2>Event</h2>
  <h6>이벤트</h6>
  </div>
  <div style="height: 20px"></div>
    <div>
  	<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="0">전체</option>
								<option value="bbsTitle">진행중</option>
								<option value="userID">종료</option>
						</select></td>
					</tr>

				</table>
  </div>
  <div style="height: 50px;"></div>
  
  <div class="row g-3 justify-content-center">
  	<c:forEach var="vo" items="${list }" begin="1" end="9" step="1">
  		<div class="col-lg-4 col-md-6">
  		<div class="inner">
  			<div class="course-item bg-white">
  				<div class="position-relative overflow-hidden">
  				<img class="img-fluid-2" src="${vo.poster }"style="width: 100%;height: 100%">
  				</div>
  				<div class="text-left py-3 px-2">
  				<span class="frame"></span>
  				<span class="tit_event">${vo.subject }</span>
  				<div class="box_info">
             <p class="info">
             <span class="tit_info">${vo.event_date }</span>
             </p>
             <p class="info">
             <span class="tit_info">${vo.progress_status }</span>
             </p>
             </div>
             </div>
  			</div>
  			</div>
  			
  		</div>
  	</c:forEach>
  </div>

	<!-- 이벤트 리스트 end --> 

  </div>
  
  <div style="height: 50px;"></div>
  
   <nav class="pagination">
        <ul>
         <c:if test="${startPage>1 }">
          <li><a href="../board/event_list.do?page=${startPage-1 }">&laquo; Previous</a></li>
         </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":"" }><a href="../board/event_list.do?page=${i }">${i }</a></li>
          </c:forEach>
         <c:if test="${endPage<totalpage }">
          <li><a href="../board/event_list.do?page=${endPage+1 }">Next &raquo;</a></li>
         </c:if>
        </ul>
        <!-- 검색바 start -->
        <div class="board_search">
        <div class="container">
		<div class="row">
			<form method="post" name="search" action="searchbbs.jsp" pos>
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="bbsTitle">제목</option>
								<option value="userID">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	</div>
        <!-- 검색바 end -->
      </nav>
  </main>
</div>

<!-- 게시판 end -->

    


     <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>
</html>