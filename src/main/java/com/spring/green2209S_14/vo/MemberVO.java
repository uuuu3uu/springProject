package com.spring.green2209S_14.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private String gender;
	private String birthday;
	private String tel;
	private String address;
	private String email;
	private String path;
	private String userDel;
	private int point;
	private int level;
	private int visitCnt;
	private String startDate;
	private String lastDate;
	private int todayCnt;
	private int noShow;
	
	private int day_diff; // 날짜 차이 계산 필드 (1일차이 계산필드)
	private int hour_diff;// 시간 차이 계산 필드...(24시간차이 계산필드)
}
