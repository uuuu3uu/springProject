package com.spring.green2209S_14.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.green2209S_14.dao.MemberDAO;
import com.spring.green2209S_14.dao.NoticeDAO;


@Service
public class PageProcess {
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	NoticeDAO noticeDAO;
	
	
	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String searchString) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		
		
		if(section.equals("member")) {
			totRecCnt = memberDAO.totRecCnt(searchString);
		}
		
		else if(section.equals("notice")) {
			totRecCnt = noticeDAO.totRecCnt(part, searchString);
		}
	
		// 다른 곳에 더 추가하고 싶으면 else if 사용해서 한다..
		
			
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setBlockSize(blockSize);
		pageVO.setLastBlock(lastBlock);

		
		return pageVO;
	}
}
