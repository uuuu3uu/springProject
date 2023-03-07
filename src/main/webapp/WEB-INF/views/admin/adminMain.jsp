<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
  <title>admin.jsp</title>
  <frameset cols="230px, *">
	  <frame src="${ctp}/admin/adminLeft" name="adminLeft" frameborder="0"/>
	  <frame src="${ctp}/admin/adminContent" name="adminContent" frameborder="0" style="border-left: 1px solid #eee;"/>
	</frameset>
</head>
<body>

</body>
</html>