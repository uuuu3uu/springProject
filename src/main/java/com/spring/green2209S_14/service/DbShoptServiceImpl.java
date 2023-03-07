package com.spring.green2209S_14.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.green2209S_14.dao.DbShopDAO;
import com.spring.green2209S_14.vo.DbOptionVO;
import com.spring.green2209S_14.vo.DbProductVO;

@Service
public class DbShoptServiceImpl implements DbShopService {
	
	@Autowired
	DbShopDAO dbShopDAO;

	@Override
	public List<DbProductVO> getCategoryMain() {
		return dbShopDAO.getCategoryMain();
	}

	@Override
	public List<DbProductVO> getCategorySub() {
		return dbShopDAO.getCategorySub();
	}

	@Override
	public DbProductVO getCategoryMainOne(String categoryMainCode, String categoryMainName) {
		return dbShopDAO.getCategoryMainOne(categoryMainCode, categoryMainName);
	}

	@Override
	public void setCategoryMainInput(DbProductVO vo) {
		dbShopDAO.setCategoryMainInput(vo);
		
	}

	@Override
	public List<DbProductVO> getCategorySubOne(DbProductVO vo) {
		return dbShopDAO.getCategorySubOne(vo);
	}

	@Override
	public void setCategoryMainDelete(String categoryMainCode) {
		dbShopDAO.setCategoryMainDelete(categoryMainCode);
		
	}

	@Override
	public void setCategorySubInput(DbProductVO vo) {
		dbShopDAO.setCategorySubInput(vo);
	}

	@Override
	public List<DbProductVO> getMainTitleList() {
		return dbShopDAO.getMainTitleList();
	}

	@Override
	public List<DbProductVO> getDbShopList(String part) {
		return dbShopDAO.getDbShopList(part);
	}

	@Override
	public List<DbProductVO> getCategorySubName(String categoryMainCode) {
		return dbShopDAO.getCategorySubName(categoryMainCode);
	}
	
	/*
	@Override
	public void imgCheckProductInput(MultipartFile file, DbProductVO vo) {
	// 먼저 기본(메인)그림파일은 'dbShop/product'폴더에 복사 시켜준다.
			try {
				System.out.println("통과!!!");
				String originalFilename = file.getOriginalFilename();
				if(originalFilename != null && originalFilename != "") {
					// 상품 메인사진을 업로드처리하기위해 중복파일명처리와 업로드처리
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
				  String saveFileName = sdf.format(date) + "_" + originalFilename;
					writeFile(file, saveFileName);	  // 메일 이미지를 서버에 업로드 시켜주는 메소드 호출
					vo.setFSName(saveFileName);				// 서버에 저장된 파일명을 vo에 set시켜준다.
				}
				else {
					return;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//             0         1         2         3         4         5
			//             012345678901234567890123456789012345678901234567890
			// <img alt="" src="/green2209S_14/data/dbShop/211229124318_4.jpg"
			// <img alt="" src="/green2209S_14/data/dbShop/product/211229124318_4.jpg"
			
			// ckeditor을 이용해서 담은 상품의 상세설명내역에 그림이 포함되어 있으면 그림을 dbShop/product폴더로 복사작업처리 시켜준다.
			String content = vo.getContent();
			if(content.indexOf("src=\"/") != -1) {
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				// String uploadPath = request.getRealPath("/resources/data/dbShop/");
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/");
				
				int position = 32;
				String nextImg = content.substring(content.indexOf("src=\"/") + position);
				boolean sw = true;
				
				while(sw) {
					String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
					String copyFilePath = "";
					String oriFilePath = uploadPath + imgFile;	// 원본 그림이 들어있는 '경로명+파일명'
					
					copyFilePath = uploadPath + "product/" + imgFile;	// 복사가 될 '경로명+파일명'
					
					fileCopyCheck(oriFilePath, copyFilePath);	// 원본그림이 복사될 위치로 복사작업처리하는 메소드
					
					if(nextImg.indexOf("src=\"/") == -1) sw = false;
					else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
				}
				// 이미지 복사작업이 종료되면 실제로 저장된 'dbShop/product'폴더명을 vo에 set시켜줘야 한다.
				vo.setContent(vo.getContent().replace("/data/dbShop/", "/data/dbShop/product/"));
			}
			// 파일 복사작업이 모두 끝나면 vo에 담긴내용을 상품의 내역을 DB에 저장한다.
			// 먼저 productCode를 만들어주기 위해 지금까지 작업된 dbProduct테이블의 idx필드중 최대값을 읽어온다. 없으면 0으로 처리한다.
			int maxIdx = 1;
			DbProductVO maxVo = dbShopDAO.getProductMaxIdx();
			if(maxVo != null) {
				maxIdx = maxVo.getIdx() + 1;
				vo.setIdx(maxIdx);
			}

			vo.setProductCode(vo.getCategoryMainCode()+vo.getCategorySubCode()+maxIdx);
			
			System.out.println("vo.getCategorySubCode() : " + vo.getCategorySubCode());
			System.out.println("2.vo : " + vo);
			dbShopDAO.setDbProductInput(vo);
		}
		*/
	
	// 멀티파일 저장하기...
	@Override
	public void imgCheckProductInput(MultipartHttpServletRequest mFile, DbProductVO vo) {
		try {
			List<MultipartFile> fileList = mFile.getFiles("file");
			String oFileNames = "";
			String sFileNames = "";
			int fileSizes = 0;
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);
				
				// 파일 업로드 메소드 호출
				writeFile(file, sFileName);
				
				oFileNames += oFileName + "/";
				sFileNames += sFileName + "/";
				fileSizes += file.getSize();
			}
			//vo.setFName(oFileNames);
			vo.setFSName(sFileNames);
			//vo.setFSize(fileSizes);
			
			//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 먼저 productCode를 만들어주기 위해 지금까지 작업된 dbProduct테이블의 idx필드중 최대값을 읽어온다. 없으면 0으로 처리한다.
			int maxIdx = 1;
			DbProductVO maxVo = dbShopDAO.getProductMaxIdx();
			if(maxVo != null) {
				maxIdx = maxVo.getIdx() + 1;
				vo.setIdx(maxIdx);
			}

			vo.setProductCode(vo.getCategoryMainCode()+vo.getCategorySubCode()+maxIdx);
			//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			
			dbShopDAO.setDbProductInput(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//실제 서버에 저장되는 파일명 중복방지를 위한 파일명설정
	private String saveFileName(String oFileName) {
		String fileName = "";
		
		Calendar cal = Calendar.getInstance();
		fileName += cal.get(Calendar.YEAR);
		fileName += cal.get(Calendar.MONTH);
		fileName += cal.get(Calendar.DATE);
		fileName += cal.get(Calendar.HOUR);
		fileName += cal.get(Calendar.MINUTE);
		fileName += cal.get(Calendar.SECOND);
		fileName += cal.get(Calendar.MILLISECOND);
		fileName += "_" + oFileName;
		
		return fileName;
		
		
	}


		
	/*
	// 실제 파일(dbShop폴더)을 'dbShop/product'폴더로 복사처리하는곳
	private void fileCopyCheck(String oriFilePath, String copyFilePath) {
		File oriFile = new File(oriFilePath);
		File copyFile = new File(copyFilePath);
		
		try {
			FileInputStream  fis = new FileInputStream(oriFile);
			FileOutputStream fos = new FileOutputStream(copyFile);
			
			byte[] buffer = new byte[2048];
			int count = 0;
			while((count = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, count);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	*/	
	
		
		
		// 메인 상품 이미지 서버에 저장하기
		private void writeFile(MultipartFile fName, String saveFileName) throws IOException {
			byte[] data = fName.getBytes();
			
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/product/");
			
			FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
			fos.write(data);
			fos.close();
		}

//		@Override
//		public BookingVO getDbShopProduct(int idx, String selectDate) {
//			return dbShopDAO.getDbShopProduct(idx, selectDate);
//		}

		@Override
		public List<DbOptionVO> getDbShopOption(int productIdx) {
			return dbShopDAO.getDbShopOption(productIdx);
		}

		@Override
		public DbProductVO getDbShopProduct(int idx) {
			return dbShopDAO.getDbShopProduct(idx);
		}

		@Override
		public DbProductVO getMainTitle(String categoryMainName) {
			return dbShopDAO.getMainTitle(categoryMainName);
		}

		@Override
		public List<DbProductVO> getDbProductAll() {
			return dbShopDAO.getDbProductAll();
		}

		@Override
		public int getPIdxSearch(String productCode) {
			return dbShopDAO.getPIdxSearch(productCode);
		}

		@Override
		public List<DbProductVO> getDbProductOne(String categorySubCode) {
			return dbShopDAO.getDbProductOne(categorySubCode);
		}

		@Override
		public void setCategorySubDelete(String categorySubCode) {
			dbShopDAO.setCategorySubDelete(categorySubCode);
		}

		@Override
		public DbProductVO getProductUpdate(int idx) {
			return dbShopDAO.getProductUpdate(idx);
		}

		@Override
		public List<DbProductVO> getDbProduct() {
			return dbShopDAO.getDbProduct();
		}

		@Override
		public void setProductDelete(int idx) {
			dbShopDAO.setProductDelete(idx);
		}
		


}
