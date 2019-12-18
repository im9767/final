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

<script type="text/javascript" src="${cp}/resources/admin/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function validate() {
    var am=document.frm1.am;
    var am2=document.getElementsByName("am");
	var cnt=0;
	for (var i = 0; i < am.length; i++) {
		if(am[i].checked){
			cnt++;
		}
	}
	for (var j = 0; j < am2.length; j++) {
		if(am2[j].checked){
			var aa=$("<input type='text' name='sublist' hidden='' value='"+am2[j].value+"'>").appendTo("#subitem");
			console.log(am[j].value) 
		}
	}
	if(cnt<1){
		alert("편의시설은 무조건 하나이상 고르세요.");
		return false;
	}
	return true;
}
    </script>
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5" style="margin-left: 300px; width: 500px;">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row" style="height: auto;">
					<div class="col-lg-7" style="margin-left: 10px; margin-top: 20px; margin-bottom: 20px;">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4" style="text-align: left;">편의시설 수정</h1>
						</div>
						<div class="user" style="width: 500px; height: 700px;">
							<form method="POST" name="frm1" onsubmit="return validate();" action="${cp}/business_view/updateamenitiesok" enctype="multipart/form-data">																															
								<hr style="width: 900px;">
								<c:forEach var="vo" items="${selam}" varStatus="vs">
								<input type="checkbox"  style="width: 100px; height: 100px;" value="${vo.AMENITIES_NAME}" name="am"><span style="font-size: 2em;">${vo.AMENITIES_NAME}</span><br>
								</c:forEach>
								<hr style="width: 900px;">
								<div id="subitem"></div>
								<a href="${cp}/business/view"
											class="btn btn-secondary btn-icon-split"><span>뒤로가기</span>
										</a>					
								 <input type="submit" class="btn btn-primary btn-icon-split"
									style="float: right; margin-right:50px;" value="수정" onclick="valiDate()">
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
