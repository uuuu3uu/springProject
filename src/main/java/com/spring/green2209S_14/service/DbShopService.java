package com.spring.green2209S_14.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.green2209S_14.vo.DbOptionVO;
import com.spring.green2209S_14.vo.DbProductVO;

public interface DbShopService {

	public List<DbProductVO> getCategoryMain();

	public List<DbProductVO> getCategorySub();

	public DbProductVO getCategoryMainOne(String categoryMainCode, String categoryMainName);

	public void setCategoryMainInput(DbProductVO vo);

	public List<DbProductVO> getCategorySubOne(DbProductVO vo);

	public void setCategoryMainDelete(String categoryMainCode);

	public void setCategorySubInput(DbProductVO vo);

	public List<DbProductVO> getMainTitleList();

	public List<DbProductVO> getDbShopList(String part);

	public List<DbProductVO> getCategorySubName(String categoryMainCode);

	public void imgCheckProductInput(MultipartHttpServletRequest file, DbProductVO vo);
	
	public List<DbOptionVO> getDbShopOption(int productIdx);

	public DbProductVO getDbShopProduct(int idx);

	public DbProductVO getMainTitle(String categoryMainName);

	public List<DbProductVO> getDbProductAll();

	public int getPIdxSearch(String productCode);

	public List<DbProductVO> getDbProductOne(String categorySubCode);

	public void setCategorySubDelete(String categorySubCode);

	public DbProductVO getProductUpdate(int idx);

	public List<DbProductVO> getDbProduct();

	public void setProductDelete(int idx);

	
	//public BookingVO getBookingSearch(int idx, String selectDate);

	










	

}
