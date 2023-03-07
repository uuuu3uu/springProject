package com.spring.green2209S_14.dao;

import org.apache.ibatis.annotations.Param;

public interface AdminDAO {

	public int setMemberLevelCheck(@Param("idx") int idx, @Param("level") int level);

	public int setbookingStatusCheck(@Param("idx") int idx, @Param("bookingStatus") int bookingStatus);

}
