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
		height: 700px;
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
						
			<h2 style="text-align:center">Slideshow Gallery</h2>
			
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
			    <img src="${ctp}/images/132.jpg" style="width:100%">
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
			      <img class="demo cursor" src="${ctp}/images/132.jpg" style="width:100%" onclick="currentSlide(6)" alt="Snowy Mountains">
			    </div>
			  </div>
			</div>
			
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
			    
		</div>
	</form>
</div><!-- loginWrap -->



</body>
</html>
