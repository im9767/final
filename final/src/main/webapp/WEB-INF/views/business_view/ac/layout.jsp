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
	var index=0;
	var cols=["orange","green","pink"];
	setInterval(() => {
		$("#mmsg").css("color",cols[index++]);
		if(index==3) index=0;
	}, 700);
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';
	function number_format(number, decimals, dec_point, thousands_sep) {
		  // *     example: number_format(1234.56, 2, ',', ' ');
		  // *     return: '1 234,56'
		  number = (number + '').replace(',', '').replace(' ', '');
		  var n = !isFinite(+number) ? 0 : +number,
		    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
		    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
		    s = '',
		    toFixedFix = function(n, prec) {
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
		// Bar Chart Example
		var bctx = document.getElementById("myBarChart");
		var bstr= [0,0,0,0,0,0,0,0,0,0,0,0];
		<c:forEach var="bvo" items="${staticList}">
		for(var i=0;i<bstr.length;i++){
			if('${bvo.MONTH}'== (i+1) ){
				bstr[i] = '${bvo.PAY}';
			}
		}
		</c:forEach>
		var myBarChart = new Chart(bctx, {
		  type: 'bar',
		  data: {
		    labels: ["1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월"],
		    datasets: [{
		      label: "매출",
		      backgroundColor: "#4e73df",
		      hoverBackgroundColor: "#2e59d9",
		      borderColor: "#4e73df",
		      data: bstr,
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
		          unit: 'month'
		        },
		        gridLines: {
		          display: false,
		          drawBorder: false
		        },
		        ticks: {
		          maxTicksLimit: 6
		        },
		        maxBarThickness: 25,
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          max: 500000,
		          maxTicksLimit: 6,
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
		      titleMarginBottom: 10,
		      titleFontColor: '#6e707e',
		      titleFontSize: 14,
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		      callbacks: {
		        label: function(tooltipItem, chart) {
		          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
		          return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + '원';
		        }
		      }
		    },
		  }
		});
		// Pie Chart Example
		var pctx = document.getElementById("myPieChart");
		var chartstr=[0,0,0,0];
		<c:forEach var="vo" items="${piechart}">
			//chartstr.push('${vo.CNT}');
			if('${vo.BNUM}'== '21'){
				chartstr[0] = '${vo.CNT}';
			}else if('${vo.BNUM}'== '22'){
				chartstr[1] = '${vo.CNT}';
			}else if('${vo.BNUM}'== '23'){
				chartstr[2] = '${vo.CNT}';
			}else if('${vo.BNUM}'== '24'){
				chartstr[3] = '${vo.CNT}';
			}
		</c:forEach>
		var myPieChart = new Chart(pctx, {
		  type: 'doughnut',
		  data: {
		    labels: ["모텔","호텔", "리조트", "펜션"],
		    datasets: [{
		      data: chartstr,
		      backgroundColor: ['#e74a3b','#4e73df', '#1cc88a', '#f6c23e'],
		      hoverBackgroundColor: ['#e74a3b','#2e59d9', '#17a673', '#f6c23e'],
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
});
</script>
</head>
<body id="page-top">
<div id="wrapper">
<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	  
	  <c:choose>
	  	<c:when test="${houseCnt > 0 }">
	  		<!-- Sidebar - Brand -->
		      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${cp}/business/loginok">
		        <div class="sidebar-brand-icon rotate-n-15">
		          <i class="fas fa-laugh-wink"></i>
		        </div>
		        <div class="sidebar-brand-text mx-3" style="background-color:red">요기어때 사업자</div>
		      </a>
	  	</c:when>
	  	<c:otherwise>
	  		<!-- Sidebar - Brand -->
		      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${cp}/business1/loginok">
		        <div class="sidebar-brand-icon rotate-n-15">
		          <i class="fas fa-laugh-wink"></i>
		        </div>
		        <div class="sidebar-brand-text mx-3" style="background-color:red">요기어때 사업자</div>
		      </a>
	  	</c:otherwise>
	  </c:choose>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        <h3>사업자 메뉴</h3>
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      
      <c:choose>
      	<c:when test="${houseCnt==1 && approval==1}">      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemember" aria-expanded="true" aria-controls="collapsemember">
          <i class="fas fa-fw fa-folder"></i>
          <span>편의시설</span>
        </a>
        <div id="collapsemember" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
             <a class="collapse-item" href="${cp}/business_view/updatehouseamenities">편의시설 수정</a>
          </div>
        </div>
      </li>      
      
	  <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapserooms" aria-expanded="true" aria-controls="collapserooms">
          <i class="fas fa-fw fa-folder"></i>
          <span>객실</span>
        </a>
        <div id="collapserooms" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="${cp}/business_view/writeroom">객실등록</a>
            <a class="collapse-item" href="${cp}/business_view/roomsboard">객실정보</a>
          </div>
        </div>
      </li>
	
	<li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseinfors" aria-expanded="true" aria-controls="collapsebooks">
          <i class="fas fa-fw fa-folder"></i>
          <span>개인정보</span>
        </a>
        <div id="collapseinfors" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="${cp}/business_view/updatebusinessinfo">사업자 정보 수정</a>
          </div>
        </div>
      </li>
      
	  <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsebooks" aria-expanded="true" aria-controls="collapsebooks">
          <i class="fas fa-fw fa-folder"></i>
          <span>예약회원</span>
        </a>
        <div id="collapsebooks" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="${cp}/business_view/bookingstauts">예약회원조회</a>
          </div>
        </div>
      </li>
	  
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
          기타
      </div>

      <!-- Nav Item - Tables -->
  
      	</c:when>
      	<c:when test="${houseCnt>1}">      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemember" aria-expanded="true" aria-controls="collapsemember">
          <i class="fas fa-fw fa-folder"></i>
          <span>업체선택</span>
        </a>
        <div id="collapsemember" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            
            <c:forEach var="vo" items="${comlist}">
             <a class="collapse-item" href="${cp}/business_view/view?house_num=${vo.HOUSE_NUM}">${vo.COMPANY}</a>
          	</c:forEach>
          </div>
        </div>
      </li>       
      	</c:when>
      	<c:when test="${approval==2 && houseCnt==1}">
      		 <li class="nav-item">
        <a class="nav-link" href="${cp}/business_view/updatehouse">
          <i class="fas fa-fw fa-table"></i>
          <span>업체등록</span></a>
      </li>
      	</c:when>
      	<c:when test="${approval==0 && houseCnt==1 }">
      		 <li class="nav-item">
        <a class="nav-link" href="${cp}/business_view/inserthouse">
          <i class="fas fa-fw fa-table"></i>
          <span>업체등록</span></a>
      </li>
      	</c:when>
      	<c:otherwise>
      		<li class="nav-item">
        <a class="nav-link" href="${cp}/business_view/inserthouse">
          <i class="fas fa-fw fa-table"></i>
          <span>업체등록</span></a>
      </li>
      	</c:otherwise>
      </c:choose>
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
<%--   <script src="${cp}/resources/admin/js/demo/chart-pie-demo.js"></script> --%>
  <script src="${cp}/resources/admin/js/demo/datatables-demo.js"></script>
</body>
</html>













