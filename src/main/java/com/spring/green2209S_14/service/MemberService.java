package com.spring.green2209S_14.service;

import java.util.List;

import com.spring.green2209S_14.vo.MemberVO;

public interface MemberService {

	public MemberVO getMemberIdCheck(String mid);

	// 로그인 시 방문포인트 누적
	public void setMemberVisitProcess(MemberVO vo);

	// 회원가입
	public void setMemberJoinOk(MemberVO vo);
	
	// 어드민 멤버리스트 
	public List<MemberVO> getMemberList(int startIndexNo, int pageSize, String part, String searchString);

	public MemberVO memberInforGet(String name, String tel);

	public MemberVO getMemberByNameTel(String name, String tel);

	public void setNoMemberJoin(String name, String tel);

	public void setPointUpdate(String mid, int point);

	

}
