<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp}/resources/admin/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function setCookie(name, value, expiredays){

	var todayDate = new Date();

	todayDate.setDate(todayDate.getDate() + expiredays);

	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"

	}

	function delcook(){

	setCookie("close","close",1);

	window.close();

	}

</script>

<video controls autoplay loop  playsinline muted style="width :100%; height: 390px;">
	<source src="${cp}/resources/media/cf.mp4" type="video/mp4" >
</video>
<br>
<input type="button" onclick="delcook()" name="close" value="오늘하루 보지않기" style="float:right;margin-top: 10px;">

