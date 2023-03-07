package com.spring.green2209S_14.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_14.vo.BookingTimeVO;
import com.spring.green2209S_14.vo.BookingVO;

public interface BookingService {

	public void getSchedule();
	
	public void setBookingData(BookingVO bookingVo);

	public List<BookingVO> getBookingSearch(String selectDate);

	public int getDiffSelectCount(String selectDate);

	public int getBookingIdx();

	public void setBookingTime(int bIdx, int bookingTimeBlock, String bookingDate);

	public List<BookingTimeVO> getBookingTimeSearch(String selectDate);

	public int getBookingCount(String selectDate, int bookingStartDate, int useTime);

	public void setBookingDataAdmin(BookingVO bookingVo);

	public List<BookingVO> getBookingData(String name, String ym);

	public int getBookingCountAdmin(String selectDate, String bookingStartTime, int bookingEndTime);

	public List<BookingVO> getBookingDataAll(int startIndexNo, int pageSize, String section, String part, String searchString, String searchStart,
			String searchEnd, String orderBy);

	public List<BookingVO> getBookingBlackList();

	public void setNoShowCntPlus(String tel);

	public String getMemberTelCheck(int idx);

	public void setUpdateNoShowCnt(int idx, int noShowCnt);

	public List<BookingVO> getBookingHistory(String name, String tel);

	public List<BookingVO> getAccounthistory(String mid);


	


	

}
