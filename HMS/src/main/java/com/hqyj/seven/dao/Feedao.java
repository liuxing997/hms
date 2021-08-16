package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.Fee;
import org.apache.ibatis.annotations.Param;

public interface Feedao {
    //插入数据
    int inserintoFee(Fee fee);
    Fee queryByHouseIdAndCoustomerId(@Param("houseId") int houseId,@Param("coustomerId") int coustomerId);
    int updateByFeeId(int feeId);

}
