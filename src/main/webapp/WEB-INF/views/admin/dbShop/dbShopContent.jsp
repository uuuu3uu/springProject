<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbCategory.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
  
  
  <jsp:include page="/WEB-INF/views/include/admin_style.jsp"></jsp:include>

  
  <script>
  
  	'use strict';
    $(document).ready(function() {
    	var bigPic = document.querySelector("#bigThumb");
			var smallThumb = document.querySelectorAll(".smallThumb");
			
			for(var i = 0; i<smallThumb.length; i++) {
				smallThumb[i].addEventListener("click", changePic);
			}
			function changePic() {
				var smallPicAttribute = this.getAttribute("src");
				bigPic.setAttribute("src", smallPicAttribute);
			}			
		});

  </script>
</head>
<body>
	<div class="container-fluid m-0 p-0">
		<div class="searchBar row">
			<a href="javascript:history.back()">
				<img src="${ctp}/images2/back.png" style="width: 32px;"/>
	    </a> 
	    <div class="col text-right">
	    	<div class="mt-1"><img src="${ctp}/images2/profile.png" style="width: 32px;"/></div>
	    </div>
		    
		  </div><!-- searchBar -->
		  <div class="adminContentWrap">
			  <div class="adminTitle">
					<h3>상품정보</h3>
				</div>
				<div class="adminProductContentWrap">
					<div class="row">
						<div class="col">
						<c:set var="thumbnails" value="${fn:split(productVo.FSName, '/')}" />
							<div>
								<img alt="상품사진" id="bigThumb" src="${ctp}/data/dbShop/product/${thumbnails[0]}" style="width:400px; height:400px; border: 1px solid #eee;">
							</div>
							<div class="smallThumbLine">
								<c:forEach var="a" begin="0" end="${fn:length(thumbnails)-1}" step="1">
									<img class="w3-hover-opacity smallThumb" src="${ctp}/data/dbShop/product/${thumbnails[a]}" style="width: 50px; height: 50px; border: 1px solid #eee">
								</c:forEach>
							</div>
						</div>
						<%-- <div class="col p-3 text-center" style="border:1px solid #ccc">
						  <!-- 상품메인 이미지 -->
						  <div>
						    <img src="${ctp}/dbShop/product/${productVo.FSName}" width="200px"/>
						  </div>
						</div> --%>
						<div class="col p-3 text-right">
						  <!-- 상품 기본정보 -->
						  <div id="iteminfor">
						  	<h3>${productVo.categorySubName}</h3>
						    <p>${productVo.detail}</p>
						    <h3><font color="orange"><fmt:formatNumber value="${productVo.mainPrice}"/>원</font></h3>
						    
						  </div>
						  <!-- 상품주문을 위한 옵션정보 출력 -->
						  <div class="form-group">
						    <form name="optionForm">  <!-- 옵션의 정보를 보여주기위한 form -->
						      <select size="1" class="form-control" id="selectOption">
						        <option value="" disabled selected>상품옵션선택</option>
						        <option value="0:기본품목_${productVo.mainPrice}">기본품목</option>
						        <c:forEach var="vo" items="${optionVos}">
						          <option value="${vo.idx}:${vo.optionName}_${vo.optionPrice}">${vo.optionName}</option>
						        </c:forEach>
						      </select>
						    </form>
						  </div>
						  <br/>
						  <div class="text-right p-2">
						    <input type="button" value="수정하기" onclick="location.href='${ctp}/dbShop/dbProductUpdate?idx=${productVo.idx}';" class="btn btn-info"/>
						    <input type="button" value="돌아가기" onclick="location.href='${ctp}/dbShop/dbShopList';" class="btn btn-secondary"/>
						  </div>
						</div>
					</div>

					<%-- <!-- 상품 상세설명 보여주기 -->
				 	<div id="content" class="text-center"><br/>
				  	${productVo.content}
				  </div>
					 --%>
					
				</div><!-- adminWarp2 -->
		  
		  
		</div><!-- adminWarp -->
	</div><!-- container-fluid -->
	
</body>
</html>