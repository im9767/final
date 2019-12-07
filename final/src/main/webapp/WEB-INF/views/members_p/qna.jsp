<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="mypage-wrap">
		
	<!-- mypage header -->
		<jsp:include page="/WEB-INF/views/members_p/include/mypageHeader.jsp"/>
	<!-- mypage header -->	
	<!-- mypage area -->
	<div class="mypage-area">
		<!-- mypage nav -->
			<jsp:include page="/WEB-INF/views/members_p/include/mypageNav.jsp"/>
		<!-- //mypage nav -->			
		<!-- contents -->
		<section class="mypage-cont">
			<header class="n-section-title">
				<h1 class="tit" style="font-size:35px;">문의</h1>
			</header>
			<br>
			<form action="${pageContext.request.contextPath }/members/qna" method="post" onsubmit="return validation()" style="margin-left:10px;">
			  <div class="form-group">
			    <label for="exampleInputEmail1" style="font-size: 22px;">제목</label>
			    <input type="text" class="form-control" id="qna_title" name="qna_title">
			    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			  </div>
			  
			<div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" id="customRadioInline1" name="qna_category_num" class="custom-control-input" value="1">
			  <label class="custom-control-label" for="customRadioInline1">예약</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" id="customRadioInline2" name="qna_category_num" class="custom-control-input" value="2">
			  <label class="custom-control-label" for="customRadioInline2">환불</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" id="customRadioInline3" name="qna_category_num" class="custom-control-input" value="3">
			  <label class="custom-control-label" for="customRadioInline3">기타</label>
			</div>
			
			
			
			  <div class="form-group">
				  <label for="comment" style="font-size: 22px;">내용</label>
				  <textarea class="form-control" rows="10" id="qna_content" name="qna_content"></textarea>
			  </div>  
			  
			  <button type="submit" class="btn btn-primary" style="width:70px;height:40px;font-size: 20px;">작성</button>
			</form>
		</section>
		<!-- //contents -->

	</div>
	<!-- //mypage area -->
</div>
