package com.spring.green2209S_14.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_14.vo.MemberVO;

public interface MemberDAO {

	public MemberVO getMemberIdCheck(@Param("mid") String mid);

	public void setMemTotalUpdate(@Param("mid") String mid, @Param("nowTodayPoint") int nowTodayPoint, @Param("todayCnt") int todayCnt);
	
	// 사진저장..?
	public void setMemberJoinOk(@Param("vo") MemberVO vo);
	
	public int totRecCnt(@Param("mid") String mid);

	public List<MemberVO> getMemberList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part") String part, @Param("searchString") String searchString);

	public MemberVO memberInforGet(@Param("name") String name, @Param("tel") String tel);

	public MemberVO getMemberByNameTel(@Param("name") String name, @Param("tel") String tel);

	public void setNoMemberJoin(@Param("name") String name, @Param("tel") String tel);

	public void setPointUpdate(@Param("mid") String mid, @Param("point") int point);




}
