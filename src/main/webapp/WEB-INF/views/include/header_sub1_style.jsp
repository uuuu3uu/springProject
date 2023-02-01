<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>

	body {
			margin: 0;
			background-color: #fff;
			font-family: Catamaran,sans-serif;
	    font-size: 16px;
	    /* line-height: 1.625em; */
	    /* font-weight: 400; */
	    color: #6f6f6f;
	    /* letter-spacing: .02em; */
	 }
	 
	 h4 {
	 	font-family: Cormorant,serif;
    letter-spacing: .01em;
    color: #363636;
    font-size: 26px;
    line-height: 1.1667em;
    font-weight: 600;
    margin: 25px 0;
	 }

	/* 공지사항 게시판 */
	.noticeWrap {
		position:inherit;
		margin: 50px 20px;
	}
	.noticeWrap h2 {
		font-family: Cormorant,serif;
    letter-spacing: .01em;
    color: #363636;
    font-size: 42px;
    line-height: 1.1667em;
    font-weight: 600;
    margin: 25px 0;
	}
	/* Style the header */
	header {
	  background-color: #transparent;
	  
	}
	
	/* Create two columns/boxes that floats next to each other */
	nav {
	  float: left;
	  width: 20%;
	  height: 300px; /* only for demonstration, should be removed */
	  background: #transparent;
	  padding-left: 10px;
	  padding-top: 100px;
	}
	
	/* Style the list inside the menu */
	nav ul {
	  list-style-type: none;
	  padding: 0;
	}
	nav ul li {
	  list-style-type: none;
	  padding-bottom: 15px;
	  color: #363636;
	}
	
	article {
	  float: left;
	  padding: 20px;
	  width: 80%;
	  background-color: #transparent;
	  height: 300px; /* only for demonstration, should be removed */
	}
	
	section {
		height: 1000px;
	}
	
	/* Clear floats after the columns */
	section::after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
	@media (max-width: 600px) {
	  nav, article {
	    width: 100%;
	    height: auto;
	  }
	}
	
	.container-fluid {
		margin: 0;
		padding: 0;
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
	.sub_img {
    width: 100%;
   	height: 80%;
	}
	.sub_img img {
   	width: 100%;
   	height: 600px;   /* 600px */
	}
	
	.search-container input {
		border: none;
		border-bottom: 1px solid #000; 
	}
	#midBtn {
		width: 120px;
    height: 35px;
    font-size: 13px;
    border-radius: 3px;
    margin: 30px 0 10px 0;
    float: right;
	}
	
	.gongInputWrap .table {
		boder: none;
	}

</style>