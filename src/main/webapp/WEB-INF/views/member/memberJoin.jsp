<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>memberLogin</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
  <jsp:include page="/WEB-INF/views/include/header_sub2_style.jsp"/>
  
  <script src="${ctp}/js/woo.js"></script>
  <script>
    'use strict';
    // 아이디와 닉네임 중복버튼을 클릭했는지를 확인하기위한 전역변수를 정의한다.(버튼클릭후에도 내용을 수정했다면 초기값은 0으로 셋팅해서 버튼을 누를수 있도록해야한다.)
    let idCheckSw = 0;
  	let nickCheckSw = 0;
    
    // 회원가입폼 체크후 서버로 전송(submit)
    function fCheck() {
    	// 폼의 유효성 검사~~~~
    	let regMid = /^[a-z0-9_]{4,20}$/;
      // let regPwd = /(?=.*[a-zA-Z])(?=.*?[#?!@$%^&*-]).{4,24}/;
      let regPwd = /(?=.*[0-9a-zA-Z]).{4,20}/;
      let regName = /^[가-힣a-zA-Z]+$/;
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      let regURL = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
      
      let submitFlag = 0;		// 전송체크버튼으로 값이 1이면 체크완료되어 전송처리한다.

      // 유효성검사를 위해 폼안의 내용들을 모두 변수에 담는다.
    	let mid = myform.mid.value;
    	let pwd = myform.pwd.value;
    	let name = myform.name.value;
    	let email1 = myform.email1.value;
    	let email2 = myform.email2.value;
      let email = email1 + '@' + email2;
      let tel1 = myform.tel1.value;
      let tel2 = myform.tel2.value;
      let tel3 = myform.tel3.value;
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
    	
    	
    	// 유효성 검사체크처리한다.(필수 입력필드는 꼭 처리해야 한다.)
    	if(!regMid.test(mid)) {
        alert("아이디는 영문 소문자와 숫자, 언더바(_)만 사용가능합니다.(길이는 4~20자리까지 허용)");
        myform.mid.focus();
        return false;
      }
      else if(!regPwd.test(pwd)) {
        alert("비밀번호는 1개이상의 문자와 특수문자 조합의 6~24 자리로 작성해주세요.");
        myform.pwd.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myform.name.focus();
        return false;
      }
      else if(!regEmail.test(email)) {
        alert("이메일 형식에 맞지않습니다.");
        myform.email1.focus();
        return false;
      }
      else {
    	  submitFlag = 1;
      }
    	
    	// 선택사항인 전화번호가 입력되어서 전송되었다면 전화번호형식을 체크해 준다.
      if(tel2 != "" || tel3 != "") {
	      if(!regTel.test(tel)) {
	        alert("전화번호 형식에 맞지않습니다.(000-0000-0000)");
	        myform.tel2.focus();
	        return false;
	      }
	      else {
	    	  submitFlag = 1;
	      }
      }
      else {	// 전화번호를 입력하지 않을시 DB에는 '010- - '의 형태로 저장하고자 한다.
    	  tel2 = " ";
    	  tel3 = " ";
    	  tel = tel1 + '-' + tel2 + '-' + tel3;
    	  submitFlag = 1;
      }
    	
  		// 전송전에 '주소'를 하나로 묶어서 전송처리 준비한다.
  		let postcode = myform.postcode.value + " ";
  		let roadAddress = myform.roadAddress.value + " ";
  		let detailAddress = myform.detailAddress.value + " ";
  		let extraAddress = myform.extraAddress.value + " ";
  		myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
  		
    	
  		// 전송전에 모든 체크가 끝나서 submitFlag가 1이되면 서버로 전송한다.
    	if(submitFlag == 1) {
    		if(idCheckSw == 0) {
    			alert("아이디 중복체크버튼을 눌러주세요!");
    			document.getElementById("midBtn").focus();
    		}
    		else {
	  			// 묶여진 필드(email/tel)를 폼태그안에 hidden태그의 값으로 저장시켜준다.
	  			myform.email.value = email;
	  			myform.tel.value = tel;
	  			
	  			myform.submit();
    		}
    	}
    	else {
    		alert("회원가입 실패~~");
    	}
    }
    
    // id 중복체크
    function idCheck() {
    	let mid = myform.mid.value;   	
    	if(mid.trim() == "" || mid.length<4 || mid.length>=20) {
    		alert("아이디를 확인하세요(아이디는 4~20자 이내)");
    		myform.mid.focus();
    		return false;
    	}
    	
    	$.ajax({
    		type	: "post",
    		url		: "${ctp}/member/memberIdCheck",
    		data	: {mid : mid},
    		success: function(res) {
					if(res =="1"){
						alert("이미 사용중인 아이디입니다");
						$("#mid").focus();
					}
					else {
						alert("사용 가능한 아이디입니다");
						idCheckSw = 1;
					}
				},
				error	: function() {
					alert("전송오류");
				}
    	});
    }
    
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="subMain">
	<div class="subTitle">
		<h1>Sing up</h1>
	</div>
</div>
<p><br/></p>
<div class="joinWrap">
	<form name="myform" method="post" class="was-validated"> <!-- 입력시켜 데이터베이스에 보내는..  -->
		<h2>Sign up</h2>
		<div class="form-group">
      <label for="mid">아이디 <input type="button" id="midBtn" class="btn p-0 m-0" value="아이디 중복체크" onclick="idCheck()"/></label>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="4~20자리 / 영문, 숫자, '_' 사용가능" required autofocus/>
      <div class="invalid-feedback">아이디 입력은 필수입니다</div>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 </label>
      <input type="password" class="form-control" id="pwd" placeholder="4자리 숫자" name="pwd" required /><!-- 8~16자리 대소문자,숫자,특수문자 조합 -->
    </div>
    <div class="form-group">
      <label for="name">성명 </label>
      <input type="text" value="asdf" class="form-control" id="name" placeholder="이름 입력" name="name" required />
    </div>
    
<!--     <div class="form-group">
      <label for="tel">전화번호 </label>
      <input type="text" class="form-control" id="tel" placeholder="'-'빼고 숫자만 입력" name="tel" required />
    </div> -->
    
    <div class="form-group">
      <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <label for="tel1" style="width:150px">전화번호 </label>
			      <select name="tel1" class="custom-select" style="border-color:#000;">
					    <option value="010" selected>010</option>
					    <option value="02">서울</option>
					    <option value="031">경기</option>
					    <option value="032">인천</option>
					    <option value="041">충남</option>
					    <option value="042">대전</option>
					    <option value="043">충북</option>
			        <option value="051">부산</option>
			        <option value="052">울산</option>
			        <option value="061">전북</option>
			        <option value="062">광주</option>
					  </select><span style="margin:0 10px">-</span>
	      </div>
	      <input type="text" value="1234" name="tel2" size=4 maxlength=4 class="form-control" required/><span style="margin:0 10px" >-</span>
	      <input type="text" value="1234" name="tel3" size=4 maxlength=4 class="form-control" required/>
	    </div> 
    </div>
   
    <div class="form-group">
      <label for="birthday">생년월일</label>
      <input type="date" name="birthday" value="<%=java.time.LocalDate.now() %>" class="form-control" style="border-color:#000;"/>
    </div>
	  
	  
	  <div class="form-group">
      <label for="gender">성별 </label> <br/>
	    <input type="radio" class="form" name="gender" value="여자" checked>여자 &nbsp;&nbsp;&nbsp;
	    <input type="radio" class="form" name="gender" value="남자">남자  
    </div>
    
    <div class="form-group">
      <label for="email1">Email address </label>
				<div class="input-group mb-3">
				  <input type="text" value="asdf" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
				  <div class="input-group-append">
				    <select name="email2" class="custom-select" style="border-color:#000;">
					    <option value="naver.com" selected>naver.com</option>
					    <option value="hanmail.net">gmail.com</option>
					    <option value="hotmail.com">daum.net</option>
					    <option value="gmail.com">nate.com</option>
					    <option value="nate.com">outlook.com</option>
					  </select>
				  </div>
				</div>
	  </div>
	  
	  <div class="form-group">
      <label for="address">주소</label>
			<input type="hidden" name="address" id="address">
			<div class="input-group mb-1">
				<input type="text" value="1234" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control" required>
				<div class="input-group-append">
					<input type="button" id="findWoo" class="btn p-0 m-0" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
				</div>
			</div>
			<input type="text" value="asdf" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1" required>
			<div class="input-group mb-1">
				<input type="text" value="asdf" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
				<div class="input-group-append">
					<input type="text" value="asdf" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
				</div>
			</div>
    </div>
	  
	  <div class="form-group">
        <label for="path">어나더유를 알게 된 경로</label><br/>	
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="인스타그램" name="path" checked/>인스타그램
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="페이스북" name="path"/>페이스북
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="카카오톡 친구" name="path"/>카카오톡 친구
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="지인추천" name="path"/>지인추천
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="검색을 통해" name="path"/>검색을 통해
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="기타" name="path"/>기타
			  </label>
			</div>
    </div><!-- form-group (경로) -->
    <div class="form-group mt-5 mb-5">
    	 
	    <input type="button" class="btn btn-sm" value="회원가입" onclick="fCheck()"/> &nbsp;
	    <input type="reset" class="btn btn-sm" value="다시작성"/> &nbsp;
	    <input type="button" class="btn btn-sm" value="돌아가기" onclick="location.href='${ctp}/member/memLogin';"/>
    </div>
    
		<input type="hidden" name="tel"/>
    <input type="hidden" name="email"/>
  </form><!-- myform -->
			   
</div><!-- container -->
<p><br/></p>
</body>
</html>