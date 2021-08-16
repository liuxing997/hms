package com.hqyj.seven.service;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.Fee;
import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.PageData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FeeService {
    //插入数据
    int insertFee(Fee fee);
    //查询已经缴费信息表
    public PageData<Fee> queryByDirectPay(int pageNumber, int pageSize);
    //查询未缴费信息表
    public PageData<Fee> queryByDirectNoPay(int pageNumber, int pageSize);
    //用id查询缴费
    public PageData<Fee> queryAllId(int pageNumber, int pageSize,int id,String direct);
}
