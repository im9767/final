<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
			
		  <div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-left:1400px">
            <div>
            	<a href="${cp}/admin_view/gohome" class="btn btn-primary btn-icon-split">
                    <span class="text">메인페이지 이동</span>
                </a>    
             	<a href="${cp}/business/logout" class="btn btn-danger btn-icon-split">
                    <span class="text">로그아웃</span>
                </a>
             </div>
          </div>
		  
          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
		
        </nav>
        <!-- End of Topbar -->
		
        <!-- Begin Page Content -->
        <div class="container-fluid" style="width: 1630px;height:1000px;">

          <!-- Content Row -->
          <div class="row">
			
			<!-- Border Left Utilities -->
            <div class="col-lg-6">
              <div class="card mb-4 py-3 border-left-danger" id="mymsg" style="width:900px;">
                <div class="card-body">
                  <a href="#" class="btn btn-warning btn-circle btn-lg">
                    <i class="fas fa-exclamation-triangle"></i>
                  </a>
                  <a href="#">
                  &nbsp;<span id="mmsg" style="font-size:30px;color:red;font-family: 고딕;font-weight: bold">
                  	업체등록 및 요청을 먼저 해주세요!!!
                  </span><span style="font-size:25px;font-family: 궁서체;font-weight: bold">(최소 1개 이상)</span>
                  </a>
                </div>
              </div>
              
              <div class="card mb-4 py-3 border-left-primary" style="width:900px;">
                <div class="card-body">
                  <a href="#" class="btn btn-success btn-circle btn-lg">
                    <i class="fas fa-check"></i>
                  </a>
                  &nbsp;<span id="mmsg" style="font-size:30px;color:black;font-family: 고딕;font-weight: bold">
                  	요청상태 ==> 등록대기중..
                  </span>
                </div>
              </div>
              
            </div>
          </div>                    
        <!-- /.container-fluid -->
      </div>
	</div>
	
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