package com.spring.green2209S_14.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_14.vo.MemberVO;

public interface MemberDAO {

	public MemberVO getMemberIdCheck(@Param("mid") String mid);

	public void setMemTotalUpdate(@Param("mid") String mid, @Param("nowTodayPoint") int nowTodayPoint, @Param("todayCnt") int todayCnt);
	
	// 사진저장..?
	public void setMemberJoinOk(@Param("vo") MemberVO vo);
	
	public int totRecCnt(@Param("vo") String searchString);




}
