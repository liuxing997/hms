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
    //更新房间号和客户号
    int  updateByHouseIdAndCustomerId(@Param("time") Date time, @Param("houseId") int houseId, @Param("customerId") int customerId);
    Enter selectByHouseIdAndCustomerId(@Param("houseId") int houseId,@Param("customerId") int customerId);
    //根据住房id或者房间id查询住宿情况
    List<Enter> queryOneById(int id);
    //更改金额 现金支付时
    int updateByEnterIdToMoney(@Param("money") double money,@Param("enterId") int enterId);
}
