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


</div>