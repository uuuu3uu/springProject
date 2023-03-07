<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	body {
		margin: 0;
		background-color: #fff;
		font-family: 'Noto Sans KR', sans-serif !important;
		font-size: 16px;
    /* line-height: 1.625em; */
    /* font-weight: 400; */
    color: #6f6f6f;
    /* letter-spacing: .02em; */
	}
	.container-fluid {
		margin: 0;
		padding: 0;
	}
	.subMain {
		width: 100%;
		
		
	}
	.header-top {
		border-color: rgba(111,111,111,0.1);
	  border-bottom-width: 1px;
	  border-style: solid;
	  height: 30px;
	}
	.header-top p {
		text-align: center;
		color: #5d5d5d;
		font-size: 15px;
	}
	#navbar {
		background-color: #fff;
		width: 100%;
		height: 95px;
		transition: top 0.4s;
		margin : 0;
		padding: 10px 50px;
		/* border: 1px solid red; */
	}
	#navbar a {
	  display: block;
	  float: left;
	  color: #000;
	  margin: 25px 0 0 20px;
	  text-decoration: none;
	  font-size: 15px;
	}
	#navbar a:hover {
		border-bottom: 1px solid #000;	  
	}
	.subMain h1 {
		/* font-family: Cormorant,serif; */
		letter-spacing: .01em; 
		color: #363636;
	  font-size: 54px;
	  line-height: 1.07em;
	  font-weight: 600;
	  padding: 60px 0 0 200px;
	}
	
	.loginWrap {
	  	margin: 100px 300px;
	  }
	.loginWrap h2 {
		
    letter-spacing: .01em;
    color: #363636;
    font-size: 42px;
    line-height: 1.1667em;
    font-weight: 600;
    margin: 25px 0;
	}
	.loginWrap input {
		background-color: transparent;
    border: none;
    border-bottom: 1px solid rgba(54,54,54,.7) !important;
    border-radius: 0;
    box-sizing: border-box;
    outline: 0;
    cursor: text;
    /* width: 600px; */
	}
	.form-group .btn {
		border-radius: 0px; 
		background-color: #363636;
    color: #fff;  
		padding: 12px 45px 11px;
    cursor: pointer;
    border: 1px solid transparent;
    
	}
	
	
	/* 회원가입 */
	#midBtn {
		width: 140px;
    height: 35px;
    font-size: 13px;
    border-radius: 3px;
	}
	.form-control.is-invalid, .was-validated .form-control:invalid {		/* 통째로 먹는듯 */
    border-color: #000;
	}
	
	.joinWrap {
	  	margin: 100px 300px;
	  }
	.joinWrap h2 {
		font-family: Cormorant,serif;
    letter-spacing: .01em;
    color: #363636;
    font-size: 42px;
    line-height: 1.1667em;
    font-weight: 600;
    margin: 25px 0;
	} 
	
	.joinWrap input {
		background-color: transparent;
    border: none;
    border-bottom: 1px solid rgba(54,54,54,.7) !important;
    border-radius: 0;
    box-sizing: border-box;
    outline: 0;
    cursor: text;
	}
	#findWoo {
		width: 140px;
    height: 35px;
    font-size: 13px;
    border-radius: 3px;
	}
	
	/* 아이디 중복 체크 */
	.idCheckWrap {
		margin: 10px;
	}
	.idCheckWrap h2 {
		font-family: Cormorant,serif;
    letter-spacing: .01em;
    color: #363636;
    font-size: 42px;
    line-height: 1.1667em;
    font-weight: 600;
    margin: 25px 0;
	}
	
	/* 예약메뉴 */
	.bookingMenuWrap {
		margin: 100px 250px;
	}
	
	.gallery {
		max-width: 1300px;
		margin: 20px 5px;
		display: flex;
    flex-wrap: wrap;
	}
	
	/* Content */
	.content {
	  background-color: white;
	  width:340px;
	  border-bottom: 1px solid #aaa;
	  
	  
	}
	.content img:hover {
		opacity: 80%;
		cursor: pointer;
	} 
	.pCategoryBox {
		margin: 21px 0;
	}
	
	.pMenuSubName {
	  font-size: 24px;    
	}
	
	.pMenuDetail {
	
	}
	
	/* 예약하기 */
	.bookCheckWrap {
		margin: 100px 16%;
		
		border: 1px solid #eee;
		border-radius: 6px;
		max-width: 927px;
		min-width: 490px;
		padding: 30px 50px;
	}
	.bookCheckWrap h2 {
		font-family: Cormorant,serif;
    letter-spacing: .01em;
    color: #363636;
    font-size: 42px;
    line-height: 1.1667em;
    font-weight: 600;
    margin: 25px 0;
	}
	
	.subTitle {
		margin: 20px 40px;
	}
	
	.smallThumbLine {
		margin: 5px 0px;
		max-width: 400px;
		text-align: center;
	}
	
	.smallThumbLine:hover {
		cursor: pointer;
	}
	
	.datePick {
  	width: 46px;
    height: 46px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    font-size: 15px;
    justify-content: center;
  }
  
  .recentDate {
  	width: 46px;
    height: 46px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    font-size: 15px;
    justify-content: center;
  	color: #ccc;
  }
  
 
  
  
  .datePick:hover {
  	cursor: pointer;
  	background-color: #eee;
  }
  .datePickClick {
  	background-color: #6192b6;
  	color: #fff;
  }
  
  .bookCheck-col-inner {
  	width: 390px;
  }
  
  .hourPick {
  	border-radius: 0.3em;
  	border:none;
  	background-color: #23272b;
  	color: #fff;
  	height: 35px;
  	
  }
  
  .hourPickNo {
  	border-radius: 0.3em;
  	border:none;
  	background-color: #ccc;
  	color:#fff;
  	height: 35px;
  	
  }
  .hourPickNo:hover {
  	color:#fff;
  	
  }
  
  .hourPickClick {
  	border-radius: 0.3em;
  	border:none;
  	background-color: #6192b6;
  	height: 35px;
  	
  }
  
  .checkProductBox {
  	border: 1px solid #eee;
    border-radius: 10px;
    padding: 20px;
    width: 390px;
    margin-bottom: 30px;
    
  }
  
  .selectSubName {
  	font-size: 18px;
  	font-weight: bold;
  	
  }
  .selectPrice {
  	font-size: 18px;
  	font-weight: bold;
		color: #000;
		text-align: right;
  }
  
  .checkPaymentBox {
  	border: 1px solid #eee;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 30px;
  }
  
  .inputNo {
  	border: none;
  	background-color: #fff;
  }
  .rightPrice {
  	text-align: right;
  }
  
  .rightTime {
  	text-align: right;
  	padding-left: 30px;
  }
  
  .paymentBox {
  	width: 390px;	
  }
  
  .checkProductBoxPrice {
  	text-align: right;
  	font-weight: bold;
  	color: #000;
  	
  }
  
	.paymentType {
		margin: 3px;
		
	}
	
	.paymentSmallTitle {
		margin-bottom: 4px;
		font-size: 14px;
		
	}
	
	/* 
	.input-group input {
		magin: 10px;
	}
	.input-group .btn {
		width: 150px;
	}
	.input-group .btn:hover { 
		background-color:#aaa;
	}
	.input-group .btnOk {
		top: 100px;
		width: 300px;
	} */
	/* my account */
	.myAccountWrap {
		margin: 100px 300px;
	}
	.myAccountWrap h2 {
		font-family: Cormorant,serif;
    letter-spacing: .01em;
    color: #363636;
    font-size: 42px;
    line-height: 1.1667em;
    font-weight: 600;
    margin: 25px 0;
	}
	
	
	
	.box-container {
		margin-bottom: 60px;
    border: 1px solid #ddd;
    /* padding: 40px 150px 22px;  */
    background-color: #fff;
  	color: #000;
	}
	
	.box-container-inner {
		display: flex;	
		flex-wrap: nowrap;
		margin: 20px 60px;
	}
	
	.level-circle {
    
    width: 120px;
    height: 120px;
    padding: 30px 0;
    border-radius: 50%;
    border: 6px solid #d8628f;
    box-sizing: border-box;
    color: #222;
    text-align: center;
	}
	
	.box-content {
		margin-left: 150px;
		
	}
	
	
	.vl {
  border-left: 1px solid #ccc;
  height: 120px;
 
  
  }
  
  .box-content1 .table td{
  	border-top: none;
  }
 	
 	.box-container-inner2 {
 		margin: 43px;
 	}
 	
 	/* 회원정보 수정하기 */
 	.UpdateWrap {
 		margin: 100px 300px;
	}
	.UpdateWrap h2 {
		font-family: Cormorant,serif;
    letter-spacing: .01em;
    color: #363636;
    font-size: 42px;
    line-height: 1.1667em;
    font-weight: 600;
    margin: 25px 0;
	}
	
	.form-group input {
		margin: 7px;
	}
	
	/* booking 예약페이지 */
	.bookingCalendar {
		border:1px solid #eee;
		border-radius:10px;
		padding:20px;
	}
	
	.bookingCalendar table {
		margin: 0px;
	}
	
	.bookingCalendar_tr {
		background-color:#eee
		
	}
	
	
	/* 예약완료 페이지 */
	.bookCheckFinishWrap {
		margin: 100px 300px
	}
	.bookCheckFinishWrap h2 {
		font-family: Cormorant,serif;
    letter-spacing: .01em;
    color: #363636;
    font-size: 42px;
    line-height: 1.1667em;
    font-weight: 600;
    margin: 25px 0;
	}
	
	
	
</style>