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
          <h1 class="h3 mb-2 text-gray-800">QNA게시판</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
          
            <div class="card-header py-3">         
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                   	 <th>번호</th>       
                      <th>카테고리</th>
                      <th>제목</th>
                      <th>문의날짜</th> 
                      <th>상태</th>             
                    </tr>
                  </thead>
                  <tbody>             
                  	<c:forEach var="vo" items="${allqnalist}" varStatus="vs">
                    <tr>
                     <td>${vs.index+1}</td>
                      <c:choose>
                      <c:when test="${vo.qna_category_num==21}">      
    						<td>예약</td>
      					</c:when>
      					<c:when test="${vo.qna_category_num==22}">      
    						<td>환불</td>
      					</c:when>
      					<c:when test="${vo.qna_category_num==23}">      
    						<td>기타</td>
      					</c:when>  					
      					</c:choose>
                      <td><a href="${cp}/admin_view/selqna?qna_num=${vo.qna_num}">${vo.qna_title}</a></td>
                      <td>${vo.qna_date}</td>  
                      <td>대기중</td>                   
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
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
