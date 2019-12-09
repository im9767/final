<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="nav flex-column" style="float: left;width:10%;padding: 10px;">

  <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">회원</a>
  <a href="${cp }/members/infoupdate" class="nav-link">회원정보변경</a>
  <a class="nav-link" href="${cp }/members/couponList">쿠폰 목록</a>
  <a class="nav-link" href="#">찜 목록</a>
  <a class="nav-link" href="#">예약 내역</a>
  <a class="nav-link" href="#">결제 내역</a>
  
  <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">문의</a>
  <a class="nav-link" href="${cp }/members/qna">Q&A문의</a>
  <a class="nav-link active" href="${cp }/members/qnalist">문의 내역</a>
  
  <a class="nav-link" href="#">Link</a>
  <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
</nav>