<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="min-height: 300px;width:100%;background-color: lightgray;margin-bottom: 20px;margin-top: 150px;">
	
	<!-- 마이페이지 프로필 이미지 -->
	<div style="height:300px;width:30%;padding: 30px;display: inline-block;text-align: center;">
		<img src="${cp }/resources/bootstrap_icons/icons/person.svg" width="200" height="200" title="Bootstrap">
	</div>
	<div style="display: inline-block;width:30%;height:150px;padding-top: 10px;">
		<strong class="name" style="font-size: 2.5em;">${map.MNAME }</strong>
		<c:choose>
			<c:when test="${map.LOGIN_TYPE == 3 }">
				<em class="account" style="background-color:lightgray;">
					<img style="width:30px;height: 30px;" src="${cp }/resources/kakao/kakaolink_btn_medium.png">
				</em>
			</c:when>
			<c:when test="${map.LOGIN_TYPE == 2 }">
				
				<em class="account" style="background-color:lightgray;">
					<img style="width:30px;height: 30px;" src="${cp }/resources/naver/네이버 아이디로 로그인_아이콘형_Green.PNG">
				</em>
			
			</c:when>
			<c:otherwise>
				<em class="account" style="background-color:lightgray;">
					${map.MID }님
				</em>
			</c:otherwise>
		</c:choose>
		<div class="level">등급 : ${map.GNAME }</div>
	
		<p class="txt">가입일 <span>:</span> ${map.MREGDATE }</p>
	</div>

</div>