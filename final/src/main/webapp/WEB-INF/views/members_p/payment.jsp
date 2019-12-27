<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>예약/결제</title>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>

	var coupon_num = 0; // 쿠폰 번호(0 = 사용하지 않음)
	
	$(function(){
		
		//결제버튼 클릭시 이벤트 발생
		$("#payment").click(payment);
		
		// 쿠폰 선택 셀렉트 변경시 이벤트 발생
		$("#coupon").change(function(){
			
			var using = false; // 쿠폰 사용버튼 활성화 비활성화 제어
			
			if($("#coupon").val() == "0"){ // 쿠폰을 선택하지 않았을 때
				
				var payment_money = parseInt("${room_price}"); // 룸 가격 할인 미적용 가격 가져오기
				
				$("#pay_money").val(payment_money);
				
				$("#price").text(payment_money.toLocaleString()+"원");
				
				using = true;
				
				coupon_num = 0;
				
			}
		
			$("#couponUse").attr("disabled", using);
		});
		
		// 쿠폰 적용 버튼 클릭시 이벤트 발생
		$("#couponUse").click(function(){
			
			var coupon = $("#coupon").val().split("/"); // /를 기준으로 값 쪼개기
			
			// 쿠폰 타입이 1(퍼센트할인)
			if(coupon[0] == "1"){
				
				var sale = parseInt(coupon[1])/100.0; // 할인율 구하기

				$("#pay_money").val(parseInt("${room_price}")-(parseInt("${room_price}")*sale)); // 결제 금액에 룸 가격에서 할인율을 뺀 가격 적용
				
				var payment_money = parseInt($("#pay_money").val()); // 할인 적용된 금액 대입
				
				$("#price").text(payment_money.toLocaleString()+"원"); // 수정된 값 화면에 콤마 적용해서 보여주기
				
				coupon_num = parseInt(coupon[2]); // 사용한 쿠폰번호 대입
				
			// 쿠폰 타입이 2(차감할인)
			}else if(coupon[0] == "2"){
				
				$("#pay_money").val(parseInt(parseInt("${room_price}")) - parseInt(coupon[1])); // 결제 금액에 룸가격에서  차감금액 뺀 가격 적용
				
				var payment_money = parseInt($("#pay_money").val()); // 할인 적용된 금액 대입
				
				$("#price").text(payment_money.toLocaleString()+"원"); // 수정된 값 화면에 콤마 적용해서 보여주기
				
				coupon_num = parseInt(coupon[2]); // 사용한 쿠폰번호 대입

			}
			
		});
	});
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp99855763'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	
	function payment(){
		
		if($("#name").val() == ""){
			alert("예약자 이름을 입력해주세요");
			return;
		}
		
		var payment_type = $("#payment_type_select").val();
		var pay_money = $("#pay_money").val();
		var start_date = $("#start_date").val();
		var end_date = $("#end_date").val();
		var name = $("#name").val();
		var room_num = $("#room_num").val();
		
		IMP.request_pay({
		    pg : payment_type, // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : pay_money,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : name,
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        
		        $.ajax({
		        	url : "${cp}/members/paymentOk",
		        	method : "POST",
		        	data : { room_num:room_num,  // 룸 번호
		        			 pay_money:pay_money, // 결제금액
		        			 start_date:start_date, // 숙박 시작일
		        			 end_date:end_date, // 숙박 종료일
		        			 name:name, // 예약자 이름
		        			 payment_type:payment_type, // 결제 유형
		        			 room_price:pay_money, // 할인 적용된 룸 가격
		        			 coupon_num:coupon_num // 쿠폰번호
		        			 } 
		        	}).done(function(data){
		        		//alert(data.code);
		        		if(data.code){
		        			location.href="${cp}/members/paymentList";
		        		}else{
		        			alert("서버에 데이터 저장 실패!");
		        		}
		        		
		        	});
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
		
	}
	
</script>



<div style="width:65%;min-height: 1000px;margin: auto;padding: 40px;margin-top: 150px;">
	
	<input type="hidden" id="pay_money" name="pay_money" value="${room_price }">
	<input type="hidden" id="start_date" name="start_date" value="${sdt }">
	<input type="hidden" id="end_date" name="end_date" value="${edt }">
	<input type="hidden" id="room_num" name="room_num" value="${room_num }">
	
	<div style="float:left;width:70%">
		<p>
		<img src="${cp }/resources/upload/${house_save_name}" style="width:85%;height:250px;border-radius: 5px;">
		</p>
		<h4>예약자 정보</h4>
		<br>
		<form>
		  <div class="form-group">
		    <label for="exampleInputEmail1">예약자 이름</label>
		    <input style="text-align: left;" name="name" type="text" class="form-control col-10" placeholder="체크인시 필요한 정보입니다." id="name">
<!-- 		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
		  </div>
		  
		  <!-- 쿠폰선택 -->
		  <div class="form-group">
		      <label for="coupon_select">사용가능한 쿠폰</label><br>
			  <select id="coupon" name="coupon" class="custom-select col-4" id="coupon_select">
		        <option selected value="0">쿠폰 선택</option>
		        <c:forEach var="coupon" items="${coupon }">
		        	<option value="${coupon.coupon_typenum }/${coupon.coupon_saletype }/${coupon.coupon_num }">${coupon.coupon_name }</option>
		        </c:forEach>
		      </select>
		      <button type="button" class="btn btn-info" id="couponUse" disabled="disabled">적용</button>
		  </div>
		 
<!-- 		  결제방식선택 -->
		  <div class="form-group">
		  	  <label for="payment_type_select">결제수단 선택</label><br>
			  <select name="payment_type" class="custom-select col-4" id="payment_type_select">
		        <option value="kakaopay" selected>카카오페이</option>
		        <option value="1">카드결제 (신용,체크)</option>
		        <option value="3">휴대폰 결제</option>
		      </select>
		  </div>
	
		</form>
		
		<div>
			<button class="btn btn-primary" onclick="javascript:history.back()">뒤로가기</button>
		</div>
	</div>
	
	<div class="card" style="float:left;width:30%;background-color: #f9f9f9;">
	
            <section class="info" style="border-bottom: 1px solid lightgray;margin: 30px 20px 0px 20px;">
            
                <p class="name" style="font-size: 1.2em;"><strong>숙소이름</strong><br><span style="color:black;">${company }</span></p>
                <p style="font-size: 1.2em;"><strong>객실타입/기간</strong><br><span style="color:black;">${room_name } / ${days }박</span></p>

                <p style="font-size: 1.2em;"><strong>체크인</strong><br><span style="color:black;">${sdt }</span></p>
                <p style="font-size: 1.2em;"><strong>체크아웃</strong><br><span style="color:black;">${edt }</span></p>
                
            </section>
            <section class="total_price_pc" style="margin: 20px 20px 30px 20px;">
                <p style="font-size: 1.2em;"><strong><b>총 결제 금액</b>(VAT포함)</strong><br><span id="price" class="in_price" style="color:red;font-size: 1.5em;">${dc.format(room_price) }원</span>
                </p>
                <ul>
                    <li>※ 해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
                    <li>※ 결제완료 후 <span style="color:red;">예약자 이름</span>으로 바로 <span style="color:red;">체크인</span> 하시면 됩니다</li>
                </ul>
            </section>

            <button id="payment" type="button" class="btn btn-warning" style="height:50px;">결제하기</button>
        </div>

</div>