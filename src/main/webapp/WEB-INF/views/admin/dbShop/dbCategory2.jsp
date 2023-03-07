<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbCategory.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
  
  
  <jsp:include page="/WEB-INF/views/include/admin_style.jsp"></jsp:include>
  
  <script>
    'use strict';
    
    // 대분류 등록하기
    function categoryMainCheck() {
    	let categoryMainCode = categoryMainForm.categoryMainCode.value.toUpperCase();
    	let categoryMainName = categoryMainForm.categoryMainName.value;
    	if(categoryMainCode.trim() == "" || categoryMainName.trim() == "") {
    		alert("1차메뉴(코드)를 입력하세요");
    		categoryMainForm.categoryMainName.focus();
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/categoryMainInput",
    		data : {
    			categoryMainCode : categoryMainCode,
    			categoryMainName : categoryMainName
    		},
    		success:function(res) {
    			if(res == "0") alert("같은 상품이 등록되어있습니다.\n확인하시고 다시 입력하세요.");
    			else {
    				alert("1차메뉴가 등록되었습니다.");
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류");
    		}
    	});
    }
    
    // 대분류 삭제하기
    function categoryMainDelete(categoryMainCode) {
    	let ans = confirm("1차메뉴 항목을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/categoryMainDelete",
    		data : {categoryMainCode : categoryMainCode},
    		success:function(res) {
    			if(res == "0") {
    				alert("하위항목이 있어 삭제할수 없습니다.\n하위항목을 먼저 삭제해 주세요.");
    			}
    			else {
    				alert("1차메뉴 항목이 삭제 되었습니다.");
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류");
    		}
    	});
    }
    
 		// 중분류 등록하기
    function categorySubCheck() {
    	let categoryMainCode = categorySubForm.categoryMainCode.value;
    	let categorySubCode = categorySubForm.categorySubCode.value;
    	let categorySubName = categorySubForm.categorySubName.value;
    	if(categoryMainCode == "" || categorySubCode.trim() == "" || categorySubName.trim() == "") {
    		alert("중분류명(코드)를 입력하세요");
    		categorySubForm.categorySubName.focus();
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/categorySubInput",
    		data : {
    			categoryMainCode : categoryMainCode,
    			categorySubCode : categorySubCode,
    			categorySubName : categorySubName
    		},
    		success:function(res) {
    			if(res == "0") alert("같은 상품이 등록되어있습니다.\n확인하시고 다시 입력하세요.");
    			else {
    				alert("중분류가 등록되었습니다.");
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 중분류 삭제하기
    function categorySubDelete(categorySubCode) {
    	let ans = confirm("중분류항목을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/categorySubDelete",
    		data : {categorySubCode : categorySubCode},
    		success:function(res) {
    			if(res == "0") {
    				alert("하위항목이 있기에 삭제할수 없습니다.\n하위항목을 먼저 삭제해 주세요.");
    			}
    			else {
    				alert("중분류 항목이 삭제 되었습니다.");
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 소분류 입력창에서 대분류 선택치 중분류 자동 조회하기
    function categoryMainChange() {
    	let categoryMainCode = categorySubForm.categoryMainCode.value;
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/categorySubName",
    		data : {categoryMainCode : categoryMainCode},
    		success:function(res) {
    			let str = '';
    			str += '<option value="">중분류</option>';
    			for(let i=0; i<res.length; i++) {
    				str += '<option value="'+res[i].categorySubCode+'">'+res[i].categorySubName+'</option>';
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
	<div class="container-fluid m-0 p-0">
		
		<div class="searchBar row">
			<form name="myform">
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
	    </form>
	    
	    <div class="col text-right">
	    	<div class="mt-1"><img src="${ctp}/images2/profile.png" style="width: 32px;"/></div>
	    </div>
		    
		  </div><!-- searchBar -->
		  <div class="adminWarp">
			  <div class="adminTitle">
					<h3>상품 분류 등록하기(1차메뉴/2차메뉴)</h3>
				</div>
				
				<div class="adminWrap2">
					<div class="adminTitle">
						<h4>1차메뉴 관리(코드는 영문대문자1자리)</h4>
					</div>
					<div class="row adminSmallTitleGroup">
						<p class="col adminSmallTitle ml-2">* Category Code</p>
						<p class="col adminSmallTitle">* Category Name</p>
						<p class="col adminSmallTitle">* Create Category</p>
					</div>
					<div class="adminCategoryWrap">
						<form name="categoryMainForm">
							<div class="inputWrap row">
								<select name="categoryMainCode" id="categoryMainCode" class="col">
						      <option value="">1차메뉴코드</option>
						      <option value="A">A</option>
						      <option value="B">B</option>
						      <option value="C">C</option>
						      <option value="D">D</option>
						      <option value="E">E</option>
						      <option value="F">F</option>
						      <option value="G">G</option>
						      <option value="H">H</option>
						      <option value="I">I</option>
						      <option value="J">J</option>
						      <option value="K">K</option>
						    </select>

								<input type="text" class="form-control col" name="categoryMainName" placeholder="1차메뉴명을 입력하세요" size="12"/> &nbsp;
						    <input type="button" value="대분류등록" onclick="categoryMainCheck()" class="btn btn-primary btn-sm col"/>
					    </div>
					    <table class="table table-hover mt-3">
					    	<tr class="table text-center">
					        <th>1차메뉴코드</th>
					        <th>1차메뉴명</th>
					        <th>삭제</th>
		     			  </tr>
		     			  <c:forEach var="mainVo" items="${mainVos}">
					        <tr class="text-center">
					          <td>${mainVo.categoryMainCode}</td>
					          <td>${mainVo.categoryMainName}</td>
					          <td><input type="button" value="삭제" onclick="categoryMainDelete('${mainVo.categoryMainCode}')" class="btn btn-danger btn-sm"/></td>
					        </tr>
					      </c:forEach>
					    	<tr><td colspan="3" class="m-0 p-0"></td></tr>
					    </table>
						</form>
					</div><!-- adminCategoryWrap -->
					<br/>
					<form name="categorySubForm">
				    <h5>2차메뉴 관리(코드는 숫자2자리)</h5>
				    1차메뉴 선택
				    <select name="categoryMainCode">
							<option value="">1차메뉴명</option>
							<c:forEach var="mainVo" items="${mainVos}">
							  <option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
							</c:forEach>
				    </select> &nbsp;
				    2차메뉴코드(01,02,03,...)
				    <input type="text" name="categorySubCode" size="2" maxlength="2"/>, &nbsp;
				    2차메뉴명
				    <input type="text" name="categorySubName" size="8"/> &nbsp;
				    <input type="button" value="2차메뉴등록" onclick="categorySubCheck()" class="btn btn-primary btn-sm"/>
				    <table class="table table-hover m-3">
				      <tr class="table-dark text-dark text-center">
				        <th>2차메뉴코드</th>
				        <th>2차메뉴명</th>
				        <th>1차메뉴명</th>
				        <th>삭제</th>
				      </tr>
				      <c:forEach var="subVo" items="${subVos}">
				        <tr class="text-center">
				          <td>${subVo.categorySubCode}</td>
				          <td>${subVo.categorySubName}</td>
				          <td>${subVo.categoryMainName}</td>
				          <td><input type="button" value="삭제" onclick="categorySubDelete('${subVo.categorySubCode}')" class="btn btn-danger btn-sm"/></td>
				        </tr>
				      </c:forEach>
				      <tr><td colspan="4" class="m-0 p-0"></td></tr>
				    </table>
				  </form>
				</div><!-- adminWarp2 -->
		  
		  
		</div><!-- adminWarp -->
	</div><!-- container-fluid -->
	
</body>
</html>