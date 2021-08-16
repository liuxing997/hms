package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Enter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EnterDao {
    int inserintoEnter(Enter enter);
    Enter queryByHouseIdAndTime(@Param("HouseId") int HouseId, @Param("time") String time);
    //查询全部 入住信息
    List<Enter> queryAll();
}
