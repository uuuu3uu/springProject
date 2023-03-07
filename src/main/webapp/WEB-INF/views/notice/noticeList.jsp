<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>memberLogin</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
  <jsp:include page="/WEB-INF/views/include/header_sub1_style.jsp"/>
  
  <script src="${ctp}/js/woo.js"></script>
  <script>
    'use strict';
 	</script>
</head>
<body>


<header>
  <jsp:include page="/WEB-INF/views/include/nav.jsp"/>
  <%-- <div class="sub_img">
  	<img src="${ctp}/images/sub6.jpg" alt="sub_img">
  </div> --%>
</header>

<section>
	<div class="section2" style="padding-left: 200px; padding-right: 200px;">
  	
	<jsp:include page="/WEB-INF/views/include/subNav.jsp"/>
  
  <article>
   	<p><br/></p>
		<div class="noticeWrap">
				<h2>Notice</h2>	
				
				<c:if test="${sLevel == 4}">
					<a href="${ctp}/notice/noticeInput?pag=${pag}&pageSize=${pageSize}"><input type="button" id="midBtn" class="btn btn-dark" value="글쓰기" onclick="idCheck()"/></a>
				</c:if>
				
				<table class="table"> 
					<thead class="thead-light text-center">
						<tr>
							<th style="width:12%">번호</th>
							<th style="width:55%">내용</th>
							<th>작성자</th>
							<th>작성일자</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach var="vo" items="${vos}">
							<tr>
								<td>${vo.idx}</td>
								<td><a href="${ctp}/notice/noticeContent?idx=${vo.idx}&pageSize=${pageSize}&pag=${pag}">${vo.title}</a></td>
								<td>${vo.name}</td>
								<td>${fn:substring(vo.WDate,0,10)}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		    
					   
		</div><!-- container -->
		
		<!-- 블록 페이지 시작 -->
		<div class="text-center">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pageVO.pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/notice/noticeList?pageSize=${pageVO.pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${pageVO.curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/notice/noticeList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(pageVO.curBlock)*pageVO.blockSize + 1}" end="${(pageVO.curBlock)*pageVO.blockSize + pageVO.blockSize}" varStatus="st">
		      <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/notice/noticeList?pageSize=${pageVO.pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/notice/noticeList?pageSize=${pageVO.pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/notice/noticeList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pageVO.pag < pageVO.totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/notice/noticeList?pageSize=${pageVO.pageSize}&pag=${pageVO.totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
		<!-- 블록 페이지 끝 -->
		<br/>
		<!-- 검색기 처리 시작  -->
		<div class="container text-center">
		  <form name="searchForm">
		    <b>검색 : </b>
		    <select name="part">
		      <option value="title">글제목</option>
		      <option value="name">글쓴이</option>
		      <option value="content">글내용</option>
		    </select>
		    <input type="text" name="searchString" id="searchString"/>
		    <input type="button" value="검색" onclick="searchCheck()" class="btn btn-secondary btn-sm"/>
		    <input type="hidden" name="pag" value="${pag}"/>
		    <input type="hidden" name="pageSize" value="${pageSize}"/>
		  </form>
		</div>
		<!-- 검색기 처리 끝  -->
		
		
		
		<p><br/></p>
  </article>
  </div>
</section>


</body>
</html>