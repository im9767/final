<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507&libraries=LIBRARY"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507&libraries=services,clusterer,drawing"></script>

<div style="width:80%;min-height: 1200px;margin: auto;padding: 40px;margin-top: 150px;">
	
	<div style="width:90%;background-color: lightgray;min-height:1100px;margin: auto;">
		<!-- 큰 이미지 div  -->
		<div style="width:50%;background-color: yellow;min-height:700px;float:left;">
			
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
		<div style="width:50%;background-color: lightgreen;min-height:700px;float:left;padding:10px;">
		
			<h2 style="font-weight: bold;">업체명</h2>
			<br>
			<p>
				<span style="color:orange;font-size: 2.0em;">★★★★★</span>&nbsp;&nbsp;&nbsp;
				<span style="font-size: 1.5em;color:gray;">리뷰 개수 1,100개</span>
			</p>
			<br>
			<p style="font-size: 1.7em;color:black;">서울특별시 종로구 디아망 빌딩</p>
			<p>
				<div style="font-size: 1.5em;"><span>입실시간 15시부터</span></div>
				<div style="font-size: 1.5em;"><span>퇴실시간 11시까지</span></div>

			<br>
			<p class="card" style="font-size: 1.2em;background-color: lightgray;min-height: 100px;padding:10px;">
				<span>업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐업소 소개좀 잘해봐업소 소개좀 잘해봐업소 소개좀 잘해봐업소 소개좀 잘해봐
				업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐
				업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐</span>
			</p>
			<p style="text-align: right;">
				<a type="button" class="btn btn-success" href="${cp }/members/payment">찜목록 추가</a>
			</p>
			
		</div>
		
		<!-- 객실정보 -->
	<div style="width:100%;min-height:1000px;background-color: pink;clear: both;padding;">
						
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
			  		
			  		<section id="div1" class="info" style="width:100%;min-height: 500px;background-color: red;">
			
				<div style="border-radius: 10px 10px 10px 10px;background-color: gray;width:100%;min-height:300px;padding-top: 25px;padding-bottom:25px;margin-bottom: 20px;">
					<div style="margin: auto;width:95%;background-color: white;min-height: 250px;">
						<!-- 객실 대표이미지 -->
						<div style="width:50%;height:250px;background-color: purple;float: left;">
							<img id="room-1" style="width:90%;height: 250px;cursor: pointer;" alt="객실사진" src="${pageContext.request.contextPath }/resources/images/banner_1.jpg">
						</div>
						<!-- 객실 정보 -->
						<div style="width:50%;height:250px;background-color: green;float: left;margin-bottom: 20px;">
						
							<h3>객실명</h3>
							<p>객실가격</p>
							<p>객실정보</p>
							<p>최대인원</p>
							
					
							<button type="button" class="btn btn-danger" style="width: 100%;height:50px;position: absolute;bottom: 0px;">숙박 예약</button>
							
							
						</div>
						<!-- 객실 이미지 여러개 div -->
						<div id="room-detail-1" style="clear:both;width:100%;height:500px;background-color: olive;padding: 50px 30px 30px 30px;display: none;">
							
							<button type="button" class="close" aria-label="Close" style="position: absolute;top:5px;right:5px;">
							  	<span aria-hidden="true" style="font-size: 1.5em;">&times;</span>
							</button>
						    
							<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							      <img style="width:100%;height: 400px;" src="${cp }/resources/images/banner_1.jpg" class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item">
							      <img style="width:100%;height: 400px;" src="${cp }/resources/images/banner_2.jpg" class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item">
							      <img style="width:100%;height: 400px;" src="${cp }/resources/images/banner_3.jpg" class="d-block w-100" alt="...">
							    </div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							</div>
						
						</div>
					</div>
					
				</div>
				
				<div style="border-radius: 10px 10px 10px 10px;background-color: gray;width:100%;min-height:300px;padding-top: 25px;padding-bottom:25px;margin-bottom: 20px;">
					<div style="margin: auto;width:95%;background-color: white;min-height: 250px;">
						<!-- 객실 대표이미지 -->
						<div style="width:50%;height:250px;background-color: purple;float: left;">
							<img id="room-2" style="width:90%;height: 250px;cursor: pointer;" alt="객실사진" src="${pageContext.request.contextPath }/resources/images/banner_1.jpg">
						</div>
						<!-- 객실 정보 -->
						<div style="width:50%;height:250px;background-color: green;float: left;margin-bottom: 20px;">
						
							<h3>객실명</h3>
							<p>객실가격</p>
							<p>객실정보</p>
							<p>최대인원</p>
							
					
							<button type="button" class="btn btn-danger" style="width:100%;height:50px;position: absolute;bottom: 0px;">숙박 예약</button>
							
							
						</div>
						<!-- 객실 이미지 여러개 div -->
						<div id="room-detail-2" style="clear:both;width:100%;height:500px;background-color: olive;padding: 50px 30px 30px 30px;display: none;">
							
							<button type="button" class="close" aria-label="Close" style="position: absolute;top:5px;right:5px;">
							  	<span aria-hidden="true" style="font-size: 1.5em;">&times;</span>
							</button>
						    
							<div id="carouselExampleFade1" class="carousel slide carousel-fade" data-ride="carousel">
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							      <img style="width:100%;height: 400px;" src="${cp }/resources/images/banner_1.jpg" class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item">
							      <img style="width:100%;height: 400px;" src="${cp }/resources/images/banner_2.jpg" class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item">
							      <img style="width:100%;height: 400px;" src="${cp }/resources/images/banner_3.jpg" class="d-block w-100" alt="...">
							    </div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleFade1" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleFade1" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							</div>
						
						</div>
					</div>
					
				</div>
				
				
			</section>
			  		
			  </div>
			  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="width:100%;min-height: 500px;background-color: blue;">
			  		
			  		<!-- 객실정보 -->
<!-- 			<section id="div2" class="info" style="width:100%;min-height: 500px;display:none;background-color: blue;"> -->
				
				<div class="card">
				
				  <div class="card-body" style="margin: 10px;">
				   
					   <h4>편의 시설</h4>
					   <!-- 편의시설 목록 -->
					   <div>
					   		<ul>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   			<li style="display: inline-block;margin-right: 10px;"><img style="width:60px;height:60px;" src="${cp }/resources/a_icon/001-bathtub.png"></li>
					   		</ul>
					   </div>
					   
					   <!-- 편의시설 설명 -->
					   <div>
					   		<div>
					   			<span>편의시설 설명 1</span>
					   		</div>
					   		<div>
					   			<span>편의시설 설명 2</span>
					   		</div>
					   		<div>
					   			<span>편의시설 설명 3</span>
					   		</div>
					   		<div>
					   			<span>편의시설 설명 4</span>
					   		</div>
					   		<div>
					   			<span>편의시설 설명 5</span>
					   		</div>
					   		<div>
					   			<span>편의시설 설명 6</span>
					   		</div>
					   		<div>
					   			<span>편의시설 설명 7</span>
					   		</div>
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
			  		
					<div class="media" style="padding:20px;">
					  <img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:56px;height:56px;">
					  <div class="media-body">
					  
					    <h5 class="mt-0">Media heading 
					    </h5>
					    <div>
					    	스위트룸 <span style="font-size: 1.0em;color:orange;">  친절도 : ★★★★★   청결도 : ★★★★  편의설 : ★★★</span>
					    </div>
					   
					    	Cras sit amet nibh libero, in gravida nulla.nibh libero,gravida nulla.
						    nibh lib in gravida nulla Nulla vel metus scelerisque ante sollicitudin.
						     Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
						      Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
						
					  	<div style="margin-top:15px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  		<img src="${cp }/resources/review_icon/ico_15.png" class="mr-3" alt="..." style="width:100px;height:100px;">
					  	</div>
					  	<p style="margin-top: 15px;font-size: 1em;">
					  		2019.12.10
					  	</p>
					  </div>
				
					</div>
					
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
		$("#room-1").click(function () {
			$("#room-detail-1").css("display","block");
		});
		
		$("#room-2").click(function () {
			$("#room-detail-2").css("display","block");
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
	geocoder.addressSearch('서울 강남구 역삼동 719-20', function(result, status) {
	
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">위치</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>