<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="width:80%;min-height: 1200px;margin: auto;padding: 40px;">
	
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
			<p><span style="color:orange;font-size: 2.0em;">★★★★★</span>&nbsp;&nbsp;&nbsp;<span style="font-size: 1.5em;color:gray;">리뷰 개수 1,100개</span></p>
			<br>
			<p style="font-size: 1.7em;">서울특별시 종로구 디아망 빌딩</p>
			<br>
			<p style="font-size: 1.5em;background-color: lightgray;min-height: 100px;padding:10px;">
				업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐업소 소개좀 잘해봐업소 소개좀 잘해봐업소 소개좀 잘해봐업소 소개좀 잘해봐
				업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐
				업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐 업소 소개좀 잘해봐
			</p>
			
		</div>
		
		<!-- 객실정보 -->
		<div style="width:100%;min-height:1000px;background-color: pink;clear: both;">
						
			<p>
			  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="true" aria-controls="collapseExample">
			    Link with href44
			  </a>
			  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="true" aria-controls="collapseExample2">
			    Link with href33
			  </a>
			</p>
			<div class="collapse" id="collapseExample">
			  <div class="card card-body">
			    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
			  </div>
			</div>
			<div class="collapse" id="collapseExample2">
			  <div class="card card-body">
			    Animasdㅁㄴㅇ pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
			  </div>
			</div>
			
		</div>
	</div>
</div>