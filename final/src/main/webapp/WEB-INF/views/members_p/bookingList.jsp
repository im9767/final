<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>예약 내역</title>

<div class="mypage-wrap">
		
	<!-- 마이페이지 헤더 -->
		<jsp:include page="/WEB-INF/views/members_p/include/mypageHeader.jsp"/>
	<!-- 마이페이지 헤더 -->	
	
	<!-- mypage area -->
	<div class="mypage-area">
	
		<!-- 마이페이지 네비게이션 바 -->
			<jsp:include page="/WEB-INF/views/members_p/include/mypageNav.jsp"/>
		<!-- //마이페이지 네비게이션 바 -->		
			
		<!-- 마이페이지 컨텐츠 -->
		<section class="mypage-cont">
			<header class="n-section-title">
				<h3 class="tit">예약 내역</h3>
			</header>
			<br>
			<table class="table">
			  <thead>
			    <tr style="text-align: center;">
			      <th scope="col">예약 번호</th>
			      <th scope="col">이미지</th>
			      <th scope="col">숙소명</th>
			      <th scope="col">객실명</th>
			      <th scope="col">숙박 시작일</th>
			      <th scope="col">숙박 종료일</th>
			      <th scope="col">예약 상태</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="bookingList" items="${bookingList }" varStatus="i">
			  		<tr style="text-align: center;">
				      <th style="vertical-align:middle;" scope="row">${bookingList.BOOKING_NUM }</th>
				      <td style="vertical-align:middle;"><img style="width:200px;height:100px;" src="${cp }/upload/${bookingList.HOUSE_SAVE_NAME }"></td>
				      <td style="vertical-align:middle;"><a href="${pageContext.request.contextPath }/house/detail?house_num=${bookingList.HOUSE_NUM }">${bookingList.COMPANY }</a></td>
				      <td style="vertical-align:middle;">${bookingList.ROOMNAME }</td>
				      <td style="vertical-align:middle;" scope="row">${bookingList.START_DATE }</td>
				      <td style="vertical-align:middle;" scope="row">${bookingList.END_DATE }</td>
				      <td style="vertical-align:middle;" scope="row">${bookingList.BOOK_STATUS }</td>
				    </tr>
			  	</c:forEach>
			  </tbody>
			</table>
			
			 <!-- 페이징 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  
			    <c:choose>
			  		<c:when test="${pagination.startPageNum > pagination.pageBlockCount }">
				    	<li class="page-item">
				    		<a class="page-link" href="${cp }/members/bookingList?pageNum=${pagination.startPageNum-1 }">이전</a>
				    	</li>
					</c:when>
					 <c:otherwise>
					 	<li class="page-item disabled">
						   	<a class="page-link" href="#" aria-disabled="true">이전</a>
						</li>
					 </c:otherwise>
			   </c:choose>
			   
			   	<c:forEach var="i" begin="${pagination.startPageNum }" end="${pagination.endPageNum }">
			   	
			   		<c:choose>
			   			<c:when test="${pagination.pageNum == i }">
				   			<li class="page-item active">
				   				<a class="page-link" href="${cp }/members/bookingList?pageNum=${i }">${i }</a>
				   				<span class="sr-only">(current)</span>
				   			</li>
			   			</c:when>
			   			<c:otherwise>
				   			<li class="page-item">
				   				<a class="page-link" href="${cp }/members/bookingList?pageNum=${i }">${i }</a>
				   			</li>
			   			</c:otherwise>
			   		</c:choose>
			   		
			   	</c:forEach>
			   	
			   <c:choose>
				 <c:when test="${pagination.endPageNum<pagination.totalPageCount }">
					    <li class="page-item">
					   	  <a class="page-link" href="${cp }/members/bookingList?pageNum=${pagination.endPageNum+1 }">다음</a>
					   	</li>
				 </c:when>
				 <c:otherwise>
				 			<li class="page-item disabled">
					      		<a class="page-link" href="#" aria-disabled="true">다음</a>
					        </li>
			 	 </c:otherwise>
			 	</c:choose>

			  </ul>
			</nav>
		</section>
		<!-- //마이페이지 컨텐츠 -->

	</div>
	<!-- //mypage area -->
</div>
