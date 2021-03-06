<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
	<header class="header trans_300">
		<!-- Top Navigation -->

		<div class="top_nav" style='background-color: red;'>
			<div class="container">
				<div class="row">
					
					<div class="col-md-12 text-right">
						<div class="top_nav_right">
							<ul class="top_nav_menu">

								<!-- Currency hf/ Language / My Account -->
								<c:choose>
									<c:when test="${not empty sessionScope.id }">
										<li class="currency" style='background-color: red;border:none;'>
											<a href="${pageContext.request.contextPath }/members/bookingList" style='color:white;font-size: 20px;font-weight: bold'>예약내역</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="currency" style='background-color: red;border:none;'>
											<a href="${pageContext.request.contextPath }/members/login" style='color:white;font-size: 20px;font-weight: bold'>예약내역</a>
										</li>
									</c:otherwise>
								</c:choose>
								<li class="language" style='background-color: red;border:none; height: auto;'>
									<a href="#" style='color:white;font-size: 20px;font-weight: bold'>
										더보기
										<i class="fa fa-angle-down" style="margin-top: 19px;"></i>
									</a>
									<ul class="language_selection" style=' height: auto;'>
										<li><a href="${cp }/public/noticeList">공지사항</a></li>
										<li><a href="${cp }/public/eventboards">이벤트</a></li>
										<li><a href="${cp}/public/faq">FAQ</a></li>
										<li><a href="#">약관 및 정책</a></li>
									</ul>
								</li>					
								<c:choose>
									<c:when test="${empty sessionScope.id && empty aid && empty bid}">
										<li class="account" style='background-color: red;border:none;'>
											<a href="${pageContext.request.contextPath }/members/login" style='color:white;font-size: 20px;font-weight: bold'>로그인</a>
										</li>
										<li class="account" style='background-color: red;border:none;'>
											<a href="<c:url value='/admin_view/login'/>" style='color:white;font-size: 20px;font-weight: bold'>관리자</a>
										</li>
										<li class="account" style='background-color: red;border:none;'>
											<a href="<c:url value='/business_view/login'/>" style='color:white;font-size: 20px;font-weight: bold'>사업자</a>
										</li>
									</c:when>
									<c:when test="${not empty sessionScope.id }">
										<li class="account" style='background-color: red;border:none;'>
											<a href="${pageContext.request.contextPath }/members/logout" style='color:white;font-size: 20px;font-weight: bold'>로그아웃</a>
										</li>
									</c:when>
									<c:when test="${not empty aid}">
										<li class="account" style='background-color: red;border:none;'>
											<a href="${pageContext.request.contextPath }/members/logout" style='color:white;font-size: 20px;font-weight: bold'>로그아웃</a>
										</li>
										<li class="account" style='background-color: red;border:none;'>
											<a href="${cp}/admin" style='color:white;font-size: 20px;font-weight: bold'>관리자페이지로이동</a>
										</li>
									</c:when>
									<c:when test="${not empty bid }">
										<li class="account" style='background-color: red;border:none;'>
											<a href="${pageContext.request.contextPath }/members/logout" style='color:white;font-size: 20px;font-weight: bold'>로그아웃</a>
										</li>
										<li class="account" style='background-color: red;border:none;'>
											<a href="${cp}/business/loginok" style='color:white;font-size: 20px;font-weight: bold'>사업자페이지로이동</a>
										</li>
									</c:when>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="${pageContext.request.contextPath }/" style="text-decoration: none;"><img style="width:140px;height:70px;" src="${cp }/resources/logo/aa.jpg"></a>
						</div>
						<nav class="navbar">
							<ul class="navbar_user">
								<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
								<c:choose>
									<c:when test="${empty sessionScope.id }">
										<li><a href="${pageContext.request.contextPath }/members/login"><i class="fa fa-user" aria-hidden="true"></i></a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath }/members/mypage"><i class="fa fa-user" aria-hidden="true"></i></a></li>
									</c:otherwise>
								</c:choose>
								<li class="checkout">
									<a href="#">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
										<!--위시리스트 담긴 갯수 <span id="checkout_items" class="checkout_items"></span> -->
									</a>
								</li>
							</ul>
							<div class="hamburger_container">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>

	</header>