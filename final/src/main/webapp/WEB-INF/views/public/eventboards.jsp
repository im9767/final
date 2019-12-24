<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="width:80%;min-height: 1200px;margin: auto;padding: 40px;margin-top: 150px;">

	<div class="accordion" id="accordionExample" style="min-height: 800px;">
	
	<c:forEach var="event" items="${event }" varStatus="i">
	
	
	<div class="card mb-3">
					
		      		<p>이벤트 제목: ${event.etitle }</p>
		<p>이벤트 기간 ${event.estartdate} ~ ${event.eenddate}</p>      		
		
 <a class="page-link" href="${cp }/public/eventdetail?event_num=${event.event_num}">
 
  <img src="../resources/upload/${event.savefilename}" class="card-img-top" alt="...">
 
  </a>
  
  <div class="card-body">
    <h5 class="card-title">${event.etitle }</h5>
    <p class="card-text">첫번재 카드모양</p>
  </div>
</div>

	
	
	
	</c:forEach>
	<c:if test="${empty event }">
		<h2 style="text-align: center;">이벤트 없습니다.</h2>
	</c:if>
	</div>

	<br>
	
	 <!-- 페이징 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  
			    <c:choose>
			  		<c:when test="${pagination.startPageNum > pagination.pageBlockCount }">
				    	<li class="page-item">
				    		<a class="page-link" href="${cp }/public/eventList?pageNum=${pagination.startPageNum-1 }">이전</a>
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
				   				<a class="page-link" href="${cp }/public/eventList?pageNum=${i }">${i }</a>
				   				<span class="sr-only">(current)</span>
				   			</li>
			   			</c:when>
			   			<c:otherwise>
				   			<li class="page-item">
				   				<a class="page-link" href="${cp }/public/eventList?pageNum=${i }">${i }</a>
				   			</li>
			   			</c:otherwise>
			   		</c:choose>
			   		
			   	</c:forEach>
			   	
			   <c:choose>
				 <c:when test="${pagination.endPageNum<pagination.totalPageCount }">
					    <li class="page-item">
					   	  <a class="page-link" href="${cp }/public/eventList?pageNum=${pagination.endPageNum+1 }">다음</a>
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



</div>