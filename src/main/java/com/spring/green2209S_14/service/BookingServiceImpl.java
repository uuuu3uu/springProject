package com.spring.green2209S_14.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.green2209S_14.dao.BookingDAO;
import com.spring.green2209S_14.vo.BookingTimeVO;
import com.spring.green2209S_14.vo.BookingVO;



@Service
public class BookingServiceImpl implements BookingService {

	@Autowired
	BookingDAO bookingDAO;

	@Override
	public void getSchedule() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		// 오늘 날짜 저장시켜둔다.(calToday변수, 년(toYear), 월(toMonth), 일(toDay))
		Calendar calToday = Calendar.getInstance(); // 현재시간
		int toYear = calToday.get(Calendar.YEAR);
		int toMonth = calToday.get(Calendar.MONTH);
		int toDay = calToday.get(Calendar.DATE);

		
		// 화면에 보여줄 해당 '년(yy)/월(mm)'을 셋팅하는 부분(처음에는 오늘 년도와 월을 가져오지만, '이전/다음'버튼 클릭하면 해당 년과 월을 가져오도록 한다.
		Calendar calView = Calendar.getInstance();
		int yy = request.getParameter("yy")==null ? calView.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
	  int mm = request.getParameter("mm")==null ? calView.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
	  int dd = request.getParameter("dd")==null ? calView.get(Calendar.DATE) : Integer.parseInt(request.getParameter("dd"));
	  
	  if(mm < 0) { // 1월에서 전월 버튼을 클릭시에 실행
	  	yy--;
	  	mm = 11;
	  }
	  if(mm > 11) { // 12월에서 다음월 버튼을 클릭시에 실행
	  	yy++;
	  	mm = 0;
	  }
	  calView.set(yy, mm, 1);		// 현재 '년/월'의 1일을 달력의 날짜로 셋팅한다.
	  
	  int startWeek = calView.get(Calendar.DAY_OF_WEEK);  						// 해당 '년/월'의 1일에 해당하는 요일값을 숫자로 가져온다.
	  int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH);  // 해당월의 마지막일자(getActualMaxximum메소드사용)를 구한다.
	  
	  // 화면에 보여줄 년월기준 전년도/다음년도를 구하기 위한 부분
	  int prevYear = yy;  			// 전년도
	  int prevMonth = (mm) - 1; // 이전월
	  int nextYear = yy;  			// 다음년도
	  int nextMonth = (mm) + 1; // 다음월
	  
	  if(prevMonth == -1) {  // 1월에서 전월 버튼을 클릭시에 실행..
	  	prevYear--;
	  	prevMonth = 11;
	  }
	  
	  if(nextMonth == 12) {  // 12월에서 다음월 버튼을 클릭시에 실행..
	  	nextYear++;
	  	nextMonth = 0;
	  }
	  
	  // 현재달력에서 앞쪽의 빈공간은 '이전달력'을 보여주고, 뒷쪽의 남은공간은 '다음달력'을 보여주기위한 처리부분(아래 6줄)
	  Calendar calPre = Calendar.getInstance(); // 이전달력
	  calPre.set(prevYear, prevMonth, 1);  			// 이전 달력 셋팅
	  int preLastDay = calPre.getActualMaximum(Calendar.DAY_OF_MONTH);  // 해당월의 마지막일자를 구한다.
	  
	  Calendar calNext = Calendar.getInstance();// 다음달력
	  calNext.set(nextYear, nextMonth, 1);  		// 다음 달력 셋팅
	  int nextStartWeek = calNext.get(Calendar.DAY_OF_WEEK);  // 다음달의 1일에 해당하는 요일값을 가져온다.
	  
	  // sql에 등록된 dataformat의 비교형식을 맞춰주기 위한 날짜형식변환 작업
	  // 해당 년월의 형식 반환? 2023-1 ====> 2023-01 로 해주어야 한다는 말~
	  String ym = "";
	  int intMM = mm + 1;
	  if(intMM >= 1 && intMM <= 9) ym = yy + "-0" + (mm + 1);
	  else ym = yy + "-" + (mm + 1);
	  
	  // 스케줄에 등록되어 있는 일정들을 가져오기
	  //List<ScheduleVO> vos = scheduleDAO.getScheduleList(mid, ym);
	  //request.setAttribute("vos", vos);
	  
	  /* ---------  아래는  앞에서 처리된 값들을 모두 request객체에 담는다.  -----------------  */
	  
	  // 오늘기준 달력...
	  request.setAttribute("toYear", toYear);
	  request.setAttribute("toMonth", toMonth);
	  request.setAttribute("toDay", toDay);
	  // 화면에 보여줄 해당 달력...
	  request.setAttribute("yy", yy);
	  request.setAttribute("mm", mm);
	  request.setAttribute("dd", dd);
	  
	  request.setAttribute("startWeek", startWeek);
	  request.setAttribute("lastDay", lastDay);
	  
	  // 화면에 보여줄 해당 달력 기준의 전년도, 전월, 다음년도, 다음월 ...
	  request.setAttribute("preYear", prevYear);
		request.setAttribute("preMonth", prevMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		
		// 현재 달력의 '앞/뒤' 빈공간을 채울, 이전달의 뒷부분과 다음달의 앞부분을 보여주기위해 넘겨주는 변수
		request.setAttribute("preLastDay", preLastDay);				// 이전달의 마지막일자를 기억하고 있는 변수
		request.setAttribute("nextStartWeek", nextStartWeek);	// 다음달의 1일에 해당하는 요일을 기억하고있는 변수
		
		String selectMonth= yy+"-"+((mm+1)<10?("0"+(mm+1)):(mm+1))+"-"+"01";
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String today =	sdf.format(date);
		today = today.substring(0, 8)+"01";
		//System.out.println(today.compareTo(selectMonth)); // 달 기준으로 0보다 크면 과거 0보다 작으면 미래
		
		
		request.setAttribute("compare", today.compareTo(selectMonth));
		
		
	}
	
	@Override
	public List<BookingVO> getBookingData(String name, String ym) {
		/*
		String mm = "", dd ="";
		String[] ymdArr = ymd.split("-");
		// 2023-1-5/202-1-15/2023-10-5 의 경우 ==> 2023-01-05 이렇게 되야하는데...
		if(ymd.length() != 10) {
			if(ymdArr[1].length() == 1) mm = "0" + ymdArr[1];
			else mm = ymdArr[1];
			if(ymdArr[2].length() == 1) dd = "0" + ymdArr[2];
			else dd = ymdArr[2];
			ymd = ymdArr[0] + "-" + mm + "-" + dd;
		}
		*/
		return bookingDAO.getBookingData(name, ym);
	}
	

	@Override
	public void setBookingData(BookingVO bookingVo) {
		bookingDAO.setBookingData(bookingVo);
	}

	@Override
	public List<BookingVO> getBookingSearch(String selectDate) {
		return bookingDAO.getBookingSearch(selectDate);
	}

	@Override
	public int getDiffSelectCount(String selectDate) {
		return bookingDAO.getDiffSelectCount(selectDate);
	}

	@Override
	public int getBookingIdx() {
		return bookingDAO.getBookingIdx();
	}

	@Override
	public void setBookingTime(int bIdx, int bookingTimeBlock, String bookingDate) {
		bookingDAO.setBookingTime(bIdx, bookingTimeBlock, bookingDate);
	}

	@Override
	public List<BookingTimeVO> getBookingTimeSearch(String selectDate) {
		return bookingDAO.getBookingTimeSearch(selectDate);
	}

	@Override
	public int getBookingCount(String selectDate, int bookingStartDate, int useTime) {
		// TODO Auto-generated method stub
		return bookingDAO.getBookingCount(selectDate, bookingStartDate, useTime);
	}

	@Override
	public void setBookingDataAdmin(BookingVO bookingVo) {
		bookingDAO.setBookingDataAdmin(bookingVo);
		
	}
	
	@Override
	public int getBookingCountAdmin(String selectDate, String bookingStartTime, int bookingEndTime) {
		return bookingDAO.getBookingCountAdmin(selectDate, bookingStartTime, bookingEndTime);
	}

	@Override
	public List<BookingVO> getBookingDataAll(int startIndexNo, int pageSize, String section, String part, String searchString, String searchStart, String searchEnd, String orderBy) {
		return bookingDAO.getBookingDataAll(startIndexNo, pageSize, section, part, searchString, searchStart, searchEnd, orderBy);
	}

	@Override
	public List<BookingVO> getBookingBlackList() {
		return bookingDAO.getBookingBlackList();
	}

	@Override
	public void setNoShowCntPlus(String tel) {
		bookingDAO.setNoShowCntPlus(tel);
	}

	@Override
	public String getMemberTelCheck(int idx) {
		return bookingDAO.getMemberTelCheck(idx);
	}

	@Override
	public void setUpdateNoShowCnt(int idx, int noShowCnt) {
		bookingDAO.setUpdateNoShowCnt(idx, noShowCnt);
		
	}

	@Override
	public List<BookingVO> getBookingHistory(String name, String tel) {
		return bookingDAO.getBookingHistory(name, tel);
	}

	@Override
	public List<BookingVO> getAccounthistory(String mid) {
		return bookingDAO.getAccounthistory(mid);
	}

	
}
