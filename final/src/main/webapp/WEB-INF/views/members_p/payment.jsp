<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	
	
	$(function(){
		$("#payment").click(payment);
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
		        	data : { room_num:room_num, 
		        			 pay_money:pay_money,
		        			 start_date:start_date,
		        			 end_date:end_date,
		        			 name:name,
		        			 payment_type:payment_type,
		        			 room_price:pay_money}
		        	}).done(function(data){
		        		alert(data.code);
		        		if(data.code){
		        			alert("서버에 데이터 저장 완료!");
		        			location.href="${cp}/";
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



<div style="width:65%;min-height: 1000px;margin: auto;padding: 40px;margin-top: 150px;background-color:lightgray;">
	
	<input type="hidden" id="pay_money" name="pay_money" value="${room_price }">
	<input type="hidden" id="start_date" name="start_date" value="${sdt }">
	<input type="hidden" id="end_date" name="end_date" value="${edt }">
	<input type="hidden" id="room_num" name="room_num" value="${room_num }">
	
	<div style="float:left;width:70%">
		<h4>예약자 정보</h4>
		<br>
		<form>
		  <div class="form-group">
		    <label for="exampleInputEmail1">예약자 이름</label>
		    <input name="name" type="text" class="form-control col-10" placeholder="체크인시 필요한 정보입니다." id="name">
<!-- 		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
		  </div>
		  
		  <!-- 쿠폰선택 -->
		  <div class="form-group">
		      <label for="payment_type_select">사용가능한 쿠폰</label><br>
			  <select name="coupon" class="custom-select col-4" id="coupon_select">
		        <option selected>Choose...</option>
		        <option value="1">One</option>
		        <option value="2">Two</option>
		        <option value="3">Three</option>
		      </select>
		  </div>
		  
<!-- 		  결제방식선택 -->
		  <div class="form-group">
		  	  <label for="coupon_select">결제수단 선택</label><br>
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
                <p style="font-size: 1.2em;"><strong><b>총 결제 금액</b>(VAT포함)</strong><br><span class="in_price" style="color:red;font-size: 1.5em;">${dc.format(room_price) }원</span>
                </p>
                <ul>
                    <li>※ 해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
                    <li>※ 결제완료 후 <span style="color:red;">예약자 이름</span>으로 바로 <span style="color:red;">체크인</span> 하시면 됩니다</li>
                </ul>
            </section>

            <button id="payment" type="button" class="btn btn-warning" style="height:50px;">결제하기</button>
        </div>

</div>