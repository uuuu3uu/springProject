<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>memberLogin</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
  <jsp:include page="/WEB-INF/views/include/header_sub2_style.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="subMain">
	<div class="subTitle">
		<h1>Login</h1>
	</div>
</div>
<p><br/></p>
<div class="loginWrap">
	<form name="myform" method="post" class="was-validated"> <!-- 입력시켜 데이터베이스에 보내는..  -->
		<h2>Login</h2>
		<div class="form-group">
      <label for="mid">회원 아이디 *</label>
      <input type="text" class="form-control" name="mid" id="mid" value="${mid}" placeholder="아이디를 입력하세요" required />
      <div class="invalid-feedback">아이디 입력은 필수입니다</div>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 *</label>
      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" required />
      <div class="invalid-feedback">회원 비밀번호는 필수 입력사항입니다.</div> 
    </div>
    <br/>
    <div class="form-group" style="float: left;">
			<button type="submit" class="btn">로그인</button>
			<button type="button" onclick="location.href='${ctp}/member/memberJoin';" class="btn">회원가입</button>
			<a href="javascript:kakaoLogin();"><img src="${ctp}/images/kakao_login_medium.png" /></a><br/>	      
			<span><input type="checkbox" checked style="width:13px; margin-top:15px;"/>아이디 저장</span>
			<span>[<a href="#">아이디 찾기</a> / <a href="#" >비밀번호 찾기</a>]</span>
		</div>
		
  </form><!-- myform -->
			   
</div><!-- loginWrap -->
<p><br/></p>
</body>
</html>