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
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="${cp}/resources/admin/css/jquery-ui.css">
<!-- Custom fonts for this template-->
<link href="${cp}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${cp}/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${cp}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script type="text/javascript" src="${cp}/resources/admin/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
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
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	// Pie Chart Example
	var ctx = document.getElementById("myPieChart");
	var chartstr=[];
	<c:forEach var="vo" items="${list}">
		chartstr.push('${vo.CNT}');
	</c:forEach>
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: ["모텔","호텔", "리조트", "펜션"],
	    datasets: [{
	      data: chartstr,
	      backgroundColor: ['#e74a3b','#4e73df', '#1cc88a', '#f6c23e'],
	      hoverBackgroundColor: ['#e74a3b','#2e59d9', '#17a673', '#2c9faf'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
	function number_format(number, decimals, dec_point, thousands_sep) {
			// *     example: number_format(1234.56, 2, ',', ' ');
			// *     return: '1 234,56'
			number = (number + '').replace(',', '').replace(' ', '');
			var n = !isFinite(+number) ? 0 : +number, prec = !isFinite(+decimals) ? 0
					: Math.abs(decimals), sep = (typeof thousands_sep === 'undefined') ? ','
					: thousands_sep, dec = (typeof dec_point === 'undefined') ? '.'
					: dec_point, s = '', toFixedFix = function(n, prec) {
				var k = Math.pow(10, prec);
				return '' + Math.round(n * k) / k;
			};
			// Fix for IE parseFloat(0.55).toFixed(0) = 0;
			s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
			if (s[0].length > 3) {
				s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
			}
			if ((s[1] || '').length < prec) {
				s[1] = s[1] || '';
				s[1] += new Array(prec - s[1].length + 1).join('0');
			}
		return s.join(dec);
	}
	// Area Chart Example
	var ctx = document.getElementById("myAreaChart");
	var staticstr=[0,0,0,0,0,0,0,0,0,0,0,0];
	<c:forEach var="vo" items="${slist}">
		//staticstr.push('${vo.PAY}');
		for(var i=0;i<staticstr.length;i++){
			if('${vo.MONTH}'== (i+1) ){
				staticstr[i] = '${vo.PAY}';
			}
		}
	</c:forEach>
	var myLineChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	    datasets: [{
	      label: "매출",
	      lineTension: 0.1,
	      backgroundColor: "rgba(78, 115, 223, 0.05)",
	      borderColor: "rgba(78, 115, 223, 1)",
	      pointRadius: 3,
	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointBorderColor: "rgba(78, 115, 223, 1)",
	      pointHoverRadius: 4,
	      pointHoverBackgroundColor: "#fd0304",
	      pointHoverBorderColor: "#fd0304",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      data: staticstr,
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: true,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 7
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          maxTicksLimit: 5,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return number_format(value) + '원';
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: true,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ': ' + number_format(tooltipItem.yLabel) +'원';
	        }
	      }
	    }
	  }
	});
});
</script>
</head>
<body id="page-top">
<div id="wrapper">
<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${cp}/admin">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3" style="background-color:red">요기어때 관리자</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="${cp}/admin">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider">
	  
	  <!-- Heading -->
      <div class="sidebar-heading">
        회원
      </div>
	  
	  <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemember" aria-expanded="true" aria-controls="collapsemember">
          <i class="fas fa-fw fa-folder"></i>
          <span>회원</span>
        </a>
        <div id="collapsemember" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="${cp}/admin/members">등록회원조회</a>
          </div>
        </div>
      </li>
	  
	  <!-- Divider -->
      <hr class="sidebar-divider">
	  
	  <!-- Heading -->
      <div class="sidebar-heading">
        업체
      </div>
	  
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>업체</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="${cp}/admin_view/housetable">등록업체현황</a>
            <a class="collapse-item" href="${cp}/admin_view/apphouse">업체등록여부</a>
          </div>
        </div>
      </li>
	  
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        기타
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
        <a class="nav-link" href="${cp}/admin">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">
	  
      <li class="nav-item">
        <a class="nav-link" href="${cp}/admin_view/noticeboard">
          <i class="fas fa-fw fa-table"></i>
          <span>공지사항</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${cp}/admin_view/eventboard">
          <i class="fas fa-fw fa-table"></i>
          <span>이벤트</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" href="#myModal" data-backdrop="static">
          <i class="fas fa-fw fa-table"></i>
          <span>쿠폰발행</span></a>
      </li>
	
	<!-- Modal -->
  	<div class="modal fade" id="myModal" aria-labelledby="쿠폰발행" role="dialog" style="color: blue">
      <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" style="font-family: 궁서체;font-size:45px">쿠폰발행</h4>
        </div>
        <div class="modal-body">
        	<div class="col-lg-6 mb-4" style="width:550px;">
                  <div class="card bg-primary text-white shadow">
                    <div class="card-body">
                      	쿠폰발급대상(등급별)
                    </div>
                  </div>
                  <div>
              		<select name="gnum" id="gnum" class="form-control form-control-user" style="width:150px;display: inline-block;
              		margin-top: 10px;">
	                  <option value="4" <c:if test="${gnum=='4'}">selected</c:if>>전체</option>
	                  <option value="3" <c:if test="${gnum=='3'}">selected</c:if>>골드</option>
	                  <option value="2" <c:if test="${gnum=='2'}">selected</c:if>>실버</option>
	                  <option value="1" <c:if test="${gnum=='1'}">selected</c:if>>브론즈</option>
           		   </select>
         		 
         		 </div> 
            </div>
            <hr>
         	 	<div class="col-lg-6 mb-4" style="width:550px">
              		<div class="card bg-info text-white shadow">
              			<div class="card-body">
                  			발행쿠폰명
               			</div>
               		</div>
               		<!-- 
               	<select name="coupon_typenum" id="coupon_typenum" class="form-control form-control-user" style="width:150px;display: inline-block;
              		margin-top: 10px;">
	                  <option value="1" <c:if test="${coupon_type=='1'}">selected</c:if>>퍼센트할인</option>
	                  <option value="2" <c:if test="${coupon_type=='2'}">selected</c:if>>포인트할인</option>
           		</select>
           		 -->
               	<select name="coupon_name" id="coupon_name" class="form-control form-control-user" style="width:500px;display: inline-block;
              		margin-top: 10px;">
              			<option value="10% 할인쿠폰:10:1">10% 할인쿠폰</option>
              			<option value="30% 할인쿠폰:30:1">30% 할인쿠폰</option>
              			<option value="50% 할인쿠폰:50:1">50% 할인쿠폰</option>
              			<option value="70% 할인쿠폰:70:1">70% 할인쿠폰</option>
              			<option value="3000포인트 할인쿠폰:3000:2">3000포인트 할인쿠폰</option>
              			<option value="5000포인트 할인쿠폰:5000:2">5000포인트 할인쿠폰</option>
              			<option value="7000포인트 할인쿠폰:7000:2">7000포인트 할인쿠폰</option>
              			<option value="10000포인트 할인쿠폰:10000:2">10000포인트 할인쿠폰</option>
           		   </select>
           		   <div id="couponMsg"></div>
           		</div>
        </div>
        <div class="modal-footer">
          <input type="button" id="couponBtn" class="btn btn-success btn-circle" value="발행"> 
          <input type="button" class="btn btn-danger btn-circle" data-dismiss="modal" value="닫기">
        </div>
       </div>
     </div>
    </div>

	 <li class="nav-item">
        <a class="nav-link" href="${cp}/admin_view/writeamenities">
          <i class="fas fa-fw fa-table"></i>
          <span>편의시설 등록</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="${cp}/admin_view/roomsboard">
          <i class="fas fa-fw fa-table"></i>
          <span>객실정보</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="${cp}/admin_view/updatebusinessinfo">
          <i class="fas fa-fw fa-table"></i>
          <span>사업자정보수정</span></a>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
    </ul>
 <!-- End of Sidebar -->
	<div id="maincontent">
		<tiles:insertAttribute name="maincontent"/>
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
  <!--  <script src="${cp}/resources/admin/js/demo/chart-area-demo.js"></script>-->
  <script src="${cp}/resources/admin/js/demo/datatables-demo.js"></script>
  <script type="text/javascript">
	  $("#couponBtn").on('click',function(){
			var gnum=$("#gnum option:selected").val();
			var coupon_typenum=$("#coupon_typenum option:selected").val();
			var coupon_name=$("#coupon_name option:selected").val();
			$.ajax({
				url:"${cp}/admin/coupon?gnum="+gnum+"&coupon_typenum="+coupon_typenum+"&coupon_name="+encodeURI(coupon_name),
				dataType:"xml",
				success:function(data){
					alert('쿠폰 발행완료!');
					$("#couponMsg").empty();
					$(data).find("result").each(function(){
						var user=$(this).find("user").text();
						var msg=$(this).find("msg").text();
						var strs=user +" "+ msg;
						$("#couponMsg").append("<div>" + strs +"</div>");
					});
				}
			});
		});  
  </script> 
</body>
</html>













