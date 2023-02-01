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
	
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/include/main_style.jsp"/>
	

</head>
<body>
	<div class="container-fluid">
		<div class="headerWrap">
			<div class="header-top">
				<p>Scroll Up and Down this page to see the parallax scrolling effect?.</p>
			</div><!-- header-top -->
			<div id="navbar" class="row">
				<div class="col-sm-4">
				  <a href="${ctp}/main.jsp">Home</a>
				  <a href="${ctp}/gongList.gong">Notice</a>
				  <a href="#news">About</a>
				  <a href="#news">Service</a>
				  <a href="#contact">Contact-us</a>
				</div>
				<div class="col-sm-4">
				  <div style="width: 200px; margin: -5px auto;"><a href="#"><img src="images/logo.png" style="width:200px;"/></a></div>
				</div>
				<div class="col-sm-4" style="justify-content: flex-end; display: flex">
						<c:if test="${sLevel == 1 || sLevel == 2 || sLevel == 3}">
							<a href="${ctp}/memMyAccount.mem" style="margin:25px 0px 0px 0px;" ><i style="font-size:24px; color:orange" class="fa">&#xf2bd;</i></a>
							<span style="margin:25px 15px 0 10px;"><font color="orange"><b>${sName}</b></font>님 환영합니다!</span>
						</c:if>
						<c:if test="${sLevel == 4}">
							<a href="${ctp}/adMain.ad" style="margin:25px 0px 0px 0px;" ><i style="font-size:24px; color:orange" class="fa">&#xf2bd;</i></a>
							<span style="margin:25px 15px 0 10px;"><font color="orange"><b>${sName}</b></font>님 환영합니다!</span>
						</c:if>
						<c:if test="${!empty sLevel}">
							<a href="${ctp}/bookCheck.book" style="margin-bottom:24px; border-bottom: 1px solid #000;">BOOK NOW</a>
						</c:if>
						<c:if test="${empty sLevel}">
							<a href="${ctp}/member/memberLogin" style="margin-bottom:24px; border-bottom: 1px solid #000;">BOOK NOW</a>
						</c:if>
						<c:if test="${empty sLevel}">
							<a href="${ctp}/member/memberLogin">로그인</a>
	  						<a href="${ctp}/member/memberJoin" style="margin-right: 20px">회원가입</a>
							</c:if>
						<c:if test="${!empty sLevel}">						
						  <a href="${ctp}/member/memberLogout">로그아웃</a>
						</c:if>
				</div>
			</div><!-- navbar -->
		</div><!-- headerWrap -->
		
		<!-- 카로셀 -->
		<div class="main">
			<div id="demo" class="carousel slide" data-ride="carousel">
				<ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			    <li data-target="#demo" data-slide-to="2"></li>
		  	</ul>
		  	<div class="carousel-inner">
		  		<div class="carousel-item active">
		      	<img src="images/main1.jpg" alt="Los Angeles" width="1100" height="500">
		    	</div>
		    	<div class="carousel-item">
		      	<img src="images/main4.jpg" alt="Chicago" width="1100" height="500">
		    	</div>
		    	<div class="carousel-item">
		      	<img src="images/main3.jpg" alt="New York" width="1100" height="500">
				      <!-- <div class="carousel-caption">
				        <h3>New York</h3>
				        <p>We love the Big Apple!</p>
				      </div>   --> 
		   		</div>
		  	</div><!-- carousel-inner -->
		  	<a class="carousel-control-prev" href="#demo" data-slide="prev">
		    	<span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			</div><!-- carousel slide -->
		</div><!-- main -->
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
		
		<!-- service -->
		<div class="service">
			<!-- <p>Another you</p> -->
			<h2>service</h2>
			<div class="container">
	    	<div class="row text-center service">
	        <div class="col-lg-3">
	        	<div class="card plan-card">
	          	<div class="card-block">
	            	<div class="pt-3 pb-3">
	              	<h1><i class="fa fa-plane plan-icon"></i></h1>
	               	<h6 class="text-uppercase text-primary">Starter Pack</h6>
	              </div><!-- pt-3 pb-3 -->
	              <div>
	              	<h1 class="plan-price padding-b-15">$19<span class="text-muted m-l-10"><sup>Per Month</sup></span></h1>
	                <div class="plan-div-border"></div>
	              </div>
	              <div class="plan-features pb-3 mt-3 text-muted padding-t-b-30">
		              <p>Free Live Support</p>
		              <p>Unlimited User</p>
		              <p>No Time Tracking</p>
		              <p>Free Setup</p>
		              <a href="#" class="btn btn-primary">Sign Up Now</a>
	              </div>
	            </div><!-- card-block -->
	          </div><!-- card plan-card -->
	        </div><!-- col-lg-3 -->
	        <div class="col-lg-3">
	        	<div class="card plan-card">
	          	<div class="card-block">
	            	<div class="pt-3 pb-3">
	              	<h1><i class="fa fa-plane plan-icon"></i></h1>
	               	<h6 class="text-uppercase text-primary">Starter Pack</h6>
	              </div><!-- pt-3 pb-3 -->
	              <div>
	              	<h1 class="plan-price padding-b-15">$19<span class="text-muted m-l-10"><sup>Per Month</sup></span></h1>
	                <div class="plan-div-border"></div>
	              </div>
	              <div class="plan-features pb-3 mt-3 text-muted padding-t-b-30">
		              <p>Free Live Support</p>
		              <p>Unlimited User</p>
		              <p>No Time Tracking</p>
		              <p>Free Setup</p>
		              <a href="#" class="btn btn-primary">Sign Up Now</a>
	              </div>
	            </div><!-- card-block -->
	          </div><!-- card plan-card -->
	        </div><!-- col-lg-3 -->
	        <div class="col-lg-3">
	        	<div class="card plan-card">
	          	<div class="card-block">
	            	<div class="pt-3 pb-3">
	              	<h1><i class="fa fa-plane plan-icon"></i></h1>
	               	<h6 class="text-uppercase text-primary">Starter Pack</h6>
	              </div><!-- pt-3 pb-3 -->
	              <div>
	              	<h1 class="plan-price padding-b-15">$19<span class="text-muted m-l-10"><sup>Per Month</sup></span></h1>
	                <div class="plan-div-border"></div>
	              </div>
	              <div class="plan-features pb-3 mt-3 text-muted padding-t-b-30">
		              <p>Free Live Support</p>
		              <p>Unlimited User</p>
		              <p>No Time Tracking</p>
		              <p>Free Setup</p>
		              <a href="#" class="btn btn-primary">Sign Up Now</a>
	              </div>
	            </div><!-- card-block -->
	          </div><!-- card plan-card -->
	        </div><!-- col-lg-3 -->
	        <div class="col-lg-3">
	        	<div class="card plan-card">
	          	<div class="card-block">
	            	<div class="pt-3 pb-3">
	              	<h1><i class="fa fa-plane plan-icon"></i></h1>
	               	<h6 class="text-uppercase text-primary">Starter Pack</h6>
	              </div><!-- pt-3 pb-3 -->
	              <div>
	              	<h1 class="plan-price padding-b-15">$19<span class="text-muted m-l-10"><sup>Per Month</sup></span></h1>
	                <div class="plan-div-border"></div>
	              </div>
	              <div class="plan-features pb-3 mt-3 text-muted padding-t-b-30">
		              <p>Free Live Support</p>
		              <p>Unlimited User</p>
		              <p>No Time Tracking</p>
		              <p>Free Setup</p>
		              <a href="#" class="btn btn-primary">Sign Up Now</a>
	              </div>
	            </div><!-- card-block -->
	          </div><!-- card plan-card -->
	        </div><!-- col-lg-3 -->  
		    </div><!-- row text-center -->
		  </div><!-- container -->
		</div><!-- service -->
		<!-- service 끝 -->
		
		<div class="about">
			
		</div><!-- about -->
		
		<div class="container contactUs text-center" style="margin-top:200px; margin-bottom: 100px;">
			<h2 class="mb-2">Contact-us</h2>
			<div id="map" style="width:1200px;height:400px;">
				<jsp:include page="/WEB-INF/views/include/map.jsp"/>
			</div>
		</div>
	
		
		
	</div><!-- container-fluid -->
</body>
</html>
