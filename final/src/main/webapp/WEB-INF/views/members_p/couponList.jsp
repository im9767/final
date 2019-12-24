<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>쿠폰 목록</title>

<div class="mypage-wrap">
		
	<!-- mypage header -->
		<jsp:include page="/WEB-INF/views/members_p/include/mypageHeader.jsp"/>
	<!-- mypage header -->	
	<!-- mypage area -->
	<div class="mypage-area">
		<!-- mypage nav -->
			<jsp:include page="/WEB-INF/views/members_p/include/mypageNav.jsp"/>
		<!-- //mypage nav -->				
		<!-- contents -->
		<section class="mypage-cont">
			<header class="n-section-title">
				<h1 class="tit">쿠폰 내역</h1>
			</header>
			<br>
			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">쿠폰번호</th>
			      <th scope="col">쿠폰명</th>
			      <th scope="col">쿠폰유형</th>
			      <th scope="col">쿠폰사용여부</th>
			      <th scope="col">쿠폰발행일</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="couponList" items="${couponList }">
			  		<tr>
				      <th>${couponList.coupon_num }</th>
				      <td>${couponList.coupon_name }</td>
				      <td>
				      	<c:choose>
				      		<c:when test="${couponList.coupon_typenum=='1'}">
				      			퍼센트할인
				      		</c:when>
				      		<c:otherwise>
				      			포인트할인
				      		</c:otherwise>
				      	</c:choose>
				      </td>
				      <td>${couponList.coupon_status }</td>
				      <td>${couponList.making_date }</td>
				    </tr>
			  	</c:forEach>
			  </tbody>
			</table>
		</section>
		<!-- //contents -->

	</div>
	<!-- //mypage area -->
</div>