<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="breadcrumb-content text-center">
</div>


<div class="container-fluid border-secondary">
	<div class="row" style="margin-top: 200px;">
		<div class="col-lg-2"
			style="border: 1px solid #ddd; margin-left: 50px; height:500px; margin-top: 150px;">

			<div class="sidebar-widget mb-50" style="margin-top: 50px;">

				<h5 style="font-style: bold;" >날짜</h5>
				<div class="form-row" style="padding-top: 18px;">
					<input type="text" class="form-control" id="startDate"
						style="width: 130px; " readonly>&nbsp 
					<input type="text"
						class="form-control" id="endDate" style="width: 130px;" readonly>
				</div>
			</div>
			<br> <br>
			<hr>
			<div class="sidebar-widget mb-60" style="margin-top: 20px;">
				<h5 class="sidebar-title " style="padding-bottom: 15px;">상세조건</h5>
				<button type="button" class="btn btn-outline-primary rounded"
					style="width: 90px; height: 40px;">초기화1</button>
				&nbsp
				<button type="button" class="btn btn-danger rounded"
					style="width: 90px; height: 40px;">적용</button>
				<br> <br>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck1"> <label class="custom-control-label"
						for="customCheck1">예약 가능</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck2"> <label class="custom-control-label"
						for="customCheck2">프로모션</label>
				</div>
				<div class="sidebar-widget mb-50" style="margin-top: 20px;">
					<label>인원 &nbsp &nbsp &nbsp &nbsp</label> <span class="minus"
						style=" margin-left:50px;padding-left: 10px; border: none; font: 25px bold;">-</span>
					<input type="text" id="quantity" value="1"
						style="color: #C90000; size: 10px; border: none"> <span
						class="plus" style="border: none; font-size: 25px;">+</span>
				</div>
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
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked"
								data-filter="*" style="width: 200px;" id="recomm">추천 순</li>
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								style="width: 200px;">거리 순</li>
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								style="width: 200px;">높은 가격 순</li>
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								style="width: 200px;">낮은 가격 순</li>
						</ul>
						<ul
							class="arrivals_grid_sorting clearfix button-group filters-button-group"
							style="float: left; padding-left: 25px;">
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								style="width: 50px;">지도</li>
						</ul>
					</div>
				
					<c:forEach var="vo" items="${list }">
						<div class="card bg-white text-white"
							style="border: none; padding: 10px; background: balck;">
							<img
								src="${pageContext.request.contextPath }/resources/h_img/${vo.house_save_name}"
								alt=""
								style="border-radius: 15px; height: 300px; width: 85%; background: black;">
							<div class="card-img-overlay"
								style="margin-top: 10px; margin-left: 10px; background: black; width: 83.4%; height: 94.5%; opacity: 0.5; border-radius: 15px;">

							</div>
							<div class="card-img-overlay" style="padding: 10px; width: 85%;">
								<h5 class="card-title"
									style="color: white; padding-top: 240px; padding-left: 780px; font: bold">${vo.room_price }원
									~</h5>
							</div>
							<div class="card-img-overlay" style="padding: 20px; width: 85%;">
								<h3 class="card-title"
									style="color: white; padding-left: 20px; padding-top: 150px">${vo.company }</h3>
								<c:choose>
									<c:when test="${vo.avg > 9.0 }">
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }
											최고에요</h5>
									</c:when>
									<c:when test="${vo.avg > 7.0 }">
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }
											만족해요</h5>
									</c:when>
									<c:when test="${vo.avg > 5.0 }">
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }
											좋아요</h5>
									</c:when>
									<c:when test="${vo.avg == 0.0 }">
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }</h5>
									</c:when>
									<c:otherwise>
										<h5 class="card-text"
											style="color: #FFCD12; padding-left: 20px;">${vo.avg }
											평범해요</h5>
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
			
		}
	});
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
     $('#recomm').click(function(){
    	var date = new Date();
     	var year = date.getFullYear();
     	var month = date.getMonth()+1;
     	var day = date.getDate();
     	if(month < 10){
     		month = "0"+month;
     	}
     	var today = year + "/" + month + "/" + day;

     	var nextDate = new Date();
     	nextDate.setDate(nextDate.getDate()+1);
     	
     	var nYear = nextDate.getFullYear();
     	var nMonth = nextDate.getMonth()+1;
     	var nDay = nextDate.getDate();
     	
     	var nextday = nYear + "/" + nMonth + "/" + nDay;
		location.href="${pageContext.request.contextPath}/product/accommodationList?sort=price&startday="+today+"&endday="+nextday;
    	 
     });

  

     

</script>





