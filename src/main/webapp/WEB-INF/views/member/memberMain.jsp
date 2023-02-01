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
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="subMain">
	<div class="subTitle">
		<h1>My account</h1>
	</div>
</div>
<p><br/></p>
<div class="myAccountWrap">
	<form name="myform" class="was-validated"> 
		<h2>my account</h2>
		<div class="row">
			<div class="col">			
				<p style="margin:20px 20px 10px 0"><i style="font-size:24px" class="fa">&#xf118;</i> &nbsp;<span style="color:orange; font-size:20px;"><b>${sName}</b> </span>님 반갑습니다</p>
			</div>
			<div class="col">
				<div class="text-right mt-3">
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
         				<td><i class="fa fa-money" style="font-size:36px"></i></td>
         				<td><span style="font-size:25px"> 적립금 </span></td>
         				<td><hr style="border-style: dashed; width: 100px"/></td>
	      				<td><span style="font-size:25px">${point}</span></td>
         			</tr>
         			<tr>
         				<td><i class="fa fa-ticket" style="font-size:36px"></i></td>
         				<td><span style="font-size:25px"> 쿠폰 </span></td>
         				<td><hr style="border-style: dashed; width: 100px"/></td>
	      				<td><span style="font-size:25px">0</span></td>
         			</tr>
         		</table>  	
         	</div>
	      </div><!-- box-content -->
	    </div><!-- box-container-inner -->
  	</div><!-- box-container -->
  	
  	<c:if test="${!empty fn:substring(bVo.bookingDate,1,11)}">
	  	<div class="box-container">
	  		<div class="box-container-inner2">
	  			
		  		<h4><i style="font-size:24px; color:red" class="fa">&#xf004;</i> &nbsp;지금 나의 예약</h4>
		  		<table class="table table-hover mt-2">
		  			<thead>
			  			<tr>
			  				<th class="text-center">예약자</th>
			  				<th class="text-center">상품명</th>
			  				<th class="text-center">예약날짜</th>
			  				<!-- <th class="text-center">주문날짜</th>  -->
			  				<th class="text-center">상태</th>
			  			</tr>
		  			</thead>
		  			<tbody>
		  				<c:forEach var="vos" items="${vos}" varStatus="st">
				  			<c:if test="${vos.bookingStatus == 1 || vos.bookingStatus == 2 }">
					  			<tr class="table-warning text-center">
					  				<td>${vo.name}</td>
					  				<td class="text-center">${vos.product}</td>
					  				<td>${fn:substring(vos.bookingDate,0,16)}</td>
					  				<td> 
					  					<c:if test="${vos.bookingStatus == 1}"><span class="badge badge-pill badge-info">예약신청</span></c:if>
					  					<c:if test="${vos.bookingStatus == 2}"><span class="badge badge-pill badge-primary">예약확인</span></c:if>
					  				</td>
				  				</tr>
					  		</c:if>
				  		</c:forEach>
	  				</tbody>
	  			</table>
	  		</div>
	  	</div>
  	</c:if>
  	
  	
  	<div class="box-container">
  		<div class="box-container-inner2">
	  		<h4><i style="font-size:24px" class="fa">&#xf073;</i> &nbsp;나의 시술 기록</h4>
	  		<table class="table">
	  			<thead class="thead-dark">
		  			<tr>
		  				<th class="text-center" width="30%">날짜</th>
		  				<th class="text-center">상품명</th>
		  				<th class="text-center">상태</th>
		  			</tr>
	  			</thead>
	  			<c:forEach var="vos" items="${vos}" varStatus="st">
		  			<c:if test="${vos.bookingStatus == 1} || ${vos.bookingStatus == 2}">
			  			<tr>
			  				<td colspan="3" class="text-center">시술기록이 없습니다 </td>
			  			</tr>
			  		</c:if>
			  		<c:if test="${vos.bookingStatus == 3 || vos.bookingStatus == 4}">
			  			<tr>
			  				<td class="text-center">
			  					${fn:substring(vos.bookingDate,0,16)}
			  				</td>
			  				<td class="text-center">${vos.product}</td>
			  				<td class="text-center">
			  					<c:if test="${vos.bookingStatus == 1}"><span class="badge badge-pill badge-info">예약신청</span></c:if>
			  					<c:if test="${vos.bookingStatus == 2}"><span class="badge badge-pill badge-primary">예약확인</span></c:if>
			  					<c:if test="${vos.bookingStatus == 3}"><span class="badge badge-pill badge-success">시술완료</span></c:if>
			  					<c:if test="${vos.bookingStatus == 4}"><span class="badge badge-pill badge-danger">취소</span></c:if>
			  				</td>
			  		</c:if>
			  	</c:forEach>
	  		</table>
	  		<h4><i style="font-size:24px" class="fa">&#xf086;</i> &nbsp;나의 1:1문의</h4>
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