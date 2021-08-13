package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Enter;
import org.apache.ibatis.annotations.Param;

public interface EnterDao {
    int inserintoEnter(Enter enter);
    Enter queryByHouseIdAndTime(@Param("HouseId") int HouseId, @Param("time") String time);
}
