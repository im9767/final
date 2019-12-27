<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="width:50%;min-height: 1200px;margin: auto;padding: 40px;margin-top: 150px;">
	<div class="accordion" id="accordionExample" style="min-height: 800px;">
	<c:forEach var="event" items="${event }" varStatus="i">
	<div class="card mb-3">	
		      		<p>이벤트 제목: ${event.etitle } 이벤트 기간:${event.eenddate}  ~ ${event.estartdate}      조회수:${event.ehit}</p>      		
 <a class="page-link" href="${cp }/public/eventdetail?event_num=${event.event_num}">
  <img src="../resources/upload/${event.savefilename}" class="card-img-top" alt="...">
  </a>
  <div class="card-body">
  </div>
</div>
	</c:forEach>
</div>