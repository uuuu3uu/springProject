package com.spring.green2209S_14.vo;

import lombok.Data;

@Data
public class NoticeVO {
	private int idx;
	private String name;
	private String title;
	private String content;
	private String wDate;
	private String fName;
	private int downNum;
	private int readNum;
	private String mid;
	
	private int day_diff; // 날짜 차이 계산 필드 (1일차이 계산필드)
	private int hour_diff;// 시간 차이 계산 필드...(24시간차이 계산필드)
	
	// 이전글/다음글을 위한 변수 설정
	private int preIdx;		// 이전 idx
	private int nextIdx;	// 다음 idx
	private String preTitle;
	private String nextTitle;
	
	// 댓글 갯수 저장하기 위한 변수
	private int replyCount;
	
	
}
