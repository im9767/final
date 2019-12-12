<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 업체 정보 등록 -->

<!-- 


 -->
<!DOCTYPE html>
<html>
<head>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>

	<h1> 업체 정보 등록 </h1>
    <form method="post" action="${pageContext.request.contextPath }/business_view/houseInformation_insertok">
               
                    
        
                    <!-- 이 아래는 업소테이블 입력하는곳 -->
                     <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="house_num" id="house_num" placeholder="업소식별키(숫자)">
                    </div>
                       <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="bnum" id="bnum" placeholder="종목식별키(21모텔 22호텔 23리조트 24펜션)">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="intro" id="intro" placeholder="업소소개(문자)">
                    </div>
                    
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="checkintime" id="checkintime" placeholder="입실시간(문자)">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="checkouttime" id="checkouttime" placeholder="퇴실시간(문자)">
                    </div>
                       <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="company" id="company" placeholder="업체명(문자)">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="license" id="license" placeholder="사업자등록번호(문자)">
                    </div>
                     <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="ceo" id="ceo" placeholder="대표자명(문자)">
                    </div>
                     <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="orgaddr" id="orgaddr" placeholder="본점소재지(문자)">
                    </div>
                      <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="workplace" id="workplace" placeholder="사업장소재지(문자)">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" name="com_tel" id="com_tel" placeholder="사업장전화번호(문자)">
                    </div>
                    
                    
                    <input type="submit" class="btn btn-primary btn-user btn-block"value="등록신청">
                    <hr>
                  </form>
                  
                  
<h1>업체 정보 등록</h1>


</body>
</html>