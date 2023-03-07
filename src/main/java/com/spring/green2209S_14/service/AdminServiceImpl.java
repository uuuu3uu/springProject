package com.spring.green2209S_14.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.green2209S_14.dao.AdminDAO;
import com.spring.green2209S_14.dao.MemberDAO;

@Service
public class AdminServiceImpl implements AdminSerivce {
	
	@Autowired
	AdminDAO adminDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	
	
	@Override
	public int setMemberLevelCheck(int idx, int level) {
		
		return adminDAO.setMemberLevelCheck(idx, level);
	}


	@Override
	public int setbookingStatusCheck(int idx, int bookingStatus) {
		
		return adminDAO.setbookingStatusCheck(idx, bookingStatus);
	}

}
