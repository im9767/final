<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>이미지 업로드</h1>
<form action="${cp}/house/image" method="post" enctype="multipart/form-data">
	파일첨부<br>
	<input type="file" name="file"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>