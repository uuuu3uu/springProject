package com.spring.green2209S_14.service;

import com.spring.green2209S_14.vo.MemberVO;

public interface MemberService {

	public MemberVO getMemberIdCheck(String mid);

	// 로그인 시 방문포인트 누적
	public void setMemberVisitProcess(MemberVO vo);

	// 회원가입
	public void setMemberJoinOk(MemberVO vo);
	
	

	
	
	


	
	

}
