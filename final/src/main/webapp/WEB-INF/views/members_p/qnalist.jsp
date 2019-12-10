<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				<h3 class="tit">문의 내역</h3>
			</header>
			<br>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">문의번호</th>
			      <th scope="col">분류</th>
			      <th scope="col">제목</th>
			      <th scope="col">답변여부</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="qnalist" items="${qnalist }" varStatus="i">
			  		<tr>
				      <th scope="row">${qnalist.QNA_NUM }</th>
				      <td>${qnalist.QNA_CATEGORY_NAME }</td>
				      <td><a href="${pageContext.request.contextPath }/members/qnaDetail?qna_num=${qnalist.QNA_NUM}">${qnalist.QNA_TITLE }</a></td>
				      <c:choose>
				      	<c:when test="${empty qnalist.ANWSER }">
				      		<td style="color:red;">답변대기</td>
				      	</c:when>
				      	<c:otherwise>
				      		<td style="color:blue;">답변완료</td>
				      	</c:otherwise>
				      </c:choose>
				      
				    </tr>
			  	</c:forEach>
			  </tbody>
			</table>
			 <!-- 페이징 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-end">
			  
			    <c:choose>
			  		<c:when test="${pagination.startPageNum > pagination.pageBlockCount }">
				    	<li class="page-item">
				    		<a class="page-link" href="${cp }/members/qnalist?pageNum=${pagination.startPageNum-1 }">이전</a>
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
				   				<a class="page-link" href="${cp }/members/qnalist?pageNum=${i }">${i }</a>
				   				<span class="sr-only">(current)</span>
				   			</li>
			   			</c:when>
			   			<c:otherwise>
				   			<li class="page-item">
				   				<a class="page-link" href="${cp }/members/qnalist?pageNum=${i }">${i }</a>
				   			</li>
			   			</c:otherwise>
			   		</c:choose>
			   		
			   	</c:forEach>
			   	
			   <c:choose>
				 <c:when test="${pagination.endPageNum<pagination.totalPageCount }">
					    <li class="page-item">
					   	  <a class="page-link" href="${cp }/members/qnalist?pageNum=${pagination.endPageNum+1 }">다음</a>
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
