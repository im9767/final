<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				      <td>${couponList.coupon_type }</td>
				      <td>${couponList.coupon_status }</td>
				      <td>${couponList.making_date }</td>
				     
				      
				    </tr>
			  	</c:forEach>
			  </tbody>
			</table>
		</section>
		<!-- //contents -->
		<!--래플 당첨결과-->
		<div class="layer_cont layer-raffle-result" id="raffle_result" style="display:none; position: fixed; top:50%; left: 60%; margin-left:-800px;  z-index: 100;margin-top:-404px"></div>
		<!--//래플 당첨결과-->
	</div>
	<!-- //mypage area -->
</div>