<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">
	
    <meta name="description" content="여기어때 로그인 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="apple-touch-icon" href="//image.goodchoice.kr/images/web_v3/h1_logo_mo.png">
    <link rel="apple-touch-icon" sizes="76x76" href="//image.goodchoice.kr/images/web_v3/icon_76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="//image.goodchoice.kr/images/web_v3/icon_120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="//image.goodchoice.kr/images/web_v3/icon_152.png">

    <meta name="apple-mobile-web-app-title" content="로그인 | 여기어때">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no,address=no,email=no">

    <meta property="og:type" content="website">
    <meta property="og:title" content="로그인 | 여기어때">
    <meta property="og:description" content="여기어때 로그인 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">
    <meta property="og:image" content="//image.goodchoice.kr/images/web_v3/h1_logo_mo_share.png">
    <meta property="og:url" content="https://www.goodchoice.kr/user/login">

    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="로그인 | 여기어때">
    <meta name="twitter:description" content="여기어때 로그인 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">
    <meta name="twitter:image" content="//image.goodchoice.kr/images/web_v3/h1_logo_mo_share.png">
    <meta name="twitter:domain" content="https://www.goodchoice.kr/user/login">

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
    <title>로그인 | 여기어때</title>
    <link rel="stylesheet" href="https://www.goodchoice.kr/css/common.css?rand=1574413652">
    <link rel="canonical" href="https://www.goodchoice.kr/user/login">
    
    <!-- jquery추가 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.js"></script>
    
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
    
</head>
<body>
<div class="layer_fix layer_unfix pop_login pop_mem_reserve">
    <section>
        <form id="loginForm" action="${pageContext.request.contextPath }/members/login" autocomplete="off" method="post" novalidate="novalidate">
            <input type="hidden" name="yeogi_token" value="c4c5ed781de43637abfb026919f86f9b">
            <div class="col-4" style="text-align: center;">
                <strong class="logo"><a href="${pageContext.request.contextPath }/"><img src="${cp }/resources/logo/aa.jpg" style="width:140px;height:70px;"></a></strong>
            </div>
            <a href="${kakaoUrl}"><img style="width:336px;height:56px;margin-bottom: 10px;" src="${cp }/resources/kakao/kakao_account_login_btn_medium_narrow.png"/></a>
            <button type="button" id="facebook-login-btn" class="btn_start btn_fb"><span><i class="icon-icn_login_facebook"></i>Facebook으로 로그인</span></button>
            <a href="${url}"><img style="width:336px;height:56px;" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
            <p class="space_or"><span>또는</span></p>
            <div class="inp_type_1 ico_email form-errors"><!-- focus / err -->
                <input type="text" name="id" placeholder="아이디" required="" class="required" value="" data-msg-required="아이디를 입력해 주세요.">
            	<button type="button" class="reset_val">초기화</button>
            </div>
            <div class="inp_type_1 ico_pw form-errors">
                <input type="password" name="pwd" placeholder="비밀번호" required="" class="required" data-msg-required="비밀번호를 입력해 주세요.">
            	<button type="button" class="reset_val">초기화</button>
            </div>
            <div><span style="color:red;font-size:16px;">${msg }</span></div>
           		<button class="btn_link gra_left_right_red" type="submit"><span>로그인</span></button>
            <div class="link_half">
            	<div><a href="javascript:findPwd()"><span>비밀번호 재설정</span></a></div>
            	<div><a href="${pageContext.request.contextPath }/members/join"><span>회원가입</span></a></div>
            </div>
            
        </form>
        
<%--         <div id="naver_id_login" style="text-align:center"><a href="${url}"> --%>
<!-- 		<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div> -->
        
        
    </section>
</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
	function findPwd(){
	
		window.open("${pageContext.request.contextPath}/members/findPwd","popup test","width=400,height=400,left=400");
	}
</script>
</html>