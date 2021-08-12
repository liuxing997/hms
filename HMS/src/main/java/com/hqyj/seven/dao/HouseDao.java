package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface HouseDao {
         int updateByHouseName(@Param("customerId")int customerId,@Param("name") String name );
         House queryByHousename(String name);
}
