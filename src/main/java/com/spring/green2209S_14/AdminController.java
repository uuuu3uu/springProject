package com.spring.green2209S_14;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.green2209S_14.pagination.PageProcess;
import com.spring.green2209S_14.pagination.PageVO;
import com.spring.green2209S_14.service.AdminSerivce;
import com.spring.green2209S_14.service.BookingService;
import com.spring.green2209S_14.service.DbShopService;
import com.spring.green2209S_14.service.MemberService;
import com.spring.green2209S_14.vo.BookingVO;
import com.spring.green2209S_14.vo.DbProductVO;
import com.spring.green2209S_14.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminSerivce adminService;

	@Autowired
	MemberService memberService;

	@Autowired
	BookingService bookingService;

	@Autowired
	PageProcess pageProcess;

	@Autowired
	DbShopService dbShopService;

	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String adminMainGet() {

		return "admin/adminMain";
	}

	@RequestMapping(value = "/adminLeft", method = RequestMethod.GET)
	public String adminLeftGet() {

		return "admin/adminLeft";
	}

	@RequestMapping(value = "/adminContent", method = RequestMethod.GET)
	public String adminContentGet() {

		return "admin/adminContent";
	}

	/* 어드민 회원리스트 */
	@RequestMapping(value = "/member/adminMemberList", method = RequestMethod.GET)
	public String adminMemberListGet(Model model, BookingVO bookingVo,
			@RequestParam(name = "searchString", defaultValue = "", required = false) String searchString,
			@RequestParam(name = "part", defaultValue = "name", required = false) String part,
			@RequestParam(name = "pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name = "pageSize", defaultValue = "10", required = false) int pageSize) {

		PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "member", part, searchString);

		// 관리자 회원리스트 검색하려고 부른거
		List<MemberVO> vos = memberService.getMemberList(pageVo.getStartIndexNo(), pageSize, part, searchString);

		model.addAttribute("vos", vos);
		model.addAttribute("pageVo", pageVo);

		// noShowCnt 가져오기

		return "admin/member/adminMemberList";
	}

	// 어드민 등급 변경
	@ResponseBody
	@RequestMapping(value = "/member/adminMemberLevel", method = RequestMethod.POST)
	public String adminMemberLevelPost(int idx, int level) {
		int res = adminService.setMemberLevelCheck(idx, level);

		return res + "";
	}

	// 어드민 멤버 인포
	@RequestMapping(value = "/member/adminMemberInfor", method = RequestMethod.GET)
	public String adminMemberInforGet(Model model, String name, String tel, BookingVO bookingVo,
			@RequestParam(name = "pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name = "pageSize", defaultValue = "10", required = false) int pageSize) {

		MemberVO vo = memberService.memberInforGet(name, tel);

		String strLevel = "";
		if (vo.getLevel() == 0)
			strLevel = "비회원";
		else if (vo.getLevel() == 1)
			strLevel = "일반회원";
		else if (vo.getLevel() == 2)
			strLevel = "우수회원";
		else if (vo.getLevel() == 3)
			strLevel = "VIP";
		else if (vo.getLevel() == 4)
			strLevel = "관리자";

		model.addAttribute("vo", vo);
		model.addAttribute("strLevel", strLevel);



		// 시술내역 불러오기
		List<BookingVO> bookingVos = bookingService.getBookingHistory(name, tel);
		model.addAttribute("bookingVos", bookingVos);
		return "admin/member/adminMemberInfor";

	}

	@RequestMapping(value = "/booking/bookingCalendar", method = RequestMethod.GET)
	public String bookingCalendarGet(Model model, HttpServletRequest request,
//		@RequestParam(name="yy", defaultValue = "0", required = false) int yy,
//		@RequestParam(name="mm", defaultValue = "0", required = false) int mm, 
			HttpSession session) {

		Calendar calToday = Calendar.getInstance();
		int toYear = calToday.get(Calendar.YEAR);
		int toMonth = calToday.get(Calendar.MONTH);

		// 화면에 보여줄 해당 '년(yy)/월(mm)'을 셋팅하는 부분(처음에는 오늘 년도와 월을 가져오지만, '이전/다음'버튼 클릭하면 해당 년과
		// 월을 가져오도록 한다.
		Calendar calView = Calendar.getInstance();
		int yy = request.getParameter("yy") == null ? calView.get(Calendar.YEAR)
				: Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm") == null ? calView.get(Calendar.MONTH)
				: Integer.parseInt(request.getParameter("mm"));
		mm++;

		if (mm < 0) { // 1월에서 전월 버튼을 클릭시에 실행
			yy--;
			mm = 11;
		}
		if (mm > 11) { // 12월에서 다음월 버튼을 클릭시에 실행
			yy++;
			mm = 0;
		}

		String sMM = mm + "";
		// String sYY = yy + "";
		if (sMM.length() == 1)
			sMM = "0" + sMM;
		String ym = "" + yy + "-" + sMM;

		System.out.println("ym : " + ym);
		bookingService.getSchedule();
		List<DbProductVO> mainVos = dbShopService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);

		List<DbProductVO> subVos = dbShopService.getCategorySub();
		model.addAttribute("subVos", subVos);

		List<MemberVO> memberVos = memberService.getMemberList(0, 100, "", "");
		model.addAttribute("memberVos", memberVos);

		List<DbProductVO> productVos = dbShopService.getDbProductAll();
		// System.out.println("productVos : " + productVos);
		model.addAttribute("productVos", productVos);

		String name = (String) session.getAttribute("sName");
		// ym = "2023-02";

		List<BookingVO> bookingVos = bookingService.getBookingData(name, ym);
		// System.out.println("bookingVos : " + bookingVos);
		model.addAttribute("bookingVos", bookingVos);

		return "admin/booking/bookingCalendar";
	}

	@Transactional
	@RequestMapping(value = "/booking/bookingCalendar", method = RequestMethod.POST)
	public String bookingCalendarPost(BookingVO bookingVo, Model model) {
		// System.out.println("productMenu : " + bookingVo.getProductMenu());
		String[] productMenu = bookingVo.getProductMenu().split("/");
		bookingVo.setProductCode(productMenu[0]);
		bookingVo.setCategoryMainName(productMenu[1]);
		bookingVo.setCategorySubName(productMenu[2]);
		bookingVo.setUseTime(Integer.parseInt(productMenu[3]));
		bookingVo.setSelectDate(bookingVo.getBookingStartDate().substring(0, 10)); // 시간 잘라서 selectDate에 넣기
		bookingVo.setLevel(0);
		bookingVo.setBookingStatus(2); // ???
		bookingVo.setMid("");
		bookingVo.setBNumber("N" + new Date().getTime());

		int endTime = Integer.parseInt(bookingVo.getSelectTime()) + bookingVo.getUseTime() - 1;
		System.out.println("bookingVo.getproductCode : " + bookingVo.getProductCode());

		bookingVo.setBookingEndDate(bookingVo.getBookingStartDate().substring(0, 10) + " " + endTime);

		// 상품고유번호 검색 저장
		bookingVo.setPIdx(dbShopService.getPIdxSearch(bookingVo.getProductCode()));

		System.out.println("bookingVo POST : " + bookingVo);

		// booking에 저장하기
		bookingService.setBookingDataAdmin(bookingVo);

		// booking에 저장도하고 멤버에 비회원으로 저장도 한다.

		MemberVO memberVo = memberService.getMemberByNameTel(bookingVo.getName(), bookingVo.getTel());
		// 이미
		if (memberVo == null) {
			memberService.setNoMemberJoin(bookingVo.getName(), bookingVo.getTel()); // 이름,
		}

		int bIdx = bookingService.getBookingIdx(); // booking테이블에 저장된 가장 마지막 idx를 불러온다.

		// booking시간을 가져와서 해당 시간만큼 bookingTimg테이블에 저장시킨다.

		int bookingStartTime = Integer.parseInt(bookingVo.getBookingStartDate().substring(11, 13));
		int bookingEndTime = bookingStartTime + bookingVo.getUseTime() - 1;
		int bookingCount = bookingService.getBookingCount(bookingVo.getSelectDate(), bookingStartTime, bookingEndTime);
		if (bookingCount > 0) {
			model.addAttribute("flag", "?idx=" + bookingVo.getIdx() + "&selectDate=" + bookingVo.getSelectDate()
					+ "&categorySubName=" + bookingVo.getCategorySubName());
			return "redirect:/msg/bookingCountOverAdmin";
		}

		System.out.println("bookingCount::: " + bookingCount);
		System.out.println("1.bookingVo.getSelectDate():::" + bookingVo.getSelectDate());
		System.out.println("2.bookingStartTime  :::" + bookingStartTime);
		System.out.println("3.bookingEndTime  :::" + bookingEndTime);

		// bookingTime테이블에 예약한 시간만 저장하기
		for (int i = bookingStartTime; i <= bookingEndTime; i++) {
			bookingService.setBookingTime(bIdx, i, bookingVo.getSelectDate());
		}

		return "redirect:/msg/bookingOkOK";
	}

	/* admisnBookingList */
	@RequestMapping(value = "/booking/adminBookingList", method = RequestMethod.GET)
	public String adminBookingListGet(Model model, BookingVO bookingVo, MemberVO memberVo,
			@RequestParam(name = "searchString", defaultValue = "", required = false) String searchString,
			@RequestParam(name = "part", defaultValue = "", required = false) String part,
			@RequestParam(name = "searchStart", defaultValue = "", required = false) String searchStart,
			@RequestParam(name = "searchEnd", defaultValue = "", required = false) String searchEnd,
			@RequestParam(name = "pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name = "pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name = "orderBy", defaultValue = "", required = false) String orderBy) {

		// 날짜 검색
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);

		searchStart = searchStart.equals("") ? today : searchStart;
		searchEnd = searchEnd.equals("") ? today : searchEnd;

		model.addAttribute("searchStart", searchStart);
		model.addAttribute("searchEnd", searchEnd);

		PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "booking", part, searchString, searchStart, searchEnd); // 비회원을
																																																									// 멤버에
																																																									// 넣을
																																																									// 수
																																																									// 있게
																																																									// 해야
																																																									// 작동..
		System.out.println(pageVo);
		System.out.println(searchStart);
		System.out.println(searchEnd);

		List<BookingVO> bookingVos = bookingService.getBookingDataAll(pageVo.getStartIndexNo(), pageSize, "member", part,
				searchString, searchStart, searchEnd, orderBy); /// pageVo.getStartIndexNo(), pageSize, part, searchString 넣어야함
		model.addAttribute("orderBy", orderBy);

		System.out.println("bookingVOs bookingList  : " + bookingVos);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("bookingVos", bookingVos);

		return "admin/booking/adminBookingList";
	}

	@ResponseBody
	@RequestMapping(value = "/booking/adminBookingStatus", method = RequestMethod.POST)
	public String adminBookingStatusPost(int idx, int bookingStatus, String mid) {
		int res = adminService.setbookingStatusCheck(idx, bookingStatus);
		// System.out.println("idx : " + idx);
		String tel = bookingService.getMemberTelCheck(idx);

		// bookingStatus가 5(노쇼)일때 카운트해주기...
		if (bookingStatus == 5) {
			System.out.println("bookingStatus : " + bookingStatus);
			bookingService.setNoShowCntPlus(tel);
		}

		return res + "";
	}

	@ResponseBody
	@RequestMapping(value = "/member/updateNoShowCnt", method = RequestMethod.POST)
	public String updateNoShowCntPost(int idx, int noShowCnt) {

		bookingService.setUpdateNoShowCnt(idx, noShowCnt);
		return "admin/member/adminMemberBlackList";
	}

	/* blackList */
	@RequestMapping(value = "/member/adminMemberBlackList", method = RequestMethod.GET)
	public String adminMemberBlackListGet(Model model, BookingVO bookingvo) {

		List<BookingVO> bookingVos = bookingService.getBookingBlackList();

		model.addAttribute("bookingVos", bookingVos);

		return "admin/member/adminMemberBlackList";
	}

}
