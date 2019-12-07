<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="mypage-wrap">
		
	<!-- mypage header -->
		<jsp:include page="mypageHeader.jsp"/>
	<!-- mypage header -->	
	<!-- mypage area -->
	<div class="mypage-area">
		<!-- mypage nav -->
			<jsp:include page="mypageNav.jsp"/>
		<!-- //mypage nav -->				
		<!-- contents -->
		<section class="mypage-cont">
			<header class="n-section-title">
				<h1 class="tit">래플 응모내역</h1>
			</header>
			<form>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Email address</label>
			    <input type="email" class="form-control span5" id="exampleInputEmail1" aria-describedby="emailHelp">
			    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" class="form-control" id="exampleInputPassword1">
			  </div>
			  <button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</section>
		<!-- //contents -->
		<!--래플 당첨결과-->
		<div class="layer_cont layer-raffle-result" id="raffle_result" style="display:none; position: fixed; top:50%; left: 60%; margin-left:-800px;  z-index: 100;margin-top:-404px"></div>
		<!--//래플 당첨결과-->
	</div>
	<!-- //mypage area -->
</div>