package com.spring.green2209S_14;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.green2209S_14.service.MemberService;
import com.spring.green2209S_14.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/memberLogin", method=RequestMethod.GET)
	public String memberLoginGet(HttpServletRequest request) {
		// 로그인폼 호출 시에 기존에 저장된 쿠키가 있다면 불러와서 mid에 담아서 넘겨준다
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				request.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
	return "member/memberLogin";
	}
	
	@RequestMapping(value = "/memberLogin", method=RequestMethod.POST)
	public String memberLoginPost(HttpServletRequest request, HttpServletResponse response, HttpSession session,
		@RequestParam(name="mid", defaultValue = "", required = false) String mid, // 널값 처리
		@RequestParam(name="pwd", defaultValue = "", required = false) String pwd, 
		@RequestParam(name="idCheck", defaultValue = "", required = false) String idCheck) {
		
		MemberVO vo = memberService.getMemberIdCheck(mid);
		
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getUserDel().equals("NO")) {
			// 회원 인증 처리된 경우 수행할 내용 ? strLevel처리, session에 필요한 자료를 저장, 쿠키 값 처리, 그날 방문자수 1증가(방문포인트도)
			String strLevel = "";
			if(vo.getLevel() == 1) strLevel = "일반회원";
			else if(vo.getLevel() == 2) strLevel = "우수회원";
			else if(vo.getLevel() == 3) strLevel = "VIP";
			else if(vo.getLevel() == 4) strLevel = "관리자";
			
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sStrLevel", strLevel);
			session.setAttribute("sMid", mid);
			
			if(idCheck.equals("on")) {	// 아이디 기억하겠다에 체크
				Cookie cookie = new Cookie("cMid", mid);
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if (cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			
		// 로그인한 사용자의 방문횟수 (포인트)누적
		memberService.setMemberVisitProcess(vo);
		
		return "redirect:/msg/memberLoginOk?mid="+mid;
		}
		else {
			return "redirect:/msg/memberLoginNo";
		}	
	}

	
	@RequestMapping(value = "/memberMain", method=RequestMethod.GET)
	public String memberMainGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		
		MemberVO vo = memberService.getMemberIdCheck(mid);
		
		model.addAttribute("vo" , vo);
		
		return "member/memberMain";
	}
	
	//회원가입폼
	@RequestMapping(value = "/memberJoin", method=RequestMethod.GET)
	public String memberJoinGet() {
		return "member/memberJoin";
	}
	
	//회원가입처리
	@RequestMapping(value = "/memberJoin", method=RequestMethod.POST)
	public String memberJoinPost(MemberVO vo) {
		//System.out.println("memberVo : " + vo);
		// 아이디 중복 체크
		if(memberService.getMemberIdCheck(vo.getMid()) != null) {
			return "redirect:/msg/memberIdCheckNo";
		}
		
		// 비밀번호 암호화(BCryptPasswordEncoder)
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		memberService.setMemberJoinOk(vo);
		
		return "redirect:/msg/memberJoinOk";
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberIdCheck", method=RequestMethod.POST)
	public String memberIdCheckPost(String mid) {
		String res = "0";
		MemberVO vo = memberService.getMemberIdCheck(mid);
		
		if(vo != null) res = "1";
		
		return res;
	}
	
	// 로그아웃
	@RequestMapping(value = "/memberLogout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		
		session.invalidate(); // 세션끊기
		
		return "redirect:/msg/memberLogout?mid="+mid;
	}
	

	
}
