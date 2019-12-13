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
		IMP.request_pay({
		    pg : 'kakaopay', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '최명도',
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
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
		
	}
	
</script>



<div style="width:65%;min-height: 800px;margin: auto;padding: 40px;margin-top: 150px;background-color:lightgray;">
	
	<div style="float:left;width:70%">
		<form>
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
		    <input type="text" class="form-control col-10" id="exampleInputEmail1" aria-describedby="emailHelp">
<!-- 		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
		  </div>
		  
		  <!-- 쿠폰선택 -->
		  <div class="form-group">
		      <label for="payment_type_select">사용가능한 쿠폰</label><br>
			  <select name="coupon" class="custom-select col-3" id="payment_type_select">
		        <option selected>Choose...</option>
		        <option value="1">One</option>
		        <option value="2">Two</option>
		        <option value="3">Three</option>
		      </select>
		  </div>
		  
<!-- 		  결제방식선택 -->
		  <div class="form-group">
		  	  <label for="coupon_select">결제수단 선택</label><br>
			  <select name="payment_type" class="custom-select col-3" id="coupon_select">
		        <option selected>Choose...</option>
		        <option value="kakaopay">카카오페이</option>
		        <option value="1">Two</option>
		        <option value="3">Three</option>
		      </select>
		  </div>
	
		</form>
	</div>
	
	<div class="card" style="float:left;width:30%;background-color: lightgreen;padding:20px;">
	
            <section class="info">
            
                <p class="name"><strong>숙소이름</strong><br>종로 스카이 더클래식</p>
                <p><strong>객실타입/기간</strong><br>일반 / 1박</p>

                <p><strong>체크인</strong><br>12.12 목 19:00</p>
                <p><strong>체크아웃</strong><br>12.13 금 13:00</p>
                
            </section>
            <section class="total_price_pc">
                <p><strong><b>총 결제 금액</b>(VAT포함)</strong><br><span class="in_price">40,000원</span>
                </p>
                <ul>
                    <li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
                    <li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다</li>
                </ul>
            </section>

            <button id="payment" type="button" class="btn btn-warning">결제하기</button>
        </div>

</div>