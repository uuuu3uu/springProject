package com.spring.green2209S_14;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.green2209S_14.pagination.PageProcess;
import com.spring.green2209S_14.pagination.PageVO;
import com.spring.green2209S_14.service.MemberService;
import com.spring.green2209S_14.service.noticeService;
import com.spring.green2209S_14.vo.MemberVO;
import com.spring.green2209S_14.vo.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	noticeService noticeService;
	
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value = "/noticeList", method=RequestMethod.GET)
	public String noticeListGet(Model model,
		@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
		@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
		@RequestParam(name="searchString", defaultValue = "", required = false) String searchString,
		@RequestParam(name="part", defaultValue = "title", required = false) String part
		) {
	
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "notice", part, searchString);
		
		// 전체리스트를 불러오는 메소드
		List<NoticeVO> vos = noticeService.getNoticeList(pageVO.getStartIndexNo(),pageSize);
		
		model.addAttribute("vos" , vos);
		model.addAttribute("pageVO" , pageVO);
		model.addAttribute("pag" , pag);
		model.addAttribute("pageSize" , pageSize);
	
	return "notice/noticeList";
	}
	
	@RequestMapping(value = "/noticeInput", method=RequestMethod.GET)
	public String noticeinputGet(Model model, HttpSession session, int pag, int pageSize) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getMemberIdCheck(mid);
		
		model.addAttribute("pag" , pag);
		model.addAttribute("pageSize" , pageSize);
		
	return "notice/noticeInput";
	}
	

	@RequestMapping(value="/noticeInput", method = RequestMethod.POST)
	public String noticeinputPost(NoticeVO vo) {
		
		// content에 이미지가 저장되어 있다면, 저장된 이미지만 골라서 resources/data/board폴더에 저장시켜준다
		noticeService.imgCheck(vo.getContent());
		
		// 이미지 복사작업이 끝나면, board폴더에 실제로 저장된 파일명을 DB에 저장시켜준다(/resources/data/ckeditor)
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/notice/"));
		int res = noticeService.setNoticeInput(vo);
		
		if(res == 1) return "redirect:/msg/noticeInputOk";
		else return "redirect:/msg/noticeInputNo";
	}
	
	
	
	
	@RequestMapping(value = "/noticeContent", method=RequestMethod.GET)
	public String noticeContentGet(HttpSession session , Model model, int idx, int pag, int pageSize) {
		
	return "notice/noticeContent";
	}
	

	

	
}
