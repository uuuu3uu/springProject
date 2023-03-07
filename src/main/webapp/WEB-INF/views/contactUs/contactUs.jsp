<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>memberLogin</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
  <jsp:include page="/WEB-INF/views/include/header_sub2_style.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="subMain">
	<div class="subTitle">
		<h1>Contact-us</h1>
	</div>
</div>
<p><br/></p>
<div class="loginWrap">
	
	<h2>오시는 길</h2>
	<div class="container contactUs text-center" style="margin-bottom: 50px;">
		<div id="map" style="width:900px;height:500px;">
			<jsp:include page="/WEB-INF/views/include/map.jsp"/>
		</div>
	</div>
	<table class="table" style="width:900px;">
		<tr>
			<th class="text-center">주소</th>
			<td>충북 청주시 서원구 oooo oooo</td>
		</tr>
		<tr>
			<th class="text-center">오시는 길</th>
			<td>사창시장입구쪽으로들어와서 우회전</td>
		</tr>
		<tr>
			<th class="text-center">주차</th>
			<td>예약 시 안내 드립니다</td>
		</tr>
		<tr>
			<th class="text-center">번호</th>
			<td>0507-0000-0055</td>
		</tr>
	</table>
</div><!-- loginWrap -->
<p><br/></p>
</body>
</html>