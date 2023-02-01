<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div class="container-fluid">
	<div class="headerWrap">
		<div class="header-top">
			<p>Scroll Up and Down this page to see the parallax scrolling effect?.</p>
		</div><!-- header-top -->
		<div id="navbar" class="row">
			<div class="col-sm-4">
			  <a href="${ctp}/main.jsp">Home</a>
				<a href="${ctp}/gongList.gong">Notice</a>
			  <a href="#news">About</a>
			  <a href="#news">Service</a>
			  <a href="#contact">Contact-us</a>
			</div>		
			<div class="col-sm-4">
			  <div style="width: 200px; margin: -5px auto;"><a href="main.jsp"><img src="" style="width:200px;"/></a></div>
			</div>
			<div class="col-sm-4" style="justify-content: flex-end; display: flex">
				<c:if test="${sLevel == 1 || sLevel == 2 || sLevel == 3}">
					<a href="${ctp}/memMyAccount.mem" style="margin:25px 0px 0px 0px;" ><i style="font-size:24px; color:orange" class="fa">&#xf2bd;</i></a>
					<span style="margin:25px 15px 0 10px;"><font color="orange"><b>${sName}</b></font>님 환영합니다!</span>
				</c:if>
				<c:if test="${sLevel == 4}">
					<a href="${ctp}/adMain.ad" style="margin:25px 0px 0px 0px;" ><i style="font-size:24px; color:orange" class="fa">&#xf2bd;</i></a>
					<span style="margin:25px 15px 0 10px;"><font color="orange"><b>${sName}</b></font>님 환영합니다!</span>
				</c:if>
				<c:if test="${!empty sLevel}">
					<a href="${ctp}/bookCheck.book" style="margin-bottom:24px; border-bottom: 1px solid #000;">BOOK NOW</a>
				</c:if>
				<c:if test="${empty sLevel}">
					<a href="${ctp}/member/memberLogin" style="margin-bottom:24px; border-bottom: 1px solid #000;">BOOK NOW</a>
				</c:if>
				<c:if test="${empty sLevel}">
					<a href="${ctp}/member/memberLogin">로그인</a>
						<a href="${ctp}/member/memberJoin" style="margin-right: 20px">회원가입</a>
					</c:if>
				<c:if test="${!empty sLevel}">						
				  <a href="${ctp}/memLogout.mem">로그아웃</a>
				</c:if>
			</div>
		</div><!-- navbar -->
	</div><!-- headerWrap -->
<!-- 	<div class="subMain">
		<div class="subTitle">
			<h1>My account</h1>
		</div>
	</div> -->
		
</div><!-- container-fluid -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
