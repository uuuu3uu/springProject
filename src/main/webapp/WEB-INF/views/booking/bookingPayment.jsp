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
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
 var IMP = window.IMP; 
IMP.init("imp84111772"); 

function requestPay() {
	   IMP.request_pay({
        pg : 'html5_inicis.INIpayTest',
        pay_method : 'card',
        // merchant_uid: "57008833-33004", 
        merchant_uid: "${sBookingVo.BNumber}", 
        // name : '당근 10kg',
        name : 'Anotheryou',
        // amount : 1004,
        amount : '${sDbProductVo.mainPrice}',
        // buyer_email : 'Iamport@chai.finance',
        buyer_email : '${memberVo.email}',
        // buyer_name : '아임포트 기술지원팀',
        buyer_name : '${memberVo.name}',
        // buyer_tel : '010-1234-5678',
        buyer_tel : '${memberVo.tel}',
        // buyer_addr : '서울특별시 강남구 삼성동',
        buyer_addr : '${memberVo.address}',
        // buyer_postcode : '123-456'
        buyer_postcode : '',
    }, function (rsp) { // callback
        if (rsp.success) {
        	  alert("결제가 완료되었습니다.");
            console.log(rsp);
            location.href = 'bookingResult';
        } else {
        	  alert("결제가 취소 되었습니다.");
            console.log(rsp);
            location.reload();
        }
    });
    //location.href = 'bookingResult';
} 
</script>

<style>
  
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
	<div class="bookCheckWrap">
		<form name="myform" method="post" action="bookingPayment"> <!-- 입력시켜 데이터베이스에 보내는..  -->
			<div class="row">
				<div class="col">
					<h4>선택정보</h4>
					<div class="checkPaymentBox">
						<input type="text" value="${sBookingVo.BNumber}" class="inputNo selectSubName" disabled />
						<input type="text" value="${sDbProductVo.categorySubName}" class="inputNo selectSubName" disabled />
						<%-- <div class="mt-2">${vo.selectDate} ${selectTime}:00~${selectTimeCal}:00</div> --%>
						<div class="mt-2">${bookingVo.bookingStartDate}</div>
						<div style="padding-left:120px; font-weight:bold; color:#000;">
						<input type="text" value="${sDbProductVo.mainPrice} " class="inputNo checkProductBoxPrice" disabled />원
						</div>
					</div>
					<h4>예약자정보</h4>
					<div class="checkPaymentBox">
						<p class="paymentSmallTitle">성함</p>
						<input type="text" value="${sName}" class="inputNo mb-3" disabled/>
						<p class="paymentSmallTitle">전화번호</p>
						<input type="text" value="${memberVo.tel}" class="inputNo" disabled/>
					</div>
					
				</div><!-- col -->
				<div class="col">
					<h4>가격정보</h4>
					<div class="checkPaymentBox">
						<span>상품금액</span>
							<div style="padding-left:120px; font-weight:bold; color:#000;">
								<input type="text" value="${sDbProductVo.mainPrice} " class="inputNo checkProductBoxPrice" disabled />원
							</div>
					</div>
					
					<h4>결제</h4>
					<div class="checkPaymentBox">
						<div class="row">
							<div class="col">
								<input class="btn btn-outline-primary paymentType form-control" value="카드결제">
								<button class="btn btn-outline-primary paymentType form-control" disabled>카카오페이</button>
							</div>
							<div class="col">
								<button class="btn btn-outline-primary paymentType form-control" disabled>네이버페이</button>
								<button class="btn btn-outline-primary paymentType form-control" disabled>삼성페이</button>
							</div>
						</div>
					</div>
					<h4>약관</h4>

					<textarea class="form-control" rows="5">
[1인 뷰티샵 시술 상품 결제 약관]

제 1 조 (목적)

본 약관은 1인 뷰티샵(이하 "회사"라 함)에서 제공하는 시술 상품(이하 "상품"이라 함)을 이용하는 고객(이하 "고객"이라 함)과 회사와의 관계에 대해 정함을 목적으로 합니다.

제 2 조 (약관의 효력과 변경)

본 약관은 고객이 상품을 결제하고 이에 동의하는 경우 효력을 발생합니다.
회사는 필요한 경우 약관을 변경할 수 있으며, 변경된 약관은 회사 홈페이지에 공지하거나 이메일 등의 방법으로 고객에게 통지합니다.

제 3 조 (상품 결제)

상품 결제는 고객이 회사 홈페이지에서 직접 이루어집니다.
상품 결제 시, 고객은 결제 수단(신용카드, 계좌이체 등)을 선택하고 결제 금액을 확인한 후 결제를 진행합니다.
상품 결제가 완료되면, 회사는 고객에게 결제 완료 안내 메일을 발송합니다.

제 4 조 (환불)

상품 결제 후, 고객이 상품 이용을 취소하고 환불을 요청하는 경우, 환불 규정에 따라 처리됩니다.
환불 규정은 상품 결제 시 홈페이지에 공지되며, 고객은 상품 결제 전에 규정을 충분히 확인해야 합니다.

제 5 조 (개인정보 보호)

회사는 고객의 개인정보를 보호하기 위해 최선을 다합니다.
회사는 고객의 개인정보를 수집, 이용, 제공하는 경우에는 고객의 동의를 받으며, 고객의 동의 없이는 제3자에게 개인정보를 제공하지 않습니다.
회사는 개인정보 처리와 관련한 법령을 준수하며, 개인정보 관리 책임자를 지정하여 개인정보 보호에 최선을 다합니다.

제 6 조 (면책조항)

회사는 천재지변, 전쟁, 테러, 서비스 공급자의 장애 등 불가항력적인 사유로 인해 서비스를 제공하지 못할 경우에는 이에 대한 책임을 지지 않습니다.
회사는 고객의 귀책사유로 인해 발생한 서비스 이용 장애나 손해에 대하여 책임을 지지 않습니다.

제 7 조 (분쟁해결)

본 약관과 관련된 분쟁은 회사와 고객간의 합의에 의해 원만히 해결할 수 있습니다.
회사와 고객간의 분쟁으로 인해 소송이 제기되는 경우, 관할 법원은 회사 소재지의 법원으로 합니다.

제 8 조 (준거법 및 관할법원)

본 약관은 대한민국법을 준거법으로 하며, 본 약관에 관하여 분쟁이 발생한 경우 대한민국 법령을 적용하며, 관할법원은 회사 소재지의 법원으로 합니다.
					</textarea>
					
					
					<input type="checkbox" id="agreement" name="agreement" required>&nbsp;<span>본인은 다음의 약관에 동의합니다</span>
					<button type="button" class="btn btn-dark mt-2" style="width:390px" onclick="requestPay()">예약하기</button>
				</div><!-- col -->
			</div>	<!-- row -->
			
			<input type="hidden" name="bookingStartDate" />
			<input type="hidden" name="bookingEndDate" />
			<input type="hidden" name="idx" value="${idx}" />
			<input type="hidden" name="mid" value="${sMid}"/>
			<input type="hidden" name="mid" value="${Name}"/>
			<input type="hidden" name="useTime" value="${bookingVo.useTime}"/>
			<input type="hidden" name="useTime" value="${bookingVo.tel}"/>
			<input type="hidden" name="useTime" value="${bookingVo.orderDate}"/>
			
		</form>
	</div><!-- bookCheckWrap -->	
</div><!-- loginWrap -->



</body>
</html>

