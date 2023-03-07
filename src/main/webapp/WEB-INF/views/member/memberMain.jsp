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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <jsp:include page="/WEB-INF/views/include/header_sub2_style.jsp"/>
  
  <script src="${ctp}/js/woo.js"></script>
  
  
  
  
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="subMain">
	<div class="subTitle">
		<h1>My account</h1>
	</div>
</div>
<p><br/></p>
<div class="myAccountWrap" style="max-width: 1200px;">
	<form name="myform" class="was-validated"> 
		<h2>my account</h2>
		<div class="row">
			<div class="col">			
				<span style="font-size:18px; color:#d8628f"><i class="fi fi-rr-laugh-wink"></i> ${sName}</span>님 반갑습니다
			</div>
			<div class="col">
				<div class="text-right mb-2">
					<a href=""><input type="button" class="btn btn-dark" value="내 정보 수정하기"/></a>
				</div>
			</div>
		</div>
		<div class="box-container">
			<div class="box-container-inner">
				<div class="level-circle">
	          <p class="p-0 m-0">현재등급</p>
	          <p style="font-size:20px;"><b>${strLevel}</b></p>       
	      </div> 
	      <div class="box-content"> 	
         	<div class="box-content1 vl">
         		<table class="table" style="margin-left :45px;">
         			<tr>
         				<td><span style="font-size:25px"><i class="fi fi-rr-piggy-bank"></i> 적립금 </span></td>
         				<td><hr style="border-style: dashed; width: 100px"/></td>
	      				<td><span style="font-size:25px">${vo.point}</span></td>
         			</tr>
         			<tr>
         				<td><span style="font-size:25px"><img src="${ctp}/resources/images2/coupon.png" style="width:30px;"/> 쿠폰</span></td>
         				<td><hr style="border-style: dashed; width: 100px"/></td>
	      				<td><span style="font-size:25px">0</span></td>
         			</tr>
         		</table>  	
         	</div>
	      </div><!-- box-content -->
	    </div><!-- box-container-inner -->
  	</div><!-- box-container -->
  	
  	
	  	<div class="box-container">
	  		<div class="box-container-inner2">
		  		<h4><img src="${ctp}/resources/images2/party.png" style="width:25px;"/> &nbsp;지금 나의 예약</h4>
		  		<table class="table table-hover mt-2">
		  			<thead class="thead-dark">
			  			<tr>
			  				<th class="text-center">예약번호</th>
			  				<th class="text-center">상품명</th>
			  				<th class="text-center">예약날짜</th>
			  				<!-- <th class="text-center">주문날짜</th>  -->
			  				<th class="text-center">상태</th>
			  			</tr>
		  			</thead>
		  			
		  			<tbody class="text-center">
		  			<c:forEach var="bookingVo" items="${bookingVos}" varStatus="st" >
			  			<c:if test="${bookingVo.bookingStatus == 1 || bookingVo.bookingStatus == 2}">
			  				<tr>
			  					<td>${bookingVo.BNumber}</td>
			  					<td>${bookingVo.categorySubName}</td>
			  					<td>${fn:substring(bookingVo.bookingStartDate,0,11)}/${fn:substring(bookingVo.bookingStartDate,11,13)}시</td>
			  					<td>
										<c:if test="${bookingVo.bookingStatus == 1}"><span class="badge badge-pill badge-info">예약신청</span></c:if>
										<c:if test="${bookingVo.bookingStatus == 2}"><span class="badge badge-pill badge-success">예약완료</span></c:if>
									</td>
			  				</tr>
			  			</c:if>
			  			<%-- <c:if test="${bookingVo.bookingStatus == 3 || bookingVo.bookingStatus == 4 || bookingVo.bookingStatus == 5}">
				  			<tr>
				  				<td colspan="4" class="text-center">시술기록이 없습니다 </td>
				  			</tr>
			  			</c:if> --%>
			  			
		  			</c:forEach>
		  			</tbody>
		  			
	  			</table>
	  		</div>
	  	</div>
  
  	
  	
  	<div class="box-container">
  		<div class="box-container-inner2">
	  		<h4><img src="${ctp}/resources/images2/calendar.png" style="width:25px; margin-top: -7px;"/> &nbsp;나의 시술 기록</h4>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th class="text-center" width="30%">예약번호</th>
							<th class="text-center">상품명</th>
							<th class="text-center">예약날짜</th>
							<th class="text-center">상태</th>
						</tr>
					</thead>
					<tbody class="text-center">
							<c:forEach var="bookingVo" items="${bookingVos}" varStatus="st" >
								<c:if test="${bookingVo.bookingStatus == 3 || bookingVo.bookingStatus == 4 || bookingVo.bookingStatus == 5}">
									<tr>
										<td>${bookingVo.BNumber}</td>
										<td>${bookingVo.categorySubName}</td>
										<td>${fn:substring(bookingVo.bookingStartDate,0,11)}/${fn:substring(bookingVo.bookingStartDate,11,13)}시</td>
										<td>
										<c:if test="${bookingVo.bookingStatus == 3}"><span class="badge badge-pill badge-primary">시술완료</span></c:if>
										<c:if test="${bookingVo.bookingStatus == 4}"><span class="badge badge-pill badge-danger">취소</span></c:if>
										<c:if test="${bookingVo.bookingStatus == 5}"><span class="badge badge-pill badge-danger">노쇼</span></c:if>
										</td>
									</tr>
								</c:if>
								<%-- <c:if test="${bookingVo.bookingStatus == 1 || bookingVo.bookingStatus == 2}">
					  			<tr>
					  				<td colspan="4" class="text-center">시술기록이 없습니다 </td>
					  			</tr>
				  			</c:if> --%>
			  		 </c:forEach>
					</tbody>
				</table>	
				  		
	  		<h4><img src="${ctp}/resources/images2/messeage.png" style="width:28px; margin-top: -7px;"/> &nbsp;나의 1:1문의</h4>
	  		<table class="table">
	  			<thead class="thead-dark">
		  			<tr>
		  				<th class="text-center">날짜</th>
		  				<th class="text-center" width="50%">제목 </th>
		  				<th class="text-center">상태</th>
		  			</tr>
	  			</thead>
	  			<tr>
	  				<td class="text-center">2022-12-21</td>
	  				<td class="text-center" width="50%">시간을 변경하고 싶습니다</td>
	  				<td class="text-center">답변대기 </td>
	  			</tr>
	  		</table>
	  	</div><!-- box-container-inner2 -->
  	</div>
  </form>
</div><!-- myAccountWrap -->
<p><br/></p>
</body>
</html>