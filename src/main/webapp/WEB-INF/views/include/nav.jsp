<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div class="container-fluid">
	<div class="headerWrap">
		<div class="header-top">
			<div class="row">
			<span class="col"></span>
			<span class="col" style="font-size:14px; text-align: center;">Scroll Up and Down this page to see the parallax scrolling effect?</span>
			<c:if test="${!empty sLevel}">
				<span class="col text-right"><font color="#c27aa9"><i class="fi fi-rr-laugh-wink"></i> ${sName}</font>님 환영합니다! &nbsp;&nbsp;</span>
			</c:if>
			<c:if test="${empty sLevel}">
				<span class="col text-right"> </span>
			</c:if>
			</div>
		</div><!-- header-top -->
		<div id="navbar" class="row">
			<div class="col">
			  <a href="${ctp}/">Home</a>
			  <a href="${ctp}/notice/noticeList">Notice</a>
			  <a href="#news">About</a>
			  <a href="#news">Service</a>
			  <a href="${ctp}/contactUs/contactUs">Contact-us</a>
			</div>
			<div class="col">
			  <div><a href="${ctp}/"><img src="${ctp}/images/logo3.png" style="width:200px;"/></a></div>
			</div>
			<div class="ml-auto" style="margin-right: 20px">
					<c:if test="${sLevel == 1 || sLevel == 2 || sLevel == 3}">
						<a href="${ctp}/member/memberMain">My Account</a>	
					</c:if>
					<c:if test="${sLevel == 4}">
						<a href="${ctp}/admin/adminMain" >관리자페이지</a>
					</c:if>
					<c:if test="${!empty sLevel}">
						<a href="${ctp}/booking/bookingMenu">BOOK NOW</a>
					</c:if>
					<c:if test="${empty sLevel}">
						<a href="${ctp}/member/memberLogin">BOOK NOW</a>
					</c:if>
					<c:if test="${empty sLevel}">
						<a href="${ctp}/member/memberLogin">로그인</a>
  						<a href="${ctp}/member/memberJoin">회원가입</a>
						</c:if>
					<c:if test="${!empty sLevel}">						
					  <a href="${ctp}/member/memberLogout">로그아웃</a>
					</c:if>
			</div>
		</div><!-- navbar -->
	</div><!-- headerWrap -->
<!-- 	<div class="subMain">
		<div class="subTitle">
			<h1>My account</h1>
		</div>
	</div> -->
		
</div><!-- container-fluid -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
