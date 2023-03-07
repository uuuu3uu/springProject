package com.spring.green2209S_14;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
	
	@RequestMapping(value="/msg/{msgFlag}", method=RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model,
			@RequestParam(value="mid", defaultValue = "", required = false) String mid,
			@RequestParam(value="flag", defaultValue = "", required = false) String flag) {
		
		if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("msg", mid + "님 로그인 되었습니다");
			model.addAttribute("url","/");
		}
		else if(msgFlag.equals("memberLogout")) {
			model.addAttribute("msg", mid + "님 로그아웃 되셨습니다");
			model.addAttribute("url","member/memberLogin");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("msg", "아이디 혹은 비밀번호를 다시 확인해주세요");
			model.addAttribute("url","member/memberLogin");
		}
		else if(msgFlag.equals("memberJoinOk")) {
			model.addAttribute("msg", "회원가입 완료");
			model.addAttribute("url","member/memberLogin");
		}
		else if(msgFlag.equals("memberJoinNo")) {
			model.addAttribute("msg", "회원가입 실패...");
			model.addAttribute("url","member/memberJoin");
		}
		else if(msgFlag.equals("memberIdCheckNo")) {
			model.addAttribute("msg", "중복된 아이디 입니다");
			model.addAttribute("url","member/memberJoin");
		}
		else if(msgFlag.equals("memberNickNameCheckNo")) {
			model.addAttribute("msg", "중복된 닉네임 입니다");
			model.addAttribute("url","member/memberJoin");
		}
		else if(msgFlag.equals("noticeInputOk")) {
			model.addAttribute("msg", "게시글이 등록되었습니다");
			model.addAttribute("url","notice/noticeList");
		}
		else if(msgFlag.equals("noticeInputNo")) {
			model.addAttribute("msg", "게시글 등록 실패");
			model.addAttribute("url","notice/noticeInput");
		}
		else if(msgFlag.equals("noticeDeleteOk")) {
			model.addAttribute("msg", "게시글이 삭제되었습니다");
			model.addAttribute("url","notice/noticeList"+flag);
		}
		else if(msgFlag.equals("noticeUpdateOk")) {
			model.addAttribute("msg", "게시글이 수정되었습니다");
			model.addAttribute("url","notice/noticeList"+flag);
		}	
		else if(msgFlag.equals("dbProductInputOk")) {
			model.addAttribute("msg", "신규 상품이 등록되었습니다.");
			model.addAttribute("url", "dbShop/dbShopList");
		}
		else if(msgFlag.equals("bookingCountOver")) {
			model.addAttribute("msg", "예약할 수 없는 시간입니다 시술시간을 확인해주세요");
			model.addAttribute("url", "booking/booking"+flag);
		}
		else if(msgFlag.equals("bookingCountOverAdmin")) {
			model.addAttribute("msg", "예약할 수 없는 시간입니다 시술시간을 확인해주세요");
			model.addAttribute("url", "admin/booking/bookingCalendar"+flag);
		}
		else if(msgFlag.equals("bookingOk")) {
			model.addAttribute("msg", "다음페이지로 이동합니다");
			model.addAttribute("url", "booking/bookingPayment");
		}
		else if(msgFlag.equals("bookingOkOK")) {
			model.addAttribute("msg", "다음페이지로 이동합니다");
			model.addAttribute("url", "admin/booking/bookingCalendar");
		}
		
		return "include/message";
	}
}
