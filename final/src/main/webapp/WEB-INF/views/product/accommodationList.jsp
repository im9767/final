<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


                <div class="breadcrumb-content text-center">
                    <h2>shop list 2 column111111</h2>
                </div>

        <div class="shop-page-wrapper shop-page-padding ptb-100 ">
            <div class="container-fluid border-secondary">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="shop-sidebar mr-50">
                            <div class="sidebar-widget mb-50">
                                <h3 class="sidebar-title">날짜</h3>
                                <div class="sidebar-search">
                                   <input type="text" id="startDate" style="width:130px;">
									<input type="text" id="endDate" style="width:130px;">
                                    
                                </div>
                            </div>
                            
                            <div class="sidebar-widget mb-60">
                                <h3 class="sidebar-title">상세조건</h3>
                           		    <button type="button" class="btn btn-outline-primary rounded"  style="width: 90px; height:40px;">초기화</button>&nbsp &nbsp 
									<button type="button" class="btn btn-danger rounded" style="width: 90px; height:40px;">적용</button><br><br>
										<input type="checkbox" style="width:20px; height:20px;">
	  									<label class="custom-control-label" for="customCheck1" >예약 가능</label><br>
	  									<input type="checkbox" style="width:20px; height:20px;">
	  									<label class="custom-control-label" for="customCheck1">프로모션</label>
                            </div>
<div class="sidebar-widget mb-40">
                                <h3 class="sidebar-title">Filter by Price</h3>
                                <div class="price_filter">
                                    <div id="slider-range"></div>
                                    <div class="price_slider_amount">
                                        <div class="label-input">
                                            <label>price : </label>
                                            <input type="text" id="amount" name="price"  placeholder="Add Your Price" />
                                        </div>
                                        <button type="button">Filter</button> 
                                    </div>
                                </div>
                            </div>
                            <div class="sidebar-widget mb-45">
                                <h3 class="sidebar-title">Categories</h3>
                                <div class="sidebar-categories">
                                    <ul>
                                        <li><a href="#">Accessories <span>4</span></a></li>
                                        <li><a href="#">Book <span>9</span></a></li>
                                        <li><a href="#">Clothing <span>5</span> </a></li>
                                        <li><a href="#">Homelife <span>3</span></a></li>
                                        <li><a href="#">Kids & Baby <span>4</span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sidebar-widget sidebar-overflow mb-45">
                                <h3 class="sidebar-title">color</h3>
                                <div class="product-color">
                                    <ul>
                                        <li class="red">b</li>
                                        <li class="pink">p</li>
                                        <li class="blue">b</li>
                                        <li class="sky">b</li>
                                        <li class="green">y</li>
                                        <li class="purple">g</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sidebar-widget mb-40">
                                <h3 class="sidebar-title">size</h3>
                                <div class="product-size">
                                    <ul>
                                        <li><a href="#">xl</a></li>
                                        <li><a href="#">m</a></li>
                                        <li><a href="#">l</a></li>
                                        <li><a href="#">ml</a></li>
                                        <li><a href="#">lm</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sidebar-widget mb-50">
                                <h3 class="sidebar-title">Top rated products</h3>
                                <div class="sidebar-top-rated-all">
                                    <div class="sidebar-top-rated mb-30">
                                        <div class="single-top-rated">
                                            <div class="top-rated-img">
                                                <a href="#"><img src="assets/img/product/sidebar-product/1.jpg" alt=""></a>
                                            </div>
                                            <div class="top-rated-text">
                                                <h4><a href="#">Flying Drone</a></h4>
                                                <div class="top-rated-rating">
                                                    <ul>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                    </ul>
                                                </div>
                                                <span>$140.00</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sidebar-top-rated mb-30">
                                        <div class="single-top-rated">
                                            <div class="top-rated-img">
                                                <a href="#"><img src="assets/img/product/sidebar-product/2.jpg" alt=""></a>
                                            </div>
                                            <div class="top-rated-text">
                                                <h4><a href="#">Flying Drone</a></h4>
                                                <div class="top-rated-rating">
                                                    <ul>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                    </ul>
                                                </div>
                                                <span>$140.00</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sidebar-top-rated mb-30">
                                        <div class="single-top-rated">
                                            <div class="top-rated-img">
                                                <a href="#"><img src="assets/img/product/sidebar-product/3.jpg" alt=""></a>
                                            </div>
                                            <div class="top-rated-text">
                                                <h4><a href="#">Flying Drone</a></h4>
                                                <div class="top-rated-rating">
                                                    <ul>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                    </ul>
                                                </div>
                                                <span>$140.00</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sidebar-top-rated mb-30">
                                        <div class="single-top-rated">
                                            <div class="top-rated-img">
                                                <a href="#"><img src="assets/img/product/sidebar-product/4.jpg" alt=""></a>
                                            </div>
                                            <div class="top-rated-text">
                                                <h4><a href="#">Flying Drone</a></h4>
                                                <div class="top-rated-rating">
                                                    <ul>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                        <li><i class="pe-7s-star"></i></li>
                                                    </ul>
                                                </div>
                                                <span>$140.00</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                    
                    	<div class="shop-product-wrapper res-xl">
                            <div class="shop-bar-area">
                                <div class="shop-bar pb-60">
                                    <div class="shop-found-selector">
                                        <div class="shop-found">
                                      <!--       <p><span>23</span> Product Found of <span>50</span></p> -->
                                        </div>
                                        <div class="shop-selector">
                                            <label>Sort By : </label>
                                            <select name="select">
                                                <option value="">Default</option>
                                                <option value="">A to Z</option>
                                                <option value=""> Z to A</option>
                                                <option value="">In stock</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="shop-filter-tab">
                                        <div class="shop-tab nav" role=tablist>
                                            <a href="#grid-sidebar11" data-toggle="tab" role="tab" aria-selected="false">
                                                <i class="ti-layout-grid4-alt"></i>
                                            </a>
                                            <a class="active" href="#grid-sidebar12" data-toggle="tab" role="tab" aria-selected="true">
                                                <i class="ti-menu"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                         
                                <div class="shop-product-content tab-content">
                                    <div id="grid-sidebar11" class="tab-pane fade">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <div class="product-wrapper mb-30">
                                           
                                                    <div class="product-img">
                                                        <a href="#">
                                                            
                                                        </a> 
                                                       <!--  <span>hot</span>  -->
                                                        <div class="product-action">
                                                            <a class="animate-left" title="Wishlist" href="#">
                                                                <i class="pe-7s-like"></i>
                                                            </a>
                                                            <a class="animate-top" title="Add To Cart" href="#">
                                                                <i class="pe-7s-cart"></i>
                                                            </a>
                                                            <a class="animate-right" title="Quick View" data-toggle="modal" data-target="#exampleModal" href="#">
                                                                <i class="pe-7s-look"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="#">100</a></h4>
                                                        <span>$115.00</span>
                                                    </div>
                                                </div>
                                           </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="product-wrapper mb-30">
                                                    <div class="product-img">
                                                        <a href="#">
                                                            <img src="assets/img/product/fashion-colorful/2.jpg" alt="">
                                                        </a>
                                                        <div class="product-action">
                                                            <a class="animate-left" title="Wishlist" href="#">
                                                                <i class="pe-7s-like"></i>
                                                            </a>
                                                            <a class="animate-top" title="Add To Cart" href="#">
                                                                <i class="pe-7s-cart"></i>
                                                            </a>
                                                            <a class="animate-right" title="Quick View" data-toggle="modal" data-target="#exampleModal" href="#">
                                                                <i class="pe-7s-look"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="#">Denim Stonewash</a></h4>
                                                        <span>$115.00</span>
                                                    </div>
                                                </div>
                                           </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="product-wrapper mb-30">
                                                    <div class="product-img">
                                                        <a href="#">
                                                            <img src="assets/img/product/fashion-colorful/3.jpg" alt="">
                                                        </a>
                                                        <span>new</span>
                                                        <div class="product-action">
                                                            <a class="animate-left" title="Wishlist" href="#">
                                                                <i class="pe-7s-like"></i>
                                                            </a>
                                                            <a class="animate-top" title="Add To Cart" href="#">
                                                                <i class="pe-7s-cart"></i>
                                                            </a>
                                                            <a class="animate-right" title="Quick View" data-toggle="modal" data-target="#exampleModal" href="#">
                                                                <i class="pe-7s-look"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="#">Mini Waffle 5 Pack</a></h4>
                                                        <span>$115.00</span>
                                                    </div>
                                                </div>
                                           </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="product-wrapper mb-30">
                                                    <div class="product-img">
                                                        <a href="#">
                                                            <img src="assets/img/product/fashion-colorful/4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action">
                                                            <a class="animate-left" title="Wishlist" href="#">
                                                                <i class="pe-7s-like"></i>
                                                            </a>
                                                            <a class="animate-top" title="Add To Cart" href="#">
                                                                <i class="pe-7s-cart"></i>
                                                            </a>
                                                            <a class="animate-right" title="Quick View" data-toggle="modal" data-target="#exampleModal" href="#">
                                                                <i class="pe-7s-look"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="#">Dagger Smart Trousers</a></h4>
                                                        <span>$115.00</span>
                                                    </div>
                                                </div>
                                           </div>
                                        </div>
                                    </div>
                                    <!-- 숙박 가능 업소 리스트 -->

                                    <div id="grid-sidebar12" class="tab-pane fade active show">
                                        <div class="row">
                                             <c:forEach var="vo" items="${list }">
                                             	<div class="container" style="height: 85%; padding: 10px; " >
	                                                <div class="card bg-white text-white" style="border: none;">
													  <img src="${pageContext.request.contextPath }/resources/h_img/${vo.house_save_name}" alt=""  style="border-radius: 30px">
													  <div class="card-img-overlay" style="padding: 10px;">
													    <h1 class="card-title" style="color: white; padding-top: 10px; ">${vo.company }</h1>				
													    <h2 class="card-text" style="color: white; padding-top: 10px;">${vo.room_price }</h2>
													  </div>
													</div>
												</div>
                                             </c:forEach> 

											  <!-- 숙박 가능 업소 리스트 끝 -->
                                        </div>
                                    </div>
                               </div>
                         
                            </div>
                        </div>
                        <!--                       
                          <div class="pagination-style mt-10 text-center">
                            <ul>
                                <li><a href="#"><i class="ti-angle-left"></i></a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">...</a></li>
                                <li><a href="#">19</a></li>
                                <li class="active"><a href="#"><i class="ti-angle-right"></i></a></li>
                            </ul>
                        </div> -->
                        
                        <!-- 상품 2개 끝 -->
                  
                    </div>
              
                 
                        
                   
                </div>
            </div>
        </div>
 <script type="text/javascript">

 $("#startDate").datepicker({
		dateFormat: "yy-mm-dd", // 날짜의 형식
		minDate: 0,
		nextText: ">",
		prevText: "<",
		//autoclose: false,
		altFormat: "yy-mm-dd",
		gotoCurrent: true,
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
		dateFormat: "yy-mm-dd", // 날짜의 형식
		nextText: ">",
		prevText: "<",
		onClose: function(){
			
		}
	});
</script>        

        

        

	