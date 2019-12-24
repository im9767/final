<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Register</title>

<!-- Custom fonts for this template-->
<link
	href="${cp}/resources/admin/admin-boot/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${cp}/resources/admin/admin-boot/css/sb-admin-2.min.css"
	rel="stylesheet">


</head>
<body class="bg-gradient-primary">

	<div class="container" >

		<div class="card o-hidden border-0 shadow-lg my-5" style="padding-left: 10px; width: auto; padding-bottom: 100px;" >
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row" style="height: auto;">
					<div class="col-lg-7" style="margin-left: 10px; margin-top: 20px;">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4" style="text-align: left;">이벤트 세부사항
								</h1>						 
						</div>				
						<div class="user" style="width: 900px; height: auto;">	
						<c:forEach  var="vo" items="${eventinfolist}" varStatus="vs">	
						<c:if test="${vs.index==0 }">
								<div class="form-group row" style="width: auto;" >
									<div class="col-sm-6 mb-3 mb-sm-0" style="width: auto; font-size: 1.7em; color: black;">										
									<span>${vo.ETITLE}</span>
									</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>시작날짜:${vo.ESTARTDATE}</span>&nbsp;&nbsp;
									<span>종료날짜:${vo.EENDDATE}</span>																	
								</div><hr style="width: 900px;">														
								</c:if>																					
								<img src="../resources/upload/${vo.SAVEFILENAME}" style="width: 1000px; height: 700px;"><br>																														
								</c:forEach>																																								
						<hr style="width: 900px;">
						<div>
						<c:forEach var="vo2" items="${list}" varStatus="vss">
						<c:if test="${vss.index==0}">
                	<span>등록날짜:${vo2.EREGDATE}</span>
                 	<a href="${cp}/admin_view/eventboard" class="btn btn-secondary btn-icon-split" style="float: right; color:black;">                
                	 <span class="text">뒤로가기</span>
                 	 </a>
                 	 </c:if>
                 	 </c:forEach>
                	</div> 
                	 							
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script
		src="${cp}/resources/admin/admin-boot/vendor/jquery/jquery.min.js"></script>
	<script
		src="${cp}/resources/admin/admin-boot/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${cp}/resources/admin/admin-boot/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${cp}/resources/admin/admin-boot/js/sb-admin-2.min.js"></script>

</body>

</html>
