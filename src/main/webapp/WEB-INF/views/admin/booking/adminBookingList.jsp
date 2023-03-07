<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>adContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
  
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
  <jsp:include page="/WEB-INF/views/include/admin_style.jsp"></jsp:include>
 
  
  <script>
    'use strict';
    function dateChange(orderBy){
    	
    	location.href= "adminBookingList?orderBy="+orderBy;
    	
    }
    
    
    function bookingStatusCheck(e) {
			let ans = confirm("예약의 상태를 변경하시겠습니까?");
			if(!ans) return false;
			
			let items = e.value.split("/");
	    	
    	let query = {
    			bookingStatus : items[0],
    			idx : items[1],
    	}
	    	
			
			$.ajax({
				type : "post",
				url : "${ctp}/admin/booking/adminBookingStatus",
				data : query,
				success : function(res) {
					if(res == 1) {
						alert("예약의 상태가 변경되었습니다");
						location.reload();
					}
					else {
						alert("상태변경 실패 ");
					}
				},
				error : function() {
					alert("전송오류 ");
				}
			});
		}

    function fSearch() {
 		let searchStart = myform.searchStart.value;
 		let searchEnd = myform.searchEnd.value;
 		//alert(searchStart);
 		//alert(searchEnd);
 		
 		location.href="adminBookingList?searchStart="+searchStart+"&searchEnd="+searchEnd;
	}
    
    
  </script>
  <style>
  	body {
  		font-size: 13px;
  	}
  </style>
</head>
<body>
<form name="myform">
	<div class="container-fluid m-0 p-0">
		
		<div class="searchBar row">
				<div class="input-group">
					<select name="part" id="part" class="part mr-2">
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
	    
	    
	    <div class="col text-right">
	    	<div class="mt-1"><img src="${ctp}/images2/profile.png" style="width: 32px;"/></div>
	    </div>
		    
		  </div><!-- searchBar -->
		  <div class="adminWarp">
			  <div class="adminTitle">
					<div class="d-flex">
						<h3>예약리스트</h3>
						<!-- <button type="button" class="btn btn-outline-primary ml-auto mr-2" style="height: 38px; margin-top: 10px;">예정된 예약</button>
						<button type="button" class="btn btn-outline-primary mr-2" style="height: 38px; margin-top: 10px;" >지난 예약</button> -->
						<!-- <button type="button" class="btn btn-outline-primary ml-auto mr-2" style="height: 38px; margin-top: 10px;">오늘의 예약</button> -->
						<div class="mr-1 ml-auto" style="height: 38px; margin-top: 10px; padding-top: 12px;">
							<input type="date" name="searchStart" value="${searchStart}"/>~
							<input type="date" name="searchEnd" value="${searchEnd}"/>
							<input type="button" name="searchButton" value="검색" onclick="fSearch()" class="mr-1"/>
							<input type="button" name="searchButton" value="전체보기"/>
							<input type="button" name="searchButton" value="오늘의예약"/>
						</div>
					</div>
				</div>
				<div class="adminWrap2">
				<table class="table table-borderless table-hover text-center">
					<tr>
						<!-- <th>번호</th> -->
						<!-- <th>아이디</th> -->
						<th>상품명</th>
						<th class="dateClick">
							 <c:if test="${orderBy==''}"><span onclick="dateChange('down')">예약날짜&nbsp;&nbsp;&nbsp;</span></c:if>
							 <c:if test="${orderBy=='down'}"><span onclick="dateChange('up')">예약날짜&nbsp;&nbsp;&nbsp;<i class="fi fi-rr-angle-small-up"></i></span></c:if>
							 <c:if test="${orderBy=='up'}"><span onclick="dateChange('')">예약날짜&nbsp;&nbsp;&nbsp;<i class="fi fi-rr-angle-small-down"  ></i></span></c:if>
						</th>
						<th>성명</th>
						<th>성별</th>
						<th>전화번호</th>
						<th>체크사항</th>
						<th>등급</th>
						<th>적립금</th>
						<th>노쇼</th>
						<th>결제방법</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				 	<c:forEach var="bookingVo" items="${bookingVos}" varStatus="st">
			 			<tr>
				 			<%-- <td>${bookingVo.idx}</td>		 --%>
				 			<td>${bookingVo.categorySubName}</td>
				 			<td>${fn:substring(bookingVo.bookingStartDate,0,13)}:00~${fn:substring(bookingVo.bookingEndDate,11,13)}:00</td>
							<td>${bookingVo.name}</td>
				 			<td>${bookingVo.gender}</td>
				 			<td>${bookingVo.tel}</td>
				 			<td>${bookingVo.customerCheck}</td>
				 			<c:if test="${bookingVo.level!=0}">
					 			<td>${bookingVo.level}</td>
					 			<td>${bookingVo.point}</td>
				 			</c:if>
				 			<c:if test="${bookingVo.level==0}">
				 				<td colspan="2" style="background-color: #eee">관리자 예약</td>
					 		</c:if>
				 			<td>${bookingVo.noShowCnt}</td>
				 			<td>${bookingVo.paymentMethod}</td>
				 			<td>
				 				<form name="bookingStatusForm">
				 					<select name="bookingStatus" class="bookingStatus" onchange="bookingStatusCheck(this)">
				 						<option value="1/${bookingVo.idx}" <c:if test="${bookingVo.bookingStatus==1}">selected</c:if>>예약신청</option>
				 						<option value="2/${bookingVo.idx}" <c:if test="${bookingVo.bookingStatus==2}">selected</c:if>>예약완료</option>
				 						<option value="3/${bookingVo.idx}" <c:if test="${bookingVo.bookingStatus==3}">selected</c:if>>시술완료</option>
				 						<option value="4/${bookingVo.idx}" <c:if test="${bookingVo.bookingStatus==4}">selected</c:if>>취소</option>
				 						<option value="5/${bookingVo.idx}" <c:if test="${bookingVo.bookingStatus==5}">selected</c:if>>노쇼</option>
				 					</select>
				 					
				 				</form>
				 			</td>	
				 			<td>
				 				<button type="button" class="btn btn-sm btn-primary" >더보기</button>
				 			</td>
				 		</tr>
					</c:forEach>
						<tr><td colspan="10" class="m-0 p-0"></td></tr>
					</table>
					
					<!-- 블록 페이지 시작 -->
					<div class="text-center">
					  <ul class="pagination justify-content-center">
					    <c:if test="${pageVo.pag > 1}">
					      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/booking/adminBookingList?pag=1">첫페이지</a></li>
					    </c:if>
					    <c:if test="${pageVo.curBlock > 0}">
					      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/booking/adminBookingList?pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}">이전블록</a></li>
					    </c:if>
					    <c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
					      <c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
					    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/admin/booking/adminBookingList?pag=${i}">${i}</a></li>
					    	</c:if>
					      <c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
					    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/booking/adminBookingList?pag=${i}">${i}</a></li>
					    	</c:if>
					    </c:forEach>
					    <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
					      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/booking/adminBookingList?pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}">다음블록</a></li>
					    </c:if>
					    <c:if test="${pageVo.pag < pageVo.totPage}">
					      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/booking/adminBookingList?pag=${pageVo.totPage}">마지막페이지</a></li>
					    </c:if>
					  </ul>
					</div>
					<!-- 블록 페이지 끝 -->
					
					
				</div><!-- adminWarp2 -->
		</div><!-- adminWarp -->
	</div><!-- container-fluid -->
</form>
</body>
</html>