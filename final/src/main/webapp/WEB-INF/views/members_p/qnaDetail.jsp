<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Q&A상세</title>

<div class="mypage-wrap" style="min-height: 1200px;">
		
	<!-- mypage header -->
		<jsp:include page="/WEB-INF/views/members_p/include/mypageHeader.jsp"/>
	<!-- mypage header -->	
	<!-- mypage area -->
	<div class="mypage-area">
		<!-- mypage nav -->
			<jsp:include page="/WEB-INF/views/members_p/include/mypageNav.jsp"/>
		<!-- //mypage nav -->					
		<!-- contents -->
		<section class="mypage-cont"  style="float: left;width:85%;margin: auto;padding: 10px;">
			<header class="n-section-title">
				<h3 class="tit">문의글 보기</h3>
			</header>
			<br>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">내용</th>
			      <th scope="col">문의/답변 일시</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<tr style="height:300px;">
			  		<td width="80%">
			  			<h5>${qnaDetail.QNA_TITLE }</h5>
			  			<p>${qnaDetail.QNA_CONTENT }</p>
			  		</td>
			  		<td width="20%">
			  			<p>${qnaDetail.QNA_DATE }</p>
			  		</td>
			  	</tr>
			  	<c:if test="${not empty qnaDetail.ANWSER }">
			  		<tr style="height:300px;">
			  			<td width="70%" >
			  				<h5>문의 해주신 내용에 관한 답변입니다.</h5>
			  				<p>${qnaDetail.ANWSER }</p>
			  			</td>
			  			<td width="30%">
			  				<p>${qnaDetail.ANWSER_DATE }</p>
			  			</td>
			  		</tr>
			  	</c:if>
			  </tbody>
			</table>
		</section>
		<!-- //contents -->

	</div>
	<!-- //mypage area -->
</div>
