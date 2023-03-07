<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    function dbProductDelete(idx) {
    	let ans = confirm("상품을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url	 : "${ctp}/dbShop/dbProductDelete",
    		data : {idx : idx},
    		success:function() {
    			alert("상품이 정상적으로 삭제되었습니다");
    			location.reload();
    		},
    		error : function () {
					alert("전송오류");
				}
    	});
		}
    
  </script>
</head>
<body>
	<div class="container-fluid m-0 p-0">
		
		<div class="searchBar row">
			<form name="myform">
				<div class="input-group">
					<select name="" id="" class=" mr-2">
			      <option value="name">이름</option>
			      <option value="tel">전화번호</option>
			      <option value="mid">아이디</option>
			    </select>
		      <div class="input-group-prepend">  
		        <span class="input-group-text" style="background-color: #fff;">
		        	<i class="fi fi-rr-search"></i>
		        </span>
		      </div>
		      <input type="text" id="searchString" name="searchString" class="form-control mr-2" placeholder="검색어를 입력하세요" autofocus />
		      <input type="button" value="검색" onclick="SearchCheck();" class="btn btn-secondary"/>
		    </div><!-- input-group mb-3 -->
	    </form>
	    
	    <div class="col text-right">
	    	<div class="mt-1"><img src="${ctp}/images2/profile.png" style="width: 32px;"/></div>
	    </div>
		    
		  </div><!-- searchBar -->
		  <div class="adminWarp">
			  <div class="adminTitle row">
					<h3 class="col">시술 상품 리스트</h3>
					<div class="col text-right">
						<button type="button" class="btn btn-primary mt-1" onclick="location.href='${ctp}/dbShop/dbProduct';">
							<i class="fi fi-rr-edit"> 상품등록하러가기</i>
						</button>
						
					</div>
					
				</div>
				
				<div class="adminWrap2">
					<a href="${ctp}/dbShop/dbShopList"><button class="btn btn-outline-dark" type="button">전체 </button></a>
				  <c:forEach var="mainTitle" items="${mainTitleVos}" varStatus="st">
				  	<a href="${ctp}/dbShop/dbShopList?part=${mainTitle.categoryMainName}"><button class="btn btn-outline-dark" type="button">${mainTitle.categoryMainName}</button></a>
					  <c:if test="${!st.last}"> </c:if>
				  </c:forEach>
				  <hr/>
			
						<h4 class="col">상품 리스트 : <font color="brown"><b>${part}</b></font></h4>			
	
					
					<table class="table table-borderless table-hover text-center">
						<tr class="table-active">
							<th>번호</th>
							<th>고유번호</th>
							<th>상품사진</th>
							<th>시술명</th>
							<th>시간</th>
							<th>가격</th>
							<th>삭제</th>
						</tr>
					 	
					 	<c:forEach var="vo" items="${productVos}">
					 		<tr class="thumbnails" onclick="location.href='${ctp}/dbShop/dbShopContent?idx=${vo.idx}';" style="cursor: pointer;" >
					 			<td>${vo.idx}</td>
					 			<td>${vo.productCode}</td>
					 			<%-- <td>
					 				<a href="${ctp}/dbShop/dbShopContent?idx=${vo.idx}"><img src="${ctp}/dbShop/product/${vo.FSName}" width="120px" height="100px"/></a>
					 			</td> --%>
					 			<td>
					 				<c:set var="thumbnails" value="${fn:split(vo.FSName, '/')}" />
									<img src="${ctp}/data/dbShop/product/${thumbnails[0]}" style="width:120px; height:100px">
					 			</td>
					 			
					 			<td>${vo.categorySubName}</td>
					 			<td>${vo.useTime}</td>
					 			<td><fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>원</td>
					 			<td><button class="btn btn-sm btn-dark" onclick="dbProductDelete('${vo.idx}')">삭제</button></td>
					 		</tr>
						</c:forEach>
						<tr><td colspan="10" class="m-0 p-0"></td></tr>
					</table>		
				</div><!-- adminWarp2 -->
		  
		  
		</div><!-- adminWarp -->
	</div><!-- container-fluid -->
	
</body>
</html>