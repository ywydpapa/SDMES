<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="path" value ="${pageContext.request.contextPath}"/>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>  
<!DOCTYPE html>
<html style="overflow-x: hidden;" lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="djkim">
  <title>SDMES</title>
  <!-- Bootstrap core CSS -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href=”${path}/css/bootstrap.vertical-tabs.min.css” rel=”stylesheet”>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
  <!-- Custom styles for this template -->
  <link href="${path}/css/modern-business.css" rel="stylesheet">
  <link href="${path}/css/sdmes.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
  <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
  
<script>
function fnSetPage(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#main_container").empty();
	    $("#carouselExampleIndicators").remove();
		$("#main_container").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}
</script>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary fixed-top">
      <a class="navbar-brand" href="${path}/">SDMES(생산관리시스템)</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="${path}/">홈</a>
            <c:set var = "role1" value = "${userKey}" />
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              계약관리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <c:if test = "${not fn:contains(role1, 'A0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/listview.do')">계약 관리</a></c:if>
              <c:if test = "${not fn:contains(role1, 'B0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/reqlistview.do')">계약 요청</a></c:if>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              생산관리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <c:if test = "${not fn:contains(role1, 'C0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/porderlistview.do')">생산수량 등록</a></c:if>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              재고관리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <c:if test = "${not fn:contains(role1, 'D0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/store/listview.do')">상품/자재 입출고 관리</a></c:if>
              <c:if test = "${not fn:contains(role1, 'E0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/store/buyreqlistview.do')">자재 구매신청</a></c:if>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              설정
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <c:if test = "${not fn:contains(role1, 'F0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/code/listview.do')">코드설정</a></c:if>
              <c:if test = "${not fn:contains(role1, 'G0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/listview.do')">상품/자재 등록</a></c:if>
              <c:if test = "${not fn:contains(role1, 'H0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/user/userRole.do')">사용자 권한 관리</a></c:if>
			</div>
          </li>
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              ${userName}
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/user/chgpasswd.do')">암호변경</a>
              <a class="dropdown-item" href="${path}/user/logout.do">로그아웃</a>
            </div>
          </li>
          
        </ul>
      </div>
  </nav>

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="height: 80%; background-image: url('${path}/resources/image/mes01.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="height: 80%; background-image: url('${path}/resources/image/mes02.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="height: 80%; background-image: url('${path}/resources/image/mes03.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="main_container" id="main_container">

    <!-- Marketing Icons Section -->
    <div class="row justify-content-md-center">
      
      
    </div>
    <!-- /.row -->

      <hr>

  </div>
  <!-- /.container -->
  <!-- Bootstrap core JavaScript -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/dayjs@1.8.21/dayjs.min.js"></script>
 <script type="text/javascript">
 </script> 
</body>

</html>
