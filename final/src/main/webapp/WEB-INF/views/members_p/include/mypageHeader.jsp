<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- mypage header -->
<div class="mypage-info" style="margin-top:150px;background-color:lightgray;">
	<div class="inner">
		<h1 class="tit"><a href="${pageContext.request.contextPath }/members/mypage" style="text-decoration: none;">My Page</a></h1>
		
		<div class="my-profile">
					<div class="img"></div>
					<strong class="name">${map.MNAME }</strong>
			<em class="account" style="background-color:lightgray;">${map.MID }</em>
			<a href="${pageContext.request.contextPath }/members/infoupdate" class="link-modify" style="text-decoration: none;">회원정보변경</a>
			<div class="member">
				<em class="level">${map.GNAME }</em>
				<a href="#" class="link-level" style="text-decoration: none;">등급 혜택 보기 &gt;</a>
			</div>
			<p class="txt">다음 등급인 브론즈까지 40,808점 남았습니다 <span>|</span>${map.MREGDATE }</p>
		</div>
		<div class="my-menu">
			
			<a href="#" style="text-decoration: none;">
				<i class="my-ico ico-point"></i>포인트 &gt;
				<strong>${map.MPOINT }</strong>
			</a>
			<a href="#" style="text-decoration: none;">
				<i class="my-ico ico-coupon"></i>쿠폰 &gt;
				<strong>${cntCoupon }</strong>
			</a>
			<a href="${pageContext.request.contextPath }/members/qna" style="text-decoration: none;">
				<i class="my-ico ico-review"></i>Q&A &gt;
				<strong>작성</strong>
			</a>
		</div>
	</div>
</div>
<!-- mypage header -->	