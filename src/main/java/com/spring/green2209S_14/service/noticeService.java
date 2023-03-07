package com.spring.green2209S_14.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.green2209S_14.vo.NoticeVO;

public interface noticeService {

	public List<NoticeVO> getNoticeList(int startIndexNo, int pageSize);

	public void imgCheck(String content);

	public int setNoticeInput(NoticeVO vo);
	
	public void setNoticeReadNum(int idx); // 조회수

	public NoticeVO getNoticeContent(int idx);

	public ArrayList<NoticeVO> getPrevNext(int idx);

	public void imgDelete(String content);

	public void setNoticeDeleteOk(int idx);

	public void imgCheckUpdate(String content);

	public void setNoticeUpdateOk(NoticeVO vo);

}
