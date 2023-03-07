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
	'use strict';
	let date=0;
	let selectTime=0; 
	
	$(function(){
		$(window).scrollTop(460);	
	});
	

	function datePick(number) {
		date = number;
		$(".datePick").removeClass('datePickClick');
		$("#datePick"+number).addClass('datePickClick');
		
		let mm="${mm+1}";
		if("${mm+1}"<10){
			mm = "0${mm+1}"
		}
		if(date<10){
			date = "0"+date
		}
		let selectDate = "${yy}-"+mm+"-"+date;
		let toToday = "${yy}-"+mm+"-"+date;
		//myform.selectDate.value = selectDate;
		//alert(selectDate);
																													// ${selectDate}를 만들어 준 부분
		location.href = "${ctp}/booking/booking?idx=${idx}&selectDate="+selectDate+"&categorySubName=${categorySubName}&yy=${yy}&mm=${mm}";
	}

	function fTime(hourPick){
		selectTime = hourPick;		// 선택한 시간
		
		$(".hourPick").removeClass('hourPickClick');
		$(".hourPick"+selectTime).addClass('hourPickClick');
		
		if(selectTime<10){
			selectTime = "0"+selectTime;
		}
		
		//alert(selectTime);
		console.log('${categorySubName}');
		let str = "";
		if(".hourPickClick") {
			str += '<h4>선택정보</h4>';
			str += '<div class="checkProductBox">';
			str += '<div class="selectSubName">${categorySubName}</div><br /> ';

			str += '${selectDate} ' + selectTime+':00 ~'+(selectTime+${productVo.useTime})+':00 <br />';
			str += '<input type="hidden" name="selectTime" value="'+selectTime+'"/>';
			str += '<input type="hidden" name="selectTimeCal" value="'+(parseInt(selectTime)+${productVo.useTime})+'"/>';
			str += '<input type="hidden" name="selectName" value="${selectDate}"/>';
	
			str += '<div class="selectPrice">${productVo.mainPrice}원</div>';
			str += '<input type="hidden" name="mainPrice" value="${productVo.mainPrice}"/>';
			str += '</div>';
			
			
			
		 	if('${partCode}'=='A') {
				str += '<h4>체크사항</h4>';
				str += '<div class="form-group checkList">';
				str += '<input type="checkbox" name="customerCheck" value="아이라인 반영구" />아이라인 반영구 시술 경험';
				str += '<input type="checkbox" name="customerCheck" value="속눈썹펌" />속눈썹펌 시술 경험';
				str += '<input type="checkbox" name="customerCheck" value="피부질환" />피부질환';
				str += '<input type="checkbox" name="customerCheck" value="라식/라섹" />6개월 이내 라식/라섹';
				str += '<input type="checkbox" name="customerCheck" value="안과시술" />안과적 시술';
				str += '</div>';
				
			}
			else if('${partCode}'=='B') {
				str += '<h4>체크사항</h4>';
				str += '<div class="form-group checkList">';
				str += '<input type="checkbox" name="customerCheck" value="민감성" />민감성';
				str += '<input type="checkbox" name="customerCheck" value="복합성" />복합성';
				str += '<input type="checkbox" name="customerCheck" value="건성" />건성';
				str += '<input type="checkbox" name="customerCheck" value="지성" />지성';
				str += '<input type="checkbox" name="customerCheck" value="여드름성" />여드름성';
				str += '</div>';
			}
			else if('${partCode}'=='C') {
				str += '<h4>체크사항</h4>';
				str += '<p>(시술하는 부위에 해당되는 부분만 체크하세요)</p>';
				str += '<div class="form-group checkList">';
				str += '<input type="checkbox" name="customerCheck" value="1개월 이내 시술" />1개월 이내 여드름치료,필링,보톡스,필러 등의 시술<br/>';
				str += '<input type="checkbox" name="customerCheck" value="3개월 이내 시술" />3개월 이내 혈관 레이저, 제모 레이저, 성형수술, 지방흡입 등의 시술<br/>';
				str += '<input type="checkbox" name="customerCheck" value="24시간 이내 태닝" />24시간 이내 스파, 태닝, 핫요가 등 땀을 내는 격렬한 운동을 한 경우<br/>';
				str += '<input type="checkbox" name="customerCheck" value="왁싱부위 화상,상처" />왁싱 부위에 화상이나 상처가 있는 경우<br/>';
				str += '<input type="checkbox" name="customerCheck" value="화농성 여드름" />화농성 여드름';
				str += '<input type="checkbox" name="customerCheck" value="얇고 건조한 피부" />지나치게 얇고 건조한 피부<br/>';
				str += '<input type="checkbox" name="customerCheck" value="아토피,켈로이드,모세혈관" />아토피, 켈로이드, 모세혈관 확장증이 있는 경우<br/>';
				str += '</div>';
			}
			else if('${partCode}'=='D') {
				str += '<h4>체크사항</h4>';
				str += '<p>(시술하는 부위에 해당되는 부분만 체크하세요)</p>';
				str += '<div class="form-group checkList">';
				str += '<input type="checkbox" name="customerCheck" value="반영구" />반영구 시술 경험';
				str += '<input type="checkbox" name="customerCheck" value="잔흔제거" />잔흔제거 시술 경험';
				str += '<input type="checkbox" name="customerCheck" value="당뇨병" />당뇨병';
				str += '<input type="checkbox" name="customerCheck" value="심장질환" />심장질환';
				str += '<input type="checkbox" name="customerCheck" value="혈우병" />혈우병';
				str += '<input type="checkbox" name="customerCheck" value="여드름/뾰루지" />여드름/뾰루지';
				str += '<input type="checkbox" name="customerCheck" value="아토피" />아토피';
				str += '<input type="checkbox" name="customerCheck" value="포진/두드러기" />포진/두드러기';
				str += '<input type="checkbox" name="customerCheck" value="3개월 이내 수술 혹은 시술" />3개월 이내 수술 혹은 시술';
				str += '<input type="checkbox" name="customerCheck" value="임신중/수유중" />임신중/수유중';
				str += '</div>';
			}
			
			$("#demo").html(str);
		
			
		}
		
		
	}

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
	
	
	
	
	
	function fCheck() {
		if('${selectDate}'== ''){
			alert("날짜를 선택해주세요.");
			return;
		}
		
		else if(selectTime==0){
			alert("시간을 선택해주세요.");
			return;
		}
		let mm="${mm+1}";
		if("${mm+1}"<10){
			mm = "0${mm+1}"
		}
		//time = parseInt(time)+${productVo.useTime}-1;
		//time = ${productVo.useTime};
		//if(time<10){
		//	time = "0"+time;
		//}
		//alert("time: " + time);
		//let bookingStartDate ="${yy}-"+mm+"-"+date+" "+time+":00";
		//let bookingEndDate   ="${yy}-"+mm+"-"+date+" "+(time+${productVo.useTime}-1)+":00";
		let bookingStartDate = "${selectDate} "+selectTime+":00";
		let bookingEndDate   = "${selectDate} "+(selectTime)+":00";
	
		
		myform.bookingStartDate.value = bookingStartDate;
		myform.bookingEndDate.value = bookingEndDate;
		/* myform.selectDate.value = '${selectDate}'; */
		//alert("bookingStartDate : " + bookingStartDate + " , bookingEndDate" + bookingEndDate);
		
		//alert("예약하신 날짜는 : ${selectDate}입니다.");
		
		myform.submit();
	}
	
	
	
</script>

<style>
  #td1,#td8,#td15,#td22,#td29,#td36 {
    color: red;
  }
  #td7,#td14,#td21,#td28,#td35,#td42 {
    color: blue;
  }
  .today {
    font-size: 1.5em;
    background-color: #ffffd9;
    /* text-align: center; */
  }

  td {
  	padding: 0 !important;
  }
</style>

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
<div class="">
<!-- 		<h2>reservation</h2> -->
	<div class="bookCheckWrap">
		<form name="myform" method="post" > <!-- 입력시켜 데이터베이스에 보내는..  -->
			<div class="row">
				<div class="col">
					<div class="">
						<h4>상품이미지</h4>
						<c:set var="thumbnails" value="${fn:split(productVo.FSName, '/')}" />
							<img alt="상품사진" id="bigThumb" src="${ctp}/data/dbShop/product/${thumbnails[0]}" style="width:400px; height:400px; border: 1px solid #eee;">
							<div class="smallThumbLine">
								<c:forEach var="a" begin="0" end="${fn:length(thumbnails)-1}" step="1">
									<img class="w3-hover-opacity smallThumb" src="${ctp}/data/dbShop/product/${thumbnails[a]}" style="width: 50px; height: 50px; border: 1px solid #eee">
								</c:forEach>
							</div><!-- smallThumbLine -->
						</div><!-- container -->
					</div><!-- col -->
					
					<div class="col bookCheck-col">
					<!-- 캘린더 -->					
						<div class="bookCheck-col-inner">
						  <h4>날짜선택</h4>
						  
						  <div class="text-center bookingCalendar" >
						  	<div class="text-center" >
						    	<%-- <a href="javascript:prevMonth('${idx}','${yy}','${mm-1}')"> --%>
										<!-- onclick="location.href='${ctp}/booking/booking?yy=${yy}&mm=${mm-1}&idx=${idx}';" -->
						    		<img src="${ctp}/images2/left_small.png" onclick="location.href='${ctp}/booking/booking?yy=${yy}&mm=${mm-1}&idx=${idx}';" style="width:17px; margin-bottom: 2px;" />
						    	<!-- </a> -->
							    &nbsp;&nbsp;<font size="3">${yy}. ${mm+1}</font>&nbsp;&nbsp;
							    <img src="${ctp}/images2/right_small.png" onclick="location.href='${ctp}/booking/booking?yy=${yy}&mm=${mm+1}&idx=${idx}';" style="width:17px; margin-bottom: 2px;" />
							    
							    <%-- <img src="${ctp}/images2/home.png" onclick="location.href='${ctp}/booking/booking';" title="오늘날짜" style="width:17px; margin-bottom: 2px;"> --%>
							  </div>
						  
						    <table class="table mt-1">
						      <tr class="text-center" style=" border:none; background-color: #fff" >
						        <th style="width:13%; font-size:13px; color:red; border:none">sun</th>
						        <th style="width:13%; font-size:13px; border:none">mon</th>
						        <th style="width:13%; font-size:13px; border:none">tue</th>
						        <th style="width:13%; font-size:13px; border:none">wed</th>
						        <th style="width:13%; font-size:13px; border:none">thu</th>
						        <th style="width:13%; font-size:13px; border:none">fri</th>
						        <th style="width:13%; font-size:13px; color:blue; border:none ">sat</th>
						      </tr>
						      <tr>
						        <c:set var="cnt" value="${1}"/>
						        <!-- 시작일 이전의 공백을 이전달의 날짜로 채워준다. -->
						        <c:forEach var="preDay" begin="${preLastDay-(startWeek-2)}" end="${preLastDay}">
						          <td style="font-size:0.6em; border:none;"></td>
						          <c:set var="cnt" value="${cnt+1}"/>
						        </c:forEach>
						        <!-- 해당월에 대한 날짜를 마지막일자까지 반복 출력한다.(단, gap이 7이되면 줄바꿈한다.) -->
						        <c:forEach begin="1" end="${lastDay}" varStatus="st">
						          <c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}"/>
						          <td id="td${cnt}" ${todaySw==1 ? 'class=today' : ''} style="font-size:0.9em; border:none;">
						            <c:set var="ymd" value="${yy}-${mm+1}-${st.count}"/>
						            <%-- <a href="scheduleMenu?ymd=${ymd}"> --%>
						            <!-- datePick -->
						            
						            <c:if test="${fn:substring(param.selectDate,8,10)!=st.count}">
						            	<c:if test="${compare==0}">
							              <div  ${toDay<=st.count ? 'class=datePick' : 'class=recentDate'} id="datePick${st.count}" onclick="datePick(${st.count})">${st.count}</div>
							             </c:if>
						            	<c:if test="${compare>0}"> <!-- 지난날짜. compare가 0보다 큼 -->
							              <div class="recentDate" id="datePick${st.count}" onclick="datePick(${st.count})">${st.count}</div>
							             </c:if>
						            	<c:if test="${compare<0}">
							              <div class="datePick" id="datePick${st.count}" onclick="datePick(${st.count})">${st.count}</div>
							             </c:if>
						            </c:if>
						            <c:if test="${fn:substring(param.selectDate,8,10)==st.count}">
						            	<div class="datePick datePickClick" onclick="datePick(${st.count})"><font color="#fff">${st.count}</font></div>
						            </c:if>
						 
						            <%-- </a> --%>
						            <!-- datePick -->
						          </td>
						          <c:if test="${cnt % 7 == 0}"></tr><tr></c:if>  <!-- 한주가 꽉차면 줄바꾸기 한다. -->
						          <c:set var="cnt" value="${cnt + 1}"/>
						        </c:forEach>
						       
						        <!-- 마지막일 이후를 다음달의 일자로 채워준다. -->
						        <c:if test="${nextStartWeek != 1}">
							        <c:forEach begin="${nextStartWeek}" end="7" varStatus="nextDay">
							          <td style="color:#ccc;font-size:0.6em; border:none;"></td>
							        </c:forEach>
						        </c:if>
						      </tr>
						    </table>
						  </div>
						</div>
						<!-- 캘린더 -->	
						
						<!-- 시간 -->
						
						<c:if test="${!empty selectDate}">
							<h4>시간선택</h4> 
							<div class="bookCheck-col-inner">
							  <c:set var="temp" value="0"/>
								<c:if test="${fn:length(bookingTimeVos)>0}">
								  <c:set var="sw" value="0"/>
							    <c:forEach var="i" begin="9" end="20">
									  <c:forEach var="bookingTimeVo" items="${bookingTimeVos}">
								      <c:if test="${bookingTimeVo.bookingTimeBlock == i}"> <!-- 예약이 같아서 비활성화 되는 부분 -->
								      	<button type="button" class="btn hourPickNo m-1" disabled style="width:120px" value="${i}" onclick="fTime(${i})">${i}:00</button>							      	
											  <c:set var="sw" value="1"/>
								      </c:if>
								    </c:forEach>
								    <c:if test="${sw == 0}">
								      <c:if test="${i != bookingTimeVo.bookingTimeBlock}">	<!-- 예약이 달라서 활성화 되는 부분 -->
								      	<button type="button" class="btn hourPick hourPick${i} m-1" style="width:120px" value="${i}" onclick="fTime(${i})">${i}:00</button>
								      </c:if>							    
							      </c:if>
							      <c:set var="sw" value="0"/>
								  </c:forEach>
								</c:if>
							  <c:if test="${fn:length(bookingTimeVos)<=0}">
									<c:forEach var="i" begin="9" end="20">
											<button type="button" class="btn hourPick hourPick${i} m-1" style="width:120px" value="${i}" onclick="fTime(${i})">${i}:00</button>
									</c:forEach>
								</c:if>
							</div>
						</c:if>
						
						<div id="demo" class="mt-3"></div>
						
						<button type="button" class="btn btn-dark mt-2" onclick="fCheck()" style="width:390px">다 음</button>
					</div><!-- col -->
			</div><!-- row -->
			
			<hr/>
			<p style="font-size:14px">1. 예약시간 변경 및 취소: 예약시간 변경 및 취소는 최소 3시간 전에 미리 연락하여야 합니다. 단, 시술 준비 단계에서는 예약 변경 및 취소가 불가능할 수 있습니다.<br/>
2. 예약시 연락처 정보 제공: 정확한 연락처 정보를 제공하여 주시기 바랍니다. 예약 확인 및 변경, 취소 등을 위해 연락처 정보가 필요합니다.<br/>
3. 시술 전 주의사항: 시술 전에는 특별한 주의사항이 있을 경우 예약 전에 미리 알려주시기 바랍니다.<br/>
4. 미성년자 이용제한: 미성년자는 법정대리인의 동의가 있을 경우에만 이용이 가능합니다.<br/>
5. 질병 및 알러지 정보 제공: 만일 특정 질병이나 알러지가 있을 경우 미리 알려주시면 시술 전에 충분한 안전조치를 취할 수 있습니다.<br/>
6. 시술 중 불편사항 발생 시: 시술 중에 불편사항이 발생할 경우 즉시 말씀해 주시기 바랍니다. 빠른 조치를 통해 최선의 서비스를 제공할 수 있습니다.<br/>
7. 시술 후 유의사항: 시술 후 유의사항을 꼭 숙지하시고 지켜주시기 바랍니다.<br/>
8. 환불 및 교환: 상품이나 서비스의 특성상 교환이나 환불이 불가능할 수 있으니 이점 유의하여 주시기 바랍니다.<br/>
9. 고객님의 안전과 건강을 위해 아래의 사항을 반드시 지켜주시기 바랍니다. 만약 지켜지지 않아 발생하는 문제에 대해서는 모든 책임은 고객님에게 있음을 알려드립니다.</p>
		
		
		
			<input type="hidden" name="bookingStartDate" />
			<input type="hidden" name="bookingEndDate" />
			<input type="hidden" name="idx" value="${idx}" />
			<input type="hidden" name="mid" value="${sMid}"/>
			<input type="hidden" name="useTime" value="${productVo.useTime}"/>
			<%-- <input type="hidden" name="categorySubName" value="${categorySubName}"/> --%>
			<!-- <input type="hidden" name="selectDate"/> -->
		</form>
	</div><!-- bookCheckWrap -->	
</div><!-- loginWrap -->



</body>
</html>
