<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.kindness{
		font-size: 1.5em;
		color:orange;
	}
	.clean{
		font-size: 1.5em;
		color:orange;
	}
	.convenience{
		font-size: 1.5em;
		color:orange;
	}
</style>

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
				<h3 class="tit">리뷰 작성</h3>
			</header>
			<br>
			
			<div class="row row-cols-1 row-cols-md-2">
			  <div class="col mb-4">
			    <div class="card">
			      <img src="${cp }/upload/${house_save_name}" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">${company }</h5>
			        <p class="card-text">${roomname }</p>
			      </div>
			    </div>
			  </div>
			 </div>
			
			<form action="${cp }/members/reviewWrite" method="post" enctype="multipart/form-data" style="margin-left:10px;">
			  <!-- 리뷰 제목 -->
			  <div class="form-group">
			    <label for="exampleInputEmail1">제목</label>
			    <input type="text" class="form-control col-8" id="review_title" name="review_title" style="text-align: left;">
			  </div>			  
			  <!-- 리뷰 내용 -->
			  <div class="form-group">
			    <label for="exampleInputEmail1">내용</label>
			  	<textarea class="form-control col-8" id="review_content" rows="8" name="review_content"></textarea>
			  </div>
			  <!-- 친절도 점수 -->
			  <div class="form-group">
			  	<input type="hidden" id="kindness" name="kindness">
			    <label for="exampleInputEmail1">친절도</label>
			    <span class="kindness" id="kindness-1">☆</span>
			    <span class="kindness" id="kindness-2">☆</span>
			    <span class="kindness" id="kindness-3">☆</span>
			    <span class="kindness" id="kindness-4">☆</span>
			    <span class="kindness" id="kindness-5">☆</span>
			  </div>
			  <!-- 청결도 점수 -->
			  <div class="form-group">
			  	<input type="hidden" id="clean" name="clean">
			    <label for="exampleInputEmail1">청결도</label>
			    <span class="clean" id="clean-1">☆</span>
			    <span class="clean" id="clean-2">☆</span>
			    <span class="clean" id="clean-3">☆</span>
			    <span class="clean" id="clean-4">☆</span>
			    <span class="clean" id="clean-5">☆</span>
			  </div>
			  <!-- 편의성 점수 -->
			  <div class="form-group">
			    <input type="hidden" id="convenience" name="convenience">
			    <label for="exampleInputEmail1">편의성</label>
			    <span class="convenience" id="convenience-1">☆</span>
			    <span class="convenience" id="convenience-2">☆</span>
			    <span class="convenience" id="convenience-3">☆</span>
			    <span class="convenience" id="convenience-4">☆</span>
			    <span class="convenience" id="convenience-5">☆</span>
			  </div>	
			  
			  <!-- 파일 업로드 -->
				<div class="form-group">
				    <label for="exampleFormControlFile1">이미지 업로드</label>
				    <input multiple="multiple" name="file1" type="file" class="form-control-file col-5" id="exampleFormControlFile1">
				</div>
				<input type="hidden" value="${room_num }" name="room_num">
				<div class="form-group">
					<button type="submit" class="btn btn-success">리뷰 등록</button>
			    </div>
				
			</form>
		</section>
		<!-- //contents -->

	</div>
	<!-- //mypage area -->
</div>
<script>
	$(function(){
		
		var kindness = 0;
		var clean = 0;
		var convenience = 0;
		
		$(".kindness, .clean, .convenience").hover(function(){
			
			var a = $(this).attr("id").split("-");
			
			if(a[0] == "kindness"){
				if(kindness > 0){
					return;	
				}				
			}else if(a[0] == "clean"){
				if(clean > 0){
					return;
				}		
			}else if(a[0] == "convenience"){
				if(convenience > 0){
					return;	
				}	
			}
			
			var bb = parseInt(a[1]);
			
			for(var i = bb; bb>= 1; bb--){
				$("#"+a[0]+"-"+bb).text("★");
			}
			
		},function(){

			var a = $(this).attr("id").split("-");
			
			if(a[0] == "kindness"){
				if(kindness > 0){
					return;	
				}				
			}else if(a[0] == "clean"){
				if(clean > 0){
					return;
				}		
			}else if(a[0] == "convenience"){
				if(convenience > 0){
					return;	
				}	
			}

			var bb = parseInt(a[1]);
			
			for(var i = bb; bb>= 1; bb--){
				
				$("#"+a[0]+"-"+bb).text("☆");
				
			}
			
		});
		
		$(".kindness, .clean, .convenience").click(function(){
			
			var a = $(this).attr("id").split("-");
			
			var bb = parseInt(a[1]);
			
			for(var i = 5; i > 0; i--){
				$("#"+a[0]+"-"+i).text("☆");
			}
			
			for(var i = bb; i>= 1; i--){
				
				$("#"+a[0]+"-"+i).text("★");
				
			}

			if(a[0] == "kindness"){
				
				kindness = bb;
				$("#kindness").val(kindness);
				alert($("#kindness").val());
				
			}else if(a[0] == "clean"){
				
				clean = bb;
				$("#clean").val(clean);
				alert($("#clean").val());
				
			}else if(a[0] == "convenience"){
				
				convenience = bb;
				$("#convenience").val(convenience);
				alert($("#convenience").val());
				
			}
			
			console.log(kindness);
			console.log(clean);
			console.log(convenience);
			
		});
		
	});
</script>
