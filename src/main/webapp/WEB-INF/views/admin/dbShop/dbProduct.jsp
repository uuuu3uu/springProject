<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbProduct.jsp(상품등록)</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <script>
  	'use strict';
    
    // 상품 등록하기전에 체크후 전송...
    function fCheck() {
    	let categoryMainCode = myform.categoryMainCode.value;
    	//let categoryMiddleCode = myform.categoryMiddleCode.value;
    	let categorySubCode = myform.categorySubCode.value;
    	//let productName = myform.productName.value;
    	let useTime = myform.useTime.value;
			let mainPrice = myform.mainPrice.value;
			let detail = myform.detail.value;
			let file = myform.file.value;	
			let ext = file.substring(file.lastIndexOf(".")+1);
			let uExt = ext.toUpperCase();
			let regExpPrice = /^[0-9|_]*$/;
			
			/* if(categorySubCode == "") {
				alert("상품 소분류(세분류)를 입력하세요!");
				return false;
			} 
			else if(product == "") {
				alert("상품명(모델명)을 입력하세요!");
				return false;
			} */
			if(categoryMainCode == "") {
				alert("1차메뉴를 선택하세요")
				return false;
			}
			else if(categorySubCode == "") {
				alert("2차메뉴를 선택하세요")
				return false;
			}	
			else if(useTime == "") {
				alert("사용시간을 등록하세요")
				return false;
			}
			else if(file == "") {
				//alert("상품 메인 이미지를 등록하세요");
				alert("상품 이미지를 등록하세요");
				return false;
			}
			else if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "JPEG") {
				alert("업로드 가능한 파일이 아닙니다.");
				return false;
			}
			else if(mainPrice == "" || !regExpPrice.test(mainPrice)) {
				alert("상품금액은 숫자로 입력하세요.");
				return false;
			}
			else if(detail == "") {
				alert("상품의 초기 설명을 입력하세요");
				return false;
			}
			else if(document.getElementById("file").value != "") {
				var maxSize = 1024 * 1024 * 10;  // 10MByte까지 허용
				var fileSize = document.getElementById("file").files[0].size;
				if(fileSize > maxSize) {
					alert("첨부파일의 크기는 10MB 이내로 등록하세요");
					return false;
				}
				else {
					myform.submit();
				}
			}
    }
    
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
    
    
  </script>
</head>
<body>
<br/>
<div class="container">
  <div id="product">
    <h3>상품등록</h3>
    <form name="myform" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="categoryMainCode">1차메뉴 </label>
        <select id="categoryMainCode" name="categoryMainCode" class="form-control" onchange="categoryMainChange()">
          <option value="">1차메뉴를  선택하세요</option>
          <c:forEach var="mainVo" items="${mainVos}">
          	<option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
          </c:forEach>
        </select>
      </div>
      <div class="form-group">         
        <label for="categorySubCode">2차메뉴 </label>
        <select id="categorySubCode" name="categorySubCode" class="form-control">
          <option value="">2차메뉴명 </option>
		  	  <c:forEach var="subVo" items="${SubVos}">
		  	    <option value=""></option>
		  	  </c:forEach>
        </select>
      </div>
      
      <div class="form-group">         
        <label for="useTime">사용시간</label>
        <select id="useTime" name="useTime" class="form-control">
        	<option value="">사용시간을 선택하세요</option>
		  	  <option value="0">0(회원권구매)</option>  
		  	  <option value="1">1시간</option>  
		  	  <option value="2">2시간</option>  
		  	  <option value="3">3시간</option>  
		  	  <option value="4">4시간</option>  
        </select>
      </div>
      
      <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
      <div class="form-group">
        <label for="file">이미지추가</label>
        <!-- <input type="file" name="file" id="file" class="form-control-file border" accept=".jpg,.gif,.png,.jpeg" required /> -->
        <input type="file" name="file" id="file" multiple="multiple" class="form-control-file border mb-2" accept=".jpg,.jpeg,.gif,.png,.zip,.ppt,.pptx,.hwp,.pdf,.txt"/>
        (업로드 가능파일:jpg, jpeg, gif, png)
      </div>
      <div class="form-group">
      	<label for="mainPrice">상품기본가격</label>
      	<input type="text" name="mainPrice" id="mainPrice" class="form-control" required />
      </div>
      <div class="form-group">
      	<label for="detail">상품기본설명</label>
      	<input type="text" name="detail" id="detail" class="form-control" required />
      </div>
      <!-- <div class="form-group">
      	<label for="content">상품상세설명</label>
      	<textarea rows="5" name="content" id="CKEDITOR" class="form-control" required></textarea>
      </div>
      <script>
		    CKEDITOR.replace("content",{
		    	uploadUrl:"${ctp}/dbShop/imageUpload",
		    	filebrowserUploadUrl: "${ctp}/dbShop/imageUpload",
		    	height:460
		    });
		  </script> -->
		  <input type="button" value="상품등록" onclick="fCheck()" class="btn btn-secondary"/> &nbsp;
    </form>
  </div>
</div>
<p><br/></p>
</body>
</html>