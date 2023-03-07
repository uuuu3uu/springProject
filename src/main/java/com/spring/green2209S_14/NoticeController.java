package com.spring.green2209S_14;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
		//조회수 증가처리
		noticeService.setNoticeReadNum(idx);
		
		
		NoticeVO vo = noticeService.getNoticeContent(idx);
		
		model.addAttribute("vo",vo);
		model.addAttribute("pag",pag);
		model.addAttribute("pageSize",pageSize);
		
		// 이전글 / 다음글 가져오기
		ArrayList<NoticeVO> pnVos = noticeService.getPrevNext(idx); // 값이 두개가 넘어오도록 처리하겠다
		//System.out.println("pnVos : " + pnVos);
		model.addAttribute("pnVos",pnVos);
		
		
	return "notice/noticeContent";
	}
	
	// notice 글 삭제하기
	@RequestMapping(value = "/noticeDeleteOk", method = RequestMethod.GET)
	public String noticeDeleteOk(int idx,int pag, int pageSize, Model model) {
		// 게시글 사진 존재하면 서버에 있는 사진파일 먼저 삭제
		NoticeVO vo = noticeService.getNoticeContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1) noticeService.imgDelete(vo.getContent());
		
		// DB에서 실제로 존재하는 게시글을 삭제처리한다.
		noticeService.setNoticeDeleteOk(idx);
		
		model.addAttribute("flag","?pag="+pag+"&pageSize="+pageSize);
		
		
		return "redirect:/msg/noticeDeleteOk";
	}
	
	// notice 수정 폼 호출
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.GET )
	public String noticeUpdateGet(Model model, int idx, int pag, int pageSize) {
		// 수정창으로 이동 시에는 먼저 원본파일에 그림파일이 있다면, 현재폴더(board)의 그림파일을 ckeditor 폴더로 복사시켜준다.
		NoticeVO vo = noticeService.getNoticeContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1) noticeService.imgCheckUpdate(vo.getContent()); // 컨텐트안에 그림파일이 존재 한다면 이미지를 체크해서 보낸다
		
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		
		return "notice/noticeUpdate";
	}
	
	// 변경된 게시글 수정 처리(그림포함)
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdatePost(Model model, NoticeVO vo, int pag, int pageSize) {
		// 수정된 자료가 원본 자료와 완전히 동일하다면 수정할 필요가 없기에, DB에 저장된 원본 자료를 불러와서 비교해준다.
		NoticeVO origVo = noticeService.getNoticeContent(vo.getIdx()); // db에서 넘어온 idx
		
		// content의 내용이 조금이라도 변경된 것이 있다면 아래 내용을 수행처리시킨다
		if(!origVo.getContent().equals(vo.getContent())) {	//오리지널에 있는 콘텐츠와 vo.콘텐츠가 같지않다면
			// 실제로 수정하기 버튼을 클릭하게 되면 기존의 board폴더에 저장된 현재 content의 그림 파일 모두를 삭제시킨다
			if(origVo.getContent().indexOf("src=\"/") != -1) noticeService.imgDelete(origVo.getContent()); // 사진이 있다면 지우겠따
			
			// vo.GetContent()에 들어있는 파일의 경로는 'ckeditor/notice' 경로를 'ckeditor' 로 변경시켜줘야한다.
			vo.setContent(vo.getContent().replace("/data/ckeditor/notice/", "/data/ckeditor/"));
			
			// 앞의 모든 준비가 끝나면, 파일을 처음 업로드한것과 같이 같은 작업을 처리한다.
			// 이 작업은 처음 게시글을 올릴 때의 파일 복사 작업과 동일한 작업이다
			noticeService.imgCheck(vo.getContent());
			
			// 파일 업로드가 끝나면 다시 경로를 수정한다, 'ckeditor' 경로를 'ckeditor/notice'로 변경시켜줘야한다(즉, 변경된 vo.setCotnent() 처리한다.)
			vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/notice/"));
		}
		
		// 잘 정비된 vo를 DB에 Update시켜준다
		noticeService.setNoticeUpdateOk(vo);
		
		model.addAttribute("flag","?pag="+pag+"&pageSize="+pageSize);
		
		return "redirect:/msg/noticeUpdateOk";
			
	}
	

	
}
