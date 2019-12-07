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
				<h1 class="tit">문의 내역</h1>
			</header>
			<br>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">분류</th>
			      <th scope="col">제목</th>
			      <th scope="col">답변여부</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="qnalist" items="${qnalist }" varStatus="i">
			  		<tr>
				      <th scope="row">${i.index+1 }</th>
				      <td>${qnalist.QNA_CATEGORY_NAME }</td>
				      <td><a href="${pageContext.request.contextPath }/members/qnaDetail?qna_num=${qnalist.QNA_NUM}">${qnalist.QNA_TITLE }</a></td>
				      <c:choose>
				      	<c:when test="${empty qnalist.ANWSER }">
				      		<td style="color:red;">답변대기</td>
				      	</c:when>
				      	<c:otherwise>
				      		<td style="color:blue;">답변완료</td>
				      	</c:otherwise>
				      </c:choose>
				      
				    </tr>
			  	</c:forEach>
			  </tbody>
			</table>
		</section>
		<!-- //contents -->

	</div>
	<!-- //mypage area -->
</div>
