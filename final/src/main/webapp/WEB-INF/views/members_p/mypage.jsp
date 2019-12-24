<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>마이페이지</title>

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
			<div style="margin-bottom: 200px;">
			<header class="n-section-title">
				<h3 class="tit">결제 내역</h3>
			</header>
			<br>
			<table class="table">
			<colgroup>
				<col width="10%">
				<col width="15%">
				<col width="27%">
				<col width="12%">
				<col width="12%">
				<col width="12%">
				<col width="14%">
			</colgroup>
			<c:choose>
				<c:when test="${empty paymentList }">
					 <thead>
						    <tr style="text-align: center;">
						      <th scope="col">결제 번호</th>
						      <th scope="col">이미지</th>
						      <th scope="col">숙소명</th>
						      <th scope="col">결제 금액</th>
						      <th scope="col">결제일</th>
						      <th scope="col">결제 유형</th>
						      <th scope="col">리뷰 작성</th>
						    </tr>
					  </thead>
					  <tbody>
					  	<tr>
					  		<td style="text-align: center;padding:150px;color:lightgray;" colspan="7">결제 내역이 없습니다.</td>
					  	</tr>
					  </tbody>
					 
				</c:when>
				<c:otherwise>
					  <thead>
					    <tr style="text-align: center;">
					      <th scope="col">결제 번호</th>
					      <th scope="col">이미지</th>
					      <th scope="col">숙소명</th>
					      <th scope="col">결제 금액</th>
					      <th scope="col">결제일</th>
					      <th scope="col">결제 유형</th>
					      <th scope="col">리뷰 작성</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="paymentList" items="${paymentList }">
						  	<tr style="text-align: center;">
						  		<th style="vertical-align:middle;">${paymentList.PAY_NUM }</th>
						  		<td style="vertical-align:middle;"><a style="text-decoration: none;" href="${cp }/house/detail?house_num=${paymentList.HOUSE_NUM}"><img style="width:200px;height:100px;" src="${cp }/upload/${paymentList.HOUSE_SAVE_NAME }"></a></td>
						  		<td style="vertical-align:middle;"><a style="text-decoration: none;" href="${cp }/house/detail?house_num=${paymentList.HOUSE_NUM}">${paymentList.COMPANY }</a></td>
						  		<td style="vertical-align:middle;">${dc.format(paymentList.PAY) }원</td>
						  		<td style="vertical-align:middle;">${paymentList.PAY_DAY }</td>
						  		<td style="vertical-align:middle;">${paymentList.PAYMENT_TYPE }</td>
						  		<c:choose>
						  			<c:when test="${paymentList.compare >= 0 }">
						  			
						  				<td style="vertical-align:middle;">
						  					<a class="btn btn-danger" href="${cp }/members/reviewWrite?house_save_name=${paymentList.HOUSE_SAVE_NAME }&room_num=${paymentList.ROOM_NUM}&roomname=${paymentList.ROOMNAME}&company=${paymentList.COMPANY}">
						  						리뷰 작성
						  					</a>
						  				</td>		
						  			
						  			</c:when>
						  			<c:otherwise>
						  			
						  				<td style="vertical-align:middle;"><button type="button" class="btn btn-light" disabled >리뷰 작성</button></td>		
						  							  			
						  			</c:otherwise>
						  		</c:choose>
						  		
						  	</tr>
					  	</c:forEach>
					  </tbody>

				</c:otherwise>
			</c:choose>
			</table>
			</div>
			<div style="margin-bottom: 200px;">
			<header class="n-section-title">
				<h3 class="tit">후기 목록</h3>
			</header>
			<table class="table">
			<colgroup>
				<col width="10%">
				<col width="30%">
				<col width="30%">
				<col width="30%">
			</colgroup>
			<c:choose>
				<c:when test="${empty reviewList }">
					  <thead>
					    <tr style="text-align: center;">
					      <th scope="col">#</th>
					      <th scope="col">숙소명</th>
					      <th scope="col">제목</th>
					      <th scope="col">작성일</th>
					    </tr>
					  </thead>
					  <tbody>
					  		<tr>
					  			<td style="text-align: center;padding:150px;color:lightgray;" colspan="4">
					  				작성된 리뷰가 없습니다.
					  			</td>
					  		</tr>
					  </tbody>
				</c:when>
				<c:otherwise>
					  <thead>
					    <tr style="text-align: center;">
					      <th scope="col">#</th>
					      <th scope="col">숙소명</th>
					      <th scope="col">제목</th>
					      <th scope="col">작성일</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="reviewList" items="${reviewList }" varStatus="i">
					  		<tr style="text-align: center;">
						      <th scope="row">${(pagination.pageNum-1)*10+i.index+1 }</th>
						      <td>${reviewList.COMPANY }<span style="font-size: 0.9em;">&nbsp;[${reviewList.ROOMNAME }]</span></td>
						      <td><a href="#">${reviewList.REVIEW_TITLE }</a></td>
						      <td>${reviewList.REVIEW_DATE }</td>
						    </tr>
					  	</c:forEach>
					  </tbody>
				</c:otherwise>
			</c:choose>
			</table>
			</div>
			
			<div style="margin-bottom: 200px;">
			<header class="n-section-title">
				<h3 class="tit">쿠폰 내역</h3>
			</header>
			<br>
			<table class="table">
			<colgroup>
				<col width="12%">
				<col width="22%">
				<col width="22%">
				<col width="22%">
				<col width="22%">
			</colgroup>
			<c:choose>
				<c:when test="${empty couponList }">
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
					  	<tr>
					  		<td style="text-align: center;padding:150px;color:lightgray;" colspan="5">보유중인 쿠폰이 없습니다.</td>
					  	</tr>
					  </tbody>
				</c:when>
				<c:otherwise>
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
				</c:otherwise>
			</c:choose>
			</table>
			</div>
		</section>
	
	</div>
	<!-- //mypage area -->
</div>