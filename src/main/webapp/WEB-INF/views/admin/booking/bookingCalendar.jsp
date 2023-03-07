<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>dbCategory.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
  
  
  <jsp:include page="/WEB-INF/views/include/admin_style.jsp"></jsp:include>
  
  <script>
    'use strict';
    
    $(document).ready(function(){
  	   $('table td').mouseover(function(){
  	      $(this).css("backgroundColor","#eee");
  	      $(this).css("cursor","pointer");
  	   });
  
  	
  	   $('table td').mouseout(function(){
  	      $(this).css("backgroundColor","#fff");
  	   });
  			
	  	$('#memberListView').click(function() {
				$('#memberListViewSelect').toggleClass('toggleButton');
			});
	  	
  	});
    
    
   
    function datePick(date) {
			$('#selectDate').text(date);
			$('#selectDateString').val(date);
		} 
    /*
 		// 상품 입력창에서 대분류 선택(onChange)시 중분류를 가져와서 중분류 선택박스에 뿌리기
    function categoryMainChange() {
    	var categoryMainCode = myform.categoryMainCode.value;
			$.ajax({
				type : "post",
				url  : "${ctp}/dbShop/categorySubName",
				data : {categoryMainCode : categoryMainCode},
				success:function(data) {
					var str = "";
					str += "<option value=''>중분류</option>";
					for(var i=0; i<data.length; i++) {
						str += "<option value='"+data[i].categorySubCode+"'>"+data[i].categorySubName+"</option>";
						//alert(data[i].categorySubCode);
					}
					$("#categorySubCode").html(str);
				},
				error : function() {
					alert("전송오류!");
				}
			});
  	}
 		*/
 		
    /* function onMemberListView(memberVos) {

		  // "memberVos"를 JSON 문자열로 변환합니다.
		  const memberVosJson = JSON.stringify(memberVos);
		  
		  // "memberListView()" 함수를 호출하고, "memberVos"를 전달합니다.
		  memberListView(memberVosJson);
    } */

 	/* 	function memberListView(memberVos) {

 			let str = "";
		  for (let i = 0; i < memberVos.length; i++) {
		    const memberVo = memberVos[i];
		    const name = memberVo.getName();
		    const tel = memberVo.getTel();
		    const point = memberVo.getPoint();
		    const noShow = memberVo.getNoShow();

				// 각 정보를 문자열로 누적시킵니다.
		    str += name + ", " + tel + ", " + point + ", " + noShow + "\n";
		  	}
				
		  	$("#demo").html(str);
 			}
 	 */
 		
    
 		function fCheck() {
 		 	//let categoryMainCode = myform.categoryMainCode.value;   // 중간에 id 값이 들어감
 		 	//let categorySubCode = myform.categorySubCode.value;   // 중간에 id 값이 들어감
 		 	let selectTime = myform.selectTime.value;   // 중간에 id 값이 들어감
 		 	let inputName = myform.name.value;
 		 	let inputTel = myform.tel.value;
 		 	let paymentMethod = myform.paymentMethod.value;
 		 	
 		 	/* 
 			if(categoryMainCode == "") {
				alert("1차메뉴를 선택하세요")
				return false;
			}
			else if(categorySubCode == "") {
				alert("2차메뉴를 선택하세요")
				return false;
			}
 			 */
			if(selectTime == "") {
				alert("시간을 선택하세요")
				return false;
			}
			else if(inputName == "") {
				alert("예약할 고객의 이름을 입력하세요")
				return false;
			}
			else if(inputTel == "") {
				alert("예약할 고객의 전화번호를 입력하세요")
				return false;
			}
 			$("#paymentMethod").val(paymentMethod);

 			// 2023-3-9
 			let selectDateString = $("#selectDateString").val();
 			alert(selectDateString);
 			let mm=selectDateString.split("-")[1];
 			let dd=selectDateString.split("-")[2];
 			if(parseInt(mm)<10){
 				mm = "0"+mm;
 			}
 			if(parseInt(dd)<10){
 				dd = "0"+dd;
 			}
 			
 			if(selectTime<10){
 				selectTime = "0"+selectTime;
 			}
 			
 			
 			let tempBookingStartDate = selectDateString.split("-")[0]+"-"+mm+"-"+dd+" "+selectTime;
 			$("#bookingStartDate").val(tempBookingStartDate);
 			
 			
 			myform.submit();
		}
    
 	 
 		// 선택박스의 회원 선택시 텍스트박스로 가져오기(e.options[e.selectedIndex].text)
 		function memberSelect(e) {
 			var member = e.options[e.selectedIndex].text.split("|");
 			var memberName = member[0].trim();
 			var memberTel = member[1].trim();
 			//alert("memberName : " + memberName + " , tel : " + memberTel);
 			$("#name").val(memberName);
 			$("#tel").val(memberTel);
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
    
    .toggleButton {
    	display: none;
    }
    
    
    
    
    
  </style>
  
</head>
<body>
	<div class="container-fluid m-0 p-0">
		<div class="searchBar row">
			
	    
	    <div class="col text-right">
	    	<div class="mt-1"><img src="${ctp}/images2/profile.png" style="width: 32px;"/></div>
	    </div>
		    
		</div><!-- searchBar -->
	  <div class="adminWarp" style="margin-bottom:50px">
		  <div class="adminTitle">
				<h3>예약캘린더</h3>
			</div>
			
			<div class="adminWrap2" style="padding: 20px 0px; border-radius: 1em; min-width: 700px">
			    <table class="table bookingCalendar mt-5" style="width:100%;">
			      <tr><th colspan="7" style="border:none"></th></tr>
			      <tr>
			      	<th colspan="7" style="height:70px; border-color:#fff;">
								<div class="d-flex">
									<div class="mr-auto">
										<div class="btn-group ml-4">
										  <button type="button" class="btn btn-outline-dark" style="width:80px">월</button>
										  <button type="button" class="btn btn-outline-dark" style="width:80px">주</button>
										  <button type="button" class="btn btn-outline-dark" style="width:80px">일</button>
										</div>
									</div>
									<div class="mr-3">
										<button type="button" onclick="location.href='${ctp}/admin/booking/bookingCalendar?yy=${yy-1}&mm=${mm}';" class="btn btn-outline-dark btn-sm" title="이전년도">◁◁</button>
										<button type="button" onclick="location.href='${ctp}/admin/booking/bookingCalendar?yy=${yy}&mm=${mm-1}';" class="btn btn-outline-dark btn-sm" title="이전월">◀</button>
										<font size="4">&nbsp;&nbsp; ${yy}년 ${mm+1}월 &nbsp;&nbsp;</font>
										<button type="button" onclick="location.href='${ctp}/admin/booking/bookingCalendar?yy=${yy}&mm=${mm+1}';" class="btn btn-outline-dark btn-sm" title="다음월">▶</button>
										<button type="button" onclick="location.href='${ctp}/admin/booking/bookingCalendar?yy=${yy+1}&mm=${mm}';" class="btn btn-outline-dark btn-sm" title="다음년도">▷▷</button>
										&nbsp;&nbsp;
										<button type="button" onclick="location.href='${ctp}/admin/booking/bookingCalendar';" class="btn btn-outline-dark btn-sm" title="오늘날짜"><i class="fa fa-home"></i></button>
				      		</div>
				      	</div><!-- row -->
			      	</th>
			      </tr>
			      
			      <tr class="text-center">
			        <th style="width:13%; height:46px; color:red; vertical-align:middle; border:none">sun</th>
			        <th style="width:13%; height:46px; vertical-align:middle; border:none">mon</th>
			        <th style="width:13%; height:46px; vertical-align:middle; border:none">tue</th>
			        <th style="width:13%; height:46px; vertical-align:middle; border:none">wed</th>
			        <th style="width:13%; height:46px; vertical-align:middle; border:none">thu</th>
			        <th style="width:13%; height:46px; vertical-align:middle; border:none">fri</th>
			        <th style="width:13%; height:46px; color:blue; vertical-align:middle; border:none">sat</th>
			      </tr>
			      <tr>
			        <c:set var="cnt" value="${1}"/>
			        <!-- 시작일 이전의 공백을 이전달의 날짜로 채워준다. -->
			        <c:forEach var="preDay" begin="${preLastDay-(startWeek-2)}" end="${preLastDay}">
			          <td></td>
			          <c:set var="cnt" value="${cnt+1}"/>
			        </c:forEach>
			        
			        <!-- 해당월에 대한 날짜를 마지막일자까지 반복 출력한다.(단, gap이 7이되면 줄바꿈한다.) -->
			        <c:forEach begin="1" end="${lastDay}" varStatus="st">
			          <c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}"/>
			          <td id="td${cnt}" ${todaySw==1 ? 'class=today' : ''} onclick="datePick('${yy}-${mm+1}-${st.count}')" style="font-size:0.9em; height: 120px;" data-toggle="modal" data-target="#myModal">
			            <c:set var="ymd" value="${yy}-${mm+1}-${st.count}"/>
			            <c:set var="ym" value="${yy}-${mm+1}"/>
			            <a ><!-- 모달 -->
			            	${st.count}<br/>
			            	<!-- 스케줄러에 출력해줄 부분 -->
			            	<c:forEach var="vo" items="${bookingVos}">
			                <c:if test="${fn:substring(vo.bookingStartDate,8,10)==st.count}">
			                  ${fn:substring(vo.bookingStartDate,11,13)}:00 ${vo.name}<br/>
			                </c:if>
			            	</c:forEach>
			            </a>
			          </td>
			          <c:if test="${cnt % 7 == 0}"></tr><tr></c:if>  <!-- 한주가 꽉차면 줄바꾸기 한다. -->
			          <c:set var="cnt" value="${cnt + 1}"/>
			        </c:forEach>
			        
			        <!-- 마지막일 이후를 다음달의 일자로 채워준다. -->
			        <c:if test="${nextStartWeek != 1}">
				        <c:forEach begin="${nextStartWeek}" end="7" varStatus="nextDay">
				          <td style="color:#ccc;font-size:0.6em"></td>
				        </c:forEach>
			        </c:if>
			      </tr>
			    </table>
			</div><!-- adminWarp2 -->
		</div><!-- adminWarp -->
	</div><!-- container-fluid -->
	
	
	<!-- The Modal -->
  <div class="modal fade" id="myModal" style="overflow: hidden">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">예약등록</h4>
          
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<form name="myform" method="post">
	         	<div>예약일시 :  <span id="selectDate"></span></div>
	       			
	       			<div class="mb-2">
		       			시술선택
		       			<%-- 
		       			<div class="row">
			       			<div class="col">
				       			<select id="categoryMainCode" name="categoryMainCode" class="form-control" onchange="categoryMainChange()">
						          <option value="">1차메뉴를 선택하세요</option>
						          <c:forEach var="mainVo" items="${mainVos}">
						          	<option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
						          </c:forEach>
						        </select>
					        </div>
					        
					        <div class="col mb-2">
						        <select id="categorySubCode" name="categorySubCode" class="form-control">
						          <option value="">2차메뉴명 </option>
								  	  <c:forEach var="subVo" items="${SubVos}">
								  	    <option value=""></option>
								  	  </c:forEach>
						        </select>
					        </div>
		       		</div><!-- row -->
	       		</div>
	       		 --%>
       			<div>
	       			<select id="productMenu" name="productMenu" class="form-control">
			          <option value="">상품을 선택하세요</option>
			          <c:forEach var="productVo" items="${productVos}">
			          	<option value="${productVo.productCode}/${productVo.categoryMainName}/${productVo.categorySubName}/${productVo.useTime}">${productVo.productCode} : ${productVo.categoryMainName} / ${productVo.categorySubName} / ${productVo.useTime}</option>
			          </c:forEach>
			        </select>
		        </div>
	       		 
	       		<div class="mb-2">
	       			시간선택  
		       		<select name="selectTime" id="selectTime" class="form-control">
		       			<option value="">시간선택</option>
		       			<c:forEach var="i" begin="9" end="20">
					  	    <option value="${i}">${i}:00</option>
		       			</c:forEach>
				  	    <option value="99">회원권구매</option>
		       		</select>
	       		</div>
	       		
	       		<div class="mb-2">
	       			<div class="row">
	       				<p class="adminSmallTitle col">* 성명</p>
	       				<p class="adminSmallTitle col">* 전화번호</p>
	       			<%-- 	<p>${memberVos}</p> --%>
	       			</div>
	       			
	       			<div class="d-flex">
		       			<input class="form-control mr-2" type="text" name="name" id="name" placeholder="성명을 입력하세요"/>
		       			<input class="form-control" type="text" name="tel" id="tel" placeholder="전화번호를 입력하세요"/>
	       			</div>
	       			
	       			<input type="button" id="memberListView" class="btn btn-info form-control mt-1" value="회원리스트에서 추가하기">
	       			<select name="memberListViewSelect" id="memberListViewSelect" onchange="memberSelect(this)" class="form-control toggleButton">
	       			  <option value="" disabled>&nbsp;&nbsp;&nbsp;&nbsp;성명&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;포인트&nbsp; | &nbsp;노쇼</option>
	       			  <c:forEach var="vo" items="${memberVos}" varStatus="st">
	       			  	<option value="${vo.idx}">&nbsp;&nbsp;${vo.name}&nbsp;&nbsp; | &nbsp;&nbsp;${vo.tel}&nbsp;&nbsp; | &nbsp;&nbsp;${vo.point}&nbsp;&nbsp; | &nbsp;&nbsp;${vo.noShow}</option>
	       			  </c:forEach>
	       			</select>
	       			<!-- <div id="demo"></div> -->
	       		</div>
	       		
	       		<div class="mb-2">
	       			결제방법 &nbsp;&nbsp; <!-- booking2 필드에 추가해야하나? -->
	       			<div class="form-check-inline">
					      <label class="form-check-label" for="check1">
					        <input type="radio" name="paymentMethod" class="form-check-input" value="현장결제" >현장결제
					      </label>
					    </div>
					    <div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" name="paymentMethod" class="form-check-input" value="회원권" />회원권
							  </label>
							</div>
							<div class="form-check-inline">
							  <label class="form-check-label">
							    <input type="radio" name="paymentMethod" class="form-check-input" value="기타" />기타
							  </label>
							</div>
						</div>
						
						<%-- <input type="hidden" name="idx" value="${productVo.idx}" /> --%>
						
						<input type="hidden" name="bookingStartDate" id="bookingStartDate" />
						<input type="hidden" name="payment" id="payment" />
						<input type="hidden" name="selectDateString" id="selectDateString" />
						<input type="hidden" name="useTime" id="useTime" value="0"/>
						<input type="hidden" name="bookingStatus" id="bookingStatus" value="0"/>
						<input type="hidden" name="mid" value="${sMid}"/>
						<input type="hidden" name="endTime"/>
					</form><!-- modalBody -->
	       </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
          <button type="button" class="btn btn-primary" onclick="fCheck()" data-dismiss="modal" >예약등록하기</button>
        </div>
        
        
      </div>
    </div>
  </div>
	
	
</body>
</html>