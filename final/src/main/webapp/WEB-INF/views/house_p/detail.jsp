<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507&libraries=LIBRARY"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507&libraries=services,clusterer,drawing"></script>

<div style="width:65%;min-height: 1200px;margin: auto;padding: 40px;margin-top: 150px;">
	
	<input type="hidden" value="${sdt }" name="sdt">
	<input type="hidden" value="${edt }" name="edt">
	
	<div style="width:90%;min-height:1100px;margin: auto;">
		<!-- 큰 이미지 div  -->
		<div style="width:50%;min-height:500px;float:left;" >
			
			<div id="carouselExampleControls" class="carousel slide" data-ride="false" style="width:100%;padding:10px;margin: auto;">
				<div class="carousel-inner">
					<div class="carousel-item active">
			      		<img src="${pageContext.request.contextPath }/resources/images/banner_1.jpg" class="d-block w-100" alt="...">
			    	</div>
			    <div class="carousel-item">
			      		<img src="${pageContext.request.contextPath }/resources/images/banner_2.jpg" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      		<img src="${pageContext.request.contextPath }/resources/images/banner_3.jpg" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
			    	<span class="sr-only">Next</span>
			  </a>
			</div>
						
		</div>
		
		<!-- 업소 정보 및 소개 div -->
		<div style="width:50%;min-height:500px;float:left;padding:10px;">
		
			<h2 style="font-weight: bold;">${houseinfo.company }</h2>
			
			<p>
				<span style="color:orange;font-size: 2.0em;">★★★★★</span>&nbsp;&nbsp;&nbsp;
				<span style="font-size: 1.3em;color:gray;">리뷰 개수 1,100개</span>
			</p>
			
			<p style="font-size: 1.3em;color:black;">${houseinfo.workplace }</p>
			
			<div style="font-size: 1em;"><span>입실 시간 : ${houseinfo.checkintime }</span></div>
			<div style="font-size: 1em;margin-bottom: 10px;"><span>퇴실 시간 : ${houseinfo.checkouttime }</span></div>

			<p class="card" style="font-size: 1.2em;min-height: 100px;padding:10px;">
				<span>${houseinfo.intro }</span>
			</p>
			<p style="text-align: right;">
				<a type="button" class="btn btn-success" href="${cp }/members/payment">찜목록 추가</a>
			</p>
			
		</div>
		
		<!-- 객실정보 -->
	<div style="width:100%;min-height:1000px;clear: both;">
		
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			  <li class="nav-item">
			    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">예약</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">소개</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">리뷰</a>
		 	 </li>
		</ul>
		
		<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			  
			  <section id="div1" class="info" style="width:100%;min-height: 500px;">
				
				<br>
				
				<c:forEach var="rooms" items="${roomsJoin }" varStatus="idx">
					<div class="card" style="border-radius: 10px 10px 10px 10px;width:100%;min-height:300px;padding-top: 25px;padding-bottom:25px;margin-bottom: 20px;">
						<div style="margin: auto;width:95%;min-height: 250px;">
							<!-- 객실 대표이미지 -->
							<div style="width:50%;height:250px;float: left;">
								<img id="room-${idx.index }" class="room" style="width:90%;height: 250px;cursor: pointer;" alt="객실사진" src="${pageContext.request.contextPath }/resources/images/banner_1.jpg">
							</div>
							<!-- 객실 정보 -->
							<div style="width:50%;height:250px;float: left;margin-bottom: 20px;">
							
								<h3>
									<span>${rooms.roomname }</span>
									<span style="font-size: 0.7em;">${rooms.max_Personnel }인</span>
								</h3>
								<div style="font-size:1.2em;">숙박</div>
								<div style="text-align: right;font-size: 1.3em;font-weight: bold;">${dc.format(rooms.room_price) }원</div>
								<div style="font-size:1.2em;">객실정보</div>
								<div style="text-align: right;">${rooms.room_info }</div>
								<p></p>
								
								
								<!-- 예약하기 버튼 -->
								<a href="${cp }/members/payment?sdt=${sdt}&edt=${edt}&room_num=${rooms.room_num}&room_name=${rooms.roomname }&room_price=${rooms.room_price}&company=${houseinfo.company}" 
								class="btn btn-danger btn-lg" role="button" style="width: 100%;position: absolute;bottom: 0px;color:white;">숙박 예약</a>
								
								
							</div>
							<!-- 객실 이미지 여러개 div -->
							<div id="room-detail-${idx.index }" style="clear:both;width:100%;height:500px;padding: 50px 30px 30px 30px;display: none;background-color: #f9f9f9;">
								
								<button type="button" class="close" aria-label="Close" style="position: absolute;top:5px;right:5px;">
								  	<span aria-hidden="true" style="font-size: 1.5em;">&times;</span>
								</button>
							    
								<div id="carouselExampleFade_${idx.index }" class="carousel slide carousel-fade" data-ride="carousel">
								  <div class="carousel-inner">
									
									<c:forEach var="roomImg" items="${rooms.rooms_img }" varStatus="i">
									
									<c:if test="${i.index == 0 }">
									
									    <div class="carousel-item active">
									      <img style="width:100%;height: 400px;" src="${cp }/resources/room_img/${roomImg.room_org_name}" class="d-block w-100" alt="...">
									    </div>
									
									</c:if>
									<c:if test="${i.index >0 }">
										<div class="carousel-item">
									      <img style="width:100%;height: 400px;" src="${cp }/resources/room_img/${roomImg.room_org_name}" class="d-block w-100" alt="...">
									    </div>
									
									</c:if>    
								    
<!-- 								    <div class="carousel-item"> -->
<%-- 								      <img style="width:100%;height: 400px;" src="${cp }/resources/images/banner_2.jpg" class="d-block w-100" alt="..."> --%>
<!-- 								    </div> -->
<!-- 								    <div class="carousel-item"> -->
<%-- 								      <img style="width:100%;height: 400px;" src="${cp }/resources/images/banner_3.jpg" class="d-block w-100" alt="..."> --%>
<!-- 								    </div> -->
									</c:forEach>
								 
								  </div>
								  <a class="carousel-control-prev" href="#carouselExampleFade_${idx.index }" role="button" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="carousel-control-next" href="#carouselExampleFade_${idx.index }" role="button" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </a>
								</div>
							
							</div>
						</div>
						
					</div>
				
				</c:forEach>
				
				
			</section>
			  		
			  </div>
			  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="width:100%;min-height: 500px;">
			  		
			  		<!-- 객실정보 -->
<!-- 			<section id="div2" class="info" style="width:100%;min-height: 500px;display:none;background-color: blue;"> -->
				
				<div class="card">
				
				  <div class="card-body" style="margin: 10px;">
				   
					   <h4>편의 시설</h4>
					   <!-- 편의시설 목록 -->
					   <div>
					   		<ul>
					   			<c:forEach var="amen" items="${houseAmen }">
					   				<li style="display: inline-block;margin-right: 10px;">
					   					<div>
					   					<img style="width:60px;height:60px;" src="${cp }/resources/a_icon/${amen.ORGFILENAME}"><br><span>${amen.AMENITIES_NAME }</span>
					   					</div>
					   				</li>
								</c:forEach>
					   		</ul>
					   </div>
					   
					   <!-- 편의시설 설명 -->
					   <div>
						   <c:forEach var="amen" items="${houseAmen }">
					   		<div>
					   			<p>
					   				<span>※ ${amen.AMENITIES_CONTENT }</span>
					   			</p>
					   		</div>

					   		</c:forEach>
					   </div>
				   
				  </div>
				  
				</div>
								
		<!-- </section> -->
			  		
			  </div>
			  
			  <!-- 리뷰 탭 -->
			  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab" style="padding:20px;">
			  	
			  		<div style="border-bottom: 2px;">
			  			<h2 style="text-align: center;">추천해요</h2>
			  			<h2 style="text-align: center;color:orange;">★★★★★</h2>
			  		</div>
			  		
			  		<c:forEach var="review" items="${review }">
						<div class="media" style="padding:20px;">
						  <img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:56px;height:56px;">
						  <div class="media-body">
						  
						    <h5 class="mt-0" style="font-weight: bold;">${review.review_title } </h5>
						    <div>
						    	<span style="font-size: 1.1em;color:gray;">스위트룸</span> <span style="font-size: 0.9em;color:orange;">
						    	친절도 :
						    	<c:choose>
						    		<c:when test="${review.kindness == 5 }">
						    			★★★★★
						    		</c:when>
						    		<c:when test="${review.kindness == 4 }">
						    			★★★★
						    		</c:when>
						    		<c:when test="${review.kindness == 3 }">
						    			★★★
						    		</c:when>
						    		<c:when test="${review.kindness == 2 }">
						    			★★
						    		</c:when>
						    		<c:when test="${review.kindness == 1 }">
						    			★
						    		</c:when>
						    	</c:choose>
						    	청결도 :
						    	<c:choose>
						    		<c:when test="${review.clean == 5 }">
						    			★★★★★
						    		</c:when>
						    		<c:when test="${review.clean == 4 }">
						    			★★★★
						    		</c:when>
						    		<c:when test="${review.clean == 3 }">
						    			★★★
						    		</c:when>
						    		<c:when test="${review.clean == 2 }">
						    			★★
						    		</c:when>
						    		<c:when test="${review.clean == 1 }">
						    			★
						    		</c:when>
						    	</c:choose>
						    	편의성 :
						    	<c:choose>
						    		<c:when test="${review.convenience == 5 }">
						    			★★★★★
						    		</c:when>
						    		<c:when test="${review.convenience == 4 }">
						    			★★★★
						    		</c:when>
						    		<c:when test="${review.convenience == 3 }">
						    			★★★
						    		</c:when>
						    		<c:when test="${review.convenience == 2 }">
						    			★★
						    		</c:when>
						    		<c:when test="${review.convenience == 1 }">
						    			★
						    		</c:when>
						    	</c:choose>
						    	</span>
						    </div>
						   
						    	${review.review_content }
							
						  	<div style="margin-top:15px;">
							  	<c:forEach var="image" items="${review.review_img }">
							  		<c:if test="${review.review_num == image.review_num }"></c:if>
							  		<img src="${cp }/resources/review_icon/${image.review_save_name}" class="mr-3" alt="..." style="width:100px;height:100px;">
							  	</c:forEach>
						  	</div>
						  	<p style="margin-top: 15px;font-size: 1em;">
						  		${review.review_date }
						  	</p>
						  </div>
					
						</div>
					</c:forEach>
					
				
					<div class="media" style="padding:20px;">
					  <img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:56px;height:56px;">
					  <div class="media-body">
					  
					    <h5 class="mt-0">Media heading 
					    	<span style="font-size: 0.7em;color:orange;">  친절도 : ★★★★★   청결도 : ★★★★  편의설 : ★★★</span>
					    </h5>
					    
					    Cras sit amet nibh libero, in gravida nulla.nibh libero,gravida nulla.nibh lib in gravida nulla Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					  	<div style="margin-top:15px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  	</div>
					  </div>
				
					</div>
					
					<div class="media" style="padding:20px;">
					  <img src="${cp }/resources/review_icon/ico_14.png" class="mr-3" alt="..." style="width:56px;height:56px;">
					  <div class="media-body">
					  
					    <h5 class="mt-0">Media heading 
					    	<span style="font-size: 0.7em;color:orange;">  친절도 : ★★★★★   청결도 : ★★★★  편의설 : ★★★</span>
					    </h5>
					    
					    Cras sit amet nibh libero, in gravida nulla.nibh libero,gravida nulla.nibh lib in gravida nulla Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					  	<div style="margin-top:15px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  	</div>
					  </div>
				
					</div>
					
					<div class="media" style="padding:20px;">
					  <img src="${cp }/resources/review_icon/ico_13.png" class="mr-3" alt="..." style="width:56px;height:56px;">
					  <div class="media-body">
					  
					    <h5 class="mt-0">Media heading 
					    	<span style="font-size: 0.7em;color:orange;">  친절도 : ★★★★★   청결도 : ★★★★  편의설 : ★★★</span>
					    </h5>
					    
					    Cras sit amet nibh libero, in gravida nulla.nibh libero,gravida nulla.nibh lib in gravida nulla Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					  	<div style="margin-top:15px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  	</div>
					  </div>
				
					</div>
					
					<div class="media" style="padding:20px;">
					  <img src="${cp }/resources/review_icon/ico_11.png" class="mr-3" alt="..." style="width:56px;height:56px;">
					  <div class="media-body">
					  
					    <h5 class="mt-0">Media heading 
					    	<span style="font-size: 0.7em;color:orange;">  친절도 : ★★★★★   청결도 : ★★★★  편의설 : ★★★</span>
					    </h5>
					    
					    Cras sit amet nibh libero, in gravida nulla.nibh libero,gravida nulla.nibh lib in gravida nulla Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					  	<div style="margin-top:15px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  	</div>
					  </div>
				
					</div>
					
					
			  </div>
		</div>
				
		<!-- 지도 -->
		<div id="map" style="width:100%;height:400px;"></div>
				
		</div>
	</div>
</div>

<script>
	$(function(){
		/*
		$("#id1").click(function(){
			$(".info").css("display","none");
			$("#div1").css("display","block");
		});
		$("#id2").click(function(){
			$(".info").css("display","none");
			$("#div2").css("display","block");
		});
		$("#id3").click(function(){
			$(".info").css("display","none");
			$("#div3").css("display","block");
		});
		*/
		$(".room").click(function () {
			
			var num = parseInt($(this).prop("id").split("-")[1]);
		
			$("#room-detail-"+num).css("display","block");
		});
		
		$(".close").click(function () {
			
			$(this).parent().css("display","none");
		});
	});
</script>
<!-- 지도 api javascript 코드 -->
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${houseinfo.workplace }', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${houseinfo.company }</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>