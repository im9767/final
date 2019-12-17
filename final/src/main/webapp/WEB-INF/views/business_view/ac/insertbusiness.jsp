<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript"
	src="${cp}/resources/admin/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${cp}/resources/admin/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	var a = false;
	var b = false;
	var c = false;
	var d = false;

	function bidcheck() {
		var bid = document.getElementById("bid").value;
		$.ajax({
			url : "${cp}/business_view/idCheck?bid=" + bid,
			dataType : "json",
			success : function(data) {
				var check = data.using;
				var id = $("#bid").val();
				if (check) {
					$("#idCheck").css("color", "red");
					$("#idCheck").text("이미 있는 아이디입니다");			
				} else if (id.length > 3 && check == false) {
					$("#idCheck").css("color", "blue");
					$("#idCheck").text("사용 가능");
					a=true;
				}
			}

		});
	}
	function pwd1check() {
		var bpwd = document.getElementById("bpwd").value;
		var span1 = document.getElementById("pwdchk1");
		if (bpwd == "") {
			span1.style.color = "red";
			span1.innerHTML = "입력하세요.";
		} else if (bpwd.length < 8) {
			span1.innerHTML = "8자이상 입력하세요."
		} else if (bpwd.length >= 8) {
			span1.innerHTML = "";
			b=true;
		}
	}
	function pwd2check() {
		var bpwd = document.getElementById("bpwd").value;
		var chkpwd = document.getElementById("chkpwd").value;
		var span2 = document.getElementById("pwdchk2");
		if (bpwd == chkpwd) {
			span2.style.color = "blue";
			span2.innerHTML = "비밀번호가 일치합니다.";
			c=true;
		} else if (chkpwd == "") {
			span2.style.color = "red";
			span2.innerHTML = "입력하세요.";
		} else {
			span2.style.color = "red";
			span2.innerHTML = "비밀번호가 불일치합니다.";
		}
	}
	function emailcheck() {
		var email = document.getElementById("bemail").value;
		var echk = document.getElementById("echk")
		var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if (!regExpEm.test($("#bemail").val())) {
			echk.style.color = "red";
			echk.innerHTML = "이메일 형식이아닙니다.";
		} else {
			echk.style.color = "blue";
			echk.innerHTML = "사용가능";
			d=true;
		}
	}

	function validate() {
		if (a == true && b == true && c == true && d == true) {
			return true;
		} else {
			return false;
		}
		console.log(a);
	}
</script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>사업자 가입</title>

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
	<div class="container" style="width: 700px;">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0"
						style="height: 580px; margin-bottom: 20px;">
						<!-- Nested Row within Card Body -->
						<div class="col-lg-6" style="margin: auto">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">사업자 가입</h1>
								</div>
							</div>
							<form method="post" action="${cp}/business_view/insertbusinessok"
								onsubmit="return validate()">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="bid" name="bid" placeholder="아이디" style="width: 250px;"
											onkeyup="bidcheck()">
									</div>
								</div>
								&nbsp;<span id="idCheck" style="color: red;"></span>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="bpwd" name="bpwd" onkeyup="pwd1check()"
											placeholder="비밀번호" style="width: 250px;">
									</div>
								</div>
								&nbsp;<span id="pwdchk1"></span>
								<div class="form-group row">
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											id="chkpwd" onkeyup="pwd2check()" placeholder="비밀번호 확인"
											style="width: 250px;">
									</div>
								</div>
								&nbsp;<span id="pwdchk2"></span>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="bemail" name="bemail" placeholder="이메일"
										onkeyup="emailcheck()"> &nbsp;<span id="echk"></span>
								</div>
								<input type="submit" id="chk"
									class="btn btn-primary btn-user btn-block" value="가입하기">
							</form>
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
