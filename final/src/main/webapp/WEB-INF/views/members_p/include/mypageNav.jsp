<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- mypage nav -->
	<nav class="mypage-nav">
		<h2 class="n-hidden">My Page Menu</h2>
		<!-- aa -->
            <span class="direct on">바로접속 ON</span>
    	<dl class="menu">
		<dt>나의 쇼핑 활동</dt>
		<dd><a href="/app/mypage/order_list_opt" style="text-decoration: none;">주문 내역 조회</a></dd>
		<dd><a href="/app/mypage/write_review" style="text-decoration: none;">구매후기</a></dd>
		<dd><a href="${pageContext.request.contextPath }/members/qnalist" style="text-decoration: none;">문의내역</a></dd>
		<dd><a href="${pageContext.request.contextPath }/members/couponList" style="text-decoration: none;">쿠폰내역</a></dd>
		<dd><a href="/app/mypage/viewed_goods" style="text-decoration: none;">최근 본 상품</a></dd>
		<dd><a href="/app/mypage/favorite_goods" style="text-decoration: none;">좋아요</a></dd>
		<dd><a href="/app/mypage/mysize_new" style="text-decoration: none;">마이 사이즈</a></dd>
		<dt>매거진&amp;커뮤니티</dt>
		<dd><a href="https://my.musinsa.com/member/v1/board" style="text-decoration: none;">커뮤니티</a></dd>
		<dd><a href="https://my.musinsa.com/member/v1/newsfeed" style="text-decoration: none;">뉴스피드</a></dd>
		<dd><a href="https://my.musinsa.com/member/v1/friends/follow" style="text-decoration: none;">친구</a></dd>
		<dd><a href="https://my.musinsa.com/member/v1/paper" style="text-decoration: none;">쪽지</a></dd>
		<dd><a href="https://my.musinsa.com/member/v1/like-magazine" style="text-decoration: none;">매거진 좋아요</a></dd>
	</dl>
	</nav>
<!-- //mypage nav -->