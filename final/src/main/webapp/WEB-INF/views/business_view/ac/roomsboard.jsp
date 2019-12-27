<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column"
	style="width: 1680px;">

	<!-- Main Content -->
	<div id="content">

		<!-- Topbar -->
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

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">Tables</h1>
			<p class="mb-4">DataTables is a third party plugin that is used
				to generate the demo table below. For more information about
				DataTables, please visit the.</p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">

				<div class="card-header py-3">
					<a href="${cp}/business_view/writeroom"
						class="btn btn-primary btn-icon-split" style="float: right"> <span
						class="text">작성하기</span>
					</a>
					<h6 class="m-0 font-weight-bold text-primary">DataTables
						Example</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>번호</th>
									<th>업체명</th>
									<th>방이름</th>
									<th>가격</th>
									<th>최대인원</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${allroomlist}" varStatus="vs">
									<tr>
										<td>${vs.index+1}</td>
										<td>${vo.COMPANY}</td>
										<td><a href="${cp}/business_view/selroominfo?room_num=${vo.ROOM_NUM}">${vo.ROOMNAME}</a></td>
										<td>${vo.ROOM_PRICE}<span>원</span></td>						
										<td>${vo.MAX_PERSONNEL}</td>
										<td><a
											href="${cp}/business_view/uproom?room_num=${vo.ROOM_NUM}">수정</a></td>
										<td><a
											href="${cp}/business_view/delroom?room_num=${vo.ROOM_NUM}">삭제</a></td>
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
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready
				to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="login.html">Logout</a>
			</div>
		</div>
	</div>
</div>