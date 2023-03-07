package com.spring.green2209S_14.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_14.vo.BookingTimeVO;
import com.spring.green2209S_14.vo.BookingVO;

public interface BookingDAO {

	public void setBookingData(@Param("bookingVo") BookingVO bookingVo);

	public List<BookingVO> getBookingSearch(@Param("selectDate") String selectDate);

	public int getDiffSelectCount(@Param("selectDate") String selectDate);

	public int getBookingIdx();

	public void setBookingTime(@Param("bIdx") int bIdx, @Param("bookingTimeBlock") int bookingTimeBlock, @Param("bookingDate") String bookingDate);

	public List<BookingTimeVO> getBookingTimeSearch(@Param("selectDate") String selectDate);

	public int getBookingCount(@Param("selectDate")String selectDate, @Param("bookingStartDate")int bookingStartDate, @Param("useTime")int useTime);

	public void setBookingDataAdmin(@Param("bookingVo") BookingVO bookingVo);

	public List<BookingVO> getBookingData(@Param("name") String name, @Param("ym") String ym);

	public int getBookingCountAdmin(@Param("selectDate") String selectDate, @Param("bookingStartTime") String bookingStartTime, @Param("bookingEndTime") int bookingEndTime);

	public List<BookingVO> getBookingDataAll(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("section") String section, @Param("part") String part, @Param("searchString") String searchString, @Param("searchStart") String searchStart, @Param("searchEnd") String searchEnd, @Param("orderBy") String orderBy);

	public List<BookingVO> getBookingBlackList();

	public void setNoShowCntPlus(@Param("tel") String tel);

	public String getMemberTelCheck(@Param("idx") int idx);

	public void setUpdateNoShowCnt(@Param("idx") int idx, @Param("noShowCnt") int noShowCnt);

	public int totRecCnt(@Param("pag") int pag, @Param("pageSize") int pageSize, @Param("section") String section, @Param("part") String part, @Param("searchString") String searchString, @Param("searchStart") String searchStart,
			@Param("searchEnd") String searchEnd);

	public List<BookingVO> getBookingHistory(@Param("name") String name, @Param("tel") String tel);

	public List<BookingVO> getAccounthistory(@Param("mid") String mid);




}
