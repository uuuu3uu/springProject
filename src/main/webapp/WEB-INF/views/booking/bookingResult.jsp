<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>title</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
<jsp:include page="/WEB-INF/views/include/header_sub2_style.jsp"/>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
  	
  	
  </script>
  
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>

<div class="subMain">
	<div class="subTitle">
		<h1>Reservation</h1>
	</div>
</div>

<div class="bookCheckFinishWrap">
	
	<form name="myform" method="post" action="${ctp}/bookCheckFinish.book" class="was-validated"> <!-- 입력시켜 데이터베이스에 보내는..  -->
	  <h2>Reservation</h2>
		
		<div class="box-container" style="height: 400px; margin-bottom:20px;">
  		<div class="box-container-inner2">
	  		<div class="col" style="margin-bottom: 50px;">
					<span><img src="${ctp}/resources/images2/success.png" width="30px"/><b> ${sName}</b>님 예약이 <ins>성공적</ins>으로 이루어졌습니다</span>
				</div>
			
	  		<table class="table table-hover">
	  			<thead>
		  			<tr>
		  				<th class="text-center">예약번호</th>
		  				<th class="text-center">상품명</th>
		  				<th class="text-center">예약날짜</th>
		  				<th class="text-center">상태</th>
		  			</tr>
	  			</thead>
	  			<tbody>
			  			<tr class="table-warning text-center">
			  				
			  				<td>${sName}</td>
			  				<td>${bookingVo.categorySubName}</td>
			  				<td>${fn:substring(bookingVo.bookingStartDate,0,11)}/${fn:substring(bookingVo.bookingStartDate,11,13)}시</td>
			  				<td> 
			  					<span class="badge badge-pill badge-info p-2">예약신청</span>
			  				</td>
			  				
			  			</tr>	
	  			</tbody>
	  		</table>
	  	</div><!-- box-container-inner2 -->
  	</div>
  	<div class="text-right">
  		<input type="button" value="돌아가기" onclick="location.href='${ctp}/';" class="btn btn-outline-secondary m-0"/>&nbsp;
  		<input type="button" value="나의 예약확인하기" onclick="location.href='${ctp}/member/memberMain';" class="btn btn-dark"/>&nbsp;
		</div>
	</form>
		
	</div><!-- bookCheckWrap -->
</body>
</html>
      