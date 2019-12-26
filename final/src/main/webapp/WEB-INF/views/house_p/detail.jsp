<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507&libraries=LIBRARY"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ccdeeae05295dd6223a8c757111507&libraries=services,clusterer,drawing"></script>

<div style="width:65%;min-height: 1200px;margin: auto;padding: 40px;margin-top: 150px;">
	
	<input type="hidden" value="${sdt }" name="sdt" id="sdt">
	<input type="hidden" value="${edt }" name="edt" id="edt">
	
	<div style="width:90%;min-height:1100px;margin: auto;">
		<!-- 큰 이미지 div  -->
		<div style="width:50%;min-height:400px;float:left;" >
			
			<div id="carouselExampleControls" class="carousel slide" data-ride="false" style="width:100%;padding:10px;margin: auto;">
				<div class="carousel-inner">
					<div class="carousel-item active">
			      		<img src="${pageContext.request.contextPath }/resources/upload/${houseImg.house_save_name}" class="d-block w-100" alt="...">
			    	</div>
			  </div>

			</div>
						
		</div>
		
		<!-- 업소 정보 및 소개 div -->
		<div style="width:50%;min-height:400px;float:left;padding:10px;">
		
			<h2 style="font-weight: bold;">${houseinfo.company }</h2>
			
			<p>
				<span style="color:orange;font-size: 2.0em;">
					<!-- 평균점수에 따른 별점 -->
					<c:choose>
						<c:when test="${reviewScore >= 4.5 }">
							★★★★★
						</c:when>
						<c:when test="${reviewScore >= 3.5 }">
							★★★★★
						</c:when>
						<c:when test="${reviewScore >= 2.5 }">
							★★★
						</c:when>
						<c:when test="${reviewScore >= 1.5 }">
							★★
						</c:when>
						<c:when test="${reviewScore < 1.5 && reviewScore > 0 }">
							★★
						</c:when>
					</c:choose>
					
				</span>
				<c:choose>
					<c:when test="${reviewScore > 0 }">
						<span style="color:orange;">${reviewScore }</span>
					</c:when>
					<c:otherwise>
						<span style="color:lightgray;">작성된 리뷰가 없습니다</span>
					</c:otherwise>
				</c:choose>
				
				&nbsp;&nbsp;&nbsp;
				<span style="font-size: 1.3em;color:gray;">
					<!-- 평균 점수에 따른 문구  -->
					<c:choose>
						<c:when test="${reviewScore >= 4 }">
							추천해요
						</c:when>
						<c:when test="${reviewScore >= 3 }">
							무난해요
						</c:when>
						<c:when test="${reviewScore < 3 && reviewScore > 0 }">
							별로예요
						</c:when>
					</c:choose>
				</span>
			</p>
			<!-- 주소 -->
			<p style="font-size: 1.3em;color:black;">${houseinfo.workplace }</p>
			<!-- 체크인 시간 -->
			<div style="font-size: 1em;"><span>입실 시간 : ${houseinfo.checkintime }</span></div>
			<!-- 체크 아웃 시간 -->
			<div style="font-size: 1em;margin-bottom: 10px;"><span>퇴실 시간 : ${houseinfo.checkouttime }</span></div>
			<!-- 업체 소개 -->
			<p class="card" style="font-size: 1.2em;min-height: 100px;padding:10px;">
				<span>${houseinfo.intro }</span>
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
				<!-- 날짜 선택 -->
				<p>숙박 기간 선택<br>
					<input style="width:150px;" type="text" id="datepicker1" placeholder="시작일" value="${sdt }"> - 
					<input style="width:150px;" value="${edt }" type="text" id="datepicker2" placeholder="종료일">
				</p>
				
				<br>
				
				<c:forEach var="rooms" items="${roomsJoin }" varStatus="idx">
					<div class="card" style="border-radius: 10px 10px 10px 10px;width:100%;min-height:300px;padding-top: 25px;padding-bottom:25px;margin-bottom: 20px;">
						<div style="margin: auto;width:95%;min-height: 250px;">
							<!-- 객실 대표이미지 -->
							<div style="width:50%;height:250px;float: left;">
								<img id="room-${idx.index }" class="room" style="width:90%;height: 250px;cursor: pointer;" alt="객실사진" src="${cp }/resources/upload/${rooms.rooms_img.get(0).room_save_name}">
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
								
								<c:choose>
									<c:when test="${empty sessionScope.id }">
										<a href="${cp }/members/login" class="btn btn-danger btn-lg" role="button" style="width: 100%;position: absolute;bottom: 0px;color:white;">숙박 예약</a>
									</c:when>
									<c:otherwise>
										<a href="${cp }/members/payment?sdt=${sdt}&edt=${edt}&room_num=${rooms.room_num}&room_name=${rooms.roomname }&room_price=${rooms.room_price}&company=${houseinfo.company}&house_save_name=${houseImg.house_save_name}"
										class="btn btn-danger btn-lg" role="button" style="width: 100%;position: absolute;bottom: 0px;color:white;">숙박 예약</a>
									</c:otherwise>
								</c:choose>
								<!-- 예약하기 버튼 -->
								
								
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
									      <img style="width:100%;height: 400px;" src="${cp }/resources/upload/${roomImg.room_save_name}" class="d-block w-100" alt="...">
									    </div>
									
									</c:if>
									<c:if test="${i.index >0 }">
										<div class="carousel-item">
									      <img style="width:100%;height: 400px;" src="${cp }/resources/upload/${roomImg.room_save_name}" class="d-block w-100" alt="...">
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
				<br>
				<div class="card">
				  
				  <div class="card-body" style="margin: 10px;">
				   
					   <h4>편의 시설</h4>
					   <!-- 편의시설 목록 -->
					   <div>
					   		<ul>
					   			<c:forEach var="amen" items="${houseAmen }">
					   				<li style="display: inline-block;margin-right: 10px;">
					   					<div>
					   					<img style="width:60px;height:60px;" src="${cp }/resources/upload/${amen.SAVEFILENAME}"><br><span>${amen.AMENITIES_NAME }</span>
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
			  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab" style="padding-top: 20px;padding-bottom: 10px;min-height: 500px;">
			  	
			  		<div style="margin-bottom: 10px;">
			  			<h2 style="text-align: center;">
			  				<!-- 평균 점수에 따른 문구 -->
							<c:choose>
								<c:when test="${reviewCount == 0 }">
									작성된 리뷰가 없습니다
								</c:when>
								<c:when test="${reviewScore >= 4 && reviewCount > 0}">
									추천해요
								</c:when>
								<c:when test="${reviewScore >= 3 && reviewCount > 0}">
									무난해요
								</c:when>
								<c:when test="${reviewScore < 3 && reviewCount > 0}">
									별로예요
								</c:when>
							</c:choose>	
						</h2>
			  			<h2 style="text-align: center;color:orange;">
							<!-- 평균점수에 따른 별점 -->
							<c:choose>
								<c:when test="${reviewScore >= 4.5 }">
									★★★★★
								</c:when>
								<c:when test="${reviewScore >= 3.5 }">
									★★★★★
								</c:when>
								<c:when test="${reviewScore >= 2.5 }">
									★★★
								</c:when>
								<c:when test="${reviewScore >= 1.5 }">
									★★
								</c:when>
								<c:otherwise>
									★
								</c:otherwise>
							</c:choose>
							<span style="color:orange;font-size: 0.7em;">${reviewScore }</span>
						</h2>
						<h6 style="text-align: center;">전체 리뷰 ${reviewCount }</h6>
			  		</div>
			  		<hr>
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
							  		<c:if test="${not empty image.review_org_name }">
							  			<img src="${cp }/resources/upload/${image.review_save_name}" class="mr-3" alt="사진" style="width:100px;height:100px;">
							  		</c:if>
							  	</c:forEach>
						  	</div>
						  	
						  	<p style="margin-top: 15px;font-size: 1em;">
						  		${review.review_date }
						  	</p>
						  </div>
						  
					
						</div>
						<hr>
					</c:forEach>
					
					<!-- 페이징 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  
			    <c:choose>
			  		<c:when test="${pagination.startPageNum > pagination.pageBlockCount }">
				    	<li class="page-item">
				    		<a class="page-link" href="${cp }/house/detail?house_num=${houseAmen.get(0).HOUSE_NUM }&pageNum=${pagination.endPageNum+1 }&sdt=${sdt}&edt=${edt}">이전</a>
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
				   				<a class="page-link" href="${cp }/house/detail?house_num=${houseAmen.get(0).HOUSE_NUM }&pageNum=${pagination.endPageNum+1 }&sdt=${sdt}&edt=${edt}">${i }</a>
				   				<span class="sr-only">(current)</span>
				   			</li>
			   			</c:when>
			   			<c:otherwise>
				   			<li class="page-item">
				   				<a class="page-link" href="${cp }/house/detail?house_num=${houseAmen.get(0).HOUSE_NUM }&pageNum=${pagination.endPageNum+1 }&sdt=${sdt}&edt=${edt}">${i }</a>
				   			</li>
			   			</c:otherwise>
			   		</c:choose>
			   		
			   	</c:forEach>
			   	
			   <c:choose>
				 <c:when test="${pagination.endPageNum<pagination.totalPageCount }">
					    <li class="page-item">
					   	  <a class="page-link" href="${cp }/house/detail?house_num=${houseAmen.get(0).HOUSE_NUM }&pageNum=${pagination.endPageNum+1 }&sdt=${sdt}&edt=${edt}">다음</a>
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
			
			<br>
			  
		</div>
				
		<!-- 지도 -->
		<div id="map" style="width:100%;height:400px;"></div>
				
		</div>
	</div>
</div>

<script>
	$(function(){
		
		$(".room").click(function () {
			
			var num = parseInt($(this).prop("id").split("-")[1]);
		
			$("#room-detail-"+num).css("display","block");
		});
		
		$(".close").click(function () {
			
			$(this).parent().css("display","none");
		});

		$("#datepicker1").datepicker({
			dateFormat: 'yy/mm/dd' //Input Display Format 변경
		        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		        ,changeYear: true //콤보박스에서 년 선택 가능
		        ,changeMonth: true //콤보박스에서 월 선택 가능                
		        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
		        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		        ,minDate: 0 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		        ,maxDate: "+30D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
				,onSelect: function (date) {
					var endDate = $('#datepicker2');
					var startDate = $(this).datepicker('getDate');
					var minDate = $(this).datepicker('getDate');
					endDate.datepicker('setDate', minDate);
					startDate.setDate(startDate.getDate() + 30);
					endDate.datepicker('option', 'maxDate', startDate);
					endDate.datepicker('option', 'minDate', minDate);
				}
		});
		$('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
		$("#datepicker2").datepicker({
			dateFormat: 'yy/mm/dd' //Input Display Format 변경
		        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		        ,changeYear: true //콤보박스에서 년 선택 가능
		        ,changeMonth: true //콤보박스에서 월 선택 가능                
		        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
		        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		        ,minDate: 0 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		        ,onSelect: function(dateText){
					var sdt = $("#datepicker1").val();
					var edt = $("#datepicker2").val();
		        	location.href="${cp}/house/detail?house_num=${param.house_num}&sdt="+sdt+"&edt="+edt;
		        }
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