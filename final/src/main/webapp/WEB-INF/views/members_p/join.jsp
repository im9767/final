<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">

    <meta name="description" content="여기어때 회원 가입 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="apple-touch-icon" href="//image.goodchoice.kr/images/web_v3/h1_logo_mo.png">
    <link rel="apple-touch-icon" sizes="76x76" href="//image.goodchoice.kr/images/web_v3/icon_76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="//image.goodchoice.kr/images/web_v3/icon_120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="//image.goodchoice.kr/images/web_v3/icon_152.png">

    <meta name="apple-mobile-web-app-title" content="회원 가입 | 여기어때">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no,address=no,email=no">

    <meta property="og:type" content="website">
    <meta property="og:title" content="회원 가입 | 여기어때">
    <meta property="og:description" content="여기어때 회원 가입 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">
    <meta property="og:image" content="//image.goodchoice.kr/images/web_v3/h1_logo_mo_share.png">
    <meta property="og:url" content="https://www.goodchoice.kr/user/join">

    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="회원 가입 | 여기어때">
    <meta name="twitter:description" content="여기어때 회원 가입 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">
    <meta name="twitter:image" content="//image.goodchoice.kr/images/web_v3/h1_logo_mo_share.png">
    <meta name="twitter:domain" content="https://www.goodchoice.kr/user/join">

    <meta property="al:ios:url" content="https://itunes.apple.com/kr/app/id884043462?mt=8">
    <meta property="al:ios:app_store_id" content="884043462">
    <meta property="al:ios:app_name" content="여기어때 - 대한민국 1등 종합숙박앱">
    <meta property="al:android:url" content="https://play.google.com/store/apps/details?id=kr.goodchoice.abouthere">
    <meta property="al:android:app_name" content="여기어때">
    <meta property="al:android:package" content="kr.goodchoice.abouthere">
    <meta property="al:web:url" content="https://www.goodchoice.kr">

    <meta name="naver-site-verification" content="27e1bd094d2f12af942addbf4afdb3f479ad0273">

    <link rel="shortcut icon" href="//image.goodchoice.kr/images/web_v3/favicon_170822.ico" type="image/x-icon">

	<!-- CSS -->
    <link rel="stylesheet" href="https://www.goodchoice.kr/css/common.css?rand=1574413652">
    <link rel="canonical" href="https://www.goodchoice.kr/user/join">
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.js"></script>
    
    <script type="text/javascript">
		
    	$(document).ready(function(){
			
			$("#mid").keyup(function(){

				var mid = $(this).val();
				
				$.ajax({
					url:"${pageContext.request.contextPath}/members/idCheck?mid="+mid,
					dataType:"json",
					success:function(data){
						
						var check = data.using;
						
						console.log(data.using);
						var id = $("#mid").val();
						
						if(check){
							
							$("#idCheck").css("color","red");
							$("#idCheck").text("사용 불가!");
						
						}else if(id.length>3 && check == false){
							$("#idCheck").css("color","blue");
							$("#idCheck").text("사용 가능");
						}
					}
					
				});
			});
			
			$("#mid").focusout(function(){
				$("#idCheck").text("");
			});
			
			
		});
    	
    	function validation(){
    		
    		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); 
    		var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    		var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
    		var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    		var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
			
    		//이름 공백 검사 
    		if($("#name").val() == ""){ 
    			alert("이름을 입력해주세요"); 
    			$("#name").focus(); 
    			return false;
    		}
    		
    		// 아이디 공백검사
   			if($("#mid").val() == ""){
    			alert("아이디 입력바람"); $("#mid").focus(); return false; 
    		} 
    		
    		// 아이디 유효성 검사
    		if(!getCheck.test($("#mid").val())){ 
    			alert("형식에 맞게 입력해주세요"); 
    			$("#mid").val("");
    			$("#mid").focus();
    			return false; 
    		}
    		
    		if($("#email").val() == ""){
    			alert("이메일을 입력해주세요");
    			$("#email").focus();
    			return false;
    		}
    		
    		if(!regExpEm.test($("#email").val())){
    			alert("이메일 형식이 맞지 않습니다");
    			$("#email").focus();
    			return false;
    		}
    		
    		if($("#phone").val() == ""){
    			alert("연락처를 입력해주세요");
    			$("#phone").focus();
    			return false;
    		}

    		
			/*
    		// 이름 유효성 검사
    		if(!getCheck.test($("#name").val())){
    			alert("이름형식에 맞게 입력해주세요"); 
    			$("#name").val("");
    			$("#name").focus();
    			return false; 
    		}
    		*/
    		// 비밀번호 공백 검사
    		if($("#pwd1").val() == ""){ 
    			alert("패스워드 입력바람"); 
    			$("#pwd1").focus(); 
    			return false; 
    		} 
    		if($("#id").val() == $("#pwd1").val()){ 
    			alert("아이디와 비밀번호가 같습니다"); 
    			$("#pwd1").val(""); 
    			$("#pwd1").focus(); 
    			return false; 
    		} 
    		//비밀번호 유효성검사
    		if(!regExpPw.test($("#pwd1").val())){ 
    			alert("형식에 맞게 입력해주세요"); 
    			$("#pwd1").val(""); 
    			$("#pwd1").focus();
    			return false; 
    		} 
    		//비밀번호 확인란 공백 확인 
    		if($("#pwd2").val() == ""){ 
    			alert("패스워드 확인란을 입력해주세요"); 
    			$("#pwd2").focus(); 
    			return false; 
    		} 
    		//비밀번호 서로확인 
    		if($("#pwd1").val() != $("#pwd2").val()){ 
    			alert("비밀번호가 상이합니다");
    			$("#pwd1").val("");
    			$("#pwd2").val("");
    			$("#pwd1").focus();
    			return false; 
    		}

    		
    	}
    	
    	
    	
	</script>
    
</head>
<body>
<div class="layer_fix pop_login pop_mem_reserve fix_disable">
    <section>
    <form id="joinForm" action="${pageContext.request.contextPath }/members/join" autocomplete="off" method="post" novalidate="novalidate" onsubmit="return validation()">
        <input type="hidden" name="yeogi_token" value="0f614d316fc01f334a06ae92f426580b">
        <div class="fix_title">
            <h1 class="page_head"><a href="${pageContext.request.contextPath }/" title="여기어때">여기어때</a></h1>
        </div>

        <div class="join">
            <strong class="sub_title">회원가입</strong>
            
            <b>이름</b>
            <div class="inp_type_2 form-errors"><!-- focus / err -->
                <input id="name" type="text" name="name" placeholder="이름을 입력해주세요." style='height:22px;' required="" class="required" value="" data-rule-validemail="true" data-msg-required="이름을 확인해 주세요.">
            </div>
            
            <b>아이디</b>
            <div class="inp_type_2 form-errors" style="margin-bottom: 5px;"><!-- focus / err -->
                <input id="mid" type="text" name="id" placeholder="아이디를 입력해주세요." required="" style='height:22px;' class="required" value="" data-rule-validemail="true" data-msg-required="아이디를 확인해 주세요.">
            </div>
            <span id="idCheck" style="color:red;"></span>
            
            
            <b>비밀번호</b>
            <div class="inp_type_2 form-errors form-password-rule">
                <input id="pwd1" type="password" name="pwd1" placeholder="비밀번호를 입력해주세요." style='height:22px;' required="" class="required" data-rule-passwdsecuritylevel="6" data-rule-passwdspace="true" data-msg-required="6~15자 영문, 숫자, 특수문자를 입력해 주세요.">
            </div>
            
            <b>비밀번호 확인</b>
            <div class="inp_type_2 form-errors">
                <input id="pwd2" type="password" name="pwd2" placeholder="비밀번호를 입력해주세요." style='height:22px;' required="" class="required" data-rule-equalto="input[name=upw]" data-msg-required="비밀번호를 한번 더 입력해 주세요." data-msg-equalto="비밀번호가 일치하지 않습니다.">
            </div>
            
            <b>이메일</b>
            <div class="inp_type_2 form-errors"><!-- focus / err -->
                <input id="email" type="email" name="email" placeholder="이메일 주소를 입력해주세요." style='height:22px;' required="" class="required" value="" data-rule-validemail="true" data-msg-required="이메일 주소를 확인해 주세요.">
            </div>
			
			<b>연락처</b>
			<div class="inp_type_2 form-errors"><!-- focus / err -->
                <input id="phone" type="text" name="phone" placeholder="연락처를 입력해주세요." style='height:22px;' required="" class="required" value="" data-rule-validemail="true" data-msg-required="연락처를 확인해 주세요.">
            </div>

			
			<!-- 
            <b>닉네임</b>
            <div class="inp_type_2 form-errors btn-add">
                <input type="text" id="unick" name="unick" required="" class="required" data-msg-required="닉네임을 입력하세요." data-rule-minlength="2" data-rule-spacechar="true" data-rule-specialchar="true"><label id="unick-error" class="error help-block default_label_txt icon-ic_downwards_arrow" for="unick">추천 닉네임이에요!</label>
            </div>
			 -->
            <p class="txt_agree">
              	  로그인/회원가입 시<br>
                <a href="https://www.goodchoice.kr/more/terms/1" target="_blank" data-default="1">이용약관</a>,
                <a href="https://www.goodchoice.kr/more/terms/3" target="_blank" data-default="3">개인정보처리방침</a>에 동의하게 됩니다.
            </p>

            <button type="submit" class="btn_link gra_left_right_red"><span>동의하고 가입하기</span></button>

        </div>
    </form>
    </section>
</div>
</body>
</html>