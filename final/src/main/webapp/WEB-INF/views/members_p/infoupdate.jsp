<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>회원 정보 수정</title>

<div class="mypage-wrap">
		
	<!-- mypage header -->
		<jsp:include page="/WEB-INF/views/members_p/include/mypageHeader.jsp"/>
	<!-- mypage header -->	
	<!-- mypage area -->
	<div class="mypage-area">
	<!-- mypage nav -->
		<jsp:include page="/WEB-INF/views/members_p/include/mypageNav.jsp"/>
	<!-- //mypage nav -->			
		<!-- contents -->
		<section class="mypage-cont">
			<header class="n-section-title">
				<h3 class="tit">회원 정보 수정</h3>
			</header>
			<br>
			<form action="${pageContext.request.contextPath }/members/infoupdate" method="post" onsubmit="return validation()" style="margin-left:10px;">
			  <div class="form-group">
			    <label for="exampleInputEmail1">이름</label>
			    <input value="${vo.mname }" type="text" class="form-control" id="mname" name="mname" aria-describedby="emailHelp" style="width:500px;text-align: left;" readonly>
			    <small id="emailHelp" class="form-text text-muted">이름은 변경 할 수 없습니다.</small>
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputEmail1">아이디</label>
			    <input value="${vo.mid }" type="text" class="form-control" id="mid" name="mid" aria-describedby="emailHelp" style="width:500px;text-align: left;" readonly>
			    <small id="emailHelp" class="form-text text-muted">아이디는 변경 할 수 없습니다.</small>
			  </div>
			  <c:if test="${vo.login_type == 1 }">
			  <div class="form-group">
			    <label for="exampleInputPassword1">비밀번호</label>
			    <input value="${vo.mpwd }" type="password" class="form-control" id="mpwd" name="mpwd" style="width:500px;text-align: left;">
			    <small id="emailHelp" class="form-text text-muted">비밀번호는 영문/숫자/특수 문자를 포함한 8자이상 입력</small>
			  </div>
			  </c:if>
			  
			  <div class="form-group">
			    <label for="exampleInputEmail1">이메일</label>
			    <input value="${vo.memail }" type="email" class="form-control" id="memail" name="memail" aria-describedby="emailHelp" style="width:500px;text-align: left;">
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputPassword1">전화번호</label>
			    <input value="${vo.mphone }" type="text" class="form-control" id="mphone" name="mphone" style="width:500px;text-align: left;">
			  </div>
			  
			  
			  <button type="submit" class="btn btn-primary">수정</button>
			</form>
		</section>
		<!-- //contents -->

	</div>
	<!-- //mypage area -->
</div>
<script>
function validation(){
	
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); 
	var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
	var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
	
	var login_type = '${vo.login_type}';

	if(login_type == '1'){
		
		// 비밀번호 공백 검사
		if($("#mpwd").val() == ""){ 
			alert("패스워드 입력바람"); 
			$("#pwd1").focus(); 
			return false; 
		} 
		if($("#mid").val() == $("#mpwd").val()){ 
			alert("아이디와 비밀번호가 같습니다"); 
			$("#pwd1").val(""); 
			$("#pwd1").focus(); 
			return false; 
		} 
		//비밀번호 유효성검사
		if(!regExpPw.test($("#mpwd").val())){ 
			alert("비밀번호를 형식에 맞게 입력해주세요."); 
			$("#pwd1").val(""); 
			$("#pwd1").focus();
			return false; 
		} 
	}
	
	if($("#memail").val() == ""){
		alert("이메일을 입력해주세요");
		$("#memail").focus();
		return false;
	}
	
	if(!regExpEm.test($("#memail").val())){
		alert("이메일 형식이 맞지 않습니다");
		$("#memail").focus();
		return false;
	}
	
	if($("#mphone").val() == ""){
		alert("연락처를 입력해주세요");
		$("#phone").focus();
		return false;
	}
	
}

</script>