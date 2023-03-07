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

<p><br/></p>
<div class="container" style="max-width: 1400px; margin:40px;">
  <div class="container-fluid">   
    <div class="menuBoxWrap row">
      <div class="menuBox col">
				<table>
					<tr>
				    <th><img src="${ctp}/images2/rating.png"/></th>
				    <td>
				    	<div>오늘의 예약</div>
				    	<div style="font-size: 30px; margin-top: -8px;">25건</div>
				    </td>
				  </tr>
				</table>
			</div>
      <div class="menuBox col">
				<table>
				  <tr>
				    <th><img src="${ctp}/images2/motivated.png"/></th>
				    <td>
				    	<div>새로운 회원</div>
				    	<div style="font-size: 30px; margin-top: -8px;">25건</div>
				    </td>
				  </tr>
				</table>
			</div>
			<div class="menuBox col">
				<table>
				  <tr>
				    <th><img src="${ctp}/images2/answer.png"/></th>
				    <td>
				    	<div>상담예약</div>
				    	<div style="font-size: 30px; margin-top: -8px;">25건</div>
				    </td>
				  </tr>
				</table>
			</div>
			<div class="menuBox col">
				<table>
				  <tr>
				    <th><img src="${ctp}/images2/presentation.png"/></th>
				    <td>
				    	<div>매출</div>
				    	<div style="font-size: 30px; margin-top: -8px;">25건</div>
				    </td>
				  </tr>
				</table>
			</div>
    </div>
  </div>
</div>
	

<p><br/></p>

</body>
</html>