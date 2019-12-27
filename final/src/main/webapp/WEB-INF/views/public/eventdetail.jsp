<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div style="width:60%;min-height: 1200px;width:80%;margin: auto;padding: 40px;margin-top:150px;">

	<div class="accordion" id="accordionExample" style="min-height: 800px;width:100%;margin: auto;">
	
	<c:forEach var="eventdetail" items="${eventdetail }" varStatus="i">
	
	
	<div style="padding:0px;width:80%;margin: auto;">
				<div style="margin:auto;width: 800px;height: 80%;">
  <img src="${cp}/resources/upload/${eventdetail.savefilename}"  style="width:800px;height:1000px;">
 </div>

</div>

	
	</c:forEach>

	
<p>배열대로 순서</p>

</div>
</div>