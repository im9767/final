<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
 .checkbox-lg .custom-control-label::before, 
.checkbox-lg .custom-control-label::after {
  top: .8rem;
  width: 1.55rem;
  height: 1.55rem;
}

.checkbox-lg .custom-control-label {
  padding-top: 13px;
  padding-left: 6px;
}


.checkbox-xl .custom-control-label::before, 
.checkbox-xl .custom-control-label::after {
  top: 1.2rem;
  width: 1.85rem;
  height: 1.85rem;
}

.checkbox-xl .custom-control-label {
  padding-top: 23px;
  padding-left: 10px;
}
</style>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript"
	src="${cp}/resources/admin/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${cp}/resources/admin/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function validate() {
		var am = document.frm1.am;
		var am2 = document.getElementsByName("am");
		var cnt = 0;
		for (var i = 0; i < am.length; i++) {
			if (am[i].checked) {
				cnt++;
			}
		}
		for (var j = 0; j < am2.length; j++) {
			if (am2[j].checked) {
				var aa = $(
						"<input type='text' name='sublist' hidden='' value='"+am2[j].value+"'>")
						.appendTo("#subitem");
				console.log(am[j].value)
			}
		}
		if (cnt < 1) {
			alert("편의시설은 무조건 하나이상 고르세요.");
			return false;
		}
		return true;
	}
	$(function() {
		$("#imgIn").on('change', function() {
			$("#imgbox img").remove();
			readURL(this);
		});
	});
	var b = 0;
	function readURL(input) {
		for (var a = 0; a < input.files.length; a++) {
			var reader = new FileReader();

			reader.onload = function(e) {
				console.log(input.files[b].name);
				if (b == 5) {
					var aa = $("<img src='"+e.target.result+"'><br>").appendTo(
							"#imgbox");
					aa.css("width", "590px");
					aa.css("height", "590px");
					console.log(b++);
				} else {
					var aa = $("<img src='"+e.target.result+"'>").appendTo(
							"#imgbox");
					aa.css("width", "590px");
					aa.css("height", "590px");
					console.log(b++);
				}
			}
			reader.readAsDataURL(input.files[a]);
		}
	}
</script>
</head>
<body class="bg-gradient-primary">

	<div class="container" style="margin-left: 10px; padding-right: 10px;">

		<div class="card o-hidden border-0 shadow-lg my-5"
			style="padding-left: 10px; width: 1800px;">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row" style="height: auto; width: auto;">
					<div class="col-lg-7"
						style="margin-left: 10px; margin-top: 20px; margin-bottom: 20px; width: 1700px;">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4"
								style="text-align: left; font-size: 50px;">업체등록</h1>
						</div>
						<div class="user"
							style="width: 1800px; height: 1000px; margin-right: 100px;">
							<form method="POST" name="frm1" onsubmit="return validate();"
								action="${cp}/business_view/inserthouse"
								enctype="multipart/form-data">
								<!-- 이 아래는 업소테이블 입력하는곳 -->
								<select name="btype" class="form-control form-control-user"
									style="width: 230px;">
									<option value="호텔">호텔</option>
									<option value="모텔">모텔</option>
									<option value="펜션">펜션</option>
									<option value="리조트">리조트</option>
								</select><br> <select name="sname"
									class="form-control form-control-user" style="width: 230px;">
									<option value="22">숙박</option>
								</select><br>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="intro" id="intro" placeholder="업소소개(문자)"
										style="width: 1700px;">
								</div>
								<div class="form-group" style="width: 1500px;">
									<input type="text" class="form-control form-control-user"
										name="checkintime" id="checkintime" placeholder="입실시간(문자)"
										style="width: 220px;"><br> <input type="text"
										class="form-control form-control-user" name="checkouttime"
										id="checkouttime" placeholder="퇴실시간(문자)" style="width: 220px;">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="company" id="company" placeholder="업체명(문자)"
										style="width: 220px;">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="license" id="license" placeholder="사업자등록번호(문자)"
										style="width: 900px;">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="ceo" id="ceo" placeholder="대표자명(문자)"
										style="width: 220px;">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="orgaddr" id="orgaddr" placeholder="본점소재지(문자)"
										style="width: 1700px;">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="workplace" id="workplace" placeholder="사업장소재지(문자)"
										style="width: 1700px;">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="com_tel" id="com_tel" placeholder="사업장전화번호(문자)"
										style="width: 220px;">
								</div>

								<c:forEach var="vo" items="${selam}" varStatus="vs">
											<div class="custom-control custom-switch checkbox-switch-lg" ">
												<input type="checkbox" class="custom-control-input"
													id="customSwitch1+${vs.index}" name="am" value="${vo.AMENITIES_NAME}" > <label
													class="checkbox-lg custom-control-label"
													for="customSwitch1+${vs.index}">${vo.AMENITIES_NAME}</label>
											</div>
								</c:forEach>
								<input type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 1700px;" value="등록신청" onclick="validate()">
								<hr>
							</form>
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
