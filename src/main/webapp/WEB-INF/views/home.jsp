<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>	
	
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/include/main_style.jsp"/>
	

</head>
<body>
	<div class="container-fluid">
		<div class="headerWrap">
			<div class="header-top">
				<div class="row">
				<span class="col"> </span>
				<span class="col" style="font-size:14px; text-align: center;">Scroll Up and Down this page to see the parallax scrolling effect?</span>
				<c:if test="${!empty sLevel}">
					<span class="col text-right"><font color="#c27aa9"><i class="fi fi-rr-smile-wink"></i> ${sName}</font>님 환영합니다! &nbsp;&nbsp;</span>
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
				  <div><a href="#"><img src="images/logo3.png" style="width:200px;"/></a></div>
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
		<!-- 카로셀 -->
			<div id="demo" class="carousel slide" data-ride="carousel">
				<ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			    <li data-target="#demo" data-slide-to="2"></li>
		  	</ul>
		  	<div class="carousel-inner">
		  		<div class="carousel-item active">
		      	<img src="images/main09.jpg" alt="main1" width="100%">
		    	</div>
		    	<div class="carousel-item">
		      	<img src="images/main11.jpg" alt="main2" width="100%">
		    	</div>
		  	</div><!-- carousel-inner -->
		  	<a class="carousel-control-prev" href="#demo" data-slide="prev">
		    	<span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			</div><!-- carousel slide -->

		<!-- 카로셀 끝 -->
		
		<!-- 상담하기 -->
		<div class="Counseling">
			<form name="CounselingForm">
				<div class="form-row">
					<div class="col">
			      <input type="text" class="form-control" id="name" placeholder="이름" name="name"/>
			    </div>
			    <div class="col">
			      <input type="text" class="form-control" placeholder="전화번호" name="phone"/>
			    </div>
			    <div class="col">
						<input type="text" class="form-control" placeholder="이메일" name="email"/>
			    </div>
			    <div class="col">
			      <input type="button" class="form-control btn" style="border: 1px solid rgba(54,54,54,7);" name="Counseling" value="상담하기"/>
			    </div>
				</div>
				<p>*or give us a call <a href="tel:8882653556">(888) 265-3556</a></p>
			</form><!-- CounselingForm -->
		</div><!-- Counseling -->
		<!-- 상담하기 끝 -->
		
		
		<%-- 
		<div class="about">
			
		</div><!-- about -->
		<div class="container contactUs text-center" style="margin-top:200px; margin-bottom: 100px;">
			<h2 class="mb-2">Contact-us</h2>
			<div id="map" style="width:1200px;height:400px;">
				<jsp:include page="/WEB-INF/views/include/map.jsp"/>
			</div>
		</div> --%>
	
		
		
	</div><!-- container-fluid -->
</body>
</html>
