<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
<jsp:include page="/WEB-INF/views/include/header_sub2_style.jsp"/>
<jsp:include page="/WEB-INF/views/include/sub_style.jsp"/>

	
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="subMain">
	<div class="subTitle">
		<h1>reservation1</h1>
	</div>
</div>
<p><br/></p>
<!-- MAIN (Center website) -->
<div class="subPageWrap">
	<form name="myform"> <!-- 입력시켜 데이터베이스에 보내는..  -->
		<h2>reservation2</h2>
		<div class="bookingBox">
						
			<div>
				<div style="font-weight: 700; font-size: 24px;">
					퍼피클래스
				</div>

				<div style="white-space: pre-line;">
					사람과 함께 가족으로 사회구성원으로 살아가기 위해, 다양한 환경과 자극에 대한 올바른 사회화와 기본 매너 교육을 통해 보호자 리더십과 반려견 자신감을 키울 수 있습니다. 반려견을 정확하게 교육하고 관리를 하는 방법으로써 개춘기와 다른 문제 행동들을 예방할 수 있습니다.
				</div>
				<div style="font-weight: 600;">
					500,000원
				</div>
			</div>
			
			<div class="row">
				<div class="col p-3 text-center">	
				  <!-- 상품메인 이미지 -->
				  <div>+${productVo.FSName}+
				    <img src="${ctp}/dbShop/product/${productVo.FSName}" width="100%"/>
				  </div>
				</div>
					
						
					
				</div><!-- cols -->
				<div class="col">달력
				</div>
					
			</div><!-- row -->
			
			
			
			
		</div>
	</form>
</div><!-- loginWrap -->



</body>

		    

</html>
