<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
		<div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-left:1400px;padding-top:15px">
            <div>
	            <a href="${cp}/admin_view/gohome" class="btn btn-primary btn-icon-split">
	               <span class="text">메인페이지 이동</span>
	            </a>    
	            <a href="${cp}/business/logout" class="btn btn-danger btn-icon-split">
	               <span class="text">로그아웃</span>
	            </a>
            </div>
          </div>
        
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example  이게 월별 매출액-->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="font-size:15px;">월별 매출액 (Monthly)</div>
                      <div>
                      	연도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월
                      	<br>
                      	<form action="${cp}/business/month" method="post">
                      	<select name="year" id="year" class="form-control form-control-user" style="width:100px;display: inline-block;">
                      		<option value="19" <c:if test="${year=='19'}">selected</c:if>>2019</option>
                      		<option value="18" <c:if test="${year=='18'}">selected</c:if>>2018</option>
                      		<option value="17" <c:if test="${year=='17'}">selected</c:if>>2017</option>
                      		<option value="16" <c:if test="${year=='16'}">selected</c:if>>2016</option>
                      		<option value="15" <c:if test="${year=='15'}">selected</c:if>>2015</option>
                      		<option value="14" <c:if test="${year=='14'}">selected</c:if>>2014</option>
                      		<option value="13" <c:if test="${year=='13'}">selected</c:if>>2013</option>
                      	</select>&nbsp;&nbsp;&nbsp;&nbsp;
                      	<select name="month" id="month" class="form-control form-control-user" style="width:80px;display: inline-block;">
                      		<option value="01" <c:if test="${month=='01'}">selected</c:if>>1월</option>
                      		<option value="02" <c:if test="${month=='02'}">selected</c:if>>2월</option>
                      		<option value="03" <c:if test="${month=='03'}">selected</c:if>>3월</option>
                      		<option value="04" <c:if test="${month=='04'}">selected</c:if>>4월</option>
                      		<option value="05" <c:if test="${month=='05'}">selected</c:if>>5월</option>
                      		<option value="06" <c:if test="${month=='06'}">selected</c:if>>6월</option>
                      		<option value="07" <c:if test="${month=='07'}">selected</c:if>>7월</option>
                      		<option value="08" <c:if test="${month=='08'}">selected</c:if>>8월</option>
                      		<option value="09" <c:if test="${month=='09'}">selected</c:if>>9월</option>
                      		<option value="10" <c:if test="${month=='10'}">selected</c:if>>10월</option>
                      		<option value="11" <c:if test="${month=='11'}">selected</c:if>>11월</option>
                      		<option value="12" <c:if test="${month=='12'}">selected</c:if>>12월</option>
                      	</select>&nbsp;&nbsp;&nbsp;&nbsp;
                      	<!--  <input type="submit" value="조회">-->
                      	<button id="search" class="btn btn-success btn-circle">
                      		 <i class="fas fa-check"></i>
                      	</button>
                      	</form>
                      </div>
                      <br>
                      <div class="h3 mb-0 font-weight-bold text-gray-800">${monthSum}원</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example 기간 매출액-->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="font-size:15px;">기간별 매출액 (Period)</div>
                      <div style="display: inline-block;">
                      <form action="${cp}/business/period" method="post">
                      	<!--  <input type="text" id="cal2">&nbsp;&nbsp;-->
                      	<input type="text" name="startday" value="${startday}" class="form-control form-control-user" id="cal2" placeholder="시작일" style="width:240px;display: inline-block;">&nbsp;&nbsp;
                      	<!--  <input type="text" id="cal3">&nbsp;&nbsp;&nbsp;&nbsp;--><br><br>
                      	<input type="text" name="endday" value="${endday}" class="form-control form-control-user" id="cal3" placeholder="마지막일" style="width:240px;display: inline;">&nbsp;&nbsp;&nbsp;&nbsp;
                      	<br><br>
                      	<button id="psearch" class="btn btn-info btn-icon-split" style="background-color:#1cc88a;display: inline-block;">
                      		<span class="icon text-white-50">
                     			<i class="fas fa-info-circle"></i>
                    	    </span>
                    	    <span class="text">조회</span>
                      	</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      	<div class="h3 mb-0 font-weight-bold text-gray-800" style="display: inline-block;">${periodSum}원</div>
                      	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">80%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example 등록된 업체수 -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">등록된 업체수</div>
                      <div>
                      	<form action="${cp}/business/register" method="post">
                      	<select onchange="this.form.submit()" name="company" class="form-control form-control-user" style="width:230px;">
                      		<option value="20" <c:if test="${company=='20'}">selected</c:if>>전체</option>
                      		<option value="42" <c:if test="${company=='42'}">selected</c:if>>호텔</option>
                      		<option value="41" <c:if test="${company=='41'}">selected</c:if>>모텔</option>
                      		<option value="44" <c:if test="${company=='44'}">selected</c:if>>펜션</option>
                      		<option value="43" <c:if test="${company=='43'}">selected</c:if>>리조트</option>
                      	</select>
                      </form>
                      </div>
                      <br>
                      <div class="h3 mb-0 font-weight-bold text-gray-800">${companycount}곳</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart 이게 그래프차트 얼마 벌엇는가 -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">년도/월별 매출 통계</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <div>
                	<form action="${cp}/business/statics" method="post">
                	<select onchange="this.form.submit()" name="year" id="year" class="form-control form-control-user" style="width:100px;display: inline-block;">
                      	<option value="2019" <c:if test="${year=='2019'}">selected</c:if>>2019</option>
                      	<option value="2018" <c:if test="${year=='2018'}">selected</c:if>>2018</option>
                      	<option value="2017" <c:if test="${year=='2017'}">selected</c:if>>2017</option>
                      	<option value="2016" <c:if test="${year=='2016'}">selected</c:if>>2016</option>
                      	<option value="2015" <c:if test="${year=='2015'}">selected</c:if>>2015</option>
                      	<option value="2014" <c:if test="${year=='2014'}">selected</c:if>>2014</option>
                      	<option value="2013" <c:if test="${year=='2013'}">selected</c:if>>2013</option>
                   </select>&nbsp;&nbsp;&nbsp;&nbsp;
                   </form>
                </div> 
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myBarChart"></canvas>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pie Chart  -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">숙소 영업율</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
               <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="myPieChart"></canvas>
                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-danger"></i> 모텔
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 호텔
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 리조트
                    </span>
                     <span class="mr-2">
                      <i class="fas fa-circle text-warning"></i> 펜션
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">등록업종 비율</h6>
                </div>
                <c:forEach var="vo" items="${piechart}">
                	<c:choose>
                		<c:when test="${vo.BNUM=='21'}">
                			<c:set var="motel" value="${vo.CNT}"/>
                		</c:when>
                		<c:when test="${vo.BNUM=='22'}">
                			<c:set var="hotel" value="${vo.CNT}"/>
                		</c:when>
                		<c:when test="${vo.BNUM=='23'}">
                			<c:set var="resort" value="${vo.CNT}"/>
                		</c:when>
                		<c:otherwise>
                			<c:set var="pension" value="${vo.CNT}"/>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
                <c:set var="allCnt" value="${businessAll}"/>
                 <div class="card-body">
                  <h4 class="small font-weight-bold">모텔 <span class="float-right">${motel*100/allCnt}%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: ${motel*100/allCnt}%" aria-valuenow="${motel*100/allCnt}" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">호텔 <span class="float-right">${hotel*100/allCnt}%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar" role="progressbar" style="width: ${hotel*100/allCnt}%" aria-valuenow="${hotel*100/allCnt}" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">리조트 <span class="float-right">${resort*100/allCnt}%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-success" role="progressbar" style="width: ${resort*100/allCnt}%" aria-valuenow="${resort*100/allCnt}" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">펜션 <span class="float-right">${pension*100/allCnt}%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: ${pension*100/allCnt}%" aria-valuenow="${pension*100/allCnt}" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>

              <!-- Color System -->
              <div class="row">
                <div class="col-lg-6 mb-4">
                  <div class="card bg-primary text-white shadow">
                    <div class="card-body">
                      Primary
                      <div class="text-white-50 small">#4e73df</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-success text-white shadow">
                    <div class="card-body">
                      Success
                      <div class="text-white-50 small">#1cc88a</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-info text-white shadow">
                    <div class="card-body">
                      Info
                      <div class="text-white-50 small">#36b9cc</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-warning text-white shadow">
                    <div class="card-body">
                      Warning
                      <div class="text-white-50 small">#f6c23e</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-danger text-white shadow">
                    <div class="card-body">
                      Danger
                      <div class="text-white-50 small">#e74a3b</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-secondary text-white shadow">
                    <div class="card-body">
                      Secondary
                      <div class="text-white-50 small">#858796</div>
                    </div>
                  </div>
                </div>
              </div>

            </div>

            <div class="col-lg-6 mb-4">

              <!-- Illustrations -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                </div>
                <div class="card-body">
                  <div class="text-center">
                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="img/undraw_posting_photo.svg" alt="">
                  </div>
                  <p>Add some quality, svg illustrations to your project courtesy of <a target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a constantly updated collection of beautiful svg images that you can use completely free and without attribution!</p>
                  <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on unDraw &rarr;</a>
                </div>
              </div>

              <!-- Approach -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                </div>
                <div class="card-body">
                  <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce CSS bloat and poor page performance. Custom CSS classes are used to create custom components and custom utility classes.</p>
                  <p class="mb-0">Before working with this theme, you should become familiar with the Bootstrap framework, especially the utility classes.</p>
                </div>
              </div>

            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>