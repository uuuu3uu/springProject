<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>adContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
  
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  
  <jsp:include page="/WEB-INF/views/include/admin_style.jsp"></jsp:include>
  
  <script>
    'use strict';
    
    function SearchCheck() {
    	let searchString = $("#searchString").val();
    	let part = $("#part").val();
    	if(searchString.trim() == "") {
    		alert("검색어를 입력하세요");
    		searchForm.searchString.focus();
    	}
    	else {
    	  myform.submit();
      }
    }
    
    function delCheck(idx) {
    	let ans = confirm("탈퇴처리 하시겠습니까?");
    	if(ans) {	
    		let query = {
    			idx : idx,
    			pag : ${pageVo.pag} 
        } 
    		
    		$.ajax({
        		type  : "get",
        		url   : "${ctp}/admin/adminMemberDel",
        		data  : query,
        		success:function() {
        			alert("삭제되었습니다");
        			location.reload();
        		},
        		error : function() {
        			alert("전송 오류");
        		}
        });		
    	} 	
    }
    
    function searchCheck(e) {
    	let ans = confirm("등급을 수정하시겠습니까?");
    	if(!ans) return false;
    	
    	let items = e.value.split("/");
    	
    	let query = {
    			level : items[0],
    			idx : items[1]
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/admin/member/adminMemberLevel",
    		data  : query,
    		success:function(res) {
    			if(res == 1) alert("등급이 수정되었습니다.");
    			else alert("등급 수정 실패");
    			location.reload();
    		},
    		error : function() {
    			alert("전송 오류");
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
					<h3>회원리스트 </h3>
				</div>
				
				<div class="adminWrap2">
					<table class="table table-borderless table-hover text-center">
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>성명</th>
							<th>성별</th>
							<th>전화번호</th>
							<th>적립금</th>
							<th>노쇼</th>
							<th>등급</th>
							<th>탈퇴유무</th>
							<th> </th>
						</tr>
					 	
					 	<c:forEach var="vo" items="${vos}" varStatus="st">
					 		<tr>
					 			<td>${vo.idx}</td>			<!-- 겟방식으로 ${vo.mid}의 값을 mid라는 이름의 변수로 memInfor.mem 로 보내준다   -->
					 			<td>${vo.mid}</td>
					 			<%-- <td><button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#myModal" onclick="memberInfor()">${vo.name}</button></td> --%>
								<td>${vo.name}</td>
					 			<td>${vo.gender}</td>
					 			<td>${vo.tel}</td>
					 			<td>${vo.point}</td>
					 			<td>${vo.noShow}</td>
					 			<td>
					 				<form name="levelForm">
					 					<select name="level" class="selectD" onchange="searchCheck(this)">
					 						<option value="0/${vo.idx}" <c:if test="${vo.level==0}">selected</c:if>>비회원</option>
					 						<option value="1/${vo.idx}" <c:if test="${vo.level==1}">selected</c:if>>일반</option>
					 						<option value="2/${vo.idx}" <c:if test="${vo.level==2}">selected</c:if>>우수</option>
					 						<option value="3/${vo.idx}" <c:if test="${vo.level==3}">selected</c:if>>VIP</option>
					 						<option value="4/${vo.idx}" <c:if test="${vo.level==4}">selected</c:if>>관리자</option>
					 					</select>
					 					
					 					<%-- <input type="hidden" name="idx" value="${vo.idx}"/> --%>
					 				</form>
					 			</td>	
					 			<td>
					 				<c:if test="${vo.userDel=='OK'}"><a href="#"><font color="red">탈퇴신청</font></a></c:if>
					 				<c:if test="${vo.userDel!='OK'}">활동중</c:if>
					 			</td>
					 			<td>
					 				<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${ctp}/admin/member/adminMemberInfor?name=${vo.name}&tel=${vo.tel}&pag=${pageVo.pag}&pageSize=${pageVo.pageSize}';">더보기 +</button>
					 			</td>
					 		</tr>
						</c:forEach>
						<tr><td colspan="10" class="m-0 p-0"></td></tr>
					</table>
					
					<!-- 블록 페이지 시작 -->
					<div class="text-center">
					  <ul class="pagination justify-content-center">
					    <c:if test="${pageVo.pag > 1}">
					      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/member/adminMemberList?pag=1">첫페이지</a></li>
					    </c:if>
					    <c:if test="${pageVo.curBlock > 0}">
					      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/member/adminMemberList?pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}">이전블록</a></li>
					    </c:if>
					    <c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
					      <c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
					    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/admin/member/adminMemberList?pag=${i}">${i}</a></li>
					    	</c:if>
					      <c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
					    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/member/adminMemberList?pag=${i}">${i}</a></li>
					    	</c:if>
					    </c:forEach>
					    <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
					      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/member/adminMemberList?pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}">다음블록</a></li>
					    </c:if>
					    <c:if test="${pageVo.pag < pageVo.totPage}">
					      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/member/adminMemberList?pag=${pageVo.totPage}">마지막페이지</a></li>
					    </c:if>
					  </ul>
					</div>
					<!-- 블록 페이지 끝 -->
					
					
				</div><!-- adminWarp2 -->
		  
		  
		</div><!-- adminWarp -->
	</div><!-- container-fluid -->
	
	
	<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-scrollable modal-xl">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <div class="modal-title pl-3">
          	<h3>회원 상세 정보</h3>    	
          </div>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
 
				
				<div class="modal-body modalWrap">
				  <div class="adminTitle">
						<h4>고객정보</h4>
					</div>
					
					<div class="modalTableWrap">
						<table class="table table-borderless table-hover text-center">
							<tr>
								<th>아이디</th>
								<th>성명</th>
								<th>성별</th>
								<th>생일</th>
								<th>전화번호</th>
								<th>주소</th>
							</tr>
						 	
						 	<c:forEach var="vo" items="${vos}" varStatus="st">
						 		<tr>
						 			<td>${vo.mid}</td>
						 			<td>${vo.name}</td>
						 			<td>${vo.gender}</td>
						 			<td>${vo.birthday}</td>
						 			<td>${vo.tel}</td>
						 			<td>${vo.address}</td>
						 			
						 		</tr>
							</c:forEach>
							<tr><td colspan="9" class="m-0 p-0"></td></tr>
						</table>
					</div><!-- modalTableWrap -->
	       </div><!--modalWrap -->
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
	
	
	
</body>
</html>