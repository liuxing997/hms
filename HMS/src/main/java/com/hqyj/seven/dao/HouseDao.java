package com.hqyj.seven.dao;

import org.apache.ibatis.annotations.Param;

public interface HouseDao {
         int updateByHouseName(@Param("customerId")int customerId,@Param("name") String name );
}
