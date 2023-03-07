<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav>
	<div class="search-container mb-5">
    <form action="/action_page.php">
      <input type="text" placeholder="Search.." name="search" style="width:200px;">
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
      <a type="submit"><i class="material-icons">&#xe8b6;</i></a>
    </form>
  </div>
  <h4>Categories</h4>
  <ul>
    <li><a href="#">공지사항</a></li>
    <li><a href="#">1:1문의게시판</a></li>
    <li><a href="#"></a></li>
  </ul>
</nav>
