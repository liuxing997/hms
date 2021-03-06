package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.Fee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Feedao {
    //插入数据
    int inserintoFee(Fee fee);
    //按照houseid 和custmerid查询
    Fee queryByHouseIdAndCoustomerId(@Param("houseId") int houseId,@Param("coustomerId") int coustomerId);
    //更新缴费信息表按照id
    int updateByFeeId(int feeId);
    //按未缴费缴费查询所有缴费信息
    List<Fee> queryByDirect(@Param("direct") String direct);
    //用id查询缴费
    List<Fee> queryAllId(@Param("Id") int Id,@Param("direct") String  direct);
    //用id查询fee
   Fee  queryOneByFeeId(int feeId);
   //更新fee表
    int updateFee(Fee fee);

}
