<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="${cp}/resources/admin/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
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
				<div class="row" style="height: 500px">
					<div class="col-lg-7" style="margin-left: 100px; margin-top: 20px;">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4" style="text-align: left;">사업자 정보 수정</h1>
						</div>
						<div class="user" style="width: 900px; height: 700px;">
							<c:forEach var="vo" items="${businessinfolist}">
								<form method="POST" action="${cp}/admin_view/updatebusinessinfook">									
									<div class="input-group input-group-sm mb-3" style="width:600px;">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-sm">사업자명</span>
											</div>
											<input type="text" name="bname" id="bname"  class="form-control"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-sm" value="${vo.CEO}">
											</div>
											<div class="input-group input-group-sm mb-3" style="width:600px;">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-sm">사업장 명</span>
											</div>
											<input type="text" name="bcompany" id="bcompany"  class="form-control"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-sm" value="${vo.COMPANY}">
											</div>
											<div class="input-group input-group-sm mb-3" style="width:600px;">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-sm">사업번호</span>
											</div>
											<input type="text" name="blicense" id="blicense"  class="form-control"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-sm" value="${vo.LICENSE}">
											</div>
											<div class="input-group input-group-sm mb-3" style="width:600px;">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-sm">사업장 주소</span>
											</div>
											<input type="text" name="bworkplace" id="bworkplace"  class="form-control"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-sm" value="${vo.WORKPLACE}">
											</div>
											<div class="input-group input-group-sm mb-3" style="width:600px;">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-sm">사업자 전화번호</span>
											</div>
											<input type="text" name="bcom_tel" id="bcom_tel"  class="form-control"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-sm" value="${vo.COM_TEL}">
											</div>	
											<div class="input-group input-group-sm mb-3" style="width:600px;">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-sm">이메일</span>
											</div>
											<input type="text" name="bemail" id="bemail" class="form-control"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-sm" value="${vo.BUSINESS_EMAIL}">
											</div>									
									<hr style="width: 900px;">								
									<div style="float: right">
										<a href="${cp}/admin_view/noticeboard"
											class="btn btn-secondary btn-icon-split"><span>뒤로가기</span>
										</a> <input type="submit" class="btn btn-primary btn-icon-split"
											value="수정하기">
									</div>									
								</form>
							</c:forEach>
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
