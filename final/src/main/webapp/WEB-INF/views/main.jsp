<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>요기어때</title>

<div class="main_slider" id="main_slider" 
	style="background-image:url(${pageContext.request.contextPath }/resources/images/slider1.jpg)">
	<div class="container fill_height">
		<div class="row align-items-center fill_height">
			
		</div>
	</div>
</div>
<br><br>

<!-- 숙박 종류 -->
	<ul class="col-12" style="width:100%;text-align: center;">
		<li id="motel" class="card bg-dark text-white" style="width:300px;height:300px;display: inline-block;border: none;margin-right: 10px;cursor: pointer;">
		  <img src="${cp }/resources/upload/abcde-모텔.jpg" class="card-img" alt="..." style="width:300px;height:300px;opacity: 0.7;">
		  <div class="card-img-overlay" style="padding: 80px;padding-top: 120px;">
		    <h5 class="card-title" style="font-size: 2em;font-weight: bold;color: white;">모 텔</h5>
		  </div>
		</li>
		<li id="hotel" class="card bg-dark text-white" style="width:300px;height:300px;display: inline-block;border: none;margin-right: 10px;cursor: pointer;">
		  <img src="${cp }/resources/upload/abcde-hotel.jpg" class="card-img" alt="..." style="width:300px;height:300px;opacity: 0.7;">
		  <div class="card-img-overlay" style="padding: 80px;padding-top: 120px;">
		   <h5 class="card-title" style="font-size: 2em;font-weight: bold;color: white;">호 텔</h5></div>
		</li>
		<li id="resort" class="card bg-dark text-white" style="width:300px;height:300px;display: inline-block;border: none;margin-right: 10px;cursor: pointer;">
		  <img src="${cp }/resources/upload/abcde-리조트.jpg" class="card-img" alt="..." style="width:300px;height:300px;opacity: 0.7;">
		  <div class="card-img-overlay" style="padding: 80px;padding-top: 120px;">
		   <h5 class="card-title" style="font-size: 2em;font-weight: bold;color: white;">리조트</h5></div>
		</li>
		<li id="pension" class="card bg-dark text-white" style="width:300px;height:300px;display: inline-block;border: none;margin-right: 10px;cursor: pointer;">
		  <img src="${cp }/resources/upload/abcde-펜션.jpg" class="card-img" alt="..." style="width:300px;height:300px;opacity: 0.7;">
		  <div class="card-img-overlay" style="padding: 80px;padding-top: 105px;">
		    <h5 class="card-title" style="font-size: 2em;font-weight: bold;color: white;">펜 션<br>풀빌라</h5>
		  </div>
		</li>
	</ul>
	
	 <script type="text/javascript">
	 var popupX = (window.screen.width / 2) - (90 / 2);
	 var popupY= (window.screen.height / 2) - (600 / 2);
		window.onload=function(){
			window.open("${cp}/mediamp4","_blank","width=700,height=400,left="+ popupX + ", top="+ popupY);
			}

		$(function(){
			$("#motel").click(function(){
				
				location.href="${cp}/product/accommodationList?t=41&p=01";
				
			});
			
			$("#hotel").click(function(){
							
				location.href="${cp}/product/accommodationList?t=42&p=01";
							
			});
						
			$("#resort").click(function(){
				
				location.href="${cp}/product/accommodationList?t=43&p=01";
				
			});
			
			$("#pension").click(function(){
				
				location.href="${cp}/product/accommodationList?t=44&p=01";
				
			});
		});
	
	</script>
	<br>
<!-- 이벤트 -->

	<div style="width:100%;">
		<p><h4 style="width:1245px;margin: auto;font-weight: bold;">이벤트</h4></p>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width:1245px;margin: auto;">
		  <ol class="carousel-indicators">
		  
		  	<c:forEach var="event" items="${event }" varStatus="idx">
		  		<c:choose>
			  		<c:when test="${idx.index == 0 }">
			  			<li data-target="#carouselExampleIndicators" data-slide-to="${idx.index }" class="active"></li>	
			  		</c:when>
			  		<c:otherwise>
			  			<li data-target="#carouselExampleIndicators" data-slide-to="${idx.index }"></li>	
			  		</c:otherwise>
		  		</c:choose>
		  	</c:forEach>
		  </ol>
		  <div class="carousel-inner" style="width:100%;background-color: gray;height: 200px;right:5px;">
		  
		  	<c:forEach var="event" items="${event }" varStatus="idx">
		  		<c:choose>
			  		<c:when test="${idx.index == 0 }">
			  			<div class="carousel-item active">
					      <img src="${cp }/resources/upload/${event.eventImg.get(0).savefilename }" class="d-block w-100" alt="...">
					    </div>
			  		</c:when>
			  		<c:otherwise>
			  			<div class="carousel-item">
					      <img src="${cp }/resources/upload/${event.eventImg.get(0).savefilename }" class="d-block w-100" alt="...">
					    </div>	
			  		</c:otherwise>
		  		</c:choose>
		  	</c:forEach>

		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
<!-- Banner -->
