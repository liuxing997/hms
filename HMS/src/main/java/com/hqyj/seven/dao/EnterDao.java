package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Enter;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface EnterDao {
    //插入一天enter数据
    int inserintoEnter(Enter enter);
    //根据房间id查询房间信息
    Enter queryByHouseIdAndLimitOne(@Param("HouseId") int HouseId);
    //查询全部 入住信息
    List<Enter> queryAll();
    //删除记录
    int deleteEnter(int enter_id);
    //更新房间号和客户号
    int  updateByHouseIdAndCustomerId(@Param("time") Date time, @Param("houseId") int houseId, @Param("customerId") int customerId,@Param("state") String state);
    Enter selectByHouseIdAndCustomerId(@Param("houseId") int houseId,@Param("customerId") int customerId);
    //根据住房id或者房间id查询住宿情况
    List<Enter> queryOneById(int id);
    //更改金额 现金支付时
    int updateByEnterIdToMoney(@Param("money") double money,@Param("enterId") int enterId);
    //更改功能，支付宝支付时候
    int updateByEnterIdToMoneyTwo(@Param("enterId") int enterId,@Param("money") double money,@Param("out_trade_no") String out_trade_no);

    //根据交易流水号查询查询住宿情况
    Enter queryByOutTradeNo(String out_trade_no);

}
