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
<script type="text/javascript">
$(function(){
	sessionStorage.setItem("contextpath","${pageContext.request.contextPath}");
	var ctx=getContextPath();
	function getContextPath(){
		return sessionStorage.getItem("contextpath");
	}
	var imgArr=new Array();
	imgArr[0]=ctx+"/resources/images/slider1.jpg";
	imgArr[1]=ctx+"/resources/images/slider6.jpg";
	imgArr[2]=ctx+"/resources/images/slider3.jpg";
	imgArr[3]=ctx+"/resources/images/slider5.jpg";
	var index=1;
	var main_slider=document.getElementById("main_slider");
	setInterval(function(){
		$("#main_slider").stop().fadeOut(500,function(){
			main_slider.style.backgroundImage="url("+imgArr[index++]+")";
			$("#main_slider").fadeIn(500);
			if(index==4){
				index=0;
			}
		});
	},3000);
});
</script>
	<!-- mypage css -->
	<link rel="stylesheet" type="text/css" href="${cp }/resources/mypage/mypage.css">
	<!-- /mypage css -->
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.css">
	<link href="${pageContext.request.contextPath}/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/main_styles.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/responsive.css">

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
	
	<!-- 드롭다운 서브메뉴 CSS -->
    <link type="text/css" href="${pageContext.request.contextPath }/resources/styles/bootstrap-submenu.css" rel="stylesheet">

</head>
<body>
<div class="super_container">
		<tiles:insertAttribute name="header"/>

		<tiles:insertAttribute name="main"/>
	
		<tiles:insertAttribute name="footer"/>
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/mainImg.js"></script> --%>
</html>