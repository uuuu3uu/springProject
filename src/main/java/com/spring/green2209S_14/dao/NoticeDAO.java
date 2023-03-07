package com.spring.green2209S_14.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_14.vo.NoticeVO;

public interface NoticeDAO {

	public List<NoticeVO> getNoticeList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize);

	public int setNoticeInput(@Param("vo") NoticeVO vo);

	public int totRecCnt(@Param("part") String part, @Param("searchString") String searchString);
	
	public void setNoticeReadNum(@Param("idx") int idx);

	public NoticeVO getNoticeContent(@Param("idx") int idx);

	public ArrayList<NoticeVO> getPrevNext(@Param("idx") int idx);

	public void setNoticeDeleteOk(@Param("idx") int idx);

	public void setNoticeUpdateOk(@Param("vo") NoticeVO vo);
	
}
