<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">

    <meta name="description" content="여기어때 비밀번호 재설정 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="apple-touch-icon" href="//image.goodchoice.kr/images/web_v3/h1_logo_mo.png">
    <link rel="apple-touch-icon" sizes="76x76" href="//image.goodchoice.kr/images/web_v3/icon_76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="//image.goodchoice.kr/images/web_v3/icon_120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="//image.goodchoice.kr/images/web_v3/icon_152.png">

    <meta name="apple-mobile-web-app-title" content="비밀번호 재설정 | 여기어때">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no,address=no,email=no">

    <meta property="og:type" content="website">
    <meta property="og:title" content="비밀번호 재설정 | 여기어때">
    <meta property="og:description" content="여기어때 비밀번호 재설정 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">
    <meta property="og:image" content="//image.goodchoice.kr/images/web_v3/h1_logo_mo_share.png">
    <meta property="og:url" content="https://www.goodchoice.kr/user/passwdResetStart">

    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="비밀번호 재설정 | 여기어때">
    <meta name="twitter:description" content="여기어때 비밀번호 재설정 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">
    <meta name="twitter:image" content="//image.goodchoice.kr/images/web_v3/h1_logo_mo_share.png">
    <meta name="twitter:domain" content="https://www.goodchoice.kr/user/passwdResetStart">

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
    <title>비밀번호 재설정 | 여기어때</title>
    <link rel="stylesheet" href="https://www.goodchoice.kr/css/common.css?rand=1574413652">
    <link rel="canonical" href="https://www.goodchoice.kr/user/passwdResetStart">
</head>
<body>
<div class="layer_fix layer_unfix pop_login pop_mem_reserve">
    <section>
        <form id="loginForm" action="${pageContext.request.contextPath }/members/sendpw" autocomplete="off" method="post" novalidate="novalidate">
            <input type="hidden" name="returnUrl" value="">
            <input type="hidden" name="yeogi_token" value="bfb3061953ce059cff1db4fae76c0f3e">
            <div class="fix_title">
                <h1 class="page_head"><a href="https://www.goodchoice.kr/" title="여기어때">여기어때</a></h1>
            </div>
            <strong class="sub_title">비밀번호 재설정</strong>
            <p class="txt_top">
                회원가입 시 등록한 이메일 주소를 입력하시면<br>비밀번호 재설정 할 수 있는 인증번호를 전송해드립니다.
            </p>

            <div class="pop_login_errors">
                <ul>
                                    </ul>
            </div>

            <div class="inp_type_1 ico_email form-errors"><!-- focus / err -->
                <input type="text" name="id" placeholder="이메일 주소" required="" class="required" value="" data-msg-required="아이디를 확인해 주세요.">
            	<button type="button" class="reset_val">초기화</button>
            </div>
            <div class="inp_type_1 ico_email form-errors"><!-- focus / err -->
                <input type="text" name="email1" placeholder="이메일 주소" required="" class="required" value="" data-msg-required="이메일 주소를 확인해 주세요.">
            	<button type="button" class="reset_val">초기화</button>
            </div>

            <button type="submit" class="btn_link gra_left_right_red"><span>인증번호 받기</span></button>
            <!-- <div class="layer_fix_footer">
                <p>
                    <a href="http://www.withinnovation.co.kr/" target="_blank">회사소개</a>|
                    <a href="https://www.goodchoice.kr/more/terms">이용약관</a>|
                    <a href="https://www.goodchoice.kr/more/terms/privacy">개인정보처리방침</a>|
                    <a href="https://www.goodchoice.kr/more/terms/teenager">청소년보호정책</a>
                </p>
                <p class="copyright">Copyright WITHINOVATION Corp. All rights reserved.</p>
            </div> -->
        </form>
    </section>
</div>
</body>
</html>