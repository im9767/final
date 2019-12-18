<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>

	<!-- mypage css -->
	<link rel="stylesheet" type="text/css" href="${cp }/resources/mypage/mypage.css">
	<!-- mypage css -->
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.css">
	<link href="${pageContext.request.contextPath}/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/main_styles.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/responsive.css">
	
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- 결제 연동 api -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


	<!-- 수량박스 css 추가 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/counter.css">
	<!-- 체크박스 css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/checkbox.css">
	<!-- 사이드바 마진, 데이트피커 주말 색 변경 css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/accomm.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- 부트스트랩 기본 css -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	
	
	<link rel="icon" type="image/png" sizes="16x16" href="${cp }/resources/favicon/favicon-16x16.png">
	
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

<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
<!-- 기존 템플릿 스크립트 추가 -->
<script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

</html>