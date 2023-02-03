<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>memberLogin</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
  <jsp:include page="/WEB-INF/views/include/header_sub1_style.jsp"/>
  
  <script src="${ctp}/js/woo.js"></script>
  <script>
    'use strict';
 		// 게시글 삭제처리
  	function gongDelCheck() {
    	let ans = confirm("현 게시글을 삭제하시겠습니까?");
    	if(ans) location.href = "${ctp}/gongDeleteOk.gong?idx=${vo.idx}";
    	
    }

 	</script>
</head>
<body>


<header>
  <jsp:include page="/WEB-INF/views/include/nav.jsp"/>
  <div class="sub_img">
  	<img src="images/sub6.jpg" alt="sub_img">
  </div>
</header>

<section>
	<div class="section2" style="padding-left: 200px; padding-right: 200px;">
  	
	<jsp:include page="/WEB-INF/views/include/subNav.jsp"/>
  
  <article>
   	<p><br/></p>
		<div class="gongContentWrap">
   		<form name="myform" method="post" action="${ctp}/gongUpdateOk.gong">
			
				<h2>Notice</h2>
				<table class="table" style="border-top:none; width:65%">
					<tr>
						<th><p style="font-size:17px;">${vo.title}</p></th>
						<td>${vo.name}</td>
						
					</tr>
					
					<tr>
						<td colspan="2" class="m-3">
							<p style="font-size:14px" class="text-right">${fn:substring(vo.wDate,0,10)}</p>
							<c:if test="${vo.fName != 'null'}">
							  <c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
							  <c:forEach var="fName" items="${fNames}">
					  			<img src="${ctp}/data/gong/${fName}" width="550px"/>
					  		</c:forEach>
				  		</c:if>
				  		<br/>
				  		<br/>
					  	<p class="mb-5">${vo.content}</p>
						</td>		
										
					</tr>
					<tr>
						<td colspan="2" class="text-right">
						<c:if test="${sLevel == 4}">
							<input type="button" value="삭제하기" onclick="gongDelCheck()" class="btn btn-outline-secondary"/>&nbsp;
							<input type="button" value="수정하기" onclick="location.href='${ctp}/gongUpdate.gong?idx=${vo.idx}';" class="btn btn-outline-secondary"/>&nbsp;
						</c:if>
						<input type="button" value="돌아가기" onclick="location.href='${ctp}/gongList.gong';" class="btn btn-outline-secondary"/>&nbsp;
						</td>
					</tr>
				</table>
			</form>
		   
		</div><!-- container -->
		<p><br/></p>	
  </article>
  </div>
</section>


</body>
</html>