<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
<jsp:include page="/WEB-INF/views/include/header_sub2_style.jsp"/>

<script>
	function reloadDivArea() {
		$("#gallery").load(location.href+' #gallery');
	}
	
	/* function reloadGallery(categoryMainName) {
		$.ajax({
			type: "post",
			url:	"${ctp}/booking/reloadGallery",
			data: {categoryMainName:categoryMainName},
			success: function(vos) {
				let str = "";
				for(let i=0; i<vos.length; i++) {
			console.log(vos[i].fSName);
			console.log(vos[i].categorySubName);
			
					str += '<div class="content" style="margin:10px">'
					str += '<img src="${ctp}/data/dbShop/product/'+vos[i].fSName+'" width="100%" height="330px;">'
					str += '<div class="pCategoryBox">'
					str += '<div class="pMenuSubName">'+vos[i].categorySubName+'</div>'
					str += '<div class="pMenuDetail">'+vos[i].detail+'</div>'
					str += '</div>'
					str += '</div>'
				}
				$("#gallery").html(str);
			},
			error: function() {
				alert("전송오류");
			}
		});
	} */
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="subMain">
	<div class="subTitle">
		<h1>reservation</h1>
	</div>
</div>
<p><br/></p>
<!-- MAIN (Center website) -->
<div class="bookingMenuWrap">
	<form name="myform"> <!-- 입력시켜 데이터베이스에 보내는..  -->
		<!-- <h2>reservation</h2> -->
		<div class="main">
			<!-- <div id="myBtnContainer">
			  <button type="button" class="btn active" onclick="filterSelection('all')"> #전체</button>
			  <button type="button" class="btn" onclick="filterSelection('nature')"> #속눈썹</button>
			  <button type="button" class="btn" onclick="filterSelection('cars')"> #피부</button>
			  <button type="button" class="btn" onclick="filterSelection('people')"> #반영구</button>
			</div> -->
			<a href="${ctp}/booking/bookingMenu"><button class="btn btn-outline-dark mr-1" type="button">전체 </button></a>
		  <c:forEach var="mainTitle" items="${mainTitleVos}" varStatus="st">
		  	<a href="${ctp}/booking/bookingMenu?part=${mainTitle.categoryMainName}"><button class="btn btn-outline-dark mr-1" type="button">${mainTitle.categoryMainName}</button></a>
			  <c:if test="${!st.last}"> </c:if>
		  </c:forEach>
		  
			
			
			<!-- Portfolio Gallery Grid -->
				
		  <div class="gallery" id="gallery">
		    <c:forEach var="vo" items="${productVos}">
		    	<div class="content" style="margin:10px" onclick="location.href='${ctp}/booking/booking?idx=${vo.idx}&categorySubName=${vo.categorySubName}';">
			    	<c:set var="thumbnails" value="${fn:split(vo.FSName, '/')}" />
						<img src="${ctp}/data/dbShop/product/${thumbnails[0]}" width="100%" height="330px;">
						
			      <div class="pCategoryBox">
			      	<div class="pMenuSubName">${vo.categorySubName}</div>
			      	<div class="pMenuDetail">${vo.detail}</div> 
			      </div>
		    	</div>
		     </c:forEach>
		  </div><!-- gallery -->
				
			
		</div><!-- main -->
	</form>
</div><!-- loginWrap -->



</body>
</html>
