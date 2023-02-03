package com.spring.green2209S_14.service;

import java.util.List;

import com.spring.green2209S_14.vo.NoticeVO;

public interface noticeService {

	public List<NoticeVO> getNoticeList(int startIndexNo, int pageSize);

	public void imgCheck(String content);

	public int setNoticeInput(NoticeVO vo);


}
