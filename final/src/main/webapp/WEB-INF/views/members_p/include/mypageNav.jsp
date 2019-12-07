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
		<dd><a href="/app/mypage/order_list_opt">주문 내역 조회</a></dd>
		<dd><a href="/app/mypage/write_review">구매후기</a></dd>
		<dd><a href="/app/mypage/raffle" class="is-active">래플 응모내역</a></dd>
		<dd><a href="${pageContext.request.contextPath }/members/qnalist">문의내역</a></dd>
		<dd><a href="/app/mypage/counsel">1:1문의</a></dd>
		<dd><a href="/app/mypage/viewed_goods">최근 본 상품</a></dd>
		<dd><a href="/app/mypage/favorite_goods">좋아요</a></dd>
		<dd><a href="/app/mypage/mysize_new">마이 사이즈</a></dd>
		<dt>매거진&amp;커뮤니티</dt>
		<dd><a href="https://my.musinsa.com/member/v1/board">커뮤니티</a></dd>
		<dd><a href="https://my.musinsa.com/member/v1/newsfeed">뉴스피드</a></dd>
		<dd><a href="https://my.musinsa.com/member/v1/friends/follow">친구</a></dd>
		<dd><a href="https://my.musinsa.com/member/v1/paper">쪽지</a></dd>
		<dd><a href="https://my.musinsa.com/member/v1/like-magazine">매거진 좋아요</a></dd>
	</dl>
	</nav>
<!-- //mypage nav -->