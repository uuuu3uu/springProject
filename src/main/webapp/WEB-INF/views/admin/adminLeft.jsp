<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminLeft.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  
  <!-- 픽토그램 -->
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
  <style>
    body {
    	font-size: 0.9em;
    	background-color: #fff;
     	
    }
    
   .navbar span {
   		margin: 12px;
   }
   
   .pIcons {
   		padding-left: 19px;
   }
   .pIcons span {
   		margin: 13px;
   }
   
   .acoSubMenu {
   		margin-left: 30px;
   }

  </style>
  <script>
    function logoutCheck() {
    	parent.location.href = "${ctp}/member/memberLogout";
    }
  </script>
</head>
<body>
<br/>
<div class="container">
  <div style="width: 200px; margin: -5px auto;"><a href="${ctp}/" target="_parent"><img src="${ctp}/images/logo.png" style="width:200px;"/></a></div>
  <hr/>
  
  
	<div class="navbar">
	  <a class="active" href="#"><i class="fi fi-rr-home"></i> <span>Home</span></a>	  	  
	  <a class="active" href="${ctp}/admin/booking/bookingCalendar" target="adminContent"><i class="fi fi-rr-calendar-clock"></i> <span>예약 캘린더</span></a>	  	
	</div>
	
	
	
  
  <div class="panel-group" id="accordion">
    <div class="panel panel-default mb-1">
      <div class="panel-heading pt-1 pb-1">
        <div class="panel-title pIcons">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
  					<i class="fi fi-sr-users"></i><span>회원관리</span>
  				</a>
        </div>
      </div>
      <div id="collapse1" class="panel-collapse collapse acoSubMenu">
        <div class="panel-body pt-2"><a href="${ctp}/admin/booking/adminBookingList" target="adminContent">예약리스트</a></div>
        <div class="panel-body pt-2"><a href="${ctp}/" target="adminContent">상담리스트</a></div>
        <div class="panel-body pt-2"><a href="${ctp}/admin/member/adminMemberList" target="adminContent">회원리스트</a></div>
        <div class="panel-body pt-2"><a href="${ctp}/admin/member/adminMemberBlackList" target="adminContent">블랙리스트</a></div>
      </div>
    </div>
    <div class="panel panel-default mb-1">
      <div class="panel-heading pt-1 pb-1">
        <div class="panel-title pIcons">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
          	<i class="fi fi-rs-box-open"></i><span>상품관리</span>
          </a>
        </div>
      </div>
      <div id="collapse2" class="panel-collapse collapse acoSubMenu">
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/dbShop/dbShopList" target="adminContent">상품등록조회</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/dbShop/dbCategory" target="adminContent">상품분류관리</a></div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading pt-1 pb-1">
        <div class="panel-title pIcons">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
          	<i class="fi fi-rr-calendar-lines-pen"></i><span>기타관리</span>
          </a>
        </div>
      </div>
      <div id="collapse3" class="panel-collapse collapse acoSubMenu">
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">공지사항관리</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">사이트분석</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/admin/file/fileList" target="adminContent">임시파일관리</a></div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading pt-1 pb-1">
        <div class="panel-title pIcons">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
          	<i class="fi fi-sr-chart-histogram"></i><span>매출관리</span>
          </a>
        </div>
      </div>
      <div id="collapse4" class="panel-collapse collapse acoSubMenu">
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">오늘 매출</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/admin/file/fileList" target="adminContent">매출관리</a></div>
      </div>
    </div>
  </div>
  <hr/>
  <div class="bg-danger mb-1"><a href="javascript:logoutCheck()" class="btn btn-danger btn-sm">로그아웃</a></div>
  <div class="bg-success"><a href="${ctp}/" target="_top" class="btn btn-success btn-sm"> 홈 으 로 </a></div>
  <hr/>
  <h5><a href="${ctp}/admin/adminContent" target="adminContent" class="btn btn-primary btn-sm">관리자메뉴</a></h5>
  <hr/>
</div>
</body>
</html>