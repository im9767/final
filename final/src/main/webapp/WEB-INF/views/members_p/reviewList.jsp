<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>나의 후기</title>

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
				<h3 class="tit">후기 목록</h3>
			</header>
			<br>
			<table class="table">
			  <thead>
			    <tr style="text-align: center;">
			      <th scope="col">#</th>
			      <th scope="col">숙소명</th>
			      <th scope="col">제목</th>
			      <th scope="col">작성일</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:choose>
			  	<c:when test="${not empty reviewList }">
			  	<c:forEach var="reviewList" items="${reviewList }" varStatus="i">
			  		<tr style="text-align: center;">
				      <th scope="row">${(pagination.pageNum-1)*10+i.index+1 }</th>
				      <td>${reviewList.COMPANY }<span style="font-size: 0.9em;">&nbsp;[${reviewList.ROOMNAME }]</span></td>
				      <td><a href="#">${reviewList.REVIEW_TITLE }</a></td>
				      <td>${reviewList.REVIEW_DATE }</td>
				    </tr>
			  	</c:forEach>
			  	</c:when>
			  	<c:otherwise>
			  		<tr>
				      <td scope="row" colspan="4" style="padding:150px;text-align: center;">작성된 리뷰가 없습니다</td>
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
				    		<a class="page-link" href="${cp }/members/reviewList?pageNum=${pagination.startPageNum-1 }">이전</a>
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
				   				<a class="page-link" href="${cp }/members/reviewList?pageNum=${i }">${i }</a>
				   				<span class="sr-only">(current)</span>
				   			</li>
			   			</c:when>
			   			<c:otherwise>
				   			<li class="page-item">
				   				<a class="page-link" href="${cp }/members/reviewList?pageNum=${i }">${i }</a>
				   			</li>
			   			</c:otherwise>
			   		</c:choose>
			   		
			   	</c:forEach>
			   	
			   <c:choose>
				 <c:when test="${pagination.endPageNum<pagination.totalPageCount }">
					    <li class="page-item">
					   	  <a class="page-link" href="${cp }/members/reviewList?pageNum=${pagination.endPageNum+1 }">다음</a>
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
