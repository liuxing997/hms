package com.hqyj.seven.service;

import com.hqyj.seven.pojo.Fee;
import com.hqyj.seven.pojo.PageData;

import java.util.Map;

public interface FeeService {

    //插入缴费信息
    int insertFee(Fee fee);

    //查询已经缴费信息表
    PageData<Fee> queryByDirectPay(int pageNumber, int pageSize);

    //查询未缴费信息表
    PageData<Fee> queryByDirectNoPay(int pageNumber, int pageSize);

    //用id查询缴费
    PageData<Fee> queryAllId(int pageNumber, int pageSize, int id, String direct);

    //查询本次缴费金额
    double paymentAmount(int feeId);

    //现金支付
    Map<String, Object> CashPayment(int feeId);
    //支付宝支付
    boolean payByAliPay(long out_trade_no,double total_amount,int feeId);
}
