package com.spring.green2209S_14.vo;

import lombok.Data;

@Data
public class BookingVO {
	private int idx;
	private int pIdx;
	private String bNumber;
	private String mid;
	private String name;
	private String tel;
	private String bookingStartDate;
	private String bookingEndDate;
	private String orderDate;
	private String customerCheck;
	
	private String paymentMethod;
	
	private int bookingStatus;
	private int noShowCnt;
	private int paymentStatus;
	
	private String historyContent;
	private String historyMemo;
	private String historyDate;
	
	private String selectDate;
	
	private String selectTime;
	private int useTime;
	private String categoryMainCode;
	private String categoryMainName;
	private String categorySubName;
	
	private String productMenu;
	private String productCode;
	
	private String gender;
	private int level;
	private int point;
	private int noShow;
	
	
}
