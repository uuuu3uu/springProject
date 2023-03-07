package com.spring.green2209S_14.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_14.vo.BookingVO;
import com.spring.green2209S_14.vo.DbOptionVO;
import com.spring.green2209S_14.vo.DbProductVO;

public interface DbShopDAO {

	public List<DbProductVO> getCategoryMain();

	public List<DbProductVO> getCategorySub();

	public DbProductVO getCategoryMainOne(@Param("categoryMainCode") String categoryMainCode, @Param("categoryMainName") String categoryMainName);

	public void setCategoryMainInput(@Param("vo") DbProductVO vo);

	public List<DbProductVO> getCategorySubOne(@Param("vo") DbProductVO vo);

	public void setCategoryMainDelete(@Param("categoryMainCode") String categoryMainCode);

	public void setCategorySubInput(@Param("vo") DbProductVO vo);

	public List<DbProductVO> getMainTitleList();

	public List<DbProductVO> getDbShopList(@Param("part") String part);

	public List<DbProductVO> getCategorySubName(@Param("categoryMainCode") String categoryMainCode);

	public DbProductVO getProductMaxIdx();

	//public void imgCheckProductInput(@Param("MultipartFile") MultipartFile file, @Param("vo") DbProductVO vo);

	public void setDbProductInput(@Param("vo") DbProductVO vo);

	public List<DbOptionVO> getDbShopOption(@Param("productIdx") int productIdx);
	
	public DbProductVO getDbShopProduct(@Param("idx") int idx);

	public DbProductVO getMainTitle(@Param("categoryMainName") String categoryMainName);

	public List<DbProductVO> getDbProductAll();

	public int getPIdxSearch(@Param("productCode") String productCode);

	public List<DbProductVO> getDbProductOne(@Param("categorySubCode") String categorySubCode);

	public void setCategorySubDelete(@Param("categorySubCode") String categorySubCode);

	public List<DbProductVO> getCategoryMain(@Param("idx") int idx);

	public DbProductVO getProductUpdate(@Param("idx") int idx);

	public List<DbProductVO> getDbProduct();

	public void setProductDelete(@Param("idx") int idx);
	
//	public BookingVO getDbShopProduct(@Param("idx") int idx, @Param("selectDate") String selectDate);

	



	

	

}
