<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>adContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
  <jsp:include page="/WEB-INF/views/include/admin_style.jsp"></jsp:include>
  
  
</head>
<body>
	<div class="container-fluid m-0 p-0">
		<div class="headerWrap" style="background-color:#fff; height:60px; border-bottom: 1px solid #eee;">
			<div id="searchbar">
				<div>
					서치 바 
				</div>
			</div><!-- searchbar -->
		</div><!-- headerWrap -->
		
		<div class="container">
			<div class="adminTitle">
				<h3>고객리스트 </h3>
			</div>
			<div class="adminWrap">
				
				
			</div> 
		</div>		
	
			
		
		
	</div><!-- container-fluid -->
</body>
</html>