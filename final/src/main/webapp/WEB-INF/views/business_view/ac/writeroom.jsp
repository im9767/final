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
<script type="text/javascript" src="${cp}/resources/admin/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

        $(function() {
            $("#imgIn").on('change', function(){
            	$("#imgbox img").remove();
            	readURL(this);
            });
        });
        var b=0;
        function readURL(input) {
        	for(var a=0;a<input.files.length;a++){
           		var reader = new FileReader();
           		
            	reader.onload = function (e){                               		
            		console.log(input.files[b].name);      		
            		var aa=$("<img src='"+e.target.result+"'><br>").appendTo("#imgbox");           		
            		aa.css("width","700px");
            		aa.css("height","700px");
            		console.log(b++);
            		}
            	reader.readAsDataURL(input.files[a]);
            	}           
        }
        var ppp = 1;
        function plus(){ 		
    		var x= $("#max").val(++ppp);
    	}
        function manous(){
        	var one=parseInt($("#max").val());
    		if(one==1){
    			$("#max").val(1);
    		}else{
    			var y= $("#max").val(--ppp);
    		}
    	}
    </script>
</head>
<body class="bg-gradient-primary">

	<div class="container" style="margin-left: 10px; padding-right: 10px;">

		<div class="card o-hidden border-0 shadow-lg my-5" style="padding-left: 10px; width: 1800px;">
			<div class="card-body p-0" >
				<!-- Nested Row within Card Body -->
				<div class="row" style="height: auto; width: auto">
					<div class="col-lg-7" style="margin-left: 10px; margin-top: 20px; margin-bottom: 20px; width: 1800px;">
						<div class="text-center" >
							<h1 class="h4 text-gray-900 mb-4" style="text-align: left; font-size: 50px;">방등록</h1>
						</div>
						<div class="user" style="width: 1800px; height: 700px;">
							<form method="POST" action="${cp}/business_view/writeroomok" enctype="multipart/form-data">
								<div class="form-group row" style="width: auto">
									<div class="col-sm-6 mb-3 mb-sm-0" style="width: 1750px;">
									<input type="text" name="rname" id="rname" placeholder="방이름" style="width: 450px;">
									</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									가격:&nbsp;<input type="text" id="price" name="price" style="float:right; width: 100px;" placeholder="가격입력">&nbsp;
									최대인원:&nbsp;<input type="button" id="mm" onclick="manous()" value="-">&nbsp;<input type="text" id="max" name="max" readonly="readonly" style="float:right; width:20px;" value="1" >&nbsp;<input type="button" id="pp" value="+" onclick="plus()">
								</div><hr style="width: 1750px;">
								<h2>소개</h2>
								<div><textarea style="width: 900px; height: 500px;" name="rcontent" id="rcontent"></textarea><div style="padding-right: 650px; float: right;"><input type="text" value="1"></div>
								<hr style="width: 1750px;">
								<h2>이미지</h2>													
								<div id="imgbox"></div>						
								<hr style="width: 1750px;">
								<input multiple="multiple" type="file" id="imgIn" name="imgIn" class="btn btn-secondary btn-icon-split" >						
								 <input type="submit" class="btn btn-primary btn-icon-split"
									style="float: right; margin-right:50px;" value="등록">
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
