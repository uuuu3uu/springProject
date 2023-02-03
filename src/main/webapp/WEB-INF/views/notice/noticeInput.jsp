<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>memberLogin</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
  <jsp:include page="/WEB-INF/views/include/header_sub1_style.jsp"/>
  
  <script src="${ctp}/js/woo.js"></script>
  <script>
    'use strict';
		
    function fCheck() {
    	let title = myform.title.value;
      let content = myform.content.value;
    	
    	if(title.trim() == "") {
      		alert("게시글 제목을 입력하세요");
      		myform.title.focus();
    	}
    	else {
      	myform.submit();
      }
    }
 	</script>
</head>
<body>


<header>
  <jsp:include page="/WEB-INF/views/include/nav.jsp"/>
  <div class="sub_img">
  	<img src="images/sub6.jpg" alt="sub_img">
		
  </div>
</header>

<section>
	<div class="section2" style="padding-left: 200px; padding-right: 200px;">
  	
	<jsp:include page="/WEB-INF/views/include/subNav.jsp"/>
  
  <article>
   	<p><br/></p>
		<div class="gongInputWrap">
			<form name="myform" method="post"> 
				<h2>Notice</h2>
				<table class="table">
					<tr>
						<th style="width:12%">작성자</th>
						<td>${sName}</td>
					</tr>
					<tr>
						<th>글제목</th>
						<td>
							<input type="text" name="title" id="title" placeholder="제목을 입력하세요" class="form-control" style="border-color: #000 !important;" required/>
						</td>
					</tr>
					<tr>
					<th>글내용</th>
					<td><textarea rows="6" name="content" id="CKEDITOR" class="form-control" required></textarea></td>
					<script>
						CKEDITOR.replace("content",{
							height: 500,
							filebrowserUploadUrl:"${ctp}/imageUpload",
							uploadUrl : "${ctp}/imageUpload"
						});
					</script>
				</tr>
					<!-- <tr>
						<th>파일첨부</th>
						<td>
							<input type="file" name="fName" id="fName" class="form-control-file border mb-2" multiple />
						</td>
					</tr> -->
				</table>    
				
				<div class="text-center mb-2">
					<input type="button" value="글올리기" onclick="fCheck()" class="btn btn-secondary"/> &nbsp;
					<input type="reset" value="다시쓰기" class="btn btn-outline-secondary"/>&nbsp;
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/notice/noticeList?pag=${pag}&pageSize=${pageSize}';" class="btn btn-outline-secondary"/>&nbsp;
				</div>
				<input type="hidden" name="name" value="${sName}"/>
				<input type="hidden" name="mid" value="${sMid}"/>
		  </form><!-- myform -->
		   
		</div><!-- container -->
		<p><br/></p>
  </article>
  </div>
</section>


</body>
</html>