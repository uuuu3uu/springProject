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

.row {
  margin: 10px -16px;
} 

/* Add padding BETWEEN each column */
.row,
.row > .column {
  padding: 8px;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  display: none; /* Hide all elements by default */
}

/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
.content {
  background-color: white;
  border-bottom: 1px solid #363636;
}
.content img:hover {
	opacity: 80%;
	cursor: pointer;
}

/* The "show" class is added to the filtered elements */
.show {
  display: block;
}

/* Style the buttons */
.btn {
  border: none;
  outline: none;
  padding: 12px 16px;
  
  background-color: white;
  cursor: pointer;
  border: 1px solid #363636;
}

.btn:hover {
  background-color: #ddd;
  
}

.btn.active {
  background-color: #666;
  color: white;
}

.pMenuBox {
	margin: 21px 0;
}

.pMenu {
	  font-family: "Poppins", "Lato", "Spoqa Han Sans Neo", sans-serif;
    height: 35px;
    font-size: 24px;
    overflow: hidden;
}


</style>

<script>
	
	function filterSelection(c) {
	  var x, i;
	  x = document.getElementsByClassName("column");
	  if (c == "all") c = "";
	  for (i = 0; i < x.length; i++) {
	    w3RemoveClass(x[i], "show");
	    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
	  }
	}
	
	function w3AddClass(element, name) {
	  var i, arr1, arr2;
	  arr1 = element.className.split(" ");
	  arr2 = name.split(" ");
	  for (i = 0; i < arr2.length; i++) {
	    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
	  }
	 
	}
	
	function w3RemoveClass(element, name) {
	  var i, arr1, arr2;
	  arr1 = element.className.split(" ");
	  arr2 = name.split(" ");
	  for (i = 0; i < arr2.length; i++) {
	    while (arr1.indexOf(arr2[i]) > -1) {
	      arr1.splice(arr1.indexOf(arr2[i]), 1);     
	    }
	  }
	  element.className = arr1.join(" ");
	}
	
	$(document).ready(function() {		// 본문을 먼저 읽고 오세여
		// Add active class to the current button (highlight it)
		var btnContainer = document.getElementById("myBtnContainer");
		var btns = btnContainer.getElementsByClassName("btn");
		for (var i = 0; i < btns.length; i++) {
		  btns[i].addEventListener("click", function(){
		    var current = document.getElementsByClassName("active");
		    current[0].className = current[0].className.replace(" active", "");
		    this.className += " active";
		  });
		}
		filterSelection("all")
	});
</script>

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
		<h2>reservation</h2>
		<div class="main">
			<div id="myBtnContainer">
			  <button type="button" class="btn active" onclick="filterSelection('all')"> #전체</button>
			  <button type="button" class="btn" onclick="filterSelection('nature')"> #속눈썹</button>
			  <button type="button" class="btn" onclick="filterSelection('cars')"> #피부</button>
			  <button type="button" class="btn" onclick="filterSelection('people')"> #반영구</button>
			</div>
			
			<!-- Portfolio Gallery Grid -->
				<div class="row">
				  <div class="column nature" onclick="location.href='booking';">
				    <div class="content">
				      <img src="${ctp}/images/161.jpg" alt="Mountains" style="width:100%">
				      <div class="pMenuBox">
				      	<p class="pMenu">벨벳모</p>
				      	<p>풍성하면서도 가벼운 100% 고급 벨벳모로 눈에 이물감과 피로감이 적습니다</p>
				      </div>
				    </div>
				  </div>
				  <div class="column nature">
				    <div class="content">
				    	<img src="${ctp}/images/161.jpg" alt="Mountains" style="width:100%">
				      <div class="pMenuBox">
				      	<p class="pMenu">벨벳모1</p>
				      	<p>풍성하면서도 가벼운 100% 고급 벨벳모로 눈에 이물감과 피로감이 적습니다</p>
				      </div>
				    </div>
				  </div>
				  <div class="column nature">
				    <div class="content">
					    <img src="${ctp}/images/161.jpg" alt="Mountains" style="width:100%">
				      <div class="pMenuBox">
				      	<p class="pMenu">벨벳모2</p>
				      	<p>풍성하면서도 가벼운 100% 고급 벨벳모로 눈에 이물감과 피로감이 적습니다</p>
				      </div>
				    </div>
				  </div>
				  
				  <div class="column cars">
				    <div class="content">
					      <img src="${ctp}/images/161.jpg" alt="Mountains" style="width:100%">
				      <div class="pMenuBox">
				      	<p class="pMenu">벨벳모3</p>
				      	<p>풍성하면서도 가벼운 100% 고급 벨벳모로 눈에 이물감과 피로감이 적습니다</p>
				      </div>
				    </div>
				  </div>
				  <div class="column cars">
				    <div class="content">
					    <img src="${ctp}/images/161.jpg" alt="Mountains" style="width:100%">
				      <div class="pMenuBox">
				      	<p class="pMenu">벨벳모4</p>
				      	<p>풍성하면서도 가벼운 100% 고급 벨벳모로 눈에 이물감과 피로감이 적습니다</p>
				      </div>
				    </div>
				  </div>
				  <div class="column cars">
				    <div class="content">
				    	<img src="${ctp}/images/161.jpg" alt="Mountains" style="width:100%">
				      <div class="pMenuBox">
				      	<p class="pMenu">벨벳모5</p>
				      	<p>풍성하면서도 가벼운 100% 고급 벨벳모로 눈에 이물감과 피로감이 적습니다</p>
				      </div>
				    </div>
				  </div>
				
				  <div class="column people">
				    <div class="content">
				      <img src="${ctp}/images/161.jpg" alt="Mountains" style="width:100%">
				      <div class="pMenuBox">
				      	<p class="pMenu">벨벳모6</p>
				      	<p>풍성하면서도 가벼운 100% 고급 벨벳모로 눈에 이물감과 피로감이 적습니다</p>
				      </div>
				    </div>
				  </div>
				  <div class="column people">
				    <div class="content">
					    <img src="${ctp}/images/161.jpg" alt="Mountains" style="width:100%">
				      <div class="pMenuBox">
				      	<p class="pMenu">벨벳모7</p>
				      	<p>풍성하면서도 가벼운 100% 고급 벨벳모로 눈에 이물감과 피로감이 적습니다</p>
				      </div>
				    </div>
				  </div>
				  <div class="column people">
				    <div class="content">
					    <img src="${ctp}/images/161.jpg" alt="Mountains" style="width:100%">
				      <div class="pMenuBox">
				      	<p class="pMenu">벨벳모8</p>
				      	<p>풍성하면서도 가벼운 100% 고급 벨벳모로 눈에 이물감과 피로감이 적습니다</p>
				      </div>
				    </div>
				  </div>
				<!-- END GRID -->
				</div>
			<!-- END MAIN -->
		</div><!-- main -->
	</form>
</div><!-- loginWrap -->



</body>
</html>
