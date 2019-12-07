<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
	<header class="header trans_300">
		<!-- Top Navigation -->

		<div class="top_nav" style='background-color: red;'>
			<div class="container">
				<div class="row">
					<div class="col-md-6">
	
					</div>
					<div class="col-md-6 text-right">
						<div class="top_nav_right">
							<ul class="top_nav_menu">

								<!-- Currency / Language / My Account -->

								<li class="currency" style='background-color: red;border:none;'>
									<a href="${pageContext.request.contextPath }/house/detail" style='color:white;'>예약내역</a>
								</li>
								<li class="language" style='background-color: red;border:none;'>
									<a href="#" style='color:white;'>
										더보기
										<i class="fa fa-angle-down" style="margin-top: 19px;"></i>
									</a>
									<ul class="language_selection">
										<li><a href="#">공지사항</a></li>
										<li><a href="#">이벤트</a></li>
										<li><a href="#">FAQ</a></li>
										<li><a href="#">약관 및 정책</a></li>
									</ul>
								</li>
								<li class="account" style='background-color: red;border:none;'>
									<c:choose>
										<c:when test="${empty sessionScope.id }">
											<a href="${pageContext.request.contextPath }/members/login" style='color:white;'>로그인</a>	
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath }/members/logout" style='color:white;'>로그아웃</a>
										</c:otherwise>
									</c:choose>
									
								</li>
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
							<a href="${pageContext.request.contextPath }/">요기<span style="font-size: 40px;">어때</span></a>
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