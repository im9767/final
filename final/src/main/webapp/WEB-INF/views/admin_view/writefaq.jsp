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

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row" style="height: 900px">
					<div class="col-lg-7" style="margin-left: 100px; margin-top: 20px;">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4" style="text-align: left;">FAQ
								작성</h1>
						</div>
						<div class="user" style="width: 900px; height: 700px;">
							<form method="POST" action="${cp}/admin_view/writefaqok">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<div class="input-group input-group-sm mb-3" style="width:500px;">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-sm">질문</span>
											
											</div>							
											<input type="text" name="ftitle" placeholder="질문" class="form-control"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-sm"> 												
										</div>									
									</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<select name="fcnum" class="form-control form-control-user" style="width: 230px; float: right;">
									<option value="1">환불</option>
									<option value="2">이용문의</option>
									<option value="3">예약</option>
									<option value="4">쿠폰</option>
									<option value="5">결제</option>
									<option value="6">기타</option>
								</select>
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">답변</span>
									</div>
									<textarea class="form-control" name="fcontent"
										aria-label="With textarea" placeholder="답변"
										style="width: 1000px; height: 650px;"></textarea>
								</div>
								<hr>
								<div style="float: right">
								<a
									href="${cp}/admin_view/faqboard"
									class="btn btn-secondary btn-icon-split"><span>뒤로가기</span>
								</a>
								<input type="submit" class="btn btn-primary btn-icon-split"
									 value="작성하기">
								</div>
							</form>
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
