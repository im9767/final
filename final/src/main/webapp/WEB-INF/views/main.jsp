<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>요기어때</title>

<div class="main_slider"
	style="background-image:url(${pageContext.request.contextPath }/resources/images/slider_1.jpg)">
	<div class="container fill_height">
		<div class="row align-items-center fill_height">
			<div class="col">
				<div class="main_slider_content">
					<h6>Spring / Summer Collection 2017</h6>
					<h1>Get up to 30% Off New Arrivals</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<br><br>
<!-- Best Sellers -->
	<ul class="col-12" style="width:100%;text-align: center;">
		<li id="motel" class="card bg-dark text-white" style="width:300px;height:300px;display: inline-block;border: none;margin-right: 10px;cursor: pointer;">
		  <img src="${cp }/resources/upload/abcde-모텔.jpg" class="card-img" alt="..." style="width:300px;height:300px;opacity: 0.7;">
		  <div class="card-img-overlay" style="padding: 80px;padding-top: 120px;">
		    <h5 class="card-title" style="font-size: 2em;font-weight: bold;color: white;">모 텔</h5>
		  </div>
		</li>
		<li id="hotel" class="card bg-dark text-white" style="width:300px;height:300px;display: inline-block;border: none;margin-right: 10px;cursor: pointer;">
		  <img src="${cp }/resources/upload/abcde-hotel.jpg" class="card-img" alt="..." style="width:300px;height:300px;opacity: 0.7;">
		  <div class="card-img-overlay" style="padding: 80px;padding-top: 120px;">
		   <h5 class="card-title" style="font-size: 2em;font-weight: bold;color: white;">호 텔</h5></div>
		</li>
		<li id="resort" class="card bg-dark text-white" style="width:300px;height:300px;display: inline-block;border: none;margin-right: 10px;cursor: pointer;">
		  <img src="${cp }/resources/upload/abcde-리조트.jpg" class="card-img" alt="..." style="width:300px;height:300px;opacity: 0.7;">
		  <div class="card-img-overlay" style="padding: 80px;padding-top: 120px;">
		   <h5 class="card-title" style="font-size: 2em;font-weight: bold;color: white;">리조트</h5></div>
		</li>
		<li id="pension" class="card bg-dark text-white" style="width:300px;height:300px;display: inline-block;border: none;margin-right: 10px;cursor: pointer;">
		  <img src="${cp }/resources/upload/abcde-펜션.jpg" class="card-img" alt="..." style="width:300px;height:300px;opacity: 0.7;">
		  <div class="card-img-overlay" style="padding: 80px;padding-top: 105px;">
		    <h5 class="card-title" style="font-size: 2em;font-weight: bold;color: white;">펜 션<br>풀빌라</h5>
		  </div>
		</li>
	</ul>
	
	<script>
	
		$(function(){
			$("#motel").click(function(){
				
				location.href="${cp}/product/accommodationList?t=21&p=01";
				
			});
			
			$("#hotel").click(function(){
							
				location.href="${cp}/product/accommodationList?t=22&p=01";
							
			});
						
			$("#resort").click(function(){
				
				location.href="${cp}/product/accommodationList?t=23&p=01";
				
			});
			
			$("#pension").click(function(){
				
				location.href="${cp}/product/accommodationList?t=24&p=01";
				
			});
		});
	
	</script>
	
<!-- New Arrivals -->

	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>New Arrivals</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col text-center">
					<div class="new_arrivals_sorting">
						<ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked" data-filter="*">all</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".women">women's</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".accessories">accessories</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".men">men's</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>

						<!-- Product 1 -->

						<div class="product-item men">
							<div class="product discount product_filter">
								<div class="product_image">
									<img src="${pageContext.request.contextPath }/resources/images/product_1.png" alt="">
								</div>
								<div class="favorite favorite_left"></div>
								<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-$20</span></div>
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">Fujifilm X100T 16 MP Digital Camera (Silver)</a></h6>
									<div class="product_price">$520.00<span>$590.00</span></div>
								</div>
							</div>
							<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
						</div>

						<!-- Product 2 -->

						<div class="product-item women">
							<div class="product product_filter">
								<div class="product_image">
									<img src="${pageContext.request.contextPath }/resources/images/product_2.png" alt="">
								</div>
								<div class="favorite"></div>
								<div class="product_bubble product_bubble_left product_bubble_green d-flex flex-column align-items-center"><span>new</span></div>
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">Samsung CF591 Series Curved 27-Inch FHD Monitor</a></h6>
									<div class="product_price">$610.00</div>
								</div>
							</div>
							<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
						</div>

						<!-- Product 3 -->

						<div class="product-item women">
							<div class="product product_filter">
								<div class="product_image">
									<img src="${pageContext.request.contextPath }/resources/images/product_3.png" alt="">
								</div>
								<div class="favorite"></div>
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">Blue Yeti USB Microphone Blackout Edition</a></h6>
									<div class="product_price">$120.00</div>
								</div>
							</div>
							<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
						</div>

						<!-- Product 4 -->

						<div class="product-item accessories">
							<div class="product product_filter">
								<div class="product_image">
									<img src="${pageContext.request.contextPath }/resources/images/product_4.png" alt="">
								</div>
								<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>sale</span></div>
								<div class="favorite favorite_left"></div>
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">DYMO LabelWriter 450 Turbo Thermal Label Printer</a></h6>
									<div class="product_price">$410.00</div>
								</div>
							</div>
							<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
						</div>

						<!-- Product 5 -->

						<div class="product-item women men">
							<div class="product product_filter">
								<div class="product_image">
									<img src="${pageContext.request.contextPath }/resources/images/product_5.png" alt="">
								</div>
								<div class="favorite"></div>
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">Pryma Headphones, Rose Gold & Grey</a></h6>
									<div class="product_price">$180.00</div>
								</div>
							</div>
							<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<!-- Banner -->

<div class="banner">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="banner_item align-items-center"
					style="background-image:url(${pageContext.request.contextPath }/resources/images/banner_1.jpg)">
					<div class="banner_category">
						<a href="categories.html">women's</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="banner_item align-items-center"
					style="background-image:url(${pageContext.request.contextPath }/resources/images/banner_2.jpg)">
					<div class="banner_category">
						<a href="categories.html">accessories's</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="banner_item align-items-center"
					style="background-image:url(${pageContext.request.contextPath }/resources/images/banner_3.jpg)">
					<div class="banner_category">
						<a href="categories.html">men's</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>