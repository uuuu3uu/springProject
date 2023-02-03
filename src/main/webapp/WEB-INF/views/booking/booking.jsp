<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
<jsp:include page="/WEB-INF/views/include/header_sub2_style.jsp"/>

<style>
	.bookingBox {
		border: 1px solid #ccc;
		border-radius: 8px;
		height: 1200px;
		padding: 30px; 
	}
	
	.container img {
		vertical-align: middle;
		height: 200px;
	}
		
	/* Position the image container (needed to position the left and right arrows) */
	.container {
	  position: relative;
	  width: 400px;
	  height: 600px;
	  
	}
	
	/* Hide the images by default */
	.mySlides {
	  display: none;
	}
	
	/* Add a pointer when hovering over the thumbnail images */
	.cursor {
	  cursor: pointer;
	}
	
	/* Next & previous buttons */
	.prev,
	.next {
	  cursor: pointer;
	  position: absolute;
	  top: 40%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: white;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	
	/* Position the "next button" to the right */
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover,
	.next:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	}
	
	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}
	
	/* Container for image text */
	.caption-container {
	  text-align: center;
	  background-color: #222;
	  padding: 2px 16px;
	  color: white;
	}
	
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Six columns side by side */
	.column {
	  float: left;
	  width: 16.66%;
	}
	
	/* Add a transparency effect for thumnbail images */
	.demo {
	  opacity: 0.6;
	}
	
	.active,
	.demo:hover {
	  opacity: 1;
	}
	</style>
	
	
	
	
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
<div class="loginWrap">
	<form name="myform"> <!-- 입력시켜 데이터베이스에 보내는..  -->
		<h2>reservation2</h2>
		<div class="bookingBox">
						
			<div class="Base JDmb5 JDtextColor--default m-5" mb="huge">
				<div class="Base JDtypho JDmb2 JDtext-size-h5 JDtextColor--default " mb="small" style="font-weight: 700; font-size: 24px;">
					퍼피클래스
				</div>
				<div class="Base JDflex JDmr---1 JDtextColor--default " mr="-1"></div>
				<div class="Base BuyPageDetailBaseRightTop__description JDtypho JDmb3 JDtext-size-small JDtextColor--default " style="white-space: pre-line;">
					사람과 함께 가족으로 사회구성원으로 살아가기 위해, 다양한 환경과 자극에 대한 올바른 사회화와 기본 매너 교육을 통해 보호자 리더십과 반려견 자신감을 키울 수 있습니다. 반려견을 정확하게 교육하고 관리를 하는 방법으로써 개춘기와 다른 문제 행동들을 예방할 수 있습니다.
				</div>
				<div class="Base JDtypho JDtext-align--right JDmb3 JDtext-size-large JDtextColor--default " style="font-weight: 600;">
					500,000원
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="container">
					  <div class="mySlides">
					    <div class="numbertext">1 / 6</div>
					    <img src="${ctp}/images/132.jpg" style="width:100%">
					  </div>
					
					  <div class="mySlides">
					    <div class="numbertext">2 / 6</div>
					    <img src="${ctp}/images/160.jpg" style="width:100%">
					  </div>
					
					  <div class="mySlides">
					    <div class="numbertext">3 / 6</div>
					    <img src="${ctp}/images/161.jpg" style="width:100%">
					  </div>
					    
					  <div class="mySlides">
					    <div class="numbertext">4 / 6</div>
					    <img src="${ctp}/images/162.png" style="width:100%">
					  </div>
					
					  <div class="mySlides">
					    <div class="numbertext">5 / 6</div>
					    <img src="${ctp}/images/163.png" style="width:100%">
					  </div>
					    
					  <div class="mySlides">
					    <div class="numbertext">6 / 6</div>
					    <img src="${ctp}/images/164.png" style="width:100%">
					  </div>
					    
					  <a class="prev" onclick="plusSlides(-1)">❮</a>
					  <a class="next" onclick="plusSlides(1)">❯</a>
					
					  <div class="caption-container">
					    <p id="caption"></p>
					  </div>
					
					  <div class="row">
					    <div class="column">
					      <img class="demo cursor" src="${ctp}/images/132.jpg" style="width:100%" onclick="currentSlide(1)" alt="The Woods">
					    </div>
					    <div class="column">
					      <img class="demo cursor" src="${ctp}/images/160.jpg" style="width:100%" onclick="currentSlide(2)" alt="Cinque Terre">
					    </div>
					    <div class="column">
					      <img class="demo cursor" src="${ctp}/images/161.jpg" style="width:100%" onclick="currentSlide(3)" alt="Mountains and fjords">
					    </div>
					    <div class="column">
					      <img class="demo cursor" src="${ctp}/images/162.png" style="width:100%" onclick="currentSlide(4)" alt="Northern Lights">
					    </div>
					    <div class="column">
					      <img class="demo cursor" src="${ctp}/images/163.png" style="width:100%" onclick="currentSlide(5)" alt="Nature and sunrise">
					    </div>    
					    <div class="column">
					      <img class="demo cursor" src="${ctp}/images/164.png" style="width:100%" onclick="currentSlide(6)" alt="Snowy Mountains">
					    </div>
					  </div>
					</div>
				</div><!-- cols -->
				<div class="col">달력</div>
				
			</div><!-- row -->
			
			
			
			
		</div>
	</form>
</div><!-- loginWrap -->



</body>

<script>
	let slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  let i;
	  let slides = document.getElementsByClassName("mySlides");
	  let dots = document.getElementsByClassName("demo");
	  let captionText = document.getElementById("caption");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	  captionText.innerHTML = dots[slideIndex-1].alt;
	}
</script>
		    

</html>
