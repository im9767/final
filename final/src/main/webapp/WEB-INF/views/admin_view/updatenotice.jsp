<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Register</title>

  <!-- Custom fonts for this template-->
  <link href="${cp}/resources/admin/admin-boot/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${cp}/resources/admin/admin-boot/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row" style="height: 800px">
          <div class="col-lg-7" style="margin-left: 100px; margin-top: 20px;" >     
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4" style="text-align: left;">공지사항 수정</h1>
              </div>             
              <div class="user" style="width: 900px; height: 700px;">
              <c:forEach var="vo" items="${list}">
              <form method="GET" action="${cp}/admin_view/upnoticeok">
                <div class="form-group row">                 
                    <div class="col-sm-6 mb-3 mb-sm-0" style="font-size:1.7em; color: black;">
                    <input type="text" name="nnum" id="nnum" value="${vo.nnum}" hidden="">
                    <hr style="width: 900px;">                
                    <input type="text" name="ntitle" id="ntitle" value="${vo.ntitle}">
                  </div>                 
                </div>
                <textarea id="ncontent" name ="ncontent" style="width: 800px; height: 500px;" >${vo.ncontent}</textarea>                                    
                <hr style="width: 900px; ">
                <span>등록날짜:${vo.nregdate}</span>
                <div style="float: right; color:black;">
                <input type="submit" class="btn btn-secondary btn-icon-split" value="수정하기">
                 <a href="${cp}/admin_view/noticeboard" class="btn btn-secondary btn-icon-split">                
                	 <span>뒤로가기</span>
                  </a>
                  </div>
               	<div>             
                </div>  
               	</form>
               	</c:forEach>
                  </div>
              <hr>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="${cp}/resources/admin/admin-boot/vendor/jquery/jquery.min.js"></script>
  <script src="${cp}/resources/admin/admin-boot/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${cp}/resources/admin/admin-boot/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${cp}/resources/admin/admin-boot/js/sb-admin-2.min.js"></script>

</body>

</html>
