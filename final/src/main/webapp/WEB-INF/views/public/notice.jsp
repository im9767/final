<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div style="width:80%;min-height: 1200px;margin: auto;padding: 40px;margin-top: 150px;">

	<div class="accordion" id="accordionExample" style="min-height: 500px;">
	
	<c:forEach var="notice" items="${notice }" varStatus="i">
	
		  <div class="card">
		    <div class="card-header" id="heading_${i.index }">
		      <h2 class="mb-0">
		        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse_${i.index }" aria-expanded="true" aria-controls="collapse_${i.index }">
		      
		          ${notice.ntitle }
		      
		        </button>
		      </h2>
		    </div>
		
		    <div id="collapse_${i.index }" class="collapse" aria-labelledby="heading_${i.index }" data-parent="#accordionExample">
		      <div class="card-body">
		      
		      		<p>${notice.ncontent }</p>
		      		<p>${notice.nregdate }</p>
		      
		      </div>
		    </div>
		  </div>
	
	</c:forEach>
	<c:if test="${empty notice }">
		<h2 style="text-align: center;">공지사항이 없습니다.</h2>
	</c:if>
	</div>

	<br>
	
	 <!-- 페이징 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  
			    <c:choose>
			  		<c:when test="${pagination.startPageNum > pagination.pageBlockCount }">
				    	<li class="page-item">
				    		<a class="page-link" href="${cp }/public/noticeList?pageNum=${pagination.startPageNum-1 }">이전</a>
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
				   				<a class="page-link" href="${cp }/public/noticeList?pageNum=${i }">${i }</a>
				   				<span class="sr-only">(current)</span>
				   			</li>
			   			</c:when>
			   			<c:otherwise>
				   			<li class="page-item">
				   				<a class="page-link" href="${cp }/public/noticeList?pageNum=${i }">${i }</a>
				   			</li>
			   			</c:otherwise>
			   		</c:choose>
			   		
			   	</c:forEach>
			   	
			   <c:choose>
				 <c:when test="${pagination.endPageNum<pagination.totalPageCount }">
					    <li class="page-item">
					   	  <a class="page-link" href="${cp }/public/noticeList?pageNum=${pagination.endPageNum+1 }">다음</a>
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