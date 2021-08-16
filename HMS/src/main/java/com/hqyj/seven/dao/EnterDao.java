package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Enter;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface EnterDao {
    int inserintoEnter(Enter enter);
    Enter queryByHouseIdAndTime(@Param("HouseId") int HouseId, @Param("time") String time);
    //查询全部 入住信息
    List<Enter> queryAll();
    //删除记录
    int deleteEnter(int enter_id);
    int  updateByHouseIdAndCustomerId(@Param("time") Date time, @Param("houseId") int houseId, @Param("customerId") int customerId);
    Enter selectByHouseIdAndCustomerId(@Param("houseId") int houseId,@Param("customerId") int customerId);
}
