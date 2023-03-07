package com.spring.green2209S_14;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.green2209S_14.pagination.PageProcess;
import com.spring.green2209S_14.service.DbShopService;
import com.spring.green2209S_14.service.MemberService;
import com.spring.green2209S_14.vo.DbOptionVO;
import com.spring.green2209S_14.vo.DbProductVO;

@Controller
@RequestMapping("/dbShop")
public class DbShopController {
	
	@Autowired
	DbShopService dbShopService;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	MemberService memberService;
	
	// 대/중 분류 폼 보기
	@RequestMapping(value = "/dbCategory", method = RequestMethod.GET)
	public String dbCategoryGet(Model model) {
		
		List<DbProductVO> mainVos = dbShopService.getCategoryMain();
		List<DbProductVO> subVos = dbShopService.getCategorySub();
		
		model.addAttribute("mainVos", mainVos);
		model.addAttribute("subVos", subVos);
		
		return "admin/dbShop/dbCategory";
	}
	
	// 대분류 등록하기
	@ResponseBody
	@RequestMapping(value = "/categoryMainInput", method = RequestMethod.POST)
	public String categoryMainInputGet(DbProductVO vo) {
		// 기존에 같은이름의 대분류가 있는지를 체크한다.
		DbProductVO imsiVo = dbShopService.getCategoryMainOne(vo.getCategoryMainCode(), vo.getCategoryMainName());
		System.out.println("imsiVo : " + imsiVo);
		if(imsiVo != null) return "0";
		dbShopService.setCategoryMainInput(vo);  // 대분류항목 저장
		
		return "1";
	}
	
	// 1차메뉴분류 삭제
	@ResponseBody
	@RequestMapping(value = "/categoryMainDelete", method = RequestMethod.POST)
	public String categoryMainDelete(DbProductVO vo) {
		// 현재 대분류에 속해있는 하위항목이 존재하는지 체크
		List<DbProductVO> vos = dbShopService.getCategorySubOne(vo);
		
		if(vos.size() != 0) return "0";
		dbShopService.setCategoryMainDelete(vo.getCategoryMainCode());  // 1차메뉴항목 삭제
		
		return "";
		
	}
	
	// 2차메뉴 등록
	@ResponseBody
	@RequestMapping(value = "/categorySubInput", method = RequestMethod.POST)
	public String categorySubInputGet(DbProductVO vo) {
		// 기존에 같은이름의 2차메뉴가 있는지를 체크한다.
		List<DbProductVO> vos = dbShopService.getCategorySubOne(vo);
		if(vos.size() != 0) return "0";
		dbShopService.setCategorySubInput(vo);  // 중분류항목 저장
		
		return "1";
	}
	
	// 2차메뉴 삭제
	@ResponseBody
	@RequestMapping(value = "/categorySubDelete", method = RequestMethod.POST)
	public String categorySubDeleteGet(DbProductVO vo) {
		// 현재 소분류가 속해있는 하위항목인 상품이 있는지를 체크한다.
		List<DbProductVO> vos = dbShopService.getDbProductOne(vo.getCategorySubCode());
		
		if(vos.size() != 0) return "0";
		dbShopService.setCategorySubDelete(vo.getCategorySubCode());  // 소분류항목 삭제
		
		return "1";
	}
	  
	// 상품 등록을 위한 등록폼 보여주기
	@RequestMapping(value = "/dbProduct", method = RequestMethod.GET)
	public String dbProducGet(Model model) {
			
		List<DbProductVO> mainVos = dbShopService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);
		
		return "admin/dbShop/dbProduct";
	}
	//관리자 상품등록시에 ckeditor에 그림을 올린다면 dbShop폴더에 저장되고, 저장된 파일을 브라우저 textarea상자에 보여준다. 
	@ResponseBody
	@RequestMapping("/imageUpload")
	public void imageUploadGet(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String originalFilename = upload.getOriginalFilename();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		originalFilename = sdf.format(date) + "_" + originalFilename;
		
		byte[] bytes = upload.getBytes();
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/");
		OutputStream outStr = new FileOutputStream(new File(uploadPath + originalFilename));
		outStr.write(bytes);
		
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/dbShop/" + originalFilename;
		out.println("{\"originalFilename\":\""+originalFilename+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
		
		out.flush();
		outStr.close();
	}
	 
	 

	// 1차메뉴 선택시 2차메뉴명 가져오기
	@ResponseBody
	@RequestMapping(value="/categorySubName", method = RequestMethod.POST)
	public List<DbProductVO> categorySubNamePost(String categoryMainCode) {
	//	System.out.println(dbShopService.getCategorySubName(categoryMainCode));
		return dbShopService.getCategorySubName(categoryMainCode);
	}
	
	
	// 시슬상품등록조회  등록된 상품 모두 보여주기(관리자화면에서 보여주는 처리부분이다.) 
	@RequestMapping(value = "/dbShopList", method = RequestMethod.GET)
	public String dbShopListGet(Model model,
		@RequestParam(name="part", defaultValue = "전체", required = false) String part) {
		
		// 1차메뉴명을 가져온다.
		List<DbProductVO> mainTitleVos = dbShopService.getMainTitleList();
		model.addAttribute("mainTitleVos", mainTitleVos);
	
		
	
		// 전체 상품리스트 가져오기
		List<DbProductVO> productVos = dbShopService.getDbShopList(part);
		model.addAttribute("productVos", productVos);
		model.addAttribute("part", part);
		

		
		
		
		return "admin/dbShop/dbShopList";
	}
	
//	//상품 등록을 위한 등록시키기
//	@RequestMapping(value = "/dbProduct", method = RequestMethod.POST)
//	public String dbProducPost(MultipartFile file, DbProductVO vo) {
//		// 이미지파일 업로드시에 ckeditor폴더에서 product폴더로 복사작업처리....(dbShop폴더에서 'dbShop/product'로)
//		dbShopService.imgCheckProductInput(file, vo);
//		System.out.println("1. : "+vo);
//		return "redirect:/msg/dbProductInputOk";
//	}
	
	//상품 등록을 위한 등록시키기
	@RequestMapping(value = "/dbProduct", method = RequestMethod.POST)
	public String dbProducPost(MultipartHttpServletRequest file, DbProductVO vo) {
		// 이미지파일 업로드시에 ckeditor폴더에서 product폴더로 복사작업처리....(dbShop폴더에서 'dbShop/product'로)
		dbShopService.imgCheckProductInput(file, vo);
		System.out.println("1. : "+vo);
		return "redirect:/msg/dbProductInputOk";
	}
	
	//관리자에서 진열된 상품을 클릭하였을경우에 해당 상품의 상세내역 보여주기
	@RequestMapping(value="/dbShopContent", method=RequestMethod.GET)
	public String dbShopContentGet(Model model, int idx) {
		DbProductVO productVo = dbShopService.getDbShopProduct(idx);	   // 1건의 상품 정보를 불러온다.
		List<DbOptionVO> optionVos = dbShopService.getDbShopOption(idx); // 해당 상품의 모든 옵션 정보를 가져온다.
		model.addAttribute("productVo", productVo);
		model.addAttribute("optionVos", optionVos);
		
		return "admin/dbShop/dbShopContent";
	}
	
	// 상품 등록 수정하기
	
	
	
	//상품 등록 수정하기
	@RequestMapping(value="/dbProductUpdate", method=RequestMethod.GET)
	public String dbContentUpdateGet(int idx, Model model) {
		
		List<DbProductVO> mainVos = dbShopService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);
		
		System.out.println("madinVos ::::: " + mainVos);
		
		DbProductVO productVo = dbShopService.getDbShopProduct(idx);
		
		System.out.println("productVo : " + productVo);
		model.addAttribute("productVo", productVo);
		
		List<DbProductVO> productVos = dbShopService.getDbProduct();
		//DbProductVO productVo = dbShopService.getProductUpdate(idx);
		model.addAttribute("productVos", productVos);
		
		
		
		return "admin/dbShop/dbProductUpdate";
	}
	
	// 상품등록 삭제하기 
	@ResponseBody
	@RequestMapping(value = "/dbProductDelete" , method=RequestMethod.POST)
	public String dbProductDeletePost(int idx) {
		
		dbShopService.setProductDelete(idx);
		
		return "admin/dbShop/dbShopList";
	}
	
	
}
