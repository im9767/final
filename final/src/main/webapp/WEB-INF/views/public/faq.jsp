<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div style="width:80%;min-height: 1200px;margin: auto;padding: 40px;margin-top: 150px;">

	<div class="accordion" id="accordionExample" style="min-height: 800px;">
	
	<c:forEach var="faq" items="${faq}" varStatus="i">
	
		  <div class="card">
		    <div class="card-header" id="heading_${i.index }">
		      <h2 class="mb-0">
		        <button style="float: left" class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse_${i.index }" aria-expanded="true" aria-controls="collapse_${i.index }">	   
		          	[
		          	 <c:choose>
                      <c:when test="${faq.fcnum==1}">      
    						<td>교환</td>
      					</c:when>
      					<c:when test="${faq.fcnum==2}">      
    						<td>이용문의</td>
      					</c:when>
      					<c:when test="${faq.fcnum==3}">      
    						<td>예약</td>
      					</c:when>
      					<c:when test="${faq.fcnum==4}">      
    						<td>쿠폰</td>
      					</c:when>
      					<c:when test="${faq.fcnum==5}">      
    						<td>결제</td>
      					</c:when><c:otherwise>
      					<td>기타</td>
      					</c:otherwise>
      					</c:choose>
		          	
		          	] &nbsp;${faq.ftitle } 		      
		        </button>
		      </h2>
		    </div>
		
		    <div id="collapse_${i.index }" class="collapse" aria-labelledby="heading_${i.index }" data-parent="#accordionExample">
		      <div class="card-body">
		      		<p>${faq.fcontent}</p>		      
		      </div>
		    </div>
		  </div>
	
	</c:forEach>
	<c:if test="${empty faq }">
		<h2 style="text-align: center;">질문이 없습니다.</h2>
	</c:if>
	</div>

	<br>



</div>