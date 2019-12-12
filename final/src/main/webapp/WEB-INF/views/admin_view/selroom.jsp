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

	<div class="container" style="margin-left: 10px; padding-right: 10px;">

		<div class="card o-hidden border-0 shadow-lg my-5" style="padding-left: 10px; width: 1800px;">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row" style="height: auto; width: auto;">
					<div class="col-lg-7" style="margin-left: 10px; margin-top: 20px; margin-bottom: 20px; width: 1800px;">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4" style="text-align: left; font-size: 50px;">상세조회</h1>
						</div>
						<div class="user" style="width: 1800px; height: 700px;">
							<c:forEach  var="vo" items="${roominfolist}" varStatus="vs">	
								<c:if test="${vs.index==0 }">
								<div class="form-group row" style="width: auto">
									<div class="col-sm-6 mb-3 mb-sm-0" style="width: auto;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>방이름:&nbsp;${vo.ROOMNAME}</span>&nbsp;가격:&nbsp;<span>${vo.ROOM_PRICE}</span>원&nbsp;
									최대인원:&nbsp;<span>${vo.MAX_PERSONNEL}</span>																		
								</div>
								</div><hr style="width: 1750px;">
								<h2>소개</h2>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${vo.ROOM_INFO }</span>
								<hr style="width: 1750px;">
								<h2>이미지</h2>
								</c:if>
								<c:choose>
									<c:when test="${vs.index==5}">
								<img src="../resources/upload/${vo.ROOM_SAVE_NAME}" style="width: 590px; height:590px;"><br>														
									</c:when><c:otherwise>
								<img src="../resources/upload/${vo.ROOM_SAVE_NAME}" style="width: 590px; height:590px;">
									</c:otherwise>
								</c:choose>
								</c:forEach>						
								<hr style="width: 1750px;">
								<a href="${cp}/admin_view/roomsboard" class="btn btn-secondary btn-icon-split" style="float: right; margin-right:50px; color:black;">                
                	 <span class="text">뒤로가기</span>
                 	 </a>
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
