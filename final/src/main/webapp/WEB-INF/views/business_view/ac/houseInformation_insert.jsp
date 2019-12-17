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
   
   

   <!--  -->
   
   
   
    <div class="alert alert-dismissible alert-success">
  	<button type="button" class="close" data-dismiss="alert">&times;</button>
  	<strong>주의 사항!</strong> 각 항목별 형식을 지켜주십시오 승인이 되지 않을수 있습니다</a>.
                    
        
	<h1><p class="text-primary"> 업체 정보 등록 </p></h1>
    <form method="post" action="${pageContext.request.contextPath }/business_view/houseInformation_insertok">
              
    

                    <!-- 이 아래는 업소테이블 입력하는곳 -->
                  
                   	<!-- 이게 바로 체크 박스 -->
          <div class="form-group" style="width:500px;height:50px;">         	
	<div class="custom-control custom-switch" >
      <input type="checkbox"  class="custom-control-input"  id="customSwitch1"  checked=""  >
      <label class="custom-control-label" for="customSwitch1" >  <p class="text-primary">  21번 펜션</p></label>
    </div>
  
    	<div class="custom-control custom-switch">
    	  <input type="checkbox" class="custom-control-input" id="customSwitch2" checked="">
     	 <label class="custom-control-label" for="customSwitch2"> <p class="text-primary">  22번 호텔 </p></label>
    	</div>
  
    <div class="custom-control custom-switch">
      <input type="checkbox" class="custom-control-input" id="customSwitch3" checked="">
      <label class="custom-control-label" for="customSwitch3"> <p class="text-primary"> 23번 리조트</p></label>
    </div>
  
  
  <div class="custom-control custom-switch">
      <input type="checkbox" class="custom-control-input" id="customSwitch4" checked="">
      <label class="custom-control-label" for="customSwitch4">  <p class="text-primary">  24번 펜션</p></label>
    </div>
     </div>
     <!--  체크박스 -->
     
     <div class="form-group has-success has-feedback">
  <label class="control-label" for="inputSuccess2">Input with success</label>
  <input type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status">
  <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
  <span id="inputSuccess2Status" class="sr-only">(success)</span>
</div>
<div class="form-group has-warning has-feedback">
  <label class="control-label" for="inputWarning2">Input with warning</label>
  <input type="text" class="form-control" id="inputWarning2" aria-describedby="inputWarning2Status">
  <span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
  <span id="inputWarning2Status" class="sr-only">(warning)</span>
</div>
<div class="form-group has-error has-feedback">
  <label class="control-label" for="inputError2">Input with error</label>
  <input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status">
  <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
  <span id="inputError2Status" class="sr-only">(error)</span>
</div>
<div class="form-group has-success has-feedback">
  <label class="control-label" for="inputGroupSuccess1">Input group with success</label>
  <div class="input-group">
    <span class="input-group-addon">@</span>
    <input type="text" class="form-control" id="inputGroupSuccess1" aria-describedby="inputGroupSuccess1Status">
  </div>
  <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
  <span id="inputGroupSuccess1Status" class="sr-only">(success)</span>
</div>

     
     
       <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
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
                    
                    <button type="button" class="btn btn-outline-danger">Danger</button>
                     <button type="submit" class="btn btn-primary">Submit</button>
                    <input type="submit" class="btn btn-primary btn-user btn-block"value="등록신청">
                    <hr>
                  </form>
                
                  
                   
  	<fieldset>
</div>
    <button type="button" class="btn btn-primary btn-lg btn-block">주의 너는 죽어있다</button>
    
    <div class="btn-group btn-group-toggle" data-toggle="buttons">
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="option1" autocomplete="off" checked="">
     여기에 무엇을 집어 넣어야할지 생각하자
  </label>
</div>


    
    <!-- 이게 바로 체크 박스 -->
    
    <p class="text-muted"> 여기서부터 업소테이블 등록하기
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
  
    
   
   
   	<input multiple="multiple" type="file" id="file" name="file" class="btn btn-secondary btn-icon-split" >
   	<div id="subitem"></div>	
  
      
    </fieldset>
    
    
   
</form>
       
                
                  
<h1>업체 정보 등록</h1>


</body>
</html>