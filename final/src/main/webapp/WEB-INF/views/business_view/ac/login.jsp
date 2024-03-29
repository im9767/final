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
<title>사업자 로그인창</title>

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
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9" style="margin-top:200px;">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="col-lg-6" style="margin: auto">
							<div class="p-5">
								<div class="text-center">
									<!-- 여기가 로그인창 위쪽 글씨 나오게 하는곳 -->
									<h1 class="h4 text-gray-900 mb-4">사장님 로그인!</h1>
								</div>

								<form method="post"
									action="${pageContext.request.contextPath }/business_view/loginok">
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											name="bid" id="bid" placeholder="아이디 입력">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-user"
											name="bpwd" id="bpwd" placeholder="비밀번호 입력">
									</div>
									<input type="submit" class="btn btn-primary btn-user btn-block"
										value="로그인">
									<hr>
								</form>
								<div class="text-center">
               				 <a class="small" href="${cp}/business_view/findpassword">비밀번호 찾기</a>
             			 </div>			
								 <div class="text-center">
               				 <a class="small" href="${cp}/business_view/insertbusiness">사업자 가입</a>
             			 </div>
							</div>
						</div>
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
