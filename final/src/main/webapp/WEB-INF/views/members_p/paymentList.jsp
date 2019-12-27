<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>결제 내역</title>

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
				<h3 class="tit">결제 내역</h3>
			</header>
			<br>
			<table class="table">
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
			  	<c:choose>
			  	<c:when test="${not empty paymentList }">
			  	<c:forEach var="paymentList" items="${paymentList }">
				  	<tr style="text-align: center;">
				  		<th style="vertical-align:middle;">${paymentList.PAY_NUM }</th>
				  		<td style="vertical-align:middle;"><a style="text-decoration: none;" href="${cp }/house/detail?house_num=${paymentList.HOUSE_NUM}"><img style="width:200px;height:100px;" src="${cp }/resources/upload/${paymentList.HOUSE_SAVE_NAME }"></a></td>
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
			  	</c:when>
			  	<c:otherwise>
			  		<tr>
				      <td scope="row" colspan="7" style="padding:150px;text-align: center;">결제 내역이 없습니다</td>
				    </tr>
			  	</c:otherwise>
			  	</c:choose>
			  </tbody>
			</table>
			
			 <!-- 페이징 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  
			    <c:choose>
			  		<c:when test="${pagination.startPageNum > pagination.pageBlockCount }">
				    	<li class="page-item">
				    		<a class="page-link" href="${cp }/members/paymentList?pageNum=${pagination.startPageNum-1 }">이전</a>
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
				   				<a class="page-link" href="${cp }/members/paymentList?pageNum=${i }">${i }</a>
				   				<span class="sr-only">(current)</span>
				   			</li>
			   			</c:when>
			   			<c:otherwise>
				   			<li class="page-item">
				   				<a class="page-link" href="${cp }/members/paymentList?pageNum=${i }">${i }</a>
				   			</li>
			   			</c:otherwise>
			   		</c:choose>
			   		
			   	</c:forEach>
			   	
			   <c:choose>
				 <c:when test="${pagination.endPageNum<pagination.totalPageCount }">
					    <li class="page-item">
					   	  <a class="page-link" href="${cp }/members/paymentList?pageNum=${pagination.endPageNum+1 }">다음</a>
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
