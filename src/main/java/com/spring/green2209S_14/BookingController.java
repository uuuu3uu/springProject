package com.spring.green2209S_14;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.green2209S_14.service.BookingService;
import com.spring.green2209S_14.service.DbShopService;
import com.spring.green2209S_14.service.MemberService;
import com.spring.green2209S_14.vo.BookingTimeVO;
import com.spring.green2209S_14.vo.BookingVO;
import com.spring.green2209S_14.vo.DbOptionVO;
import com.spring.green2209S_14.vo.DbProductVO;
import com.spring.green2209S_14.vo.MemberVO;

@Controller
@RequestMapping("/booking")
public class BookingController {
	
	
  @Autowired
  BookingService bookingService;
  
  @Autowired
  DbShopService dbShopService;
 
  @Autowired
  BCryptPasswordEncoder passwordEncoder;
  
  @Autowired
  MemberService memberService;
	
	@RequestMapping(value = "/bookingMenu", method=RequestMethod.GET)
	public String bookingMenuGet(Model model,
		@RequestParam(name="part", defaultValue = "전체", required = false) String part) {
		
		// 1차메뉴명을 가져온다.
		List<DbProductVO> mainTitleVos = dbShopService.getMainTitleList();
		model.addAttribute("mainTitleVos", mainTitleVos);
	
		
	
		// 전체 상품리스트 가져오기
		List<DbProductVO> productVos = dbShopService.getDbShopList(part);
		
		
		model.addAttribute("productVos", productVos);
		model.addAttribute("part", part);
	
	return "booking/bookingMenu";
	}
	
	
	@RequestMapping(value = "/booking", method=RequestMethod.GET)
	public String bookingGet(Model model, int idx,
		@RequestParam(name="selectDate", defaultValue = "", required = false) String selectDate,
		@RequestParam(name="categorySubName", defaultValue = "", required = false) String categorySubName,
		@RequestParam(name="useTime", defaultValue = "0", required = false) int useTime) {
		 
		List<DbOptionVO> optionVos = dbShopService.getDbShopOption(idx); // 해당 상품의 모든 옵션 정보를 가져온다.
			
		List<BookingVO> bookingVos = null;
		List<BookingTimeVO> bookingTimeVos = null;
		
		
		
		DbProductVO productVo = dbShopService.getDbShopProduct(idx);
		bookingVos = bookingService.getBookingSearch(selectDate);	   // 상품 정보를 불러온다.(선택된 날짜에 해당하는 상품)
		bookingTimeVos = bookingService.getBookingTimeSearch(selectDate);
		
		model.addAttribute("bookingVos", bookingVos);
		model.addAttribute("productVo", productVo);
		model.addAttribute("categorySubName", categorySubName);
		model.addAttribute("optionVos", optionVos);
		model.addAttribute("selectDate", selectDate);
		model.addAttribute("bookingTimeVos", bookingTimeVos);
		model.addAttribute("bookingTimeVosSize", bookingTimeVos.size());
		//model.addAttribute("diffSelectCount", (diffSelectCount + bookingSize));
		
		bookingService.getSchedule();	// 달력출력을 위한 검색
			
		model.addAttribute("idx", idx);
	 	model.addAttribute("partCode", productVo.getCategoryMainCode());
			
	 	
		return "booking/booking";
	}
	
	

//	@RequestMapping(value = "/booking", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@RequestMapping(value = "/booking", method=RequestMethod.POST)
	public String bookingPost(HttpSession session, String bookingDate, Model model, DbProductVO vo,
			BookingVO bookingVo, String selectTime, String selectTimeCal) {
		String mid = (String)session.getAttribute("sMid");
		String name = (String)session.getAttribute("sName");
		String tel = (String)session.getAttribute("sTel");
		bookingVo.setTel(tel);
		bookingVo.setName(name);
		
		MemberVO memberVo = memberService.getMemberIdCheck(mid);
		
		model.addAttribute("vo",vo);
		//model.addAttribute("bookingVo",bookingVo);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("selectTime",selectTime);
		System.out.println("bookingDate : "+ bookingDate);
		System.out.println("selectTime : "+ selectTime);
		
 		String select = bookingVo.getSelectDate() + " "+selectTime+":" + "00";
 		System.out.println(select);
 		
 		Date date = new Date();
 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
 		System.out.println(sdf.format(date));
 		select.compareTo(sdf.format(date));
 		if(select.compareTo(sdf.format(date))<0) {
 			model.addAttribute("flag","?idx="+vo.getIdx()+"&selectDate="+vo.getSelectDate()+"&categorySubName="+vo.getCategorySubName());
 			return "redirect:/msg/bookingCountOver";
 		}
 		
		/*
		 * 
		 * model.addAttribute("selectTimeCal",selectTimeCal);
		 * model.addAttribute("selectTimeCal",selectTimeCal);
		 */
		
		int bookingStartDate = Integer.parseInt(bookingVo.getBookingStartDate().substring(11,13)); //10
		int useTime = bookingStartDate + vo.getUseTime()-1; // 10+1=11
		int bookingCount = bookingService.getBookingCount(bookingVo.getSelectDate(), bookingStartDate, useTime);
		//System.out.println(bookingCount);
		if(bookingCount > 0) {
			model.addAttribute("flag","?idx="+vo.getIdx()+"&selectDate="+vo.getSelectDate()+"&categorySubName="+vo.getCategorySubName());
			return "redirect:/msg/bookingCountOver";
		}
		
		System.out.println("1.bookingVo.getSelectDate():::" + bookingVo.getSelectDate());
		System.out.println("2.bookingStartDate  :::" + bookingStartDate);
		System.out.println("3.useTime  :::" + useTime);
		
		bookingVo.setUseTime(vo.getUseTime());
		
		//예약번호 만들기
		bookingVo.setBNumber( "N"+new Date().getTime());
		
		bookingVo.setPIdx(vo.getIdx());
		
		session.setAttribute("sBookingVo", bookingVo);
		session.setAttribute("memberVo", memberVo);
		session.setAttribute("sDbProductVo", vo);
		return "booking/bookingPayment";
		//return "redirect:/msg/bookingOk";
	}
	
	// 결제 정보 확인하기
	@RequestMapping(value = "/bookingPayment", method=RequestMethod.GET)
	public String bookingPaymentGet(BookingVO bookingVo, Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		bookingVo = (BookingVO) session.getAttribute("sBookingVo");
		DbProductVO vo = (DbProductVO) session.getAttribute("sDbProductVo");


		bookingVo.setMid(mid);

		MemberVO memberVo = memberService.getMemberIdCheck(bookingVo.getMid());
		//System.out.println("vo.getIdx(): "+ vo.getIdx());

		bookingVo.setName(memberVo.getName());
		bookingVo.setTel(memberVo.getTel());
		
		model.addAttribute("vo", vo);
		model.addAttribute("bookingVo", bookingVo);
		System.out.println("이곳은 bookingPayment Get입니다~~~~~~.bookingVo : " + bookingVo);
	
		
		return "booking/bookingPayment";
	}
	
	@RequestMapping(value = "/bookingResult", method=RequestMethod.GET)
	public String bookingResultGet(HttpSession session, Model model, String orderDate) {
		
		BookingVO bookingVo = (BookingVO) session.getAttribute("sBookingVo");
		System.out.println("bookingVo 여기 " + bookingVo);
		
		
  		
		bookingVo.setPaymentStatus(1);
		// booking테이블에 기본 정보 저장하기J(아래로 10줄 - 결재가 완료된 후에 처리한다.)
		bookingService.setBookingData(bookingVo);
		int bIdx = bookingService.getBookingIdx();	// booking테이블에 저장된 가장 마지막 idx를 불러온다.
		
		// booking시간을 가져와서 해당 시간만큼 bookingTimg테이블에 저장시킨다.
		int bookingStartTime = Integer.parseInt(bookingVo.getBookingStartDate().substring(11,13));
		int bookingEndTime = bookingVo.getUseTime() + bookingStartTime - 1;
		
		// bookingTime테이블에 예약한 시간만 저장하기
		for(int i=bookingStartTime; i<=bookingEndTime; i++) {
			bookingService.setBookingTime(bIdx, i, bookingVo.getSelectDate());
		}
		
		
	
		int price = Integer.parseInt(((DbProductVO)session.getAttribute("sDbProductVo")).getMainPrice());
		// 포인트 적립
 		String mid =  bookingVo.getMid();
 		if(!mid.equals("")){
  		int level = memberService.getMemberIdCheck(mid).getLevel();
  		int point = 0 ;
  		if(level==1) point =(int)(price * 0.01);
  		else if(level==2) point =(int)(price * 0.03);
  		else if(level==3) point =(int)(price * 0.05);
  		else if(level==4) point =(int)(price * 0.1);
  		
  		memberService.setPointUpdate(mid, point);
  		
  		// 예약정보 확인하기 
  		bookingVo.setOrderDate(bookingVo.getOrderDate());
  		
  		model.addAttribute("bookingVo", bookingVo);
  		
 		}		
		return "booking/bookingResult";
	}
	

	
}
