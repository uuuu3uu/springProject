package com.spring.green2209S_14.vo;

import lombok.Data;

@Data
public class DbProductVO {
	private int idx;
	private String productCode;
	//private String productName;
	private String detail;
	private String mainPrice;
	private String fName;
	private String fSName;
	private int fSize;
	//private String content;
	private int useTime;
	private String categoryMainCode;
	private String categoryMainName;
	private String categorySubCode;
	private String categorySubName;
	
//	private int pIdx;
	private String bookingStartDate;
	private String bookingEndDate;
	private String selectDate;
}
