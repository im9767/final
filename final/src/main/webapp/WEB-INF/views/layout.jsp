<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/responsive.css">


<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.js"></script>




<!-- 마이페이지 -->
	<link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/mypage.min.css?20191119">
	<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?20191107_1">
	<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/store_common.css?20191106_4">
	<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/layout.min.css?20191121">
	<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/guide.min.css?20191204">
	<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/style.min.css?20191203"><link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/sub.css?20191202">
	<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/media_query.css?20191015">
	<!--<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/font.css?20170221" />-->
	<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/new.css?20191015">
	<!-- Swiper -->
	<link rel="stylesheet" type="text/css" href="//static.msscdn.net/swiper/swiper.min.css">
	<script src="//static.msscdn.net/swiper/swiper.min.js"></script>
	<!-- 스토어, 매거진 공통 스크립트 -->
	<script type="text/javascript" src="//static.msscdn.net/mfile_outsrc/js/vendor/jquery-1.11.1.min.js?20160201"></script>
	<script type="text/javascript" src="//static.msscdn.net/mfile_outsrc/js/common/base.js?20160201"></script>
	<script type="text/javascript" src="//static.msscdn.net/mfile_outsrc/js/common/common.js?20191015"></script>
	<script type="text/javascript" src="//static.msscdn.net/mfile_outsrc/js/vendor/jquery.easing.js?20160201"></script>
	<!--// 스토어, 매거진 공통 스크립트 -->
	
	<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/mini_cart.js?20181029_1"></script>
	<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/common.js?20191122"></script>
	<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/jquery.cycle.all.js?20160202"></script>
	<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/m_js/jquery-ui.min.js?20160202"></script>
	<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/jslib.js?20190701"></script>
	<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/jquery.bxslider.js?20180503"></script>
	<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/suggestions.js?20190819"></script>
	<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/clipboard.min.js?20170406"></script>
	<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/ui.js?20191015"></script>
	
	<!--jqModal-->
	<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/jqModal.css?20160119">
	<script src="//static.msscdn.net/skin/musinsa/js/jqModal.min.js?20160511" type="text/javascript"></script>
	<!--//jqModal-->
	
	<!-- 매거진 관심브랜드 관련 스크립트 -->
	<script type="text/javascript" src="https://www.musinsa.com/layouts/community/js/ex.script.js"></script>
	<!--// 매거진 관심브랜드 관련 스크립트 -->




<!-- <link rel="stylesheet" href="${pageConctext.request.contextPath }/resources/detailcss/detail.css">
<link rel="stylesheet" href="${pageConctext.request.contextPath }/resources/detailcss/detail2.css"> -->

		<!-- 상세페이지 css -->
		<!-- all css here -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/themify-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/pe-icon-7-stroke.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/icofont.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/meanmenu.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/easyzoom.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/bundle.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ezone/assets/css/responsive.css">
        <script src="${pageContext.request.contextPath }/resources/ezone/assets/js/vendor/modernizr-2.8.3.min.js"></script>
	
	<!-- 유사 이미지 상품 검색 -->
	<link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/image_search.css?20181203_02">
	
	
	<!-- ezone템플릿 css -->
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/img/favicon.png">
		
<!-- all css here -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/icofont.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/meanmenu.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/bundle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ezone/assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
	
	
		<!-- 부트스트랩 기본 css -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	
	
</head>
<body>
<div class="super_container">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="main">
		<tiles:insertAttribute name="main"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>
<!-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<!-- ezone 템플릿-->
<!-- <script src="${pageContext.request.contextPath}/resources/ezone/assets/js/vendor/jquery-1.12.0.min.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/jquery.counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/ajax-mail.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resources/ezone/assets/js/main.js"></script>
</html>