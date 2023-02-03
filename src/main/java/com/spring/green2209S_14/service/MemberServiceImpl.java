package com.spring.green2209S_14.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.green2209S_14.dao.MemberDAO;
import com.spring.green2209S_14.vo.MemberVO;



@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getMemberIdCheck(String mid) {
		return memberDAO.getMemberIdCheck(mid);
	}

	@Override
	public void setMemberVisitProcess(MemberVO vo) {
	// 오늘 날짜 편집
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strNow = sdf.format(now);
		
		// 오늘 처음 방문 시는 오늘 방문카운트(todayCont)를 0으로 셋팅한다.
		if(!vo.getLastDate().substring(0,10).equals(strNow)) {  // 마지막방문날짜와 오늘 날짜가 같지 않다 -> 오늘 처음 방문했따
			//memberDAO.setTodayContUpdate(vo.getMid());  
			vo.setTodayCnt(0);		// 오늘 첫 방문 0으로 세팅
		}
		
		int todayCnt = vo.getTodayCnt() + 1;
		
		int nowTodayPoint = 0; // (오늘 방문포인트)
		if(vo.getTodayCnt() >= 5) {
			nowTodayPoint = vo.getPoint();
		}
		else {
			nowTodayPoint = vo.getPoint() + 10;
		}
		
		// 오늘 재방문이라면 '총 방문수', '오늘 방문수' '포인트' 누적처리
		memberDAO.setMemTotalUpdate(vo.getMid(), nowTodayPoint, todayCnt);
		
	}

	@Override
	public void setMemberJoinOk(MemberVO vo) {
		memberDAO.setMemberJoinOk(vo);
		
	}


	
	

	


	
}
