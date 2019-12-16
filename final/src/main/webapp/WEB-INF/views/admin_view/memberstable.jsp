<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column" style="width:1680px;">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
			<div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-left:1400px">
            <div>
            	<a href="${cp}/admin_view/gohome" class="btn btn-primary btn-icon-split">
                    <span class="text">메인페이지 이동</span>
                </a>    
             	<a href="${cp}/admin/logout" class="btn btn-danger btn-icon-split">
                    <span class="text">로그아웃</span>
                </a>
             </div>
          </div>
        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">등록회원 조회</h1>
          

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">조회테이블</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>아이디</th>
                      <th>비밀번호</th>
                      <th>이름</th>
                      <th>전화번호</th>
                      <th>이메일</th>
                      <th>가입일</th>
                      <th>포인트</th>
                      <th>등급</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="vo" items="${mlist}">
                    	<tr>
                    		<td>${vo.MID}</td>
                    		<td>${vo.MPWD}</td>
                    		<td>${vo.MNAME}</td>
                    		<td>${vo.MPHONE}</td>
                    		<td>${vo.MEMAIL}</td>
                    		<td>${vo.MREGDATE}</td>
                    		<td>${vo.MPOINT}</td>
                    		<td>
                    			<c:choose>
                    				<c:when test="${vo.GNAME=='골드'}">
                    					<img src="${cp}/resources/admin/골드.png" style="width:20px;height:20px">
                    					<b><span style="color:#ffd700">골드</span></b>
                    				</c:when>
                    				<c:when test="${vo.GNAME=='실버'}">
                    					<img src="${cp}/resources/admin/실버.png" style="width:20px;height:20px">
                    					<b><span style="color:#808080">실버</span></b>
                    				</c:when>
                    				<c:otherwise>
                    					<img src="${cp}/resources/admin/브론즈.png" style="width:20px;height:20px">
                    					<b><span style="color:#800000">브론즈</span></b>
                    				</c:otherwise>
                    			</c:choose>
                    		</td>
                    	</tr>
                    </c:forEach>
                  </tbody>
                </table>
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