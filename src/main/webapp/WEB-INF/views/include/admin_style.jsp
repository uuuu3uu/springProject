<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style> 
	body {
		background-color: #fff;
		font-family: 'Noto Sans KR', sans-serif !important;
		font-size: 16px;
	}
	
	.adminTitle {
		padding: 20px 0 10px 10px;
	}
	
	.adminWarp {
		padding: 25px 140px 0 65px;
	}
	
	.adminWrap2 {
		border: 1px solid #ddd;
		border-radius: 0.5em;
		
		padding: 20px 25px;

		
	}
	
	.searchBar {
		padding: 19px 55px 14px 56px;
		border-bottom: 1px solid #eee;
		
	}
	
	/* 홈 */
	.menuBox {
		background-color: #fff;
		border: 1px solid #eee;
		border-radius: 0.8em;
		height: 100px;
		margin: 10px;
	}
	
	.menuBox table{
		margin: 20px 0 0 5px;
		padding: 0px;
	}
	
	.menuBox table td{
		padding-left: 20px;
		font-size: 14px;
	}
	
	.menuBox img {
		 width: 45px;	
	}
	
	/* 어드민멤버 */
	
	
	.adminWrap2 table tr {
		border-bottom:1px solid #ddd;"	
	}
	
	.adminWrap2 table td {
		border-bottom:1px solid #eee;"	
	}
	
	.selectD {
		width: 80px;
		height: 28px;
		border: 1px solid #C4C4C4;
		border-radius: 5px;
	}
	
	.part {
		border: 1px solid #C4C4C4;
		border-radius: 5px;
	}
	
	
	
	.input-group>.input-group-prepend:not(:first-child)>.input-group-text {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
   }
   
   .input-group>.form-control:not(:last-child) {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
	}
	
	@media screen and (min-width: 200px) { 
    .modal:before {
	    display: inline-block;
	    vertical-align: middle;
	    content: " ";
	    height: 10%;
    }
	}
	
	/* 어드민 멤버 인포 */
	.adminInfor {
		font-size: 14px;
	}
	
	/* 모달 */
	.modalWrap {
		padding: 15px;
	}
	
	.modalTableWrap {
		border: 1px solid #ddd;
		border-radius: 0.5em;
		
		padding: 15px;		
	}
	.modalTableWrap table tr {
		border-bottom:1px solid #ddd;"	
	}
	
	.modalTableWrap table td {
		border-bottom:1px solid #eee;"	
	}
	
	/* table 이미지 */
	.tableImgWrap {
		border: 1px solid #ddd;
		border-radius: 0.5em;
	}
	
	/* dbShopList dbShopContent  dbCategory*/
		
	.adminContentWrap {
		padding: 18px 200px 0 100px;
	
	}
	
	.adminProductContentWrap {
		border: 1px solid #ddd;
		border-radius: 0.5em;
		padding: 50px 70px;
	}
	
	.smallThumbLine {
		margin: 5px 0px;
		max-width: 400px;
		text-align: center;
	}
	
	.smallThumbLine:hover {
		cursor: pointer;
	}
	
	.adminCategoryWrap {
		
	}
	.adminSmallTitleGroup {
		
		
	}
	
	.adminSmallTitle {
		margin-bottom: 4px;
		font-size: 12px;
		color: #bbb;
		
	}
	
	.inputWrap select  {
		height: 45px;
		border-radius: 6px;
	}
	
	.inputWrap input {
		height: 45px;
		border-radius: 6px;
	}
	
	/* 어드민 예약 캘린더 */
	
	.bookingCalendar>td:hover {
		background-color: #ddd;
	}
	
	/* adminBookingList */
	.dateClick:hover {
		cursor: pointer;
		background-color: #f9ffdf;
		font-size: 15px;
		
	} 
	

</style>