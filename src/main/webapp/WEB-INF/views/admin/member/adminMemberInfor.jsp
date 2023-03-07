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
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
  <jsp:include page="/WEB-INF/views/include/admin_style.jsp"></jsp:include>
  
  
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
		  
		  
		  <div class="adminWarp">
			  
			  <div class="adminTitle">
					<h3>고객리스트 </h3>
				</div>
				<div class="adminWrap2 row" style="margin: 0 6px;">
					<div class="tableImgWrap col" style="margin-right:13px; background-color: #eee; max-width: 200px;">
						<img src="${ctp}/images2/userProfile.png" />
					</div>
					
					<div class="adminWrap2 col">
						<table class="table table-borderless text-center adminInfor">
							<tr>
								<th style="background-color: #eee;">이름</th>
								<td>${vo.name}</td>
								<th style="background-color: #eee;">성별</th>
								<td>${vo.gender}</td>
								<th style="background-color: #eee;">전화번호</th>
								<td colspan="3">${vo.tel}</td>
							</tr>
							<tr>
								<th style="background-color: #eee;">생년월일</th>
								<td>${fn:substring(vo.birthday,0,10)}</td>	
								<th style="background-color: #eee;">주소</th>
								<td colspan="5">${vo.address}</td>
							</tr>
							<tr>	
								<th style="background-color: #eee;">등급</th>
								<td>${strLevel}</td>						
								<th style="background-color: #eee;">포인트</th>
								<td>${vo.point}</td>
								<th style="background-color: #eee;">이메일</th>
								<td colspan="3">${vo.email}</td>
							</tr>
							<tr>
								<th style="background-color: #eee;">경로</th>
								<td>${vo.path}</td>							
								<th style="background-color: #eee;">최초 가입일</th>
								<td>${fn:substring(vo.startDate,0,10)}</td>
								<th style="background-color: #eee;">마지막 접속일</th>
								<td>${fn:substring(vo.lastDate,0,16)}</td>						
								<th style="background-color: #eee;">오늘 방문횟수</th>
								<td>${vo.todayCnt}</td>
							</tr>					
						</table>
					</div><!-- adminWrap2 -->			
				</div><!-- adminWarp2 -->
				
				
				<!--  -->
				
				<div class="adminTitle">
					<h3>시술내역</h3>
				</div>
				
					<div class="adminWrap2" style="margin: 0 6px;">
						<table class="table table-borderless table-hover text-center adminInfor">
							<tr>
								<th>상품명</th>				
								<th>시술날짜</th>				
								<th>체크사항</th>				
								<!-- <th>시술적립금</th> -->				
								<th>결제방법</th>				
								<th>예약상태</th>				
							</tr>
							<c:forEach var="bookingVo" items="${bookingVos}" varStatus="st">
								<c:if test="${!empty bookingVo.bookingStatus}">
									<tr>
										<td>${bookingVo.categorySubName}</td>
										<td>${bookingVo.bookingStartDate}</td>
										<td>${bookingVo.customerCheck}</td>
										<td>${bookingVo.paymentMethod}</td>
										<td>
											<c:if test="${bookingVo.bookingStatus == 1}">예약신청</c:if>
											<c:if test="${bookingVo.bookingStatus == 2}">예약완료</c:if>
											<c:if test="${bookingVo.bookingStatus == 3}">시술완료</c:if>
											<c:if test="${bookingVo.bookingStatus == 4}">취소</c:if>
											<c:if test="${bookingVo.bookingStatus == 5}">노쇼</c:if>
										</td>
									</tr>
								</c:if>
								<c:if test="${empty bookingVo.bookingStatus}">
									<tr>
										<td colspan="5">시술기록이 없습니다</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div><!-- adminWrap2 -->			
		
		</div><!-- adminWarp -->
	</div><!-- container-fluid -->

	
</body>
</html>