<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="breadcrumb-content text-center">
</div>


<div class="container-fluid border-secondary">
	<div class="row" style="margin-top: 200px;">
		<div class="col-lg-2"
			style="border: 1px solid #ddd; margin-left: 50px; height:850px; margin-top: 150px;">
			<div class="sidebar-widget mb-50" style="margin-top: 50px;">
				<h5 style="font-style: bold;" >날짜2</h5>
				<div class="form-row" style="padding-top: 18px;">
					<input type="text" class="form-control" id="startDate"
						style="width: 130px; " value="${start_date }" readonly>&nbsp 
					<input type="text"
						class="form-control" id="endDate" style="width: 130px;" value="${end_date }" readonly>
				</div>
			</div>
			<br> <br>
			<hr>
			<div class="sidebar-widget mb-60" style="margin-top: 20px;">
				<h5 class="sidebar-title " style="padding-bottom: 15px;">상세조건</h5>
				<form action="${pageContext.request.contextPath }/product/accommodationList">
				<button type="reset" class="btn btn-outline-primary rounded"
					style="width: 90px; height: 40px;">초기화</button>
				&nbsp
				<button type="submit" class="btn btn-danger rounded"
					style="width: 90px; height: 40px;">적용</button>
				<br> <br>
				<input type="checkbox" id="booking" name="booking" class="css-checkbox" style="margin-top:10px "/>
				<label for="booking" class="css-label lite-red-check" >예약 가능</label>
				<div class="sidebar-widget mb-50" style="margin-top: 15px;">
					<label>인원 &nbsp &nbsp &nbsp &nbsp</label> <span class="minus"
						style=" margin-left:50px;padding-left: 10px; border: none; font: 25px bold;">-</span>
					<input type="text" id="quantity" value="1"
						style="color: #C90000; size: 10px; border: none"> <span
						class="plus" style="border: none; font-size: 25px;">+</span>
				</div>
				<div class="sidebar-widget mb-50" style="margin-top: 15px;">
					<label>객실 내 시설</label><br>
					<input type="checkbox" id="checkbox4" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox4" name="checkbox4_lbl" class="css-label lite-red-check" >객실 스파</label><br>
					<input type="checkbox" id="checkbox5" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox5" name="checkbox4_lbl" class="css-label lite-red-check" >와이파이</label><br>
					<input type="checkbox" id="checkbox6" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox6" name="checkbox4_lbl" class="css-label lite-red-check" >TV</label><br>
					<input type="checkbox" id="checkbox7" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox7" name="checkbox4_lbl" class="css-label lite-red-check" >냉장고</label><br>
					<input type="checkbox" id="checkbox8" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox8" name="checkbox4_lbl" class="css-label lite-red-check" >욕조</label><br>
					<input type="checkbox" id="checkbox9" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox9" name="checkbox4_lbl" class="css-label lite-red-check" >다리미</label><br>
					<input type="checkbox" id="checkbox10" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox10" name="checkbox4_lbl" class="css-label lite-red-check" >미니바</label><br>
					<input type="checkbox" id="checkbox11" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox11" name="checkbox4_lbl" class="css-label lite-red-check" >냉장고</label><br>
					<input type="checkbox" id="checkbox12" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox12" name="checkbox4_lbl" class="css-label lite-red-check" >욕실용품</label><br>
					<input type="checkbox" id="checkbox13" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox13" name="checkbox4lbl" class="css-label lite-red-check" >에어컨</label><br>
					<input type="checkbox" id="checkbox14" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox14" name="checkbox4_lbl" class="css-label lite-red-check" >객실샤워실</label><br>
					<input type="checkbox" id="checkbox15" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox15" name="checkbox4_lbl" class="css-label lite-red-check" >드라이기</label><br>
					<input type="checkbox" id="checkbox16" class="css-checkbox" style="margin-top:10px "/>
					<label for="checkbox16" name="checkbox4_lbl" class="css-label lite-red-check" >전기밥솥</label><br>
				</div>
				</form>
			</div>
		</div>

		<div class="col-lg-9">
			<div class="row" style="margin-left: 50px;">
				<div class="container" style="width: 85%;">
					<div class="new_arrivals_sorting">
						<ul
							class="arrivals_grid_sorting clearfix button-group filters-button-group"
							style="float: left">
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								data-filter="*" style="width: 200px;" id="recomm">추천 순</li>
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								style="width: 200px;" id="">거리 순</li>
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								style="width: 200px;" id="highPrice">높은 가격 순</li>
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								style="width: 200px;"id="rowPrice">낮은 가격 순</li>
						</ul>
						<ul
							class="arrivals_grid_sorting clearfix button-group filters-button-group"
							style="float: left; padding-left: 25px;">
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								style="width: 50px;">지도</li>
						</ul>
					</div>
					<ul class="top_nav_menu">
						<li class="language" style='background-color: red;border:none; width:200px;'>
							<a href="#" style='color:white;'>
								지역 선택
							<i class="fa fa-angle-down" style="margin-top: 19px;"></i>
							</a>
							<ul class="language_selection">
								<li class="dropdown-submenu">
								    <a class="dropdown-item" tabindex="-1" href="#" id="seoul">서울     </a>
								     <ul class="dropdown-menu" id="sub">
								     	
								     </ul>
								</li>
								<li class="dropdown-submenu">
								    <a class="dropdown-item" tabindex="-1" href="#" id="busan">부산     </a>
								</li>
								<li class="dropdown-submenu">
								    <a class="dropdown-item" tabindex="-1" href="#" id="jeju">제주     </a>
								</li>
								<li class="dropdown-submenu">
								    <a class="dropdown-item" tabindex="-1" href="#" id="kang">강원    </a>
								</li>
								<li class="dropdown-submenu">
								    <a class="dropdown-item" tabindex="-1" href="#" id="kg">경기     </a>
								</li>
								<li class="dropdown-submenu">
								    <a class="dropdown-item" tabindex="-1" href="#" id="inc">인천     </a>
								</li>
								<li class="dropdown-submenu">
								    <a class="dropdown-item" tabindex="-1" href="#" id="ks">경상     </a>
								</li>
								<li class="dropdown-submenu">
								    <a class="dropdown-item" tabindex="-1" href="#" id="jr">전라     </a>
								</li>
								<li class="dropdown-submenu">
								    <a class="dropdown-item" tabindex="-1" href="#" id="cc">충청     </a>
								</li>
							</ul>
						</li>
					</ul>
					<c:forEach var="vo" items="${list }">
						<div class="card bg-white text-white house"
							style="border: none; padding: 10px; background: balck;">
							<input type="hidden" value="${vo.house_num }" class="house_num">
							<img
								src="${pageContext.request.contextPath }/resources/h_img/${vo.house_save_name}"
								alt=""
								style="border-radius: 15px; height: 300px; width: 85%; background: black;">
							<div class="card-img-overlay"
								style="margin-top: 10px; margin-left: 10px; background: black; width: 83.4%; height: 94.5%; opacity: 0.5; border-radius: 15px;">
							</div>
							<div class="card-img-overlay" style="padding: 10px; width: 85%;">
								<h5 class="card-title"
									style="color: white; padding-top: 240px; float:right; padding-right:20px; font: bold">${vo.room_price }원
									~</h5>
							</div>
							<div class="card-img-overlay" style="padding: 20px; width: 85%;">
								<h3 class="card-title"
									style="color: white; padding-left: 20px; padding-top: 150px">${vo.company }</h3>
								<c:choose>
									<c:when test="${vo.avg > 9.0 }">
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }
											최고에요 (${vo.cnt })</h5>
									</c:when>
									<c:when test="${vo.avg > 7.0 }">
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }
											만족해요 (${vo.cnt })</h5>
									</c:when>
									<c:when test="${vo.avg > 5.0 }">
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }
											좋아요 (${vo.cnt })</h5>
									</c:when>
									<c:when test="${vo.avg == 0.0 }">
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }</h5>
									</c:when>
									<c:otherwise>
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }
											평범해요 (${vo.cnt })</h5>
									</c:otherwise>
								</c:choose>
								<h4 class="card-text" style="color: white; padding-left: 20px;">
									${vo.workplace }</h4>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>




<script type="text/javascript">
	

 $("#startDate").datepicker({
		dateFormat: "yy/mm/dd", // 날짜의 형식
		minDate: 0,
		nextText: ">",
		prevText: "<",
		//autoclose: false,
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월" , "10월", "11월", "12월"],
		yearSuffix: "년",
		gotoCurrent: true,
		showMonthAfterYear: true,
		onSelect: function (date) {
			var endDate = $('#endDate');
			var startDate = $(this).datepicker('getDate');
			var minDate = $(this).datepicker('getDate');
			$("#startDate").datepicker('show');
			endDate.datepicker('setDate', minDate);
			startDate.setDate(startDate.getDate() + 30);
			endDate.datepicker('option', 'minDate', minDate);
		},
		onClose: function(data){
			$("#endDate").datepicker("show");
		}
	});

	
	$('#endDate').datepicker({
		dateFormat: "yy/mm/dd", // 날짜의 형식
		nextText: ">",
		prevText: "<",
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월" , "10월", "11월", "12월"],
		yearSuffix: "년",
		gotoCurrent: true,
		showMonthAfterYear: true,
		onClose: function(){
			dateSelect();
		}
	});
	
	
	function dateSelect(){
		var start_date = $("#startDate").val();
		var end_date = $("#endDate").val();
		alert(start_date)
		alert(end_date)
		location.href="${pageContext.request.contextPath}/product/accommodationList?date=select&start_date="+start_date+"&end_date="+end_date;
		
	}
		

	//수량상자
	var quantitiy=0;
   $('.plus').click(function(e){
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
            $('#quantity').val(quantity + 1);
    });

     $('.minus').click(function(e){
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
            if(quantity>1){
            $('#quantity').val(quantity - 1);
            }
    });
     //날짜 구하기
     var nextday = null;
     var today = null;

    	var date = new Date();
      	var year = date.getFullYear();
      	var month = date.getMonth()+1;
      	var day = date.getDate();
      	if(month < 10){
      		month = "0"+month;
      	}
      	today = year + "/" + month + "/" + day;

      	var nextDate = new Date();
      	nextDate.setDate(nextDate.getDate()+1);
      	
      	var nYear = nextDate.getFullYear();
      	var nMonth = nextDate.getMonth()+1;
      	var nDay = nextDate.getDate();
      	
      	nextday = nYear + "/" + nMonth + "/" + nDay;
     
      	var start_date = $("#startDate").val();
		var end_date = $("#endDate").val();
     $('#recomm').click(function(){
    	 if(start_date != today){
    		 location.href="${pageContext.request.contextPath}/product/accommodationList?date=select&start_date="+start_date+"&end_date="+end_date+"&sort=recomm";
    	 }else{
    		 location.href="${pageContext.request.contextPath}/product/accommodationList?sort=recomm&startday="+today+"&endday="+nextday;
    	 }
		
    	 
     });
	$('#highPrice').click(function(){
		if(start_date!=today){
			location.href="${pageContext.request.contextPath}/product/accommodationList?date=select&start_date="+start_date+"&end_date="+end_date+"&sort=highPrice";
		}else{
			location.href="${pageContext.request.contextPath}/product/accommodationList?sort=highPrice&startday="+today+"&endday="+nextday;
		}
		
	});
	$('#rowPrice').click(function(){
		if(start_date!=today){
			location.href="${pageContext.request.contextPath}/product/accommodationList?date=select&start_date="+start_date+"&end_date="+end_date+"&sort=rowPeice";
		}else{
			location.href="${pageContext.request.contextPath}/product/accommodationList?sort=rowPrice&startday="+today+"&endday="+nextday;
		}
		
	});
  
	$('.house').click(function(){
		var house_num = $(this).find('.house_num').val()
		location.href="${pageContext.request.contextPath }/house/detail?house_num="+house_num+"&sdt=${start_date}&edt=${end_date}"
	});
     //드롭다운
	$(".dropdown-toggle").on("mouseenter", function () {
	    if (!$(this).parent().hasClass("show")) {
	        $(this).click();
	    }
	});
	$(".btn-group, .dropdown").on("mouseleave", function () {
	    // make sure it is shown:
	    if ($(this).hasClass("show")){
	        $(this).children('.dropdown-toggle').first().click();
	    }
	});
	//드롭다운
	var submenu=null;
	$("#seoul").mouseover(function(){
		var start_date = $("#startDate").val();
		var end_date = $("#endDate").val();
		submenu = 
				'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=01&start_date='+start_date+'&end_date='+end_date+'">서울 전체</a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=02&start_date='+start_date+'&end_date='+end_date+'">강남 / 역삼 / 삼성 / 신사 / 청담 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=03&start_date='+start_date+'&end_date='+end_date+'">서초 / 교대  </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=04&start_date='+start_date+'&end_date='+end_date+'">잠실 / 송파  / 왕십리 / 강동 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=05&start_date='+start_date+'&end_date='+end_date+'">을지로 / 시청  / 명동 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=06&start_date='+start_date+'&end_date='+end_date+'">종로 / 인사동  / 동대문 / 강북 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=07&start_date='+start_date+'&end_date='+end_date+'">서울역 / 이태원  / 용산 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=08&start_date='+start_date+'&end_date='+end_date+'">마포 / 홍대  / 신촌 / 서대문 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=09&start_date='+start_date+'&end_date='+end_date+'">영등포 / 여의도  / 김포공항 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=10&start_date='+start_date+'&end_date='+end_date+'">구로 / 금천  / 관악 / 동작 </a></li>'
  	 	$("#sub").html(submenu);
	});
	$("#busan").mouseover(function(){
		submenu = 
				'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=11&start_date='+start_date+'&end_date='+end_date+'">부산 전체</a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=12&start_date='+start_date+'&end_date='+end_date+'">해운대 (센텀, 송정) </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=13&start_date='+start_date+'&end_date='+end_date+'">광안리 / 기장 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=14&start_date='+start_date+'&end_date='+end_date+'">부산역 / 남포  / 자갈치 / 영도 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=15&start_date='+start_date+'&end_date='+end_date+'">서면 / 동래  / 연제 / 남구 </a></li>'
		$("#sub").html(submenu);
		$("#sub").show();
	});
	$("#jeju").mouseover(function(){
		submenu = 
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=21&start_date='+start_date+'&end_date='+end_date+'">제주 전체</a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=22&start_date='+start_date+'&end_date='+end_date+'">제주공항 / 애월 / 함덕 </a></li>'+
		        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=23&start_date='+start_date+'&end_date='+end_date+'">서귀포시 / 중문 / 표선 / 성산 </a></li>'
		$("#sub").html(submenu);
		$("#sub").show();
	});
	$("#kang").mouseover(function(){
		submenu = 
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=31&start_date='+start_date+'&end_date='+end_date+'">강원 전체</a></li>'+
	        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=32&start_date='+start_date+'&end_date='+end_date+'">강릉 / 속초 </a></li>'+
	        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=33&start_date='+start_date+'&end_date='+end_date+'">양양 / 고성 / 동해 / 삼척 </a></li>'+
	        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=34&start_date='+start_date+'&end_date='+end_date+'">춘천 / 홍천 / 인제 / 철원 </a></li>'+
	        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=35&start_date='+start_date+'&end_date='+end_date+'">평창 / 정선 / 횡성 </a></li>'+
	        '<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=36&start_date='+start_date+'&end_date='+end_date+'">영월 / 원주 / 태백 </a></li>'
	    $("#sub").html(submenu);
		$("#sub").show();
	});
	$("#kg").mouseover(function(){
		submenu = 
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=41&start_date='+start_date+'&end_date='+end_date+'">경기 전체</a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=42&start_date='+start_date+'&end_date='+end_date+'">수원 / 성남 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=43&start_date='+start_date+'&end_date='+end_date+'">용인 / 평택 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=44&start_date='+start_date+'&end_date='+end_date+'">화성 / 안산 / 부천 / 안양 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=45&start_date='+start_date+'&end_date='+end_date+'">고양 / 의정부 / 파주 / 김포 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=46&start_date='+start_date+'&end_date='+end_date+'">시흥 / 군포 / 광명 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=47&start_date='+start_date+'&end_date='+end_date+'">남양주시 / 구리 / 하남 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=48&start_date='+start_date+'&end_date='+end_date+'">가평 / 양평 </a></li>'
		$("#sub").html(submenu);
		$("#sub").show();
	});
	$("#inc").mouseover(function(){
		submenu = 
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=51&start_date='+start_date+'&end_date='+end_date+'">인천 전체</a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=52&start_date='+start_date+'&end_date='+end_date+'">송도 / 남동구 / 옹진군 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=53&start_date='+start_date+'&end_date='+end_date+'">인천 국제 공항(중구) </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=54&start_date='+start_date+'&end_date='+end_date+'">부평 / 계양 / 서구 / 미추홀구 / 강화 </a></li>'
		$("#sub").html(submenu);
		$("#sub").show();
	});
	$("#ks").mouseover(function(){
		submenu = 
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=61&start_date='+start_date+'&end_date='+end_date+'">경상 전체</a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=62&start_date='+start_date+'&end_date='+end_date+'">경주 / 포항 / 울진 / 영덕 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=63&start_date='+start_date+'&end_date='+end_date+'">거제 / 통영 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=64&start_date='+start_date+'&end_date='+end_date+'">대구 / 구미 / 문경 / 안동 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=65&start_date='+start_date+'&end_date='+end_date+'">울산 / 양산 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=66&start_date='+start_date+'&end_date='+end_date+'">창원 / 김해 / 창녕 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=67&start_date='+start_date+'&end_date='+end_date+'">사천 / 남해 / 진주 / 함양 </a></li>'
		$("#sub").html(submenu);
		$("#sub").show();
	});
	$("#jr").mouseover(function(){
		submenu = 
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=71&start_date='+start_date+'&end_date='+end_date+'">전라 전체</a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=72&start_date='+start_date+'&end_date='+end_date+'">여수</a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=73&start_date='+start_date+'&end_date='+end_date+'">전주</a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=74&start_date='+start_date+'&end_date='+end_date+'">광주</a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=75&start_date='+start_date+'&end_date='+end_date+'">광양 / 구례 / 순천 / 화순 / 남원 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=76&start_date='+start_date+'&end_date='+end_date+'">군산 / 익산 / 부안 / 진안 / 무주 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=77&start_date='+start_date+'&end_date='+end_date+'">목포 / 나주 / 완도 / 해남 / 영암 </a></li>'
		$("#sub").html(submenu);
		$("#sub").show();
	});
	$("#cc").mouseover(function(){
		submenu = 
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=81&start_date='+start_date+'&end_date='+end_date+'">충청 전체</a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=82&start_date='+start_date+'&end_date='+end_date+'">대전</a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=83&start_date='+start_date+'&end_date='+end_date+'">천안 / 아산 / 예산 / 당진 </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=84&start_date='+start_date+'&end_date='+end_date+'">보령 / 서산 / 태안  </a></li>'+
			'<li><a class="dropdown-item" tabindex="-1" href="${pageContext.request.contextPath}/product/accommodationList?date=select&p=75&start_date='+start_date+'&end_date='+end_date+'">청주 / 제천 / 충주 / 보은 / 금산  </a></li>'
		$("#sub").html(submenu);
		$("#sub").show();
	});
	
</script>





