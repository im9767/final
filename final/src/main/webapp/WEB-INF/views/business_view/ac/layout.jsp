<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>사업자 페이지</title>
<link rel="stylesheet" type="text/css" href="${cp}/resources/admin/css/jquery-ui.css">
<!-- Custom fonts for this template-->
<link href="${cp}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${cp}/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${cp}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script type="text/javascript" src="${cp}/resources/admin/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#cal").datepicker({
		showOn: "both",
		buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		dateFormat: "yy/mm/dd", //날짜포맷형식
		dayNamesMin: ["일","월","화","수","목","금","토"],//배열형태로 들어가야함
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		yearSuffix: "년",
		showMonthAfterYear: true,
		showAnim: "slideDown"
	});
	$("#cal2").datepicker({
		showOn: "both",
		buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		dateFormat: "yy/mm/dd", //날짜포맷형식
		dayNamesMin: ["일","월","화","수","목","금","토"],//배열형태로 들어가야함
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		yearSuffix: "년",
		showMonthAfterYear: true,
		showAnim: "slideDown"
	});
	$("#cal3").datepicker({
		showOn: "both",
		buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		dateFormat: "yy/mm/dd", //날짜포맷형식
		dayNamesMin: ["일","월","화","수","목","금","토"],//배열형태로 들어가야함
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		yearSuffix: "년",
		showMonthAfterYear: true,
		showAnim: "slideDown"
	});
	
});
</script>
</head>
<body id="page-top">
<div id="wrapper">
<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${cp}/business">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3" style="background-color:red">요기어때 사업자</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="${cp}/business_view/main">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        <h3>사업자 메뉴</h3>
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>업소등록신청</span>
        </a>`
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="${cp}/business_view/houseInformation_insert">업소 등록 신청</a>
            <a class="collapse-item" href="${cp}/business_view/">업소 등록 확인</a>
            <a class="collapse-item" href="#">등록 내용 수정</a>
          </div>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemember" aria-expanded="true" aria-controls="collapsemember">
          <i class="fas fa-fw fa-folder"></i>
          <span>업소시설등록</span>
        </a>
        <div id="collapsemember" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
             <a class="collapse-item" href="${cp}/business_view/writeamenities">편의시설 등록</a>
             <a class="collapse-item" href="#">편의시설 수정 및삭제</a>
          </div>
        </div>
      </li>
	
      

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>업소 이미지</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="#">읎어</a>
          	<a class="collapse-item" href="utilities-border.html">업소이미지 조회/수정</a>
          </div>
        </div>
      </li>
      
      
	  <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemember" aria-expanded="true" aria-controls="collapsemember">
          <i class="fas fa-fw fa-folder"></i>
          <span>객실정보등록</span>
        </a>
        <div id="collapsemember" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="${cp}/business_view/writeroom">객실등록</a>
            <a class="collapse-item" href="${cp}/business_view/roomsboard">객실정보</a>
          </div>
        </div>
      </li>
	
	  <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemember" aria-expanded="true" aria-controls="collapsemember">
          <i class="fas fa-fw fa-folder"></i>
          <span>예약회원</span>
        </a>
        <div id="collapsemember" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="#">예약회원조회</a>
            <a class="collapse-item" href="utilities-border.html"></a>
          </div>
        </div>
      </li>
	  
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      
	   <li class="nav-item">
        <a class="nav-link" href="${cp}/business_view/roomsboard">
          <i class="fas fa-fw fa-table"></i>
          <span>객실정보</span></a>
      </li>
		 <li class="nav-item">
        <a class="nav-link" href="${cp}/business_view/updatebusinessinfo">
          <i class="fas fa-fw fa-table"></i>
          <span>사업자 정보수정</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${cp}/business/view">
          <i class="fas fa-fw fa-table"></i>
          <span>사업자 홈버튼</span></a>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
    </ul>
 <!-- End of Sidebar -->
	<div id="main">
		<tiles:insertAttribute name="main"/>
	</div>
</div>


<!-- Bootstrap core JavaScript-->
  <script src="${cp}/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="${cp}/resources/admin/js/jquery-ui.js"></script>
  <script src="${cp}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${cp}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${cp}/resources/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${cp}/resources/admin/vendor/chart.js/Chart.min.js"></script>
  <script src="${cp}/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${cp}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${cp}/resources/admin/js/demo/chart-area-demo.js"></script>
  <script src="${cp}/resources/admin/js/demo/chart-pie-demo.js"></script>
  <script src="${cp}/resources/admin/js/demo/datatables-demo.js"></script>
</body>
</html>













